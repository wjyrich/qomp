INCLUDEPATH += $$PWD
DEPENDPATH += $$PWD

SOURCES += $$PWD/main.cpp \
    $$PWD/qompcon.cpp \
    $$PWD/qompplaylistmodel.cpp \
    $$PWD/updateschecker.cpp \
    $$PWD/qomptunedownloader.cpp \
    $$PWD/translator.cpp \
    $$PWD/qompcommandline.cpp
#    $$PWD/qomptaglibmetadataresolver.cpp \


HEADERS  += $$PWD/qompmainwin.h \
    $$PWD/qompcon.h \
    $$PWD/qompplaylistmodel.h \   
    $$PWD/updateschecker.h \
    $$PWD/qomptunedownloader.h \
    $$PWD/translator.h \
    $$PWD/qompcommandline.h
#    $$PWD/qomptaglibmetadataresolver.h \

RESOURCES+= $$PWD/qomp.qrc

android {
    SOURCES     +=  $$PWD/qompmainwin_mobile.cpp

    HEADERS     +=

    RESOURCES   += $$PWD/qml.qrc

OTHER_FILES += $$PWD/../android/AndroidManifest.xml \
    $$PWD/../android/src/net/sourceforge/qomp/Qomp.java \
    $$PWD/../android/src/net/sourceforge/qomp/QompService.java
}
else {
    SOURCES += $$PWD/qomptrayicon.cpp \
        $$PWD/qompmainwin.cpp \
        $$PWD/aboutdlg.cpp \
        $$PWD/qompplaylistdelegate.cpp \
        $$PWD/qompplaylistview.cpp \
        $$PWD/qompmenu.cpp

    HEADERS += $$PWD/qomptrayicon.h \
        $$PWD/aboutdlg.h \
        $$PWD/qompplaylistdelegate.h \
        $$PWD/qompplaylistview.h \
        $$PWD/qompmenu.h

    FORMS   += \
        $$PWD/qompmainwin.ui \
        $$PWD/aboutdlg.ui

    RESOURCES   += $$PWD/themes.qrc
}

qtmultimedia_backend {
    HEADERS += $$PWD/qompqtmultimediaplayer.h #\
       # $$PWD/qompqtmultimediametadataresolver.h

    SOURCES += $$PWD/qompqtmultimediaplayer.cpp #\
       # $$PWD/qompqtmultimediametadataresolver.cpp
}

mac {
    HEADERS += $$PWD/CocoaTrayClick.h

    SOURCES += $$PWD/CocoaTrayClick.cpp
}
lupdate_only {
    SOURCES += $$PWD/qml/*.qml
}
include (options/options.pri)
