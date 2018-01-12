import QtQuick 2.4
import Ubuntu.Components 1.3
import Qt.labs.settings 1.0

Item {
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

   Settings {
      property alias mon00: mon0.bookChecked
      property alias mon01: mon0.bookExercise
      property alias mon10: mon1.bookChecked
      property alias mon11: mon1.bookExercise
      property alias mon20: mon2.bookChecked
      property alias mon21: mon2.bookExercise
      property alias mon30: mon3.bookChecked
      property alias mon31: mon3.bookExercise
      property alias mon40: mon4.bookChecked
      property alias mon41: mon4.bookExercise
      property alias mon50: mon5.bookChecked
      property alias mon51: mon5.bookExercise
   }
}
