import QtQuick 2.4
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.1
import Ubuntu.Layouts 1.0
import "script.js" as Js

Flickable {
    id: sun_flick
    anchors.fill: parent.fill
    contentHeight: height > sun_col.height ? height+1 : sun_col.height
    clip: true

    ColumnLayout {
        id: sun_col
        width: parent.width
        //height: sun_flick.height > height ? sun_flick.height : holiday.height+name.height+name2.height+units.gu(3)
        spacing: units.gu(0.5)
        //anchors.centerIn: parent.centerIn
        anchors.topMargin: units.gu(25)
        Padding{padding:3}
        Image {
            id: holiday
            source: "Party-Poppers.png"
            Layout.preferredWidth: units.gu(25)
            Layout.preferredHeight: Layout.preferredWidth
            Layout.maximumWidth: sun_col.width-units.gu(1)
            Layout.maximumHeight: Layout.maximumWidth
            Layout.alignment: Qt.AlignCenter
            //Layout.topMargin: units.gu(3)
        }
        Text {
            id: name
            text: i18n.tr("You don't go to School")
            wrapMode: Text.WordWrap
            font.pointSize: units.gu(2.5)
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignCenter
            Layout.maximumWidth: sun_col.width-units.gu(1)
        }
        Text {
            id: name2
            text: i18n.tr("You're on Holiday")
            wrapMode: Text.WordWrap
            font.pointSize: units.gu(2.5)
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignCenter
            Layout.maximumWidth: sun_col.width-units.gu(1)
            //Layout.bottomMargin: units.gu(3)
        }
        Padding{padding:3}
        Component.onCompleted: {
            //console.log(holiday.height+name.height+name2.height+units.gu(3))
        }
    }
}
