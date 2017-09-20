import QtQuick 2.0
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.1


Page {
    id: firstStartPage
    header: PageHeader {
        id: firstStartPageHeader
        title: i18n.tr("Welcome!")
    }
    BackGround {}

    Flickable {
        anchors {
            bottom: parent.bottom
            right: parent.right
            left: parent.left
            top: firstStartPageHeader.bottom
            topMargin: units.gu(2)
            leftMargin: units.gu(2)
            rightMargin: units.gu(2)
        }
        contentHeight: firstStart_column.height
        ColumnLayout {
            id: firstStart_column
            spacing: units.gu(4)
            anchors.fill: parent.fill

            Label {
                id: firstLabel
                text: i18n.tr("This is a must-have app for all students who wants to manage their own weekly school timetable")
                font.pointSize: units.gu(2)
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment : Qt.AlignHCenter
                wrapMode: Text.WordWrap
                Layout.maximumWidth: firstStartPage.width-units.gu(4)
            }

            ProportionalShape {
                id: logo
                source: Image {
                    source: "schoolhouse.svg"
                }
                aspect: UbuntuShape.Flat
                Layout.alignment : Qt.AlignHCenter
                Layout.preferredWidth: Layout.preferredHeight*16/15
                Layout.preferredHeight: units.gu(25)
                Layout.maximumWidth: firstStartPage.width-units.gu(4)
                Layout.maximumHeight: Layout.maximumWidth*15/16     //firstStartPage.width*15/16-units.gu(4)
            }

            Button {
                id: firstButton
                text: i18n.tr("Start managing your TimeTable")
                Layout.alignment : Qt.AlignHCenter
                Layout.maximumWidth: firstStartPage.width-units.gu(4)
                color: "#bf3421"
                onClicked: pageStack.push(Qt.resolvedUrl("Edit.qml"))
                Layout.preferredHeight: units.gu(5)
            }
        }
    }
}
