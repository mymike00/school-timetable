import QtQuick 2.0
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Page {
    id: mainPage
    header: PageHeader {
        id: pageHeader
        title: i18n.tr("School TimeTable")
        StyleHints {
            //foregroundColor: UbuntuColors.coolGrey
            backgroundColor: "transparent"//"#bf3421"
            //dividerColor: "transparent"//"#bf3421"
        }
        leadingActionBar.actions: null
        trailingActionBar.actions: [
            Action {
                iconName: "close"
                onTriggered: Qt.quit()
                text: i18n.tr("Close")
                shortcut: "esc"
            },
            Action {
                iconName: "edit"
                text: i18n.tr("Edit")
                onTriggered: pageStack.push(Qt.resolvedUrl("Edit.qml"))
                shortcut: "f2"
            },
            Action {
                iconName: "info"
                text: i18n.tr("Info")
                onTriggered: pageStack.push(Qt.resolvedUrl("About.qml"))
                shortcut: "f1"
            }
        ]
        extension: Sections {
            anchors {
                left: parent.left
                right: parent.right
            }
            property var modelExtended: [i18n.tr("Monday"),i18n.tr("Tuesday"),i18n.tr("Wednesday"),i18n.tr("Thursday"),i18n.tr("Friday"),i18n.tr("Saturday"),i18n.tr("Sunday")]
            property var modelCompact: [i18n.tr("Mon"),i18n.tr("Tue"),i18n.tr("Wed"),i18n.tr("Thu"),i18n.tr("Fri"),i18n.tr("Sat"),i18n.tr("Sun")]
            property var modelCompactOrig: [i18n.tr("Mon"),i18n.tr("Tue"),i18n.tr("Wed"),i18n.tr("Thu"),i18n.tr("Fri"),i18n.tr("Sat"),i18n.tr("Sun")]
            property bool modelIsCompact: true
            id: header_sections
            selectedIndex: getSelDay()
            /*anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }*/
            model: modelCompact
            onSelectedIndexChanged: {
                if (!resizing)
                    setSelDay(selectedIndex)
                /*console.log(modelIsCompact+"\n"+selIndex)
                if (modelIsCompact) {
                    if (selIndex == 0)
                        //modelCompact[0] = i18n.tr("<b>Monday</b>")
                        model[0] = i18n.tr("<b>Monday</b>")
                    console.log(model)
                    //model = modelCompact
                }*/
            }
            function updateSelectedIndex() {
                selectedIndex = getSelDay()
            }
        }
        onWidthChanged: {
            resizing = true

            if (width > units.gu(45) && header_sections.modelIsCompact) {
                header_sections.model = header_sections.modelExtended
                header_sections.modelIsCompact=false
            }
            else if (width <= units.gu(45) && !header_sections.modelIsCompact) {
                header_sections.model = header_sections.modelCompact
                header_sections.modelIsCompact=true
            }
            resizing = false
            header_sections.selectedIndex = getSelDay()
        }
    }
    BackGround {}

    Component {
        id: edit
        Dialog {
            id: edit2
            title: i18n.tr("Edit Subject")
            TextField {
                id: editField
            }
            Button {
                text: i18n.tr("Ok")
                color: UbuntuColors.green
                onClicked: {
                    var c = matLunedi.contents
                    c['primaOra'] = editField.text
                    matLunedi.contents = c
                    lun1.title.text=i18n.tr(matLunedi.contents.primaOra)
                    PopupUtils.close(edit2)
                }
            }
            Button {
                text: i18n.tr("cancel")
                onClicked: PopupUtils.close(edit2)
            }
        }
    }

    ScrollView {
        id: page_scrollview
        anchors {
            top: pageHeader.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        Flickable {
            id: page_flickable
            anchors.fill: parent
            contentHeight:  main_column.height + units.gu(2)
            clip: true


            Column {
                id: main_column
                anchors {
                    left: parent.left
                    right: parent.right
                    top: parent.top
                }

                SubjectHeader {
                    visible:  header_sections.selectedIndex !== 6
                }

                //Monday
                Hour {
                    dbPath: matLunedi.contents.primaOra
                    indexDay: 0
                }
                Hour {
                    dbPath: matLunedi.contents.secondaOra
                    indexDay: 0
                }
                Hour {
                    dbPath: matLunedi.contents.terzaOra
                    indexDay: 0
                }
                Hour {
                    dbPath: matLunedi.contents.quartaOra
                    indexDay: 0
                }
                Hour {
                    dbPath: matLunedi.contents.quintaOra
                    indexDay: 0
                }
                Hour {
                    dbPath: matLunedi.contents.sestaOra
                    indexDay: 0
                }

                //Tuesday
                Hour {
                    dbPath: matMartedi.contents.primaOra
                    indexDay: 1
                }
                Hour {
                    dbPath: matMartedi.contents.secondaOra
                    indexDay: 1
                }
                Hour {
                    dbPath: matMartedi.contents.terzaOra
                    indexDay: 1
                }
                Hour {
                    dbPath: matMartedi.contents.quartaOra
                    indexDay: 1
                }
                Hour {
                    dbPath: matMartedi.contents.quintaOra
                    indexDay: 1
                }
                Hour {
                    dbPath: matMartedi.contents.sestaOra
                    indexDay: 1
                }


                property int dbHourIndex: 1
                property string dbWed1: "matMercoledi.contents.ora"+dbHourIndex
                //Wednesday
                Hour {
                    dbPath: matMercoledi.contents.ora1 //dbWed1      //FIXME
                    indexDay: 2
                }
                Hour {
                    dbPath: matMercoledi.contents.ora2
                    indexDay: 2
                }
                Hour {
                    dbPath: matMercoledi.contents.ora3
                    indexDay: 2
                }
                Hour {
                    dbPath: matMercoledi.contents.ora4
                    indexDay: 2
                }
                Hour {
                    dbPath: matMercoledi.contents.ora5
                    indexDay: 2
                }
                Hour {
                    dbPath: matMercoledi.contents.ora6
                    indexDay: 2
                }


                //Thursday
                Hour {
                    dbPath: matGiovedi.contents.ora1
                    indexDay: 3
                }
                Hour {
                    dbPath: matGiovedi.contents.ora2
                    indexDay: 3
                }
                Hour {
                    dbPath: matGiovedi.contents.ora3
                    indexDay: 3
                }
                Hour {
                    dbPath: matGiovedi.contents.ora4
                    indexDay: 3
                }
                Hour {
                    dbPath: matGiovedi.contents.ora5
                    indexDay: 3
                }
                Hour {
                    dbPath: matGiovedi.contents.ora6
                    indexDay: 3
                }


                //Friday
                Hour {
                    dbPath: matVenerdi.contents.ora1
                    indexDay: 4
                }
                Hour {
                    dbPath: matVenerdi.contents.ora2
                    indexDay: 4
                }
                Hour {
                    dbPath: matVenerdi.contents.ora3
                    indexDay: 4
                }
                Hour {
                    dbPath: matVenerdi.contents.ora4
                    indexDay: 4
                }
                Hour {
                    dbPath: matVenerdi.contents.ora5
                    indexDay: 4
                }
                Hour {
                    dbPath: matVenerdi.contents.ora6
                    indexDay: 4
                }


                //Saturday
                Hour {
                    dbPath: matSabato.contents.ora1
                    indexDay: 5
                }
                Hour {
                    dbPath: matSabato.contents.ora2
                    indexDay: 5
                }
                Hour {
                    dbPath: matSabato.contents.ora3
                    indexDay: 5
                }
                Hour {
                    dbPath: matSabato.contents.ora4
                    indexDay: 5
                }

                ExcerciseBookCounter {
                    indexDay: 0
                    id: numbersMon
                }
                ExcerciseBookCounter {
                    indexDay: 1
                    id: numbersTue
                }
                ExcerciseBookCounter {
                    indexDay: 2
                    id: numbersWed
                }
                ExcerciseBookCounter {
                    indexDay: 3
                    id: numbersThu
                }
                ExcerciseBookCounter {
                    indexDay: 4
                    id: numbersFri
                }
                ExcerciseBookCounter {
                    indexDay: 5
                    id: numbersSat
                }
            }
        }
    }

    //Domenica
    Sunday {
        id: sunday
        visible: header_sections.selectedIndex === 6
        anchors {
            top: pageHeader.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }
}

