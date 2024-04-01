/**
 * Copyright (c) 2015 Damien Tardy-Panis <damien@tardypad.me>
 * Copyright (c) 2018,2019 Oleg Linkin <maledictusdemagog@gmail.com>
 * Copyright (c) 2023,2024 olf <Olf0@users.noreply.github.com>
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
        contentHeight: infoColumn.height

        PageHeader {
            title: qsTr("Comic info")
        }

        // The content of this Column {} is very similar to the one in qml/components/ComicInfoPage.qml:
        // One may consider to unify them as an own component, but that likely would have to be parametrised.
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
                    text: comic.authors.join("\n")
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

            Label {
                id: exampleImageHeaderLabel
                text: qsTr("Example")
                font {
                    italic: true
                    pixelSize: Theme.fontSizeMedium
                }
                color: Theme.secondaryColor
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Image {
                id: exampleImage
                source: comic.id ? comic.examplePath : ''
                fillMode: Image.PreserveAspectFit
                smooth: true
                asynchronous: true

                width: parent.width

                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        VerticalScrollDecorator { }
    }

    PullDownMenu {
        id: homepagePullDownMenu

        MenuItem {
            text: qsTr("Go to homepage")
            onClicked: Qt.openUrlExternally(comic.homepage)
        }
    }
}
