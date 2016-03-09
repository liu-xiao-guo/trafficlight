import QtQuick 2.0
import Ubuntu.Components 0.1
import Light 1.0

Item {    
    width: units.gu(100)
    height: units.gu(75)

    Rectangle {
        id: background
        anchors.fill: parent
        color: "black"
        property int size: width*0.7

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            spacing: units.gu(3)

            TrafficLight{
                id: redlight
                width: background.size
                height: background.size
                color:"red"
            }

            TrafficLight{
                id: yellowlight
                width: background.size
                height: background.size
                color:"yellow"
            }

            TrafficLight{
                id: greenlight
                width: background.size
                height: background.size
                color:"green"
            }

            state: "red_on"

            states: [
                State {
                    name: "red_on"
                    PropertyChanges {
                        target: redlight
                        color:"red"
                        scale: 1.0
                    }
                    PropertyChanges {
                        target: greenlight
                        color: "black"
                    }
                    PropertyChanges {
                        target: yellowlight
                        color: "black"
                    }
                },

                State {
                    name: "red_yellow_on"
                    PropertyChanges {
                        target: redlight
                        color: "red"
                    }
                    PropertyChanges {
                        target: yellowlight
                        color: "yellow"
                    }
                    PropertyChanges {
                        target: greenlight
                        color: "black"
                    }
                },

                State {
                    name: "green_on"
                    PropertyChanges {
                        target: redlight
                        color: "black"
                    }
                    PropertyChanges {
                        target: yellowlight
                        color: "black"
                    }
                    PropertyChanges {
                        target: greenlight
                        color: "green"
                    }
                },

                State {
                    name: "yellow_on"
                    PropertyChanges {
                        target: redlight
                        color: "black"
                    }

                    PropertyChanges {
                        target: yellowlight
                        color: "yellow"
                    }

                    PropertyChanges {
                        target: greenlight
                        color: "black"
                    }
                }
            ]

            transitions: [
                Transition {
                    from: "*"
                    to: "*"

                    PropertyAnimation {
                        target: redlight
                        properties: "scale, color"
                        duration: 1000
                        easing.type: Easing.InQuad
                    }
                    PropertyAnimation {
                        target: greenlight
                        properties: "scale, color"
                        duration: 1000
                        easing.type: Easing.InQuad
                    }
                    PropertyAnimation {
                        target: yellowlight
                        properties: "scale, color"
                        duration: 1000
                        easing.type: Easing.InQuad
                    }
                }
            ]

            Timer {
                interval: 1000
                running: true
                repeat: true
                property int count: 0

                onTriggered: {
                    if (parent.state == "red_on" && count >= 5)
                    {
                        parent.state = "red_yellow_on"
                        count = 0
                    }
                    else if ( parent.state == "red_yellow_on" )
                    {
                        parent.state = "green_on"
                        count++
                    }
                    else if ( parent.state == "green_on" && count >= 5 )
                    {
                        parent.state = "yellow_on"
                        count ++
                    }
                    else if ( parent.state == "yellow_on" ) {
                        parent.state = "red_on"
                        count = 0
                    }
                    else {
                        count++
                    }
                }
            }
        }
    }
}
