/**
 * Copyright (c) 2015 Damien Tardy-Panis <damien@tardypad.me>
 *
 * This file is subject to the terms and conditions defined in
 * file `LICENSE.txt`, which is part of this source code package.
 **/

import QtQuick 2.0
import Sailfish.Silica 1.0

import harbour.dailycomics.Comics 1.0

CoverBackground {

    property ComicsModel favoritesComicsModel
    property int newComicsCount: favoritesComicsModel ? favoritesComicsModel.newCount : 0
    property bool newComics: newComicsCount > 0
    property bool emptyComics: !favoritesComicsModel || favoritesComicsModel.count == 0

    ComicsModelProxy {
        id: comicsModelProxy
        comicsModel: favoritesComicsModel
        filterRole: newComics ? ComicsModel.NewStripRole : 0
        sortRole: ComicsModel.RandomRole
    }

    Connections {
        target: favoritesComicsModel
        onCountChanged: comicsModelProxy.invalidate()
        onNewCountChanged: comicsModelProxy.invalidate()
    }

    Item {
        id: statusLabel
        visible: newComics
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        height: newComics ? Math.ceil(parent.height / 3.0) : 0

        Label {
            text: qsTr("%n new comic(s)", "", newComicsCount)
            color: Theme.highlightColor
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
        }
    }

    GridView {
        id: grid

        anchors {
            top: statusLabel.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        interactive: false
        cellWidth: Math.floor(parent.width / 2.0)
        cellHeight: Math.ceil(parent.height / 3.0)
        model: comicsModelProxy

        delegate: Image {
            source: coverPath
            width: grid.cellWidth
            height: grid.cellHeight
            sourceSize.width: width
            sourceSize.height: height
        }
    }

    Column {
        visible: emptyComics
        spacing: Theme.paddingLarge

        anchors.centerIn: parent

        Label {
            text: "Daily Comics"
            color: Theme.highlightColor
        }

        Image {
            fillMode: Image.PreserveAspectFit
            source: "../../images/cover.png"
            opacity: 0.6
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    CoverActionList {
        iconBackground: true
        enabled: newComics

        CoverAction {
            iconSource: "image://theme/icon-cover-next"
            onTriggered: {
                window.activate()
                window.showNewComicsPage()
            }
        }
    }

}
