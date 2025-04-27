/**
 * Copyright (c) 2015-2019 Damien Tardy-Panis <damien@tardypad.me>
 * Copyright (c) 2016 Hauke Schade <github@cnlpete.de>
 * Copyright (c) 2019 Oleg Linkin <maledictusdemagog@gmail.com>
 * Copyright (c) 2023,2024 olf <Olf0@users.noreply.github.com>
 *
 * This file is subject to the terms and conditions defined in
 * file `LICENSE.txt`, which is part of this source code package.
 **/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent

        contentWidth: parent.width;
        contentHeight: pageHeader.height + contentColumn.height + Theme.verticalPageMargin

        flickableDirection: Flickable.VerticalFlick

        PageHeader {
            id: pageHeader
            title: qsTr("About")
        }

        Column {
            id: contentColumn
            spacing: Theme.paddingLarge
            anchors {
                top: pageHeader.bottom
                horizontalCenter: parent.horizontalCenter
            }
            width: parent.width - Theme.horizontalPageMargin

            Rectangle {
                color: "transparent"
                width: parent.width
                // This does not work as intended with `fillMode: Image.PreserveAspectFit`:
                // Image is not scaled up to its `width: parent.width`!
                height: childrenRect.height
                Image {
                    id: coverImage
                    source: Qt.resolvedUrl("../../images/harbour-cover.png")
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                    clip: true
                    asynchronous: true
                    width: parent.width
                    Layout.fillWidth: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    id: topText
                    anchors {
                        top: coverImage.bottom
                        topMargin: Theme.paddingSmall
                        horizontalCenter: parent.horizontalCenter
                    }
                    width: parent.width
                    text: qsTr("Read your favourite comic strips every day.")
                    font {
                        italic: true
                        pixelSize: Theme.fontSizeSmall
                    }
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    id: versionLabel
                    anchors {
                        top: topText.bottom
                        topMargin: Theme.paddingMedium
                        horizontalCenter: parent.horizontalCenter
                    }
                    width: parent.width
                    text: qsTr("Version %1").arg(Qt.application.version)
                    font.pixelSize: Theme.fontSizeMedium
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    id: codeLabel
                    anchors {
                        top: versionLabel.bottom
                        topMargin: Theme.paddingLarge
                        horizontalCenter: parent.horizontalCenter
                    }
                    width: parent.width
                    text: qsTr("<a href=\"%1\">Source code repository</a>").arg(constants.repoGithub)
                    font.pixelSize: Theme.fontSizeMedium
                    horizontalAlignment: Text.AlignHCenter
                    linkColor: Theme.highlightColor
                    onLinkActivated: Qt.openUrlExternally(link)
                }

                Label {
                    id: licenseLabel
                    anchors {
                        top: codeLabel.bottom
                        topMargin: Theme.paddingMedium
                        horizontalCenter: parent.horizontalCenter
                    }
                    width: parent.width
                    text: qsTr("License: %1").arg("MIT")
                    font.pixelSize: Theme.fontSizeMedium
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    id: issuesLabel
                    anchors {
                        top: licenseLabel.bottom
                        topMargin: Theme.paddingLarge
                        horizontalCenter: parent.horizontalCenter
                    }
                    width: parent.width
                    wrapMode: Text.WordWrap
                    text: qsTr("<a href=\"%1\">Issue tracker for bug reports, feature suggestions and help requests</a>").arg(constants.issuesGithub)
                    font.pixelSize: Theme.fontSizeMedium
                    horizontalAlignment: Text.AlignHCenter
                    linkColor: Theme.highlightColor
                    onLinkActivated: Qt.openUrlExternally(link)
                }

            }

        }
    }
}
