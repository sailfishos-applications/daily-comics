/**
 * Copyright (c) 2015 Damien Tardy-Panis <damien@tardypad.me>
 * Copyright (c) 2023,2024 olf <Olf0@users.noreply.github.com>
 *
 * This file is subject to the terms and conditions defined in
 * file `LICENSE.txt`, which is part of this source code package.
 **/

import QtQuick 2.0
import Sailfish.Silica 1.0

import harbour.dailycomics.Comics 1.0

DockedPanel {
    id: comicInfoPanel

    property int index
    property ComicsModel comicsModel
    property bool isPortrait: (parent.isPortrait !== undefined) ? parent.isPortrait : true
    property alias homepageMenu: homepagePushUpMenu.visible

    width: isPortrait ? parent.width : 0.7 * parent.width
    height: isPortrait ? 0.7 * parent.height : parent.height
    contentHeight: height
    dock: isPortrait ? Dock.Bottom : Dock.Right

    function showComicInfo() {
        comic.setComic(comicsModel.comicAt(index))
        show()
    }

    ComicProxy {
        id: comic
    }

    MouseArea {
        anchors.fill: parent
        onClicked: hide()
    }

    // The content of this rectangle is very similar to ComicInfoPage.qml:
    // One may consider to unify them.
    Rectangle {
        anchors.fill: parent
        color: Theme.rgba(Theme.highlightDimmerColor, 0.9)

        Column {
            id: infoColumn
            spacing: Theme.paddingMedium
            anchors.centerIn: parent
            width: parent.width - 2 * Theme.paddingMedium

            Grid {
                columns: 2
                spacing: Theme.paddingMedium

                Label {
                    id: nameHeaderLabel
                    text: qsTr("Name") + " "
                    font {
                        italic: true
                        pixelSize: Theme.fontSizeMedium
                    }
                    color: Theme.secondaryColor
                }

                Label {
                    id: nameLabel
                    text: comic.name
                    width: parent.width
                    font.pixelSize: Theme.fontSizeMedium
                    truncationMode: TruncationMode.Fade
                }

                Label {
                    id: authorsHeaderLabel
                    text: comic.authors.length > 1 ? qsTr("Authors")  + " " : qsTr("Author") + " "
                    font {
                        italic: true
                        pixelSize: Theme.fontSizeMedium
                    }
                    color: Theme.secondaryColor
                }

                Label {
                    id: authorsLabel
                    text: comic.authors.join(", ")
                    font.pixelSize: Theme.fontSizeMedium
                    truncationMode: TruncationMode.Fade
                }

                Label {
                    id: languageHeaderLabel
                    text: qsTr("Language") + " "
                    font {
                        italic: true
                        pixelSize: Theme.fontSizeMedium
                    }
                    color: Theme.secondaryColor
                }

                Label {
                    id: languageLabel
                    text: comic.language
                    font.pixelSize: Theme.fontSizeMedium
                    truncationMode: TruncationMode.Fade
                }
            }

            Image {
                id: exampleImage
                source: comic.id ? comic.examplePath : ''
                fillMode: Image.PreserveAspectFit
                smooth: true
                asynchronous: true

                width: parent.width
                height: comicInfoPanel.height - (nameLabel.height + 5 * Theme.paddingMedium
                        + authorsLabel.height + languageLabel.height)

                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

    }

    PushUpMenu {
        id: homepagePushUpMenu

        MenuItem {
            text: qsTr("Go to homepage")
            onClicked: Qt.openUrlExternally(comic.homepage)
        }
    }
}
