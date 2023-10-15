/**
 * Copyright (c) 2015 Damien Tardy-Panis <damien@tardypad.me>
 * Copyright (c) 2018-2019 Oleg Linkin <maledictusdemagog@gmail.com>
 * Copyright (c) 2023 olf <Olf0@users.noreply.github.com>
 *
 * This file is subject to the terms and conditions defined in
 * file `LICENSE.txt`, which is part of this source code package.
 **/

import QtQuick 2.0
import Sailfish.Silica 1.0

import harbour.dailycomics.Comics 1.0

import "../utils"
import "../components"

Page {
    id: comicInfoPage

    allowedOrientations: Orientation.All

    property int index
    property ComicsModel model

    ComicProxy {
        id: comic
    }

    onStatusChanged: {
        if (comicInfoPage.status == PageStatus.Active) {
            comic.setComic(model.comicAt(index))
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column

            width: parent.width

            PageHeader {
                title: qsTr("Comic info")
            }
            DetailItem {
                id: authorsHeaderLabel
                label: comic.authors.length > 1 ? qsTr("Authors") : qsTr("Author")
                value: comic.authors.join("\n")
            }
            DetailItem {
                id: languageHeaderLabel
                label: qsTr("Language")
                value: comic.language
            }

            Image {
                id: exampleImage
                source: comic.id ? comic.examplePath : ''
                fillMode: Image.PreserveAspectFit
                smooth: true
                asynchronous: true

                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        VerticalScrollDecorator { }
    }
}
