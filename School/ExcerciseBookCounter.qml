import QtQuick 2.4
import Ubuntu.Components 1.3
import "script.js" as Js

ListItem {
    property int indexDay
    visible: header_sections.selectedIndex === indexDay
    ListItemLayout {
        title.text:i18n.tr("№ of Books -> Exercise Books: ")
        title.color: UbuntuColors.orange
        Button {
            id: bookButton
            text: /*i18n.tr("Exercise books: ")+*/numbers[indexDay][0]
            color: UbuntuColors.orange
            width:units.gu(3)
            height: width
            font.pointSize: units.gu(1.5)
        }
        Button {
            id: exerciseButton
            text: /*i18n.tr("Exercise books: ")+*/numbers[indexDay][1]
            color: UbuntuColors.orange
            width:units.gu(3)
            height: width
            font.pointSize: units.gu(1.5)
        }
        //Text {id: numbersLabel; text: i18n.tr("Exercise books: ")+Js.numbers[indexDay][1] ; font.pointSize: 16;color: UbuntuColors.orange}

    }
    PropertyAnimation {
        id:highlightBook;
        target: bookButton;
        properties: "color";
        easing.type: Easing.OutSine
        from: UbuntuColors.blue
        to: UbuntuColors.orange
        duration: 750
    }
    PropertyAnimation {
        id:highlightExercise;
        target: exerciseButton;
        properties: "color";
        easing.type: Easing.OutSine
        from: UbuntuColors.blue
        to: UbuntuColors.orange
        duration: 750
    }


    onClicked: {}
    function refreshBook() {
        highlightBook.stop();
        //console.log("refreshBook: "+Js.numbers)
        bookButton.text = numbers[indexDay][0];
        highlightBook.start();
    }
    function refreshExercise() {
        highlightExercise.stop();
        //console.log("refreshExercise: "+Js.numbers)
        exerciseButton.text = numbers[indexDay][1];
        highlightExercise.start();
    }
}
