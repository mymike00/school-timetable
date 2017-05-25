import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import U1db 1.0 as U1db
//import QtSystemInfo 5.0
//import U1db 1.0 as U1db

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "school.mymike"

    width: units.gu(40)
    height: units.gu(75)

    /*ScreenSaver {
        id: screen_saver
        screenSaverEnabled: true
    }*/

    //property bool isDisplayOn: false
    property int nLibriLun: 0
    property int nQuaderniLun: 0

    property int nLibriMar: 0
    property int nQuaderniMar: 0

    property int nLibriMer: 0
    property int nQuaderniMer: 0

    property int nLibriGio: 0
    property int nQuaderniGio: 0

    property int nLibriVen: 0
    property int nQuaderniVen: 0

    property int nLibriSab: 0
    property int nQuaderniSab: 0

    //property int x: 3

    property var date: new Date()
    property int day: date.getDay()
    property int hour: date.getHours()
    property int min: date.getMinutes()

    //backgroundColor: "#f6d3cd"
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
            header: PageHeader {
                id: pageHeader
                title: i18n.tr("School TimeTable")
                StyleHints {
                    //foregroundColor: UbuntuColors.coolGrey
                    backgroundColor:  "transparent"
                    dividerColor: "transparent"
                }
                trailingActionBar.actions: [
                    Action {
                        iconName: "close"
                        onTriggered: Qt.quit()
                        text: i18n.tr("Close")
                    },
                    Action {
                        iconName: "edit"
                        text: i18n.tr("Edit")
                        onTriggered: {
                            pageStack.push(Qt.resolvedUrl("Edit.qml"))
                            //header_sections_edit.selectedIndex = header_sections.selectedIndex // - da corregere. db?
                        }
                    },
                    Action {
                        iconName: "info"
                        text: i18n.tr("Info")
                        onTriggered: pageStack.push(Qt.resolvedUrl("About.qml"))
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

                /*if (lun1.title.text==="Diritto"||lun1.title.text==="Matematica") {
                    lun1_2.checked=true
                    nQuaderniLun +=1
                }
                if (lun1.title.text==="Storia"||lun1.title.text==="Matematica") {
                    lun1_1.checked=true
                    nLibriLun +=1
                }

                if (lun2.title.text==="Diritto"||lun2.title.text==="Matematica") {
                    lun2_2.checked=true
                    nQuaderniLun +=1
                }
                if (lun2.title.text==="Storia"||lun2.title.text==="Matematica") {
                    lun2_1.checked=true
                    nLibriLun +=1
                }

                if (lun3.title.text==="Diritto"||lun3.title.text==="Matematica") {
                    lun3_2.checked=true
                    nQuaderniLun +=1
                }
                if (lun3.title.text==="Storia"||lun3.title.text==="Matematica") {
                    lun3_1.checked=true
                    nLibriLun +=1
                }

                if (lun4.title.text==="Diritto"||lun4.title.text==="Matematica") {
                    lun4_2.checked=true
                    nQuaderniLun +=1
                }
                if (lun4.title.text==="Storia"||lun4.title.text==="Matematica") {
                    lun4_1.checked=true
                    nLibriLun +=1
                }

                if (lun5.title.text==="Diritto"||lun5.title.text==="Matematica") {
                    lun5_2.checked=true
                    nQuaderniLun +=1
                }
                if (lun5.title.text==="Storia"||lun5.title.text==="Matematica") {
                    lun5_1.checked=true
                    nLibriLun +=1
                }

                if (lun6.title.text==="Diritto"||lun6.title.text==="Matematica") {
                    lun6_2.checked=true
                    nQuaderniLun +=1
                }
                if (lun6.title.text==="Storia"||lun6.title.text==="Matematica") {
                    lun6_1.checked=true
                    nLibriLun +=1
                }*/
            }

            Image {
                source: "fold3.svg"
                width: pageStack.width
                height: width*2
                y: (pageStack.height-this.width)/2
                opacity: 0.02
            }
            Image {
                source: "fold2.svg"
                width: pageStack.width
                height: pageStack.height
                opacity: 0.03
            }

            Component {
                id: edit
                Dialog {
                    id: edit2
                    title: i18n.tr("Modifica Materia")
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
                    anchors {
                        top: pageHeader.bottom
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }
                    contentHeight:  main_column.height + units.gu(2)
                    clip: true

                    //Domenica
                    Column {
                        height:holiday.height+name.height+name2.height
                        y:(pageStack.height-this.height-pageHeader.height-units.gu(5))/2
                        anchors.horizontalCenter: parent.horizontalCenter
                        visible: header_sections.selectedIndex === 6
                        spacing: units.gu(0.5)
                        Image {
                            id: holiday
                            source: "Party-Poppers.png"
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: units.gu(25)
                            width: height
                        }
                        Text {
                            id: name
                            text: i18n.tr("You don't go to School")
                            font.pointSize: units.gu(2.5)
                            anchors.horizontalCenter: parent.horizontalCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                        Text {
                            id: name2
                            text: i18n.tr("You're on Holiday")
                            font.pointSize: units.gu(2.5)
                            anchors.horizontalCenter: parent.horizontalCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    Column {
                        id: main_column

                        anchors {
                            left: parent.left
                            right: parent.right
                            top: parent.top
                        }

                        ListItem {
                            visible:  header_sections.selectedIndex !== 6
                            ListItemLayout {
                                title.text: i18n.tr("Subjects")
                                title.font.weight: Font.DemiBold
                                Icon {
                                    name: "bookmark"
                                    color: UbuntuColors.blue
                                    height: units.gu(3)
                                    width: height
                                }
                                Icon {
                                    name: "edit-copy"
                                    color: UbuntuColors.blue
                                    height: units.gu(3)
                                    width: height
                                }
                            }
                            onClicked: {}
                        }

                        //Lunedì
                        ListItem {
                            visible: header_sections.selectedIndex === 0
                            ListItemLayout {
                                id: lun1
                                title.text: matLunedi.contents.primaOra+"" === "" ? matLunedi.defaults.primaOra : matLunedi.contents.primaOra

                                CheckBox {
                                    id: lun1_1; width:units.gu(3); height:width;

                                    onClicked: {
                                        if (lun1_1.checked == true) nLibriLun += 1
                                        else if (lun1_1.checked == false) nLibriLun -= 1
                                    }
                                }
                                CheckBox {
                                    id: lun1_2; width:units.gu(3); height:width;

                                    onClicked: {
                                        if (lun1_2.checked == true) nQuaderniLun += 1
                                        else if (lun1_2.checked == false) nQuaderniLun -= 1
                                    }
                                }
                            }
                            /*trailingActions: ListItemActions {
                                actions: [
                                    Action {
                                        iconName: "edit"
                                        onTriggered: {PopupUtils.open(edit)}        //SET DIALOG PARAMS
                                    }
                                ]
                            }*/
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 0
                            ListItemLayout {
                                id: lun2
                                title.text: i18n.tr(matLunedi.contents.secondaOra)

                                CheckBox {
                                    id: lun2_1; width:units.gu(3); height:width;

                                    onClicked: {
                                        if (lun2_1.checked == true) nLibriLun += 1
                                        else if (lun2_1.checked == false) nLibriLun -= 1
                                    }
                                }
                                CheckBox {
                                    id: lun2_2; width:units.gu(3); height:width;

                                    onClicked: {
                                        if (lun2_2.checked == true) nQuaderniLun += 1
                                        else if (lun2_2.checked == false) nQuaderniLun -= 1
                                    }
                                }
                            }
                            /*trailingActions: ListItemActions {
                                actions: [
                                    Action {iconName: "edit"}        ///CIAO A TUTTI VADO IN VACANZA
                                ]
                            }*/

                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 0
                            ListItemLayout {
                                id: lun3
                                title.text: i18n.tr(matLunedi.contents.terzaOra)

                                CheckBox {
                                    id: lun3_1; width:units.gu(3); height:width;

                                    onClicked: {
                                        if (lun3_1.checked == true) nLibriLun += 1
                                        else if (lun3_1.checked == false) nLibriLun -= 1
                                    }
                                }
                                CheckBox {
                                    id: lun3_2; width:units.gu(3); height:width;

                                    onClicked: {
                                        if (lun3_2.checked == true) nQuaderniLun += 1
                                        else if (lun3_2.checked == false) nQuaderniLun -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 0
                            ListItemLayout {
                                id: lun4
                                title.text: i18n.tr(matLunedi.contents.quartaOra)

                                CheckBox {
                                    id: lun4_1; width:units.gu(3); height:width;

                                    onClicked: {
                                        if (lun4_1.checked == true) nLibriLun += 1
                                        else if (lun4_1.checked == false) nLibriLun -= 1
                                    }
                                }
                                CheckBox {
                                    id: lun4_2; width:units.gu(3); height:width;

                                    onClicked: {
                                        if (lun4_2.checked == true) nQuaderniLun += 1
                                        else if (lun4_2.checked == false) nQuaderniLun -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 0
                            ListItemLayout {
                                id: lun5
                                title.text: i18n.tr(matLunedi.contents.quintaOra)

                                CheckBox {
                                    id: lun5_1; width:units.gu(3); height:width;

                                    onClicked: {
                                        if (lun5_1.checked == true) nLibriLun += 1
                                        else if (lun5_1.checked == false) nLibriLun -= 1
                                    }
                                }
                                CheckBox {
                                    id: lun5_2; width:units.gu(3); height:width;

                                    onClicked: {
                                        if (lun5_2.checked == true) nQuaderniLun += 1
                                        else if (lun5_2.checked == false) nQuaderniLun -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 0
                            ListItemLayout {
                                id: lun6
                                title.text: i18n.tr(matLunedi.contents.sestaOra)

                                CheckBox {
                                    id: lun6_1; width:units.gu(3); height:width;

                                    onClicked: {
                                        if (lun6_1.checked == true) nLibriLun += 1
                                        else if (lun6_1.checked == false) nLibriLun -= 1
                                    }
                                }
                                CheckBox {
                                    id: lun6_2; width:units.gu(3); height:width;

                                    onClicked: {
                                        if (lun6_2.checked == true) nQuaderniLun += 1
                                        else if (lun6_2.checked == false) nQuaderniLun -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }

                        //Martedì
                        ListItem {
                            visible: header_sections.selectedIndex === 1
                            ListItemLayout {
                                title.text: i18n.tr(matMartedi.contents.primaOra)

                                CheckBox {
                                    id: mar1_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mar1_1.checked == true) nLibriMar += 1
                                        else if (mar1_1.checked == false) nLibriMar -= 1
                                    }
                                }
                                CheckBox {
                                    id: mar1_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mar1_2.checked == true) nQuaderniMar += 1
                                        else if (mar1_2.checked == false) nQuaderniMar -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 1
                            ListItemLayout {
                                title.text: i18n.tr(matMartedi.contents.secondaOra)

                                CheckBox {
                                    id: mar2_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mar2_1.checked == true) nLibriMar += 1
                                        else if (mar2_1.checked == false) nLibriMar -= 1
                                    }
                                }
                                CheckBox {
                                    id: mar2_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mar2_2.checked == true) nQuaderniMar += 1
                                        else if (mar2_2.checked == false) nQuaderniMar -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 1
                            ListItemLayout {
                                title.text: i18n.tr(matMartedi.contents.terzaOra)

                                CheckBox {
                                    id: mar3_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mar3_1.checked == true) nLibriMar += 1
                                        else if (mar3_1.checked == false) nLibriMar -= 1
                                    }
                                }
                                CheckBox {
                                    id: mar3_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mar3_2.checked == true) nQuaderniMar += 1
                                        else if (mar3_2.checked == false) nQuaderniMar -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 1
                            ListItemLayout {
                                title.text: i18n.tr(matMartedi.contents.quartaOra)

                                CheckBox {
                                    id: mar4_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mar4_1.checked == true) nLibriMar += 1
                                        else if (mar4_1.checked == false) nLibriMar -= 1
                                    }
                                }
                                CheckBox {
                                    id: mar4_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mar4_2.checked == true) nQuaderniMar += 1
                                        else if (mar4_2.checked == false) nQuaderniMar -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 1
                            ListItemLayout {
                                title.text: i18n.tr(matMartedi.contents.quintaOra)

                                CheckBox {
                                    id: mar5_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mar5_1.checked == true) nLibriMar += 1
                                        else if (mar5_1.checked == false) nLibriMar -= 1
                                    }
                                }
                                CheckBox {
                                    id: mar5_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mar5_2.checked == true) nQuaderniMar += 1
                                        else if (mar5_2.checked == false) nQuaderniMar -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 1
                            ListItemLayout {
                                title.text: i18n.tr(matMartedi.contents.sestaOra)

                                CheckBox {
                                    id: mar6_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mar6_1.checked == true) nLibriMar += 1
                                        else if (mar6_1.checked == false) nLibriMar -= 1
                                    }
                                }
                                CheckBox {
                                    id: mar6_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mar6_2.checked == true) nQuaderniMar += 1
                                        else if (mar6_2.checked == false) nQuaderniMar -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }

                        //Mercoledì
                        ListItem {
                            visible: header_sections.selectedIndex === 2
                            ListItemLayout {
                                title.text: i18n.tr(matMercoledi.contents.ora1)

                                CheckBox {
                                    id: mer1_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mer1_1.checked == true) nLibriMer += 1
                                        else if (mer1_1.checked == false) nLibriMer -= 1
                                    }
                                }
                                CheckBox {
                                    id: mer1_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mer1_2.checked == true) nQuaderniMer += 1
                                        else if (mer1_2.checked == false) nQuaderniMer -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 2
                            ListItemLayout {
                                title.text: i18n.tr(matMercoledi.contents.ora2)

                                CheckBox {
                                    id: mer2_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mer2_1.checked == true) nLibriMer += 1
                                        else if (mer2_1.checked == false) nLibriMer -= 1
                                    }
                                }
                                CheckBox {
                                    id: mer2_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mer2_2.checked == true) nQuaderniMer += 1
                                        else if (mer2_2.checked == false) nQuaderniMer -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 2
                            ListItemLayout {
                                title.text: i18n.tr(matMercoledi.contents.ora3)

                                CheckBox {
                                    id: mer3_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mer3_1.checked == true) nLibriMer += 1
                                        else if (mer3_1.checked == false) nLibriMer -= 1
                                    }
                                }
                                CheckBox {
                                    id: mer3_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mer3_2.checked == true) nQuaderniMer += 1
                                        else if (mer3_2.checked == false) nQuaderniMer -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 2
                            ListItemLayout {
                                title.text: i18n.tr(matMercoledi.contents.ora4)

                                CheckBox {
                                    id: mer4_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mer4_1.checked == true) nLibriMer += 1
                                        else if (mer4_1.checked == false) nLibriMer -= 1
                                    }
                                }
                                CheckBox {
                                    id: mer4_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mer4_2.checked == true) nQuaderniMer += 1
                                        else if (mer4_2.checked == false) nQuaderniMer -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 2
                            ListItemLayout {
                                title.text: i18n.tr(matMercoledi.contents.ora5)

                                CheckBox {
                                    id: mer5_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mer5_1.checked == true) nLibriMer += 1
                                        else if (mer5_1.checked == false) nLibriMer -= 1
                                    }
                                }
                                CheckBox {
                                    id: mer5_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mer5_2.checked == true) nQuaderniMer += 1
                                        else if (mer5_2.checked == false) nQuaderniMer -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 2
                            ListItemLayout {
                                title.text: i18n.tr(matMercoledi.contents.ora6)

                                CheckBox {
                                    id: mer6_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mer6_1.checked == true) nLibriMer += 1
                                        else if (mer6_1.checked == false) nLibriMer -= 1
                                    }
                                }
                                CheckBox {
                                    id: mer6_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (mer6_2.checked == true) nQuaderniMer += 1
                                        else if (mer6_2.checked == false) nQuaderniMer -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }

                        //Giovedì
                        ListItem {
                            visible: header_sections.selectedIndex === 3
                            ListItemLayout {
                                title.text: i18n.tr(matGiovedi.contents.ora1)

                                CheckBox {
                                    id: gio1_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (gio1_1.checked == true) nLibriGio += 1
                                        else if (gio1_1.checked == false) nLibriGio -= 1
                                    }
                                }
                                CheckBox {
                                    id: gio1_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (gio1_2.checked == true) nQuaderniGio += 1
                                        else if (gio1_2.checked == false) nQuaderniGio -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 3
                            ListItemLayout {
                                title.text: i18n.tr(matGiovedi.contents.ora2)

                                CheckBox {
                                    id: gio2_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (gio2_1.checked == true) nLibriGio += 1
                                        else if (gio2_1.checked == false) nLibriGio -= 1
                                    }
                                }
                                CheckBox {
                                    id: gio2_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (gio2_2.checked == true) nQuaderniGio += 1
                                        else if (gio2_2.checked == false) nQuaderniGio -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 3
                            ListItemLayout {
                                title.text: i18n.tr(matGiovedi.contents.ora3)

                                CheckBox {
                                    id: gio3_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (gio3_1.checked == true) nLibriGio += 1
                                        else if (gio3_1.checked == false) nLibriGio -= 1
                                    }
                                }
                                CheckBox {
                                    id: gio3_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (gio3_2.checked == true) nQuaderniGio += 1
                                        else if (gio3_2.checked == false) nQuaderniGio -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 3
                            ListItemLayout {
                                title.text: i18n.tr(matGiovedi.contents.ora4)

                                CheckBox {
                                    id: gio4_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (gio4_1.checked == true) nLibriGio += 1
                                        else if (gio4_1.checked == false) nLibriGio -= 1
                                    }
                                }
                                CheckBox {
                                    id: gio4_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (gio4_2.checked == true) nQuaderniGio += 1
                                        else if (gio4_2.checked == false) nQuaderniGio -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 3
                            ListItemLayout {
                                title.text: i18n.tr(matGiovedi.contents.ora5)

                                CheckBox {
                                    id: gio5_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (gio5_1.checked == true) nLibriGio += 1
                                        else if (gio5_1.checked == false) nLibriGio -= 1
                                    }
                                }
                                CheckBox {
                                    id: gio5_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (gio5_2.checked == true) nQuaderniGio += 1
                                        else if (gio5_2.checked == false) nQuaderniGio -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 3
                            ListItemLayout {
                                title.text: i18n.tr(matGiovedi.contents.ora6)

                                CheckBox {
                                    id: gio6_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (gio6_1.checked == true) nLibriGio += 1
                                        else if (gio6_1.checked == false) nLibriGio -= 1
                                    }
                                }
                                CheckBox {
                                    id: gio6_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (gio6_2.checked == true) nQuaderniGio += 1
                                        else if (gio6_2.checked == false) nQuaderniGio -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }

                        //Venerdì
                        ListItem {
                            visible: header_sections.selectedIndex === 4
                            ListItemLayout {
                                title.text: i18n.tr(matVenerdi.contents.ora1)

                                CheckBox {
                                    id: ven1_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (ven1_1.checked == true) nLibriVen += 1
                                        else if (ven1_1.checked == false) nLibriVen -= 1
                                    }
                                }
                                CheckBox {
                                    id: ven1_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (ven1_2.checked == true) nQuaderniVen += 1
                                        else if (ven1_2.checked == false) nQuaderniVen -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 4
                            ListItemLayout {
                                title.text: i18n.tr(matVenerdi.contents.ora2)

                                CheckBox {
                                    id: ven2_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (ven2_1.checked == true) nLibriVen += 1
                                        else if (ven2_1.checked == false) nLibriVen -= 1
                                    }
                                }
                                CheckBox {
                                    id: ven2_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (ven2_2.checked == true) nQuaderniVen += 1
                                        else if (ven2_2.checked == false) nQuaderniVen -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 4
                            ListItemLayout {
                                title.text: i18n.tr(matVenerdi.contents.ora3)

                                CheckBox {
                                    id: ven3_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (ven3_1.checked == true) nLibriVen += 1
                                        else if (ven3_1.checked == false) nLibriVen -= 1
                                    }
                                }
                                CheckBox {
                                    id: ven3_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (ven3_2.checked == true) nQuaderniVen += 1
                                        else if (ven3_2.checked == false) nQuaderniVen -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 4
                            ListItemLayout {
                                title.text: i18n.tr(matVenerdi.contents.ora4)

                                CheckBox {
                                    id: ven4_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (ven4_1.checked == true) nLibriVen += 1
                                        else if (ven4_1.checked == false) nLibriVen -= 1
                                    }
                                }
                                CheckBox {
                                    id: ven4_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (ven4_2.checked == true) nQuaderniVen += 1
                                        else if (ven4_2.checked == false) nQuaderniVen -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 4
                            ListItemLayout {
                                title.text: i18n.tr(matVenerdi.contents.ora5)

                                CheckBox {
                                    id: ven5_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (ven5_1.checked == true) nLibriVen += 1
                                        else if (ven5_1.checked == false) nLibriVen -= 1
                                    }
                                }
                                CheckBox {
                                    id: ven5_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (ven5_2.checked == true) nQuaderniVen += 1
                                        else if (ven5_2.checked == false) nQuaderniVen -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 4
                            ListItemLayout {
                                title.text: i18n.tr(matVenerdi.contents.ora6)

                                CheckBox {
                                    id: ven6_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (ven6_1.checked == true) nLibriVen += 1
                                        else if (ven6_1.checked == false) nLibriVen -= 1
                                    }
                                }
                                CheckBox {
                                    id: ven6_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (ven6_2.checked == true) nQuaderniVen += 1
                                        else if (ven6_2.checked == false) nQuaderniVen -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }

                        //Sabato
                        ListItem {
                            visible: header_sections.selectedIndex === 5
                            ListItemLayout {
                                title.text: i18n.tr(matSabato.contents.ora1)

                                CheckBox {
                                    id: sab1_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (sab1_1.checked == true) nLibriSab += 1
                                        else if (sab1_1.checked == false) nLibriSab -= 1
                                    }
                                }
                                CheckBox {
                                    id: sab1_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (sab1_2.checked == true) nQuaderniSab += 1
                                        else if (sab1_2.checked == false) nQuaderniSab -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 5
                            ListItemLayout {
                                title.text: i18n.tr(matSabato.contents.ora2)

                                CheckBox {
                                    id: sab2_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (sab2_1.checked == true) nLibriSab += 1
                                        else if (sab2_1.checked == false) nLibriSab -= 1
                                    }
                                }
                                CheckBox {
                                    id: sab2_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (sab2_2.checked == true) nQuaderniSab += 1
                                        else if (sab2_2.checked == false) nQuaderniSab -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 5
                            ListItemLayout {
                                title.text: i18n.tr(matSabato.contents.ora3)

                                CheckBox {
                                    id: sab3_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (sab3_1.checked == true) nLibriSab += 1
                                        else if (sab3_1.checked == false) nLibriSab -= 1
                                    }
                                }
                                CheckBox {
                                    id: sab3_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (sab3_2.checked == true) nQuaderniSab += 1
                                        else if (sab3_2.checked == false) nQuaderniSab -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 5
                            ListItemLayout {
                                title.text: i18n.tr(matSabato.contents.ora4)

                                CheckBox {
                                    id: sab4_1; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (sab4_1.checked == true) nLibriSab += 1
                                        else if (sab4_1.checked == false) nLibriSab -= 1
                                    }
                                }
                                CheckBox {
                                    id: sab4_2; width:units.gu(3); height:width;
                                    onClicked: {
                                        if (sab4_2.checked == true) nQuaderniSab += 1
                                        else if (sab4_2.checked == false) nQuaderniSab -= 1
                                    }
                                }
                            }
                            onClicked: {}
                        }

                        ListItem {
                            visible: header_sections.selectedIndex === 0
                            ListItemLayout {
                                title.text:i18n.tr("Books: "+nLibriLun)
                                title.color: UbuntuColors.orange
                                Label { text: i18n.tr("Exercise books: ")+nQuaderniLun ;color: UbuntuColors.orange}

                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 1
                            ListItemLayout {
                                title.text:i18n.tr("Books: "+nLibriMar)
                                title.color: UbuntuColors.orange
                                Label { text: i18n.tr("Exercise books: ")+nQuaderniMar ;color: UbuntuColors.orange}

                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 2
                            ListItemLayout {
                                title.text:i18n.tr("Books: "+nLibriMer)
                                title.color: UbuntuColors.orange
                                Label { text: i18n.tr("Exercise books: ")+nQuaderniMer ;color: UbuntuColors.orange}

                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 3
                            ListItemLayout {
                                title.text:i18n.tr("Books: "+nLibriGio)
                                title.color: UbuntuColors.orange
                                Label { text: i18n.tr("Exercise books: ")+nQuaderniGio ;color: UbuntuColors.orange}

                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 4
                            ListItemLayout {
                                title.text:i18n.tr("Books: "+nLibriVen)
                                title.color: UbuntuColors.orange
                                Label { text: i18n.tr("Exercise books: ")+nQuaderniVen ;color: UbuntuColors.orange}

                            }
                            onClicked: {}
                        }
                        ListItem {
                            visible: header_sections.selectedIndex === 5
                            ListItemLayout {
                                title.text:i18n.tr("Books: "+nLibriSab)
                                title.color: UbuntuColors.orange
                                Label { text: i18n.tr("Exercise books: ")+nQuaderniSab ;color: UbuntuColors.orange}

                            }
                            onClicked: {}
                        }
                    }
                }
            }
        }
    }
}

