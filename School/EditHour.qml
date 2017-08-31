import Ubuntu.Components 1.3
import QtQuick 2.4
import "script.js" as Js

Column {
    property var dbPath
    property int numberHour
    property int indexDay
    default property bool scroll: false

    spacing: units.gu(2)
    visible: header_sections_edit.selectedIndex === indexDay
    width: parent.width

    TextField  {
        x: units.gu(2)
        id: textField
        placeholderText: i18n.tr("Insert a subject")
        text: dbPath
        width: parent.width - units.gu(4)
        onActiveFocusChanged: scroll ? (activeFocus ? timerScroll.start() : "") : ""
    }
    Rectangle {
        color: "#cdcdcd"
        height: 1
        width: parent.parent.width
    }

    function text() {
        return textField.displayText
    }
}
