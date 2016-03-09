import QtQuick 2.0
import Ubuntu.Components 0.1
import "ui"

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "com.ubuntu.developer.liu-xiao-guo.TrafficLight"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    width: units.gu(120)
    height: units.gu(80)

    Page {
        id:main
        anchors.fill: parent

        Row {
            id: myrow
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: units.gu(5)

            MyLight {
                id:light1
                width: main.width/5
                height: width*3
            }

            MyLight {
                id:light2
                width: main.width/5
                height: width*3
            }

            MyLight {
                id:light3
                width: main.width/5
                height: width*3
            }
        }

    }
}

