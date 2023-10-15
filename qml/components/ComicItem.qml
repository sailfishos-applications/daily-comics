/**
 * Copyright (c) 2018-2019 Oleg Linkin <maledictusdemagog@gmail.com>
 * Copyright (c) 2020 Mirian Margiani <ichthyosaurus@users.noreply.github.com>
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

ZoomableImage {
    id: zoomableImage
    imageOpacity: indicator.visible ? Theme.opacityLow : 1.0

    property alias comicProxy: indicator.model
    property alias indicator: indicator

    ready: imagePath !== "" && !indicator.busy

    StatusOverlay {
        id: indicator
        loadingText: qsTr("Loading comic")
        defaultErrorText: qsTr("Cannot display comic")
        networkErrorText: qsTr("Cannot download comic")
        parsingErrorText: qsTr("Cannot extract comic")
        savingErrorText: qsTr("Cannot save comic")
    }

    MouseArea {
        anchors.fill: parent
        enabled: indicator.overlayVisible
        onClicked: {
            indicator.visible = !indicator.visible
            zoomableImage.active = !indicator.visible
        }
    }

    BackgroundItem {
        visible: indicator.error
        parent: zoomableImage
        anchors.bottom: parent.bottom
        width: parent.width
        height: Theme.itemSizeMedium

        onClicked: Qt.openUrlExternally(constants.issuesGithub)

        Rectangle {
            anchors.fill: parent; z: -1
            visible: indicator.overlayVisible && !indicator.visible
            color: Theme.highlightDimmerColor
            opacity: Theme.opacityOverlay
        }

        Label {
            anchors {
                leftMargin: Theme.horizontalPageMargin; left: parent.left
                rightMargin: Theme.paddingMedium; right: githubButton.left
                top: parent.top; bottom: parent.bottom
            }
            verticalAlignment: Text.AlignVCenter
            text: qsTr("Please report if this issue persists.")
            font.pixelSize: Theme.fontSizeExtraSmall
            wrapMode: Text.WordWrap
        }

        HighlightImage {
            id: githubButton
            anchors {
                right: parent.right; rightMargin: Theme.horizontalPageMargin
                verticalCenter: parent.verticalCenter
            }
            height: Theme.iconSizeMedium; width: height
            fillMode: Image.PreserveAspectFit
            source: Theme.colorScheme == 0  ? "qrc:/icon/light/github" : "qrc:/icon/dark/github"
            highlighted: parent.highlighted
        }
    }
}
