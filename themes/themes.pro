CONFIG -= debug_and_release debug_and_release_target

QT -= core gui

RESOURCES += \
    themes.qrc


system( rcc -binary themes.qrc -o $$OUT_PWD/themes.rcc )

unix:!android {
	isEmpty(PREFIX) {
		PREFIX = /usr/local
	}
	DATADIR = $$PREFIX/share/qomp
	themes.path = $$DATADIR/themes
        themes.extra = $$QMAKE_COPY $$OUT_PWD/themes.rcc $(INSTALL_ROOT)$$themes.path/themes.rcc
	INSTALLS += themes
}
