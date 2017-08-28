import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import U1db 1.0 as U1db
//import QtSystemInfo 5.0
import "script.js" as Js

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"
    id: mainView

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "school.mymike"

    width: units.gu(40)
    height: units.gu(75)

    /*ScreenSaver {
        id: screen_saver
        screenSaverEnabled: true
    }*/

    //property bool isDisplayOn: false
    property var numbers: [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
    // Book - Exercise > Mon - Tue - ...
    // [0][0] -> Mon, Book
    // [4][1] -> Fri, Exercise

    property var date: new Date()
    property int day: date.getDay()
    property int hour: date.getHours()
    property int min: date.getMinutes()

    property int selIndex: 0

    //backgroundColor: "#bf3421"
    backgroundColor: UbuntuColors.porcelain

    U1db.Database { id: db; path: "subjects.u1db" }
    U1db.Document {
        id: matLunedi
        database: db
        docId: "matLunedi"
        create: true
        defaults: {
            primaOra: "Italiano"
            secondaOra:"Italiano"
            terzaOra: "Matematica"
            quartaOra: "Informatica"
            quintaOra: "Telecomunicazioni"
            sestaOra: "😇"
        }
    }
    U1db.Document {
        id: matMartedi
        database: db
        docId: "matMartedi"
        create: true
        defaults: { //unusefull ? -> remove ?
            primaOra: "Telecomunicazioni"
            secondaOra:"Sistemi & Reti"
            terzaOra: "Compl. Mate"
            quartaOra: "Informatica"
            quintaOra: "Sistemi & Reti"
            sestaOra: "😇"
        }
    }
    U1db.Document {
        id: matMercoledi
        database: db
        docId: "matMercoledi"
        create: true
        defaults: {ora1:"";ora2:"";ora3:"";ora4:"";ora5:"";ora6:""}
    }
    U1db.Document {
        id: matGiovedi
        database: db
        docId: "matGiovedi"
        create: true
        defaults: {ora1:"";ora2:"";ora3:"";ora4:"";ora5:"";ora6:"";}
    }
    U1db.Document {
        id: matVenerdi
        database: db
        docId: "matVenerdi"
        create: true
        defaults: {ora1:"";ora2:"";ora3:"";ora4:"";ora5:"";ora6:""}
    }
    U1db.Document {
        id: matSabato
        database: db
        docId: "matSabato"
        create: true
        defaults: {ora1:"";ora2:"";ora3:"";ora4:"";ora5:"";ora6:""}
    }

    function accept(lunediOra1,lunediOra2,lunediOra3,lunediOra4,lunediOra5,lunediOra6,martediOra1,martediOra2,martediOra3,martediOra4,martediOra5,martediOra6,mercolediOra1,mercolediOra2,mercolediOra3,mercolediOra4,mercolediOra5,mercolediOra6,giovediOra1,giovediOra2,giovediOra3,giovediOra4,giovediOra5,giovediOra6,venerdiOra1,venerdiOra2,venerdiOra3,venerdiOra4,venerdiOra5,venerdiOra6,sabatoOra1,sabatoOra2,sabatoOra3,sabatoOra4) {
        //SALVA TUTTO NEL DB - save all in the db
        /*var c = matLunedi.contents
        c["primaOra"] = lunediOra1
        c["secondaOra"] = lunediOra2
        c["terzaOra"] = lunediOra3
        c["quartaOra"] = lunediOra4
        c["quintaOra"] = lunediOra5
        c["sestaOra"] = lunediOra6
        matLunedi.contents = c*/
        matLunedi.contents = {primaOra: lunediOra1,secondaOra: lunediOra2,terzaOra: lunediOra3,quartaOra: lunediOra4,quintaOra: lunediOra5,sestaOra: lunediOra6}
        matMartedi.contents = {primaOra: martediOra1,secondaOra: martediOra2,terzaOra: martediOra3,quartaOra: martediOra4,quintaOra: martediOra5,sestaOra: martediOra6}
        matMercoledi.contents = {ora1: mercolediOra1,ora2: mercolediOra2,ora3: mercolediOra3,ora4: mercolediOra4,ora5: mercolediOra5,ora6: mercolediOra6}
        matGiovedi.contents = {ora1: giovediOra1,ora2: giovediOra2,ora3: giovediOra3,ora4: giovediOra4,ora5: giovediOra5,ora6: giovediOra6}
        matVenerdi.contents = {ora1: venerdiOra1, ora2: venerdiOra2, ora3: venerdiOra3, ora4: venerdiOra4, ora5: venerdiOra5, ora6: venerdiOra6}
        matSabato.contents = {ora1: sabatoOra1, ora2: sabatoOra2, ora3: sabatoOra3, ora4: sabatoOra4}
    }

    anchorToKeyboard: true
    PageStack {
        id: pageStack
        Page {
            id: mainPage
            header: PageHeader {
                id: pageHeader
                title: i18n.tr("School TimeTable")
                StyleHints {
                    //foregroundColor: UbuntuColors.coolGrey
                    backgroundColor: "transparent"//"#bf3421"
                    dividerColor: "transparent"//"#bf3421"
                }
                trailingActionBar.actions: [
                    /*Action {
                        iconName: "close"
                        onTriggered: Qt.quit()
                        text: i18n.tr("Close")
                        shortcut: "esc"
                    },*/
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
                    id: header_sections
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }
                    model :[i18n.tr("Mon"),i18n.tr("Tue"),i18n.tr("Wed"),i18n.tr("Thu"),i18n.tr("Fri"),i18n.tr("Sat"),i18n.tr("Sun")]
                    onSelectedIndexChanged: selIndex = selectedIndex
                }
            }
            Component.onCompleted: {
                /*var c = matGiovedi.contents
                c["ora1"] = "ciao"
                matGiovedi.contents = c*/

                //matLunedi.contents = {primaOra: "Dirittopippo", secondaOra:"Matematica", terzaOra: "Matematica", quartaOra: "Informatica", quintaOra: "Storia", sestaOra: "Italiano"}

                header_sections.selectedIndex = day
                if (hour<14) {
                    if (day==0) header_sections.selectedIndex = 6
                    else header_sections.selectedIndex -= 1
                }
                selIndex = header_sections.selectedIndex
            }
            BackGround {}

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
    }
}
