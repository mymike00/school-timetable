import QtQuick 2.4
import Ubuntu.Components 1.3
import "script.js" as Js

Rectangle {
    color: UbuntuColors.porcelain
    anchors.fill: parent
    z: 0

    Image {
        source: "fold3.svg"
        y: (pageStack.height-this.width)/2
        anchors {
            left: parent.left
            right: parent.right
            //verticalCenter: parent.verticalCenter
        }
        height: width*2
        opacity: 0.02
    }
    Image {
        source: "fold2.svg"
        anchors.fill: parent
        opacity: 0.03
    }
}
