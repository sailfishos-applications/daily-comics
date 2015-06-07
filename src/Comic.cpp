/**
 * Copyright (c) 2015 Damien Tardy-Panis
 *
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE', which is part of this source code package.
 **/

#include "Comic.h"

#include <QDebug>
#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkRequest>
#include <QtNetwork/QNetworkReply>

#include "ComicDatabaseResource.h"
#include "ComicFileResource.h"

const int Comic::_minFetchDelay = 1800; // 30 min
const int Comic::_timeout = 20000; // 20 sec

Comic::Comic(QObject *parent) :
    QObject(parent),
    m_currentReply(NULL),
    m_extractedStripUrl(QUrl()),
    m_stripUrl(QUrl()),
    m_favorite(false),
    m_newStrip(false),
    m_error(false),
    m_fetching(false),
    m_fetchTime(QDateTime())
{
    m_networkManager = new QNetworkAccessManager(this);
    dbResource = ComicDatabaseResource::instance();
    fileResource = ComicFileResource::instance();

    m_timeoutTimer = new QTimer(this);
    m_timeoutTimer->setInterval(_timeout);
    m_timeoutTimer->setSingleShot(true);
    connect(m_timeoutTimer, SIGNAL(timeout()), this, SLOT(timeout()));
}

Comic::~Comic()
{
    delete m_currentReply;
    delete m_networkManager;
    delete m_timeoutTimer;
}

void Comic::load()
{
    dbResource->load(this);
}

void Comic::save()
{
    dbResource->save(this);
}

QString Comic::stripPath() const
{
     return fileResource->filePath(id());
}

void Comic::fetchStrip(QUrl stripUrl)
{
    if (!error() &&
        !fetchTime().isNull() &&
        QDateTime::currentDateTime().secsTo(fetchTime()) > -_minFetchDelay &&
        stripImageDownloaded())
        return;

    abortFetching();
    delete m_currentReply;
    m_currentReply = NULL;

    QUrl requestUrl = !stripUrl.isEmpty() ? stripUrl : stripSourceUrl();
    QNetworkRequest request(requestUrl);
    request.setHeader(QNetworkRequest::UserAgentHeader, "sailfishos/tardypad/dailycomics");
    m_currentReply = m_networkManager->get(request);

    m_timeoutTimer->start();
    emit fetchStarted();
    setFetching(true);

    connect(m_currentReply, SIGNAL(finished()), this, SLOT(onFetchFinished()));
    connect(m_currentReply, SIGNAL(downloadProgress(qint64,qint64)), this, SIGNAL(downloadProgress(qint64,qint64)));
}

void Comic::abortFetching()
{
    setFetching(false);

    if (m_currentReply != NULL && m_currentReply->isRunning()) {
        m_currentReply->disconnect(this);
        m_currentReply->abort();        
    }
}

void Comic::read()
{
    setNewStrip(false);
    save();
}

bool Comic::stripImageDownloaded()
{
    return fileResource->isDownloaded(id());
}

QUrl Comic::redirectedToUrl()
{
    QVariant redirectAttribute = m_currentReply->attribute(QNetworkRequest::RedirectionTargetAttribute);

    if (redirectAttribute.isValid()) {
        QUrl redirectUrl = redirectAttribute.toUrl();

        if (redirectUrl.isRelative())
            redirectUrl = m_currentReply->url().resolved(redirectUrl);

        return redirectUrl;
    }

    return QUrl();
}

void Comic::onFetchFinished()
{
    m_timeoutTimer->stop();

    if (m_currentReply->error() != QNetworkReply::NoError) {
        setFetching(false);
        setError(true);
        emit networkError();
        return;
    }

    QUrl redirectUrl = redirectedToUrl();

    if (!redirectUrl.isEmpty()) {
        fetchStrip(redirectUrl);
        return;
    }

    parse();
}

void Comic::parse()
{
    QByteArray data = m_currentReply->readAll();
    QUrl extractedStripUrl = extractStripUrl(data);

    if (!extractedStripUrl.isValid()) {
        setFetching(false);
        setError(true);
        emit parsingError();
        return;
    }

    setExtractedStripUrl(extractedStripUrl);

    if (extractedStripUrl != stripUrl()) {
        fetchStripImage(extractedStripUrl);
        setNewStrip(true);
    } else if (!stripImageDownloaded()) {
        fetchStripImage(extractedStripUrl);
    } else {
        setFetching(false);
        emit fetchFinished();
        setStripUrl(extractedStripUrl);
        setFetchTime(QDateTime::currentDateTime());
        save();
    }
}

void Comic::fetchStripImage(QUrl stripImageUrl)
{
    delete m_currentReply;
    m_currentReply = NULL;

    QNetworkRequest request(stripImageUrl);
    m_currentReply = m_networkManager->get(request);

    m_timeoutTimer->start();

    connect(m_currentReply, SIGNAL(finished()), this, SLOT(onFetchImageFinished()));
    connect(m_currentReply, SIGNAL(downloadProgress(qint64,qint64)), this, SIGNAL(downloadProgress(qint64,qint64)));
}

void Comic::onFetchImageFinished()
{
    m_timeoutTimer->stop();

    if (m_currentReply->error() != QNetworkReply::NoError) {
        setFetching(false);
        setError(true);
        emit networkError();
        return;
    }

    QUrl redirectUrl = redirectedToUrl();

    if (!redirectUrl.isEmpty()) {
        fetchStripImage(redirectUrl);
        return;
    }

    bool result = fileResource->save(id(), m_currentReply->readAll());

    if (!result) {
        setFetching(false);
        setError(true);
        emit savingError();
        return;
    }

    setFetching(false);
    setError(false);
    emit fetchFinished();
    setStripUrl(extractedStripUrl());
    setFetchTime(QDateTime::currentDateTime());
    save();
}

void Comic::timeout()
{
    abortFetching();
    setError(true);
    emit networkError();
}
