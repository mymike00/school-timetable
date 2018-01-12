import Ubuntu.Components 1.3
//import "script.js" as Js
import Qt.labs.settings 1.0

ListItem {
   id: listItemHour
   property var dbPath
   property int numberHour
   property int indexDay
   property alias bookChecked: checkBook.checked
   property alias exerciseChecked: checkExercise.checked

   property var numberType: {
      Book: "Book";
      Exercise: "Exercise";
   }

   function numbersRefresh(obj, animation) {
      if (obj === "Book") {
         numbersMon.refreshBook(animation);
         numbersTue.refreshBook(animation);
         numbersWed.refreshBook(animation);
         numbersThu.refreshBook(animation);
         numbersFri.refreshBook(animation);
         numbersSat.refreshBook(animation);
      }
      else if (obj === "Exercise") {
         numbersMon.refreshExercise(animation);
         numbersTue.refreshExercise(animation);
         numbersWed.refreshExercise(animation);
         numbersThu.refreshExercise(animation);
         numbersFri.refreshExercise(animation);
         numbersSat.refreshExercise(animation);
      }

   }

   visible: header_sections.selectedIndex === indexDay && listItemLayoutHour.title.text != ""

   ListItemLayout {
      id: listItemLayoutHour
      title.text: {
         var t = dbPath==null ? "" : dbPath
         // if (t == "") {
         //    checkBook.checked ? numbers[indexDay][0]-- : ""
         //    checkBook.checked ? numbers[indexDay][1]-- : ""
         // }
         // else {
         //    checkBook.checked ? numbers[indexDay][0]++ : ""
         //    checkExercise.checked ? numbers[indexDay][1]++ : ""
         // }
         // numbersRefresh("Book", false);
         // numbersRefresh("Exercise", false);
         return t
      }

      CheckBox {
         id: checkBook; width:units.gu(3); height:width;
         onCheckedChanged: {
            checked ? numbers[indexDay][0]++ : numbers[indexDay][0]--
            //console.log("CheckBox Book: "+Js.numbers)
            numbersRefresh("Book", true);
         }
      }
      CheckBox {
         id: checkExercise; width:units.gu(3); height:width;
         onCheckedChanged: {
            checked ? numbers[indexDay][1]++ : numbers[indexDay][1]--
            //console.log("CheckBox Exercise: "+Js.numbers)
            numbersRefresh("Exercise", true);
         }
      }
   }
   onClicked: {}
}
