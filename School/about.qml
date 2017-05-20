import QtQuick 2.4
import Ubuntu.Components 1.3

Page {
    header: PageHeader {
        id: pageHeader
        title: i18n.tr("About")
        StyleHints {
            //foregroundColor: UbuntuColors.coolGrey
            backgroundColor:  "transparent"
        }
        leadingActionBar.actions: [
            Action {
                iconName: "back"
                text: i18n.tr("Back")
                onTriggered: pageStack.pop()
            }
        ]
    }
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
        contentHeight:  about_column.height + units.gu(6)
        clip: true
        Column {
            id: about_column
            anchors.centerIn: parent
            spacing: units.gu(4)

            Column {
                width: parent.width

                Label {
                    fontSize: "x-large"
                    font.weight: Font.DemiBold
                    text: "Orario Scolastico"

                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    text: i18n.tr("Versione ") + "1.4"

                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            UbuntuShape {
                id: logo

                radius: "large"

                width: units.gu(15)
                height: width

                source: Image {
                    source: "schoolhouse.svg"
                }

                anchors.horizontalCenter: parent.horizontalCenter
            }

            Column {
                width: parent.width

                Label {
                    text: "© 2016-2017 Michele Castellazzi"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    fontSize: "small"
                    text: i18n.tr("Rilasciata sotto i termini della licenza GNU GPL v3")

                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Column {
                width: parent.width
                spacing: units.gu(2)

                Label {
                    fontSize: "small"
                    text: i18n.tr("Codice sorgente non disponibile in rete")// + "<a href=\"https://launchpad.net/utris/\">launchpad.net</a>"

                    anchors.horizontalCenter: parent.horizontalCenter

                    onLinkActivated: Qt.openUrlExternally(link)
                }
            }
        }

    }
}
