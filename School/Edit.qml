import QtQuick 2.4
import Ubuntu.Components 1.3
import U1db 1.0 as U1db
import "script.js" as Js

Page {
    header: PageHeader {
        id: pageHeader
        title: i18n.tr("Edit TimeTable")
        StyleHints {
            //foregroundColor: UbuntuColors.coolGrey
            backgroundColor:  "transparent"
            //dividerColor: "transparent"
        }
        leadingActionBar.actions: [
            Action {
                iconName: "back"
                visible: isFirstStart()
                onTriggered: {
                    pageStack.pop()
                    //if (!isFirstStart())
                        //header_sections.updateSelectedIndex()
                }
                text: i18n.tr("Close")
                shortcut: "esc"
            }
        ]
        trailingActionBar.actions: [
            Action {
                iconName: "close"
                visible: !isFirstStart()
                onTriggered: {
                    pageStack.pop()
                    //if (!isFirstStart())
                        //header_sections.updateSelectedIndex()
                }
                text: i18n.tr("Close")
                shortcut: "esc"
            },
            Action {
                iconName: isFirstStart() ? "tick" : "ok"
                text: i18n.tr("Accept")
                onTriggered: {
                    accept(monday1.text(),monday2.text(),monday3.text(),monday4.text(),monday5.text(),monday6.text(),
                           tuesday1.text(),tuesday2.text(),tuesday3.text(),tuesday4.text(),tuesday5.text(),tuesday6.text(),
                           wednesday1.text(),wednesday2.text(),wednesday3.text(),wednesday4.text(),wednesday5.text(),wednesday6.text(),
                           thursday1.text(),thursday2.text(),thursday3.text(),thursday4.text(),thursday5.text(),thursday6.text(),
                           friday1.text(),friday2.text(),friday3.text(),friday4.text(),friday5.text(),friday6.text(),
                           saturday1.text(),saturday2.text(),saturday3.text(),saturday4.text())
                    if (isFirstStart()) {
                        firstEdit()
                        pageStack.push(Qt.resolvedUrl("MainPage.qml"))
                    }
                    else {
                        pageStack.pop()
                    }
                }
                shortcut: "enter"
            }

        ]
        extension: SectionsDays {
            id: header_sections_edit
        }
    }

    BackGround {}

    Timer {
        id: timerScroll
        interval: 200; running: false; repeat: false
        onTriggered: page_flickable.flick(0,-1300)
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
                    topMargin: units.gu(2)
                }
                spacing: units.gu(2)

                Text {
                    id: name
                    text: i18n.tr("Subjects")
                    font.weight: Font.DemiBold
                    x: units.gu(2)
                    visible:  header_sections_edit.selectedIndex !== 6
                }
                Rectangle {
                    color: "#cdcdcd"
                    height: 1
                    width: parent.width
                    visible:  header_sections_edit.selectedIndex !== 6
                }

                //Lunedì
                EditHour {
                    id: monday1
                    dbPath: matLunedi.contents.primaOra
                    indexDay: 0
                }
                EditHour {
                    id: monday2
                    dbPath: matLunedi.contents.secondaOra
                    indexDay: 0
                }
                EditHour {
                    id: monday3
                    dbPath: matLunedi.contents.terzaOra
                    indexDay: 0
                }
                EditHour {
                    id: monday4
                    dbPath: matLunedi.contents.quartaOra
                    indexDay: 0
                    scroll: true
                }
                EditHour {
                    id: monday5
                    dbPath: matLunedi.contents.quintaOra
                    indexDay: 0
                    scroll: true
                }
                EditHour {
                    id: monday6
                    dbPath: matLunedi.contents.sestaOra
                    indexDay: 0
                    scroll: true
                }
                /*ListItem {
                    focus : false
                    FocusScope {
                        //x: lun6.x; y: lun6.y
                        width: lun6.width; height: lun6.height
                        visible: header_sections_edit.selectedIndex === 0
                        SlotsLayout.position: SlotsLayout.Leading
                        ListItemLayout {
                            focus : false
                            id: lun6
                            //title.text: i18n.tr(matLunedi.contents.sestaOra)
                            TextField  {
                                id: lunediOra6
                                activeFocusOnTab : true
                                placeholderText: i18n.tr("Insert a subject")
                                text: i18n.tr(matLunedi.contents.sestaOra)
                                onActiveFocusChanged: {
                                    if (activeFocus) {
                                        console.log("Focus attivo!")
                                        //page_flickable.flick(0,-500)
                                        timerScroll.start()
                                    } else {
                                        console.log("Focus perso!")
                                    }
                                }
                            }
                        }
                    }
                }*/

                //Martedì
                EditHour {
                    id: tuesday1
                    dbPath: matMartedi.contents.primaOra
                    indexDay: 1
                }
                EditHour {
                    id: tuesday2
                    dbPath: matMartedi.contents.secondaOra
                    indexDay: 1
                }
                EditHour {
                    id: tuesday3
                    dbPath: matMartedi.contents.terzaOra
                    indexDay: 1
                }
                EditHour {
                    id: tuesday4
                    dbPath: matMartedi.contents.quartaOra
                    indexDay: 1
                    scroll: true
                }
                EditHour {
                    id: tuesday5
                    dbPath: matMartedi.contents.quintaOra
                    indexDay: 1
                    scroll: true
                }
                EditHour {
                    id: tuesday6
                    dbPath: matMartedi.contents.sestaOra
                    indexDay: 1
                    scroll: true
                }


                //Mercoledì
                EditHour {
                    id: wednesday1
                    dbPath: matMercoledi.contents.ora1
                    indexDay: 2
                }
                EditHour {
                    id: wednesday2
                    dbPath: matMercoledi.contents.ora2
                    indexDay: 2
                }
                EditHour {
                    id: wednesday3
                    dbPath: matMercoledi.contents.ora3
                    indexDay: 2
                }
                EditHour {
                    id: wednesday4
                    dbPath: matMercoledi.contents.ora4
                    indexDay: 2
                    scroll: true
                }
                EditHour {
                    id: wednesday5
                    dbPath: matMercoledi.contents.ora5
                    indexDay: 2
                    scroll: true
                }
                EditHour {
                    id: wednesday6
                    dbPath: matMercoledi.contents.ora6
                    indexDay: 2
                    scroll: true
                }


                //Giovedì
                EditHour {
                    id: thursday1
                    dbPath: matGiovedi.contents.ora1
                    indexDay: 3
                }
                EditHour {
                    id: thursday2
                    dbPath: matGiovedi.contents.ora2
                    indexDay: 3
                }
                EditHour {
                    id: thursday3
                    dbPath: matGiovedi.contents.ora3
                    indexDay: 3
                }
                EditHour {
                    id: thursday4
                    dbPath: matGiovedi.contents.ora4
                    indexDay: 3
                    scroll: true
                }
                EditHour {
                    id: thursday5
                    dbPath: matGiovedi.contents.ora5
                    indexDay: 3
                    scroll: true
                }
                EditHour {
                    id: thursday6
                    dbPath: matGiovedi.contents.ora6
                    indexDay: 3
                    scroll: true
                }


                //Venerdì
                EditHour {
                    id: friday1
                    dbPath: matVenerdi.contents.ora1
                    indexDay: 4
                }
                EditHour {
                    id: friday2
                    dbPath: matVenerdi.contents.ora2
                    indexDay: 4
                }
                EditHour {
                    id: friday3
                    dbPath: matVenerdi.contents.ora3
                    indexDay: 4
                }
                EditHour {
                    id: friday4
                    dbPath: matVenerdi.contents.ora4
                    indexDay: 4
                    scroll: true
                }
                EditHour {
                    id: friday5
                    dbPath: matVenerdi.contents.ora5
                    indexDay: 4
                    scroll: true
                }
                EditHour {
                    id: friday6
                    dbPath: matVenerdi.contents.ora6
                    indexDay: 4
                    scroll: true
                }

                //Sabato
                EditHour {
                    id: saturday1
                    dbPath: matSabato.contents.ora1
                    indexDay: 5
                }
                EditHour {
                    id: saturday2
                    dbPath: matSabato.contents.ora2
                    indexDay: 5
                }
                EditHour {
                    id: saturday3
                    dbPath: matSabato.contents.ora3
                    indexDay: 5
                }
                EditHour {
                    id: saturday4
                    dbPath: matSabato.contents.ora4
                    indexDay: 5
                    scroll: true
                }


            }
        }
    }

    //Domenica
    Sunday {
        id: sunday
        visible: header_sections_edit.selectedIndex === 6
        anchors {
            top: pageHeader.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }
}

