TEMPLATE = subdirs

sub_prostopleerplugin.subdir = prostopleerplugin
sub_urlplugin.subdir = urlplugin
sub_lastfmplugin.subdir = lastfmplugin
sub_myzukaruplugin.subdir = myzukaruplugin
sub_yandexmusicplugin.subdir = yandexmusicplugin
sub_notificationsplugin.subdir = notificationsplugin

SUBDIRS +=  sub_prostopleerplugin \
        sub_myzukaruplugin \
        sub_lastfmplugin \
        sub_yandexmusicplugin \
        sub_urlplugin \
        sub_notificationsplugin

!android {
    sub_filesystemplugin.subdir = filesystemplugin
    sub_tunetofileplugin.subdir = tunetofileplugin

    SUBDIRS += sub_filesystemplugin \
            sub_tunetofileplugin
}

unix:!mac:!android: {
    sub_mprisplugin.subdir = mprisplugin
    SUBDIRS += sub_mprisplugin
}
