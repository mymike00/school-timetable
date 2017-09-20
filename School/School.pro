TEMPLATE = aux
TARGET = School

RESOURCES += School.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  School.apparmor \
               img/Party-Poppers.png \
               Party-Poppers.png \
               schoolhouse.svg \
               img/folds.svg \
               img/fold1.svg \
               fold2.svg \
               fold3.svg \
               schoolhouse2.svg

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)               

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES} \
               School.desktop

#specify where the qml/js files are installed to
qml_files.path = /School
qml_files.files += $${QML_FILES}

#specify where the config files are installed to
config_files.path = /School
config_files.files += $${CONF_FILES}

#install the desktop file, a translated version is 
#automatically created in the build directory
desktop_file.path = /School
desktop_file.files = $$OUT_PWD/School.desktop
desktop_file.CONFIG += no_check_exist

INSTALLS+=config_files qml_files desktop_file

DISTFILES += \
    Edit.qml \
    script.js \
    ExcerciseBookCounter.qml \
    db.js \
    SubjectHeader.qml \
    EditHour.qml \
    FirstStart.qml \
    MainPage.qml \
    Padding.qml

