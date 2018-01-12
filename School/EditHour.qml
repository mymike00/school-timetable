import Ubuntu.Components 1.3
import QtQuick 2.4
import "script.js" as Js

Column {
   property var dbPath
   property int numberHour
   property int indexDay
   default property bool scroll: false

   spacing: units.gu(2)
   visible: header_sections.selectedIndex === indexDay
   width: parent.width

   Timer {
      id: timerLog
      interval: 201; running: false; repeat: false
      onTriggered: console.log("\n\nAltezza MainView: "+mainView.height+"\nAltezza pageStack: "+pageStack.height+"\nAltezza Pagina: "+mainPage.height+"\nAltezza ScrollView: "+page_scrollview.height+"\nAltezza Flickable: "+page_flickable.height+"\nAltezza Colonna: "+main_column.height+"\nAltezza Colonna Edit: "+edit_column.height)
   }

   TextField  {
      x: units.gu(2)
      id: textField
      placeholderText: i18n.tr("Insert a subject")
      text: isFirstStart() ? "" : dbPath
      width: parent.width - units.gu(4)
      onActiveFocusChanged: {
         scroll ? (activeFocus ? timerScroll.start() : "") : ""
         // timerLog.start()
      }
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
