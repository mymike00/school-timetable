import QtQuick 2.4
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.1
import "script.js" as Js

Flickable {
    id: sun_flick
    anchors.fill: parent.fill
    contentHeight: (height > sun_col.height ? height : sun_col.height)+units.gu(2)
    clip: true
    topMargin: units.gu(1)
    leftMargin: units.gu(1)
    //contentItem.width: sun_col.width

    ColumnLayout {
        id: sun_col
        /*Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.minimumWidth: parent.width
        Layout.preferredWidth: parent.width
        Layout.minimumHeight: parent.height*/
        Layout.alignment: Qt.AlignCenter
        spacing: units.gu(0.5)
        Image {
            id: holiday
            source: "Party-Poppers.png"
            Layout.maximumWidth: units.gu(25)
            Layout.maximumHeight: Layout.maximumWidth
            Layout.alignment: Qt.AlignCenter
        }
        Text {
            id: name
            text: i18n.tr("You don't go to School")
            font.pointSize: units.gu(2.5)
            Layout.alignment: Qt.AlignCenter
        }
        Text {
            id: name2
            text: i18n.tr("You're on Holiday")
            font.pointSize: units.gu(2.5)
            Layout.alignment: Qt.AlignCenter
            Component.onCompleted: {
                console.log("col: "+sun_col.width)
                console.log("col.parent: "+sun_col.parent.width)
                console.log("flick: "+sun_flick.width)
                console.log("contentItem: "+sun_flick.contentItem.width)
            }
        }
    }
}
