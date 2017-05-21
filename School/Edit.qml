import QtQuick 2.4
import Ubuntu.Components 1.3
import U1db 1.0 as U1db

Page {
    header: PageHeader {
        id: pageHeader
        title: i18n.tr("Edit TimeTable")
        StyleHints {
            //foregroundColor: UbuntuColors.coolGrey
            backgroundColor:  "transparent"
            dividerColor: "transparent"
        }
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
                    accept(lunediOra1.text,lunediOra2.text,lunediOra3.text,lunediOra4.text,lunediOra5.text,lunediOra6.text,martediOra1.text,martediOra2.text,martediOra3.text,martediOra4.text,martediOra5.text,martediOra6.text,mercolediOra1.text,mercolediOra2.text,mercolediOra3.text,mercolediOra4.text,mercolediOra5.text,mercolediOra6.text,giovediOra1.text,giovediOra2.text,giovediOra3.text,giovediOra4.text,giovediOra5.text,giovediOra6.text,venerdiOra1.text,venerdiOra2.text,venerdiOra3.text,venerdiOra4.text,venerdiOra5.text,venerdiOra6.text,sabatoOra1.text,sabatoOra2.text,sabatoOra3.text,sabatoOra4.text)
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
            model :[i18n.tr("Mon"),i18n.tr("Tue"),i18n.tr("Wed"),i18n.tr("Thu"),i18n.tr("Fri"),i18n.tr("Sat"),i18n.tr("Sun")]
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
                height:holiday.height+name.height+name2.height
                y:(pageStack.height-this.height-pageHeader.height-units.gu(5))/2
                anchors.horizontalCenter: parent.horizontalCenter
                visible: header_sections_edit.selectedIndex === 6
                spacing: units.gu(2)
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
                    visible:  header_sections_edit.selectedIndex !== 6
                    ListItemLayout {
                        title.text: i18n.tr("Subjects")
                        title.font.weight: Font.DemiBold
                        /*Icon {
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
                        }*/
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
                            placeholderText: lunediOra1.placeholderText
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
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matMercoledi.contents.ora1)
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
                        //title.text: i18n.tr(materieMer[1])
                        TextField  {
                            id: mercolediOra2
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matMercoledi.contents.ora2)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 2
                    ListItemLayout {
                        //title.text: i18n.tr(materieMer[2])
                        TextField  {
                            id: mercolediOra3
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matMercoledi.contents.ora3)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 2
                    ListItemLayout {
                        //title.text: i18n.tr(materieMer[3])
                        TextField  {
                            id: mercolediOra4
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matMercoledi.contents.ora4)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 2
                    ListItemLayout {
                        //title.text: i18n.tr(materieMer[4])
                        TextField  {
                            id: mercolediOra5
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matMercoledi.contents.ora5)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 2
                    ListItemLayout {
                        //title.text: i18n.tr(materieMer[5])
                        TextField  {
                            id: mercolediOra6
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matMercoledi.contents.ora6)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }

                //Giovedì
                ListItem {
                    visible: header_sections_edit.selectedIndex === 3
                    ListItemLayout {
                        //title.text: i18n.tr(matGiovedi.contents.ora1)
                        TextField {
                            id: giovediOra1
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matGiovedi.contents.ora1)
                        }
                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 3
                    ListItemLayout {
                        //title.text: i18n.tr(materieGio[1])
                        TextField {
                            id: giovediOra2
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matGiovedi.contents.ora2)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 3
                    ListItemLayout {
                        //title.text: i18n.tr(materieGio[2])
                        TextField {
                            id: giovediOra3
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matGiovedi.contents.ora3)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 3
                    ListItemLayout {
                        //title.text: i18n.tr(materieGio[3])
                        TextField {
                            id: giovediOra4
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matGiovedi.contents.ora4)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 3
                    ListItemLayout {
                        //title.text: i18n.tr(materieGio[3])
                        TextField {
                            id: giovediOra5
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matGiovedi.contents.ora5)
                        }

                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 3
                    ListItemLayout {
                        //title.text: i18n.tr(materieGio[3])
                        TextField {
                            id: giovediOra6
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matGiovedi.contents.ora6)
                        }

                    }
                    onClicked: {}
                }

                //Venerdì
                ListItem {
                    visible: header_sections_edit.selectedIndex === 4
                    ListItemLayout {
                        //title.text: i18n.tr(materieVen[0])
                        TextField {
                            id: venerdiOra1
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matVenerdi.contents.ora1)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 4
                    ListItemLayout {
                        //title.text: i18n.tr(materieVen[1])
                        TextField {
                            id: venerdiOra2
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matVenerdi.contents.ora2)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 4
                    ListItemLayout {
                        //title.text: i18n.tr(materieVen[2])
                        TextField {
                            id: venerdiOra3
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matVenerdi.contents.ora3)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 4
                    ListItemLayout {
                        //title.text: i18n.tr(materieVen[3])
                        TextField {
                            id: venerdiOra4
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matVenerdi.contents.ora4)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 4
                    ListItemLayout {
                        //title.text: i18n.tr(materieVen[4])
                        TextField {
                            id: venerdiOra5
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matVenerdi.contents.ora5)
                        }

                        /*CheckBox {
                            id: ven5_1; width:units.gu(3); height:width;
                            onClicked: {
                                if (ven5_1.checked == true) nLibriVen += 1
                                else if (ven5_1.checked == false) nLibriVen -= 1
                            }
                        }
                        /*CheckBox {
                            id: ven5_2; width:units.gu(3); height:width;
                            onClicked: {
                                if (ven5_2.checked == true) nQuaderniVen += 1
                                else if (ven5_2.checked == false) nQuaderniVen -= 1
                            }
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 4
                    ListItemLayout {
                        //title.text: i18n.tr(materieVen[5])
                        TextField {
                            id: venerdiOra6
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matVenerdi.contents.ora6)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }

                //Sabato
                ListItem {
                    visible: header_sections_edit.selectedIndex === 5
                    ListItemLayout {
                        //title.text: i18n.tr(materieSab[0])
                        TextField {
                            id: sabatoOra1
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matSabato.contents.ora1)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 5
                    ListItemLayout {
                        //title.text: i18n.tr(materieSab[1])
                        TextField {
                            id: sabatoOra2
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matSabato.contents.ora2)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 5
                    ListItemLayout {
                        //title.text: i18n.tr(materieSab[2])
                        TextField {
                            id: sabatoOra3
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matSabato.contents.ora3)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
                ListItem {
                    visible: header_sections_edit.selectedIndex === 5
                    ListItemLayout {
                        //title.text: i18n.tr(materieSab[3])
                        TextField {
                            id: sabatoOra4
                            placeholderText: lunediOra1.placeholderText
                            text: i18n.tr(matSabato.contents.ora4)
                        }

                        /*CheckBox {
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
                        }*/
                    }
                    onClicked: {}
                }
            }
        }
    }

