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
    id: comicPage

    allowedOrientations: Orientation.All

    property int index
    property ComicsModel comicsModel

    ComicProxy {
        id: comicProxy
    }

    ComicItem {
        id: comicItem
        anchors.fill: parent

        comicProxy: comicProxy
        name: comicProxy.name
        homepage: comicProxy.homepage
        imagePath: comicProxy.stripImagePath
        indicator.error: comicProxy.error
        onRead: comicProxy.read()
        onSetError: {
            indicator.displayError(errorText, hintText)
            comicProxy.setError()
        }
        onClicked: overlay.active = !overlay.active
    }

    ImageOverlay {
        id: overlay
        anchors.fill: parent

        visible: comicItem.ready && !comicProxy.error
        comicProxy: comicProxy
        comicIndex: comicPage.index
        comicsModel: comicPage.comicsModel
        z: comicItem.z + 1
    }

    Component.onCompleted: {
        comicProxy.setComic(comicsModel.comicAt(index))
        comicProxy.fetch()
    }
}
