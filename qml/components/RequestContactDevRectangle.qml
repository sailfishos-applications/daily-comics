/**
 * Copyright (c) 2015 Damien Tardy-Panis <damien@tardypad.me>
 * Copyright (c) 2023 olf <Olf0@users.noreply.github.com>
 *
 * This file is subject to the terms and conditions defined in
 * file `LICENSE.txt`, which is part of this source code package.
 **/

import QtQuick 2.0
import Sailfish.Silica 1.0


Item {

    property Item flickable

    width: flickable.width
    height: rect.height + 2*Theme.paddingLarge

    Rectangle {
        id: rect

        width: parent.width
        height: label.height + 2*Theme.paddingSmall
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        anchors.margins: Theme.paddingLarge

        color: Theme.rgba(Theme.highlightBackgroundColor, Theme.highlightBackgroundOpacity / 3)

        Label {
            id: label
            anchors {
                left: parent.left
                leftMargin: Theme.paddingSmall
                verticalCenter: parent.verticalCenter
            }
            width: parent.width - githubButton.width - 3*Theme.paddingSmall
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: qsTr("Please report if you like to see some additional comic(s)")
            font.pixelSize: Theme.fontSizeExtraSmall
        }

        IconButton {
            id: githubButton
            height: Theme.iconSizeMedium
            width: Theme.iconSizeMedium
            anchors {
                left: label.right
                leftMargin: Theme.paddingSmall
                rightMargin: Theme.paddingSmall
                verticalCenter: parent.verticalCenter
            }
            icon {
                source: Theme.colorScheme == 0  ? "qrc:/icon/light/github" : "qrc:/icon/dark/github"
                height: Theme.iconSizeMedium
                fillMode: Image.PreserveAspectFit
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: Qt.openUrlExternally(constants.issuesGithub)
        }
    }
}
