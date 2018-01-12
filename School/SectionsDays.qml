import Ubuntu.Components 1.3

Sections {
    anchors {
        left: parent.left
        right: parent.right
    }
    property var modelExtended: [i18n.tr("Monday"),i18n.tr("Tuesday"),i18n.tr("Wednesday"),i18n.tr("Thursday"),i18n.tr("Friday"),i18n.tr("Saturday"),i18n.tr("Sunday")]
    property var modelCompact: [i18n.tr("Mon"),i18n.tr("Tue"),i18n.tr("Wed"),i18n.tr("Thu"),i18n.tr("Fri"),i18n.tr("Sat"),i18n.tr("Sun")]
    property bool modelIsCompact: true

    selectedIndex: getSelDay()
    model: modelCompact
    onSelectedIndexChanged: {
        if (!resizing)
            setSelDay(selectedIndex)
    }
    function updateSelectedIndex() {
        selectedIndex = getSelDay()
    }
    onWidthChanged: {
        resizing = true

        if (width > units.gu(45) && modelIsCompact) {
            model = modelExtended
            modelIsCompact=false
        }
        else if (width <= units.gu(45) && !modelIsCompact) {
            model = modelCompact
            modelIsCompact=true
        }
        resizing = false
        selectedIndex = getSelDay()
    }
}

