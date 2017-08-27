import QtQuick 2.4
import Ubuntu.Components 1.3
import "script.js" as Js

ListItem {
    default property bool iconsAreVisible: true
    ListItemLayout {
        title.text: i18n.tr("Subjects")
        title.font.weight: Font.DemiBold
        Icon {
            name: "bookmark"
            color: UbuntuColors.blue
            height: units.gu(3)
            width: height
            visible: iconsAreVisible
        }
        Icon {
            name: "edit-copy"
            color: UbuntuColors.blue
            height: units.gu(3)
            width: height
            visible: iconsAreVisible
        }
    }
    onClicked: {}
}
