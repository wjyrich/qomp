INCLUDEPATH += $$PWD

SOURCES += $$PWD/common.cpp \
        $$PWD/options.cpp \
        $$PWD/qompmetadataresolver.cpp \
        $$PWD/qompnetworkingfactory.cpp \
        $$PWD/qompplayer.cpp \
        $$PWD/tune.cpp \
        $$PWD/pluginmanager.cpp \
        $$PWD/pluginhost.cpp \
        $$PWD/tuneurlchecker.cpp

HEADERS += $$PWD/libqomp_global.h \
        $$PWD/common.h \
        $$PWD/options.h \        
        $$PWD/qompmetadataresolver.h \
        $$PWD/qompnetworkingfactory.h \
        $$PWD/qompplayer.h \
        $$PWD/tune.h \
        $$PWD/defines.h \
        $$PWD/pluginmanager.h \
        $$PWD/pluginhost.h \
        $$PWD/tuneurlchecker.h


android {
    HEADERS += $$PWD/qompqmlengine.h  \
         $$PWD/scaler.h

    SOURCES += $$PWD/qompqmlengine.cpp  \
         $$PWD/scaler.cpp

    RESOURCES += $$PWD/qml.qrc
}
else {
    HEADERS += $$PWD/qompbusylabel.h \
               $$PWD/qompactionslist.h

    SOURCES += $$PWD/qompbusylabel.cpp \
               $$PWD/qompactionslist.cpp
}

lupdate_only {
    SOURCES += $$PWD/qmlshared/*.qml
}

include(plugins/plugins.pri)
include(options/options.pri)
