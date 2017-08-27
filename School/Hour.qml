import Ubuntu.Components 1.3
//import "script.js" as Js

ListItem {
    property var dbPath
    property int numberHour
    property int indexDay
    property var numberType: {
        Book: "Book";
        Exercise: "Exercise";
    }

    function numbersRefresh(obj) {
        if (obj === "Book") {
            numbersMon.refreshBook();
            numbersTue.refreshBook();
            numbersWed.refreshBook();
            numbersThu.refreshBook();
            numbersFri.refreshBook();
            numbersSat.refreshBook();
        }
        else if (obj === "Exercise") {
            numbersMon.refreshExercise();
            numbersTue.refreshExercise();
            numbersWed.refreshExercise();
            numbersThu.refreshExercise();
            numbersFri.refreshExercise();
            numbersSat.refreshExercise();
        }

    }
    visible: header_sections.selectedIndex === indexDay
    ListItemLayout {
        title.text: dbPath

        CheckBox {
            width:units.gu(3); height:width;
            onCheckedChanged: {
                checked ? numbers[indexDay][0]++ : numbers[indexDay][0]--
                //console.log("CheckBox Book: "+Js.numbers)
                numbersRefresh("Book");
            }
        }
        CheckBox {
            width:units.gu(3); height:width;
            onCheckedChanged: {
                checked ? numbers[indexDay][1]++ : numbers[indexDay][1]--
                //console.log("CheckBox Exercise: "+Js.numbers)
                numbersRefresh("Exercise");
            }
        }
    }
    onClicked: {}
}
