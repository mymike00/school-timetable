import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Qt.labs.settings 1.0

Page {
   id: mainPage

   function updateCounters() {
      numbersMon.refreshBook(false);
      numbersTue.refreshBook(false);
      numbersWed.refreshBook(false);
      numbersThu.refreshBook(false);
      numbersFri.refreshBook(false);
      numbersSat.refreshBook(false);
      numbersMon.refreshExercise(false);
      numbersTue.refreshExercise(false);
      numbersWed.refreshExercise(false);
      numbersThu.refreshExercise(false);
      numbersFri.refreshExercise(false);
      numbersSat.refreshExercise(false);
   }

   header: PageHeader {
      id: pageHeader
      title: i18n.tr("School TimeTable")
      StyleHints {
         //foregroundColor: UbuntuColors.coolGrey
         backgroundColor: "transparent"//"#bf3421"
         //dividerColor: "transparent"//"#bf3421"
      }
      leadingActionBar.actions: null
      trailingActionBar.actions: [
         Action {
            id: closeAppHead
            iconName: "close"
            onTriggered: Qt.quit()
            text: i18n.tr("Close")
            shortcut: "esc"
         },
         Action {
            id: editHead
            iconName: "edit"
            text: i18n.tr("Edit")
            //  onTriggered: pageStack.push(Qt.resolvedUrl("Edit.qml"))
            onTriggered: editMode ? editMode = false : editMode = true
            shortcut: "f2"
         },
         Action {
            id: infoAppHead
            iconName: "info"
            text: i18n.tr("Info")
            onTriggered: pageStack.push(Qt.resolvedUrl("About.qml"))
            shortcut: "f1"
         },
         Action {
            id: closeEditHead
            iconName: "close"
            visible: !isFirstStart()
            onTriggered: editMode ? editMode = false : editMode = true
            /*onTriggered: {
              pageStack.pop()
              //if (!isFirstStart())
                  //header_sections.updateSelectedIndex()
            }*/
            text: i18n.tr("Close")
            shortcut: "esc"
         },
         Action {
            id: confirmEditHead
            iconName: isFirstStart() ? "tick" : "ok"
            text: i18n.tr("Accept")
            onTriggered: {
               var weekDays = [
                  [monday1.text(), monday2.text(), monday3.text(), monday4.text(), monday5.text(), monday6.text()],
                  [tuesday1.text(), tuesday2.text(), tuesday3.text(), tuesday4.text(), tuesday5.text(), tuesday6.text()],
                  [wednesday1.text(), wednesday2.text(), wednesday3.text(), wednesday4.text(), wednesday5.text(), wednesday6.text()],
                  [thursday1.text(), thursday2.text(), thursday3.text(), thursday4.text(), thursday5.text(), thursday6.text()],
                  [friday1.text(), friday2.text(), friday3.text(), friday4.text(), friday5.text(), friday6.text()],
                  [saturday1.text(), saturday2.text(), saturday3.text(), saturday4.text()]
               ]
               var objsArray = [
                  [mon0, mon1, mon2, mon3, mon4, mon5],
                  [tue0, tue1, tue2, tue3, tue4, tue5],
                  [wed0, wed1, wed2, wed3, wed4, wed5],
                  [thu0, thu1, thu2, thu3, thu4, thu5],
                  [fri0, fri1, fri2, fri3, fri4, fri5],
                  [sat0, sat1, sat2, sat3]
               ]

               accept(weekDays, objsArray)
               // accept(monday1.text(),monday2.text(),monday3.text(),monday4.text(),monday5.text(),monday6.text(),
               // tuesday1.text(),tuesday2.text(),tuesday3.text(),tuesday4.text(),tuesday5.text(),tuesday6.text(),
               // wednesday1.text(),wednesday2.text(),wednesday3.text(),wednesday4.text(),wednesday5.text(),wednesday6.text(),
               // thursday1.text(),thursday2.text(),thursday3.text(),thursday4.text(),thursday5.text(),thursday6.text(),
               // friday1.text(),friday2.text(),friday3.text(),friday4.text(),friday5.text(),friday6.text(),
               // saturday1.text(),saturday2.text(),saturday3.text(),saturday4.text()]]
               if (isFirstStart()) {
                  firstEdit()
                  pageStack.push(Qt.resolvedUrl("MainPage.qml"))
                  editMode = editMode ? false : true
               }
               else {
                  editMode = editMode ? false : true
               }
            }
            shortcut: "enter"
         }
      ]
      extension: SectionsDays {
         id: header_sections
      }
   }
   BackGround {}

   Timer {
      id: timerScroll
      interval: 200; running: false; repeat: false
      onTriggered: page_flickable.flick(0,-1300)
   }

   ScrollView {
      id: page_scrollview
      anchors {
         top: pageHeader.bottom
         left: parent.left
         right: parent.right
         bottom: parent.bottom
      }
      Flickable {
         id: page_flickable
         anchors.fill: parent
         clip: true
         contentHeight:  main_column.height + units.gu(2)


         Column {
            id: main_column
            anchors {
               left: parent.left
               right: parent.right
               top: parent.top
            }

            SubjectHeader {
               id: sbjHeader
               visible:  header_sections.selectedIndex !== 6
            }

            //Monday
            Hour {
               id: mon0
               dbPath: matLunedi.contents.primaOra
               indexDay: 0
            }
            Hour {
               id: mon1
               dbPath: matLunedi.contents.secondaOra
               indexDay: 0
            }
            Hour {
               id: mon2
               dbPath: matLunedi.contents.terzaOra
               indexDay: 0
            }
            Hour {
               id: mon3
               dbPath: matLunedi.contents.quartaOra
               indexDay: 0
            }
            Hour {
               id: mon4
               dbPath: matLunedi.contents.quintaOra
               indexDay: 0
            }
            Hour {
               id: mon5
               dbPath: matLunedi.contents.sestaOra
               indexDay: 0
            }

            //Tuesday
            Hour {
               id: tue0
               dbPath: matMartedi.contents.primaOra
               indexDay: 1
            }
            Hour {
               id: tue1
               dbPath: matMartedi.contents.secondaOra
               indexDay: 1
            }
            Hour {
               id: tue2
               dbPath: matMartedi.contents.terzaOra
               indexDay: 1
            }
            Hour {
               id: tue3
               dbPath: matMartedi.contents.quartaOra
               indexDay: 1
            }
            Hour {
               id: tue4
               dbPath: matMartedi.contents.quintaOra
               indexDay: 1
            }
            Hour {
               id: tue5
               dbPath: matMartedi.contents.sestaOra
               indexDay: 1
            }


            property int dbHourIndex: 1
            property string dbWed1: "matMercoledi.contents.ora"+dbHourIndex
            //Wednesday
            Hour {
               id: wed0
               dbPath: matMercoledi.contents.ora1 //dbWed1      //FIXME
               indexDay: 2
            }
            Hour {
               id: wed1
               dbPath: matMercoledi.contents.ora2
               indexDay: 2
            }
            Hour {
               id: wed2
               dbPath: matMercoledi.contents.ora3
               indexDay: 2
            }
            Hour {
               id: wed3
               dbPath: matMercoledi.contents.ora4
               indexDay: 2
            }
            Hour {
               id: wed4
               dbPath: matMercoledi.contents.ora5
               indexDay: 2
            }
            Hour {
               id: wed5
               dbPath: matMercoledi.contents.ora6
               indexDay: 2
            }


            //Thursday
            Hour {
               id: thu0
               dbPath: matGiovedi.contents.ora1
               indexDay: 3
            }
            Hour {
               id: thu1
               dbPath: matGiovedi.contents.ora2
               indexDay: 3
            }
            Hour {
               id: thu2
               dbPath: matGiovedi.contents.ora3
               indexDay: 3
            }
            Hour {
               id: thu3
               dbPath: matGiovedi.contents.ora4
               indexDay: 3
            }
            Hour {
               id: thu4
               dbPath: matGiovedi.contents.ora5
               indexDay: 3
            }
            Hour {
               id: thu5
               dbPath: matGiovedi.contents.ora6
               indexDay: 3
            }


            //Friday
            Hour {
               id: fri0
               dbPath: matVenerdi.contents.ora1
               indexDay: 4
            }
            Hour {
               id: fri1
               dbPath: matVenerdi.contents.ora2
               indexDay: 4
            }
            Hour {
               id: fri2
               dbPath: matVenerdi.contents.ora3
               indexDay: 4
            }
            Hour {
               id: fri3
               dbPath: matVenerdi.contents.ora4
               indexDay: 4
            }
            Hour {
               id: fri4
               dbPath: matVenerdi.contents.ora5
               indexDay: 4
            }
            Hour {
               id: fri5
               dbPath: matVenerdi.contents.ora6
               indexDay: 4
            }


            //Saturday
            Hour {
               id: sat0
               dbPath: matSabato.contents.ora1
               indexDay: 5
            }
            Hour {
               id: sat1
               dbPath: matSabato.contents.ora2
               indexDay: 5
            }
            Hour {
               id: sat2
               dbPath: matSabato.contents.ora3
               indexDay: 5
            }
            Hour {
               id: sat3
               dbPath: matSabato.contents.ora4
               indexDay: 5
            }

            ExcerciseBookCounter {
               indexDay: 0
               id: numbersMon
            }
            ExcerciseBookCounter {
               indexDay: 1
               id: numbersTue
            }
            ExcerciseBookCounter {
               indexDay: 2
               id: numbersWed
            }
            ExcerciseBookCounter {
               indexDay: 3
               id: numbersThu
            }
            ExcerciseBookCounter {
               indexDay: 4
               id: numbersFri
            }
            ExcerciseBookCounter {
               indexDay: 5
               id: numbersSat
            }
            Settings {
               property alias mon00: mon0.bookChecked
               property alias mon01: mon0.exerciseChecked
               property alias mon10: mon1.bookChecked
               property alias mon11: mon1.exerciseChecked
               property alias mon20: mon2.bookChecked
               property alias mon21: mon2.exerciseChecked
               property alias mon30: mon3.bookChecked
               property alias mon31: mon3.exerciseChecked
               property alias mon40: mon4.bookChecked
               property alias mon41: mon4.exerciseChecked
               property alias mon50: mon5.bookChecked
               property alias mon51: mon5.exerciseChecked

               property alias tue00: tue0.bookChecked
               property alias tue01: tue0.exerciseChecked
               property alias tue10: tue1.bookChecked
               property alias tue11: tue1.exerciseChecked
               property alias tue20: tue2.bookChecked
               property alias tue21: tue2.exerciseChecked
               property alias tue30: tue3.bookChecked
               property alias tue31: tue3.exerciseChecked
               property alias tue40: tue4.bookChecked
               property alias tue41: tue4.exerciseChecked
               property alias tue50: tue5.bookChecked
               property alias tue51: tue5.exerciseChecked

               property alias wed00: wed0.bookChecked
               property alias wed01: wed0.exerciseChecked
               property alias wed10: wed1.bookChecked
               property alias wed11: wed1.exerciseChecked
               property alias wed20: wed2.bookChecked
               property alias wed21: wed2.exerciseChecked
               property alias wed30: wed3.bookChecked
               property alias wed31: wed3.exerciseChecked
               property alias wed40: wed4.bookChecked
               property alias wed41: wed4.exerciseChecked
               property alias wed50: wed5.bookChecked
               property alias wed51: wed5.exerciseChecked

               property alias thu00: thu0.bookChecked
               property alias thu01: thu0.exerciseChecked
               property alias thu10: thu1.bookChecked
               property alias thu11: thu1.exerciseChecked
               property alias thu20: thu2.bookChecked
               property alias thu21: thu2.exerciseChecked
               property alias thu30: thu3.bookChecked
               property alias thu31: thu3.exerciseChecked
               property alias thu40: thu4.bookChecked
               property alias thu41: thu4.exerciseChecked
               property alias thu50: thu5.bookChecked
               property alias thu51: thu5.exerciseChecked

               property alias fri00: fri0.bookChecked
               property alias fri01: fri0.exerciseChecked
               property alias fri10: fri1.bookChecked
               property alias fri11: fri1.exerciseChecked
               property alias fri20: fri2.bookChecked
               property alias fri21: fri2.exerciseChecked
               property alias fri30: fri3.bookChecked
               property alias fri31: fri3.exerciseChecked
               property alias fri40: fri4.bookChecked
               property alias fri41: fri4.exerciseChecked
               property alias fri50: fri5.bookChecked
               property alias fri51: fri5.exerciseChecked

               property alias sat00: sat0.bookChecked
               property alias sat01: sat0.exerciseChecked
               property alias sat10: sat1.bookChecked
               property alias sat11: sat1.exerciseChecked
               property alias sat20: sat2.bookChecked
               property alias sat21: sat2.exerciseChecked
               property alias sat30: sat3.bookChecked
               property alias sat31: sat3.exerciseChecked
            }
         }
         Column {
            id: edit_column
            visible: false
            anchors {
               left: parent.left
               right: parent.right
               top: parent.top
               // bottom: parent.bottom
               topMargin: units.gu(2)
               bottomMargin: units.gu(2)
            }
            spacing: units.gu(2)

            Text {
               id: name
               text: i18n.tr("Subjects")
               font.weight: Font.DemiBold
               x: units.gu(2)
               visible:  header_sections.selectedIndex !== 6
            }
            Rectangle {
               color: "#cdcdcd"
               height: 1
               width: parent.width
               visible:  header_sections.selectedIndex !== 6
            }

            //Lunedì
            EditHour {
               id: monday1
               dbPath: matLunedi.contents.primaOra
               indexDay: 0
            }
            EditHour {
               id: monday2
               dbPath: matLunedi.contents.secondaOra
               indexDay: 0
            }
            EditHour {
               id: monday3
               dbPath: matLunedi.contents.terzaOra
               indexDay: 0
            }
            EditHour {
               id: monday4
               dbPath: matLunedi.contents.quartaOra
               indexDay: 0
               scroll: true
            }
            EditHour {
               id: monday5
               dbPath: matLunedi.contents.quintaOra
               indexDay: 0
               scroll: true
            }
            EditHour {
               id: monday6
               dbPath: matLunedi.contents.sestaOra
               indexDay: 0
               scroll: true
            }

            //Martedì
            EditHour {
               id: tuesday1
               dbPath: matMartedi.contents.primaOra
               indexDay: 1
            }
            EditHour {
               id: tuesday2
               dbPath: matMartedi.contents.secondaOra
               indexDay: 1
            }
            EditHour {
               id: tuesday3
               dbPath: matMartedi.contents.terzaOra
               indexDay: 1
            }
            EditHour {
               id: tuesday4
               dbPath: matMartedi.contents.quartaOra
               indexDay: 1
               scroll: true
            }
            EditHour {
               id: tuesday5
               dbPath: matMartedi.contents.quintaOra
               indexDay: 1
               scroll: true
            }
            EditHour {
               id: tuesday6
               dbPath: matMartedi.contents.sestaOra
               indexDay: 1
               scroll: true
            }


            //Mercoledì
            EditHour {
               id: wednesday1
               dbPath: matMercoledi.contents.ora1
               indexDay: 2
            }
            EditHour {
               id: wednesday2
               dbPath: matMercoledi.contents.ora2
               indexDay: 2
            }
            EditHour {
               id: wednesday3
               dbPath: matMercoledi.contents.ora3
               indexDay: 2
            }
            EditHour {
               id: wednesday4
               dbPath: matMercoledi.contents.ora4
               indexDay: 2
               scroll: true
            }
            EditHour {
               id: wednesday5
               dbPath: matMercoledi.contents.ora5
               indexDay: 2
               scroll: true
            }
            EditHour {
               id: wednesday6
               dbPath: matMercoledi.contents.ora6
               indexDay: 2
               scroll: true
            }


            //Giovedì
            EditHour {
               id: thursday1
               dbPath: matGiovedi.contents.ora1
               indexDay: 3
            }
            EditHour {
               id: thursday2
               dbPath: matGiovedi.contents.ora2
               indexDay: 3
            }
            EditHour {
               id: thursday3
               dbPath: matGiovedi.contents.ora3
               indexDay: 3
            }
            EditHour {
               id: thursday4
               dbPath: matGiovedi.contents.ora4
               indexDay: 3
               scroll: true
            }
            EditHour {
               id: thursday5
               dbPath: matGiovedi.contents.ora5
               indexDay: 3
               scroll: true
            }
            EditHour {
               id: thursday6
               dbPath: matGiovedi.contents.ora6
               indexDay: 3
               scroll: true
            }


            //Venerdì
            EditHour {
               id: friday1
               dbPath: matVenerdi.contents.ora1
               indexDay: 4
            }
            EditHour {
               id: friday2
               dbPath: matVenerdi.contents.ora2
               indexDay: 4
            }
            EditHour {
               id: friday3
               dbPath: matVenerdi.contents.ora3
               indexDay: 4
            }
            EditHour {
               id: friday4
               dbPath: matVenerdi.contents.ora4
               indexDay: 4
               scroll: true
            }
            EditHour {
               id: friday5
               dbPath: matVenerdi.contents.ora5
               indexDay: 4
               scroll: true
            }
            EditHour {
               id: friday6
               dbPath: matVenerdi.contents.ora6
               indexDay: 4
               scroll: true
            }

            //Sabato
            EditHour {
               id: saturday1
               dbPath: matSabato.contents.ora1
               indexDay: 5
            }
            EditHour {
               id: saturday2
               dbPath: matSabato.contents.ora2
               indexDay: 5
            }
            EditHour {
               id: saturday3
               dbPath: matSabato.contents.ora3
               indexDay: 5
            }
            EditHour {
               id: saturday4
               dbPath: matSabato.contents.ora4
               indexDay: 5
               scroll: true
            }
         }

      }
   }

   //Domenica
   Sunday {
      id: sunday
      visible: header_sections.selectedIndex === 6
      anchors {
         top: pageHeader.bottom
         left: parent.left
         right: parent.right
         bottom: parent.bottom
      }
   }


   states: [
   State {
      name: "edit"
      when: editMode
      PropertyChanges { target: main_column; visible: false }
      PropertyChanges { target: edit_column; visible: true }
      PropertyChanges { target: closeAppHead; visible: false }
      PropertyChanges { target: editHead; visible: false }
      PropertyChanges { target: infoAppHead; visible: false }
      PropertyChanges { target: closeEditHead; visible: true }
      PropertyChanges { target: confirmEditHead; visible: true }
      PropertyChanges { target: page_flickable; contentHeight: edit_column.height + units.gu(2)}
   },
   State {
      name: "no-edit"
      when: !editMode
      PropertyChanges { target: main_column; visible: true }
      PropertyChanges { target: edit_column; visible: false }
      PropertyChanges { target: closeAppHead; visible: true }
      PropertyChanges { target: editHead; visible: true }
      PropertyChanges { target: infoAppHead; visible: true }
      PropertyChanges { target: closeEditHead; visible: false }
      PropertyChanges { target: confirmEditHead; visible: false }
      PropertyChanges { target: page_flickable; contentHeight: edit_column.height + units.gu(2)}
   }
   ]
   Component.onCompleted: {
      console.log("height: "+main_column.height)
      console.log("implicitHeight: "+main_column.implicitHeight)
   }
}
