/**
 * Copyright (c) 2015 Damien Tardy-Panis <damien@tardypad.me>
 *
 * This file is subject to the terms and conditions defined in
 * file `LICENSE.txt`, which is part of this source code package.
 **/

import QtQuick 2.0
import Sailfish.Silica 1.0

BackgroundItem {
    width: gridView.cellWidth
    height: gridView.cellHeight

    Image {
        anchors.fill: parent
        source: coverPath
        sourceSize.width: Screen.width / 2
        sourceSize.height: Screen.width / 2
    }

    Rectangle {
        property bool active: favorite

        anchors.fill: parent
        color: Theme.highlightBackgroundColor
        opacity: active ? 0.7 : 0.0

        Image {
            source: "image://theme/icon-m-favorite-selected"
            height: Theme.iconSizeSmall
            width: Theme.iconSizeSmall
            anchors {
                right: parent.right
                bottom: parent.bottom
                rightMargin: Theme.paddingSmall
                bottomMargin: Theme.paddingSmall
            }
            fillMode: Image.PreserveAspectFit
        }
    }

    onClicked: gridView._setFavorite(index, !favorite)

    onPressAndHold: gridView._showComicInfo(index)

    onPressed: gridView.currentIndex = index
}
