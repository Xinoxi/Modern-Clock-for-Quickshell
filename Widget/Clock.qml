import Quickshell
import Quickshell.Wayland
import QtQuick

ShellRoot {
    PanelWindow {
        // ┌─────────────────────────────────────┐
        // │           Widget position           │
        // ├─────────────────────────────────────┤
        // │  active side (true/false)           │
            anchors.top: true                  
            anchors.right: true                
            anchors.left: true                 
            anchors.bottom: true               
        //  Position     
            margins.top: 0                   
            margins.right: 0                    
            margins.left: 0                   
            margins.bottom: 0                   
        // └─────────────────────────────────────┘

        WlrLayershell.layer: WlrLayer.Background
        WlrLayershell.namespace: "clock-widget"
        WlrLayershell.exclusiveZone: -1
        color: "transparent"

        // --- Fonts ---
         FontLoader {
             id: font_anurati
             source: Qt.resolvedUrl("Anurati.otf")
}

         FontLoader {
             id: font_poppins
		         source: Qt.resolvedUrl("Poppins.ttf")
}

        // --- Time ---
        Timer {
            interval: 1000
            running: true
            repeat: true
            triggeredOnStart: true
            onTriggered: {
                var now = new Date()
                display_day.text  = Qt.formatDate(now, "dddd").toUpperCase()
                display_date.text = Qt.formatDate(now, "dd MMM yyyy").toUpperCase()
                display_time.text = "- " + Qt.formatTime(now, "hh:mm") + " -"
            }
        }

        // --- Content ---
        Column {
            id: container
            anchors.centerIn: parent
            spacing: 4

            // ── Days of the week ──────────────────────────
            Item {
                implicitWidth: display_day.implicitWidth
                implicitHeight: display_day.implicitHeight
                anchors.horizontalCenter: parent.horizontalCenter

                // shadow
                Text {
                    x: 2; y: 2
                    text: display_day.text
                    font: display_day.font
                    color: "#55000000"
                }
                // Main text
                Text {
                    id: display_day
                    font.family: font_anurati.name
                    font.pixelSize: 90
                    color: "#ffffff"
                    font.letterSpacing: 10
                }
            }

            // ── Date ────────────────────────────────
            Item {
                implicitWidth: display_date.implicitWidth
                implicitHeight: display_date.implicitHeight
                anchors.horizontalCenter: parent.horizontalCenter

                // shadow
                Text {
                    x: 1; y: 1
                    text: display_date.text
                    font: display_date.font
                    color: "#55000000"
                }
                // Main text
                Text {
                    id: display_date
                    font.family: font_poppins.name
                    font.pixelSize: 20
                    color: "#ffffff"
                }
            }

            // ── Time  ─────────────────────────────────
            Item {
                implicitWidth: display_time.implicitWidth
                implicitHeight: display_time.implicitHeight
                anchors.horizontalCenter: parent.horizontalCenter

                // shadow
                Text {
                    x: 1; y: 1
                    text: display_time.text
                    font: display_time.font
                    color: "#55000000"
                }
                // Main text
                Text {
                    id: display_time
                    font.family: font_poppins.name
                    font.pixelSize: 17
                    color: "#ffffff"
                }
            }

        }
    }
}
