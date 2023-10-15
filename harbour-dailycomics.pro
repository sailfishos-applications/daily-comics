TARGET = harbour-dailycomics

CONFIG += \
    sailfishapp \
    sailfishapp_i18n \
    c++11

SOURCES += $$files(src/*.cpp)

HEADERS += $$files(src/*.h)

OTHER_FILES = \
    $$files(qml/*.qml, true) \
    translations/* \
    rpm/$${TARGET}.spec \
    rpm/$${TARGET}.rpmlintrc \
    $${TARGET}.desktop

RESOURCES += $${TARGET}.qrc

QT += sql

images.files = images
images.path = /usr/share/$${TARGET}

plugins.files = plugins
plugins.path = /usr/share/$${TARGET}

INSTALLS += \
    images \
    plugins

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

DEFINES += \
    APP_VERSION=\"\\\"$${VERSION}\\\"\" \
    PLUGINS_FOLDER_PATH=\"\\\"$${plugins.path}/plugins\\\"\"

TRANSLATIONS += \
    translations/$${TARGET}.ts \
    translations/$${TARGET}-de.ts \
    translations/$${TARGET}-fr.ts \
    translations/$${TARGET}-nl.ts \
    translations/$${TARGET}-sv.ts
