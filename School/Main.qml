import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import U1db 1.0 as U1db
//import QtSystemInfo 5.0
import "script.js" as Js

MainView {
   // objectName for functional testing purposes (autopilot-qt5)
   objectName: "mainView"
   id: mainView

   // Note! applicationName needs to match the "name" field of the click manifest
   applicationName: "school.mymike"

   width: units.gu(40)
   height: units.gu(75)

   /*ScreenSaver {
   id: screen_saver
   screenSaverEnabled: true
   }*/

   //property bool isDisplayOn: false
   property var numbers: [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
   // Book - Exercise > Mon - Tue - ...
   // [0][0] -> Mon, Book
   // [4][1] -> Fri, Exercise

   property var date: new Date()
   property int day: date.getDay()
   property int hour: date.getHours()
   property int min: date.getMinutes()

   property bool resizing: false

   //backgroundColor: "#bf3421"
   backgroundColor: UbuntuColors.porcelain

   U1db.Database { id: db; path: "subjects.u1db" }
   U1db.Document {
      id: matLunedi
      database: db
      docId: "matLunedi"
      create: true
      defaults: {
         primaOra: "Italiano"
         secondaOra:"Italiano"
         terzaOra: "Matematica"
         quartaOra: "Informatica"
         quintaOra: "Telecomunicazioni"
         sestaOra: "😇"
      }
   }
   U1db.Document {
      id: matMartedi
      database: db
      docId: "matMartedi"
      create: true
      defaults: { //unusefull ? -> remove ?
         primaOra: "Telecomunicazioni"
         secondaOra:"Sistemi & Reti"
         terzaOra: "Compl. Mate"
         quartaOra: "Informatica"
         quintaOra: "Sistemi & Reti"
         sestaOra: "😇"
      }
   }
   U1db.Document {
      id: matMercoledi
      database: db
      docId: "matMercoledi"
      create: true
      defaults: {ora1:"";ora2:"";ora3:"";ora4:"";ora5:"";ora6:""}
   }
   U1db.Document {
      id: matGiovedi
      database: db
      docId: "matGiovedi"
      create: true
      defaults: {ora1:"";ora2:"";ora3:"";ora4:"";ora5:"";ora6:"";}
   }
   U1db.Document {
      id: matVenerdi
      database: db
      docId: "matVenerdi"
      create: true
   defaults: {ora1:"";ora2:"";ora3:"";ora4:"";ora5:"";ora6:""}
   }
   U1db.Document {
      id: matSabato
      database: db
      docId: "matSabato"
      create: true
      defaults: {ora1:"";ora2:"";ora3:"";ora4:"";ora5:"";ora6:""}
   }

   U1db.Database { id: stuff; path: "stuff.u1db" }
   U1db.Document {
      id: firstStart
      database: stuff
      docId: "firstStart"
      create: true
      defaults: {firstStart: true}
   }
   U1db.Document {
      id: selDay
      database: stuff
      docId: "selDay"
      create: true
      defaults: {selIndex: 0}
   }

   function getSelDay(){
      return selDay.contents.selIndex
   }

   function setSelDay(selectedIndex){
      selDay.contents = {selIndex:selectedIndex}
   }

   // function accept(lunediOra1,lunediOra2,lunediOra3,lunediOra4,lunediOra5,lunediOra6,martediOra1,martediOra2,martediOra3,martediOra4,martediOra5,martediOra6,mercolediOra1,mercolediOra2,mercolediOra3,mercolediOra4,mercolediOra5,mercolediOra6,giovediOra1,giovediOra2,giovediOra3,giovediOra4,giovediOra5,giovediOra6,venerdiOra1,venerdiOra2,venerdiOra3,venerdiOra4,venerdiOra5,venerdiOra6,sabatoOra1,sabatoOra2,sabatoOra3,sabatoOra4) {
   //    //SALVA TUTTO NEL DB - save all in the db
   //    matLunedi.contents = {primaOra: lunediOra1,secondaOra: lunediOra2,terzaOra: lunediOra3,quartaOra: lunediOra4,quintaOra: lunediOra5,sestaOra: lunediOra6}
   //    matMartedi.contents = {primaOra: martediOra1,secondaOra: martediOra2,terzaOra: martediOra3,quartaOra: martediOra4,quintaOra: martediOra5,sestaOra: martediOra6}
   //    matMercoledi.contents = {ora1: mercolediOra1,ora2: mercolediOra2,ora3: mercolediOra3,ora4: mercolediOra4,ora5: mercolediOra5,ora6: mercolediOra6}
   //    matGiovedi.contents = {ora1: giovediOra1,ora2: giovediOra2,ora3: giovediOra3,ora4: giovediOra4,ora5: giovediOra5,ora6: giovediOra6}
   //    matVenerdi.contents = {ora1: venerdiOra1, ora2: venerdiOra2, ora3: venerdiOra3, ora4: venerdiOra4, ora5: venerdiOra5, ora6: venerdiOra6}
   //    matSabato.contents = {ora1: sabatoOra1, ora2: sabatoOra2, ora3: sabatoOra3, ora4: sabatoOra4}
   // }
   function accept(arrayWeekDays, objsArray) {
      numbers= [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]

      arrayWeekDays.forEach(function(element, index, week) {
         element.forEach(function(el, i, day) {
            if (el != "") {
               objsArray[index][i].bookChecked ? numbers[index][0]++ : ""
               objsArray[index][i].exerciseChecked ? numbers[index][1]++ : ""
            }
         })
      })

      matLunedi.contents = {primaOra: arrayWeekDays[0][0],secondaOra: arrayWeekDays[0][1],terzaOra: arrayWeekDays[0][2],quartaOra: arrayWeekDays[0][3],quintaOra: arrayWeekDays[0][4],sestaOra: arrayWeekDays[0][5]}
      matMartedi.contents = {primaOra: arrayWeekDays[1][0],secondaOra: arrayWeekDays[1][1],terzaOra: arrayWeekDays[1][2],quartaOra: arrayWeekDays[1][3],quintaOra: arrayWeekDays[1][4],sestaOra: arrayWeekDays[1][5]}
      matMercoledi.contents = {ora1: arrayWeekDays[2][0],ora2: arrayWeekDays[2][1],ora3: arrayWeekDays[2][2],ora4: arrayWeekDays[2][3],ora5: arrayWeekDays[2][4],ora6: arrayWeekDays[2][5]}
      matGiovedi.contents = {ora1: arrayWeekDays[3][0],ora2: arrayWeekDays[3][1],ora3: arrayWeekDays[3][2],ora4: arrayWeekDays[3][3],ora5: arrayWeekDays[3][4],ora6: arrayWeekDays[3][5]}
      matVenerdi.contents = {ora1: arrayWeekDays[4][0], ora2: arrayWeekDays[4][1], ora3: arrayWeekDays[4][2], ora4: arrayWeekDays[4][3], ora5: arrayWeekDays[4][4], ora6: arrayWeekDays[4][5]}
      matSabato.contents = {ora1: arrayWeekDays[5][0], ora2: arrayWeekDays[5][1], ora3: arrayWeekDays[5][2], ora4: arrayWeekDays[5][3]}

      pageStack.currentPage.updateCounters();
   }

   function isFirstStart() {
      if (firstStart.contents.firstStart)
      return true
      else
      return false
   }
   function firstEdit(){
      firstStart.contents = {firstStart:false}
   }
   property bool editMode: false

   anchorToKeyboard: true

   PageStack {
      id: pageStack
      anchors.fill: parent

      Component.onCompleted: {
         numbers= [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
         setSelDay(day)
         if (hour<14) {
            if (day==0) setSelDay(6)
            else setSelDay(day-1)
         }

         if (firstStart.contents.firstStart !== true && firstStart.contents.firstStart !== false) {
            firstStart.contents = {firstStart:true}
            selDay.contents = {selIndex:0}
         }

         isFirstStart()
         if (firstStart.contents.firstStart)
            push(Qt.resolvedUrl("FirstStart.qml"))
         else
            push(Qt.resolvedUrl("MainPage.qml"))
      }

   }

}
