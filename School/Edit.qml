import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import U1db 1.0 as U1db

Page {
    header: PageHeader {
        id: pageHeader
        title: i18n.tr("Orario Scolastico")
        StyleHints {
            //foregroundColor: UbuntuColors.coolGrey
            backgroundColor:  "transparent"
            dividerColor: "transparent"
        }
        //backgroundColor: UbuntuColors.porcelain
        trailingActionBar.actions: [
            Action {
                iconName: "close"
                onTriggered: pageStack.pop()
                text: i18n.tr("Close")
            },
            Action {
                iconName: "ok"
                text: i18n.tr("Accept")
                onTriggered: {
                    accept(lunediOra1.text,lunediOra2.text,lunediOra3.text,lunediOra4.text,lunediOra5.text,lunediOra6.text,martediOra1.text,martediOra2.text,martediOra3.text,martediOra4.text,martediOra5.text,martediOra6.text)
                    pageStack.pop()
                }
            }

        ]
        extension: Sections {
            id: header_sections_edit
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            model :[i18n.tr("Lun"),i18n.tr("Mar"),i18n.tr("Mer"),i18n.tr("Gio"),i18n.tr("Ven"),i18n.tr("Sab"),i18n.tr("Dom")]
        }
    }
    /*Component.onCompleted: {
        //matLunedi.contents = {primaOra: "Diritto", secondaOra:"Matematica", terzaOra: "Matematica", quartaOra: "Informatica", quintaOra: "Storia", sestaOra: "Italiano"}

        header_sections_edit.selectedIndex = day
        if (hour<14) {
            if (day==0) header_sections_edit.selectedIndex = 6
            else header_sections_edit.selectedIndex -= 1
        }

        if (lun1.title.text==="Diritto"||lun1.title.text==="Matematica") {
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
        }
    }*/

    Rectangle {
        color: UbuntuColors.porcelain
        anchors.fill: parent
        z: 0
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
                height:holiday.height+name.height
                y:(pageStack.height-holiday.height-name.height-pageHeader.height)/2
                anchors.horizontalCenter: parent.horizontalCenter
                Image {
                    id: holiday
                    visible: header_sections_edit.selectedIndex === 6
                    source: "Party-Poppers.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: units.gu(25)
                    width: height
                }
                Label {
                    id: name
                    visible: header_sections_edit.selectedIndex === 6
                    text: i18n.tr("Non si va a Scuola\nSei in Vacanza")
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
                    visible:  header_sections_edit.selectedIndex !== 6
                    ListItemLayout {
                        title.text: i18n.tr("Materie")
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
                    visible: header_sections_edit.selectedIndex === 0
                    ListItemLayout {
                        id: lun1
                        //title.text: i18n.tr(matLunedi.contents.primaOra)
                        TextField  {
                            id: lunediOra1
                            hasClearButton: true
                            placeholderText: i18n.tr("Insert a subject")
                            text: i18n.tr(matLunedi.contents.primaOra)
                        }
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 0
                    ListItemLayout {
                        id: lun2
                        //title.text: i18n.tr(matLunedi.contents.secondaOra)
                        TextField  {
                            id: lunediOra2
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matLunedi.contents.secondaOra)
                        }
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 0
                    ListItemLayout {
                        id: lun3
                        //title.text: i18n.tr(matLunedi.contents.terzaOra)
                        TextField  {
                            id: lunediOra3
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matLunedi.contents.terzaOra)
                        }
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 0
                    ListItemLayout {
                        id: lun4
                        //title.text: i18n.tr(matLunedi.contents.quartaOra)
                        TextField  {
                            id: lunediOra4
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matLunedi.contents.quartaOra)
                        }
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 0
                    ListItemLayout {
                        id: lun5
                        //title.text: i18n.tr(matLunedi.contents.quintaOra)
                        TextField  {
                            id: lunediOra5
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matLunedi.contents.quintaOra)
                        }
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 0
                    ListItemLayout {
                        id: lun6
                        //title.text: i18n.tr(matLunedi.contents.sestaOra)
                        TextField  {
                            id: lunediOra6
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matLunedi.contents.sestaOra)
                        }
                    }
                    onClicked: {}
                }

                //Martedì
                ListItem {
                    visible: header_sections_edit.selectedIndex === 1
                    ListItemLayout {
                        //title.text: i18n.tr(materieMar[0])
                        TextField  {
                            id: martediOra1
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matMartedi.contents.primaOra)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 1
                    ListItemLayout {
                        //title.text: i18n.tr(materieMar[1])
                        TextField  {
                            id: martediOra2
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matMartedi.contents.secondaOra)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 1
                    ListItemLayout {
                        //title.text: i18n.tr(materieMar[2])
                        TextField  {
                            id: martediOra3
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matMartedi.contents.terzaOra)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 1
                    ListItemLayout {
                        //title.text: i18n.tr(materieMar[3])
                        TextField  {
                            id: martediOra4
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matMartedi.contents.quartaOra)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 1
                    ListItemLayout {
                        //title.text: i18n.tr(materieMar[4])
                        TextField  {
                            id: martediOra5
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matMartedi.contents.quintaOra)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 1
                    ListItemLayout {
                        //title.text: i18n.tr(materieMar[5])
                        TextField  {
                            id: martediOra6
                            text: i18n.tr(matMartedi.contents.sestaOra)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }

                //Mercoledì
                ListItem {
                    visible: header_sections_edit.selectedIndex === 2
                    ListItemLayout {
                        //title.text: i18n.tr(materieMer[0])
                        TextField  {
                            id: mercolediOra1
                            text: i18n.tr(matMercoledi.contents.primaoraOra)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 2
                    ListItemLayout {
                        title.text: i18n.tr(materieMer[1])

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
                    visible: header_sections_edit.selectedIndex === 2
                    ListItemLayout {
                        title.text: i18n.tr(materieMer[2])

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
                    visible: header_sections_edit.selectedIndex === 2
                    ListItemLayout {
                        title.text: i18n.tr(materieMer[3])

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
                    visible: header_sections_edit.selectedIndex === 2
                    ListItemLayout {
                        title.text: i18n.tr(materieMer[4])

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
                    visible: header_sections_edit.selectedIndex === 2
                    ListItemLayout {
                        title.text: i18n.tr(materieMer[5])

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
                    visible: header_sections_edit.selectedIndex === 3
                    ListItemLayout {
                        title.text: i18n.tr(materieGio[0])

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
                    visible: header_sections_edit.selectedIndex === 3
                    ListItemLayout {
                        title.text: i18n.tr(materieGio[1])

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
                    visible: header_sections_edit.selectedIndex === 3
                    ListItemLayout {
                        title.text: i18n.tr(materieGio[2])

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
                    visible: header_sections_edit.selectedIndex === 3
                    ListItemLayout {
                        title.text: i18n.tr(materieGio[3])

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

                //Venerdì
                ListItem {
                    visible: header_sections_edit.selectedIndex === 4
                    ListItemLayout {
                        title.text: i18n.tr(materieVen[0])

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
                    visible: header_sections_edit.selectedIndex === 4
                    ListItemLayout {
                        title.text: i18n.tr(materieVen[1])

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
                    visible: header_sections_edit.selectedIndex === 4
                    ListItemLayout {
                        title.text: i18n.tr(materieVen[2])

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
                    visible: header_sections_edit.selectedIndex === 4
                    ListItemLayout {
                        title.text: i18n.tr(materieVen[3])

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
                    visible: header_sections_edit.selectedIndex === 4
                    ListItemLayout {
                        title.text: i18n.tr(materieVen[4])

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
                    visible: header_sections_edit.selectedIndex === 4
                    ListItemLayout {
                        title.text: i18n.tr(materieVen[5])

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
                    visible: header_sections_edit.selectedIndex === 5
                    ListItemLayout {
                        title.text: i18n.tr(materieSab[0])

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
                    visible: header_sections_edit.selectedIndex === 5
                    ListItemLayout {
                        title.text: i18n.tr(materieSab[1])

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
                    visible: header_sections_edit.selectedIndex === 5
                    ListItemLayout {
                        title.text: i18n.tr(materieSab[2])

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
                    visible: header_sections_edit.selectedIndex === 5
                    ListItemLayout {
                        title.text: i18n.tr(materieSab[3])

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
            }
        }
    }

