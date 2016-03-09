TEMPLATE = app
TARGET = runtime

load(ubuntu-click)

QT += qml quick

SOURCES += main.cpp dataobject.cpp
HEADERS += dataobject.h

RESOURCES += runtime.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  runtime.apparmor \
               runtime.desktop \
               runtime.png

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)

#show all the files in QtCreator
OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES}

#specify where the config files are installed to
config_files.path = /runtime
config_files.files += $${CONF_FILES}
INSTALLS+=config_files

# Default rules for deployment.
target.path = $${UBUNTU_CLICK_BINARY_PATH}
INSTALLS+=target

