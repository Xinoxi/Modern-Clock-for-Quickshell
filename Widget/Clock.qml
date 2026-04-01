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
 		SystemClock {
 			id: clock
 			precision: SystemClock.Seconds
}

        // --- Content ---
        Column {
            id: container
            anchors.centerIn: parent
            spacing: 4

// ── Days of the week ──────────────────────────
            Item {
                implicitWidth: clock_day.implicitWidth
                implicitHeight: clock_day.implicitHeight
                anchors.horizontalCenter: parent.horizontalCenter

                // shadow
                Text {
                    x: 2; y: 2
                    text: clock_day.text
                    font: clock_day.font
                    color: "#55000000"
                }
                // Main text
                Text {
                    id: clock_day
                    text: Qt.formatDate(clock.date, "dddd").toUpperCase()
                    font.family: font_anurati.name
                    font.pixelSize: 90
                    color: "#ffffff"
                    font.letterSpacing: 10
                }
            }

            // ── Date ────────────────────────────────
            Item {
                implicitWidth: clock_date.implicitWidth
                implicitHeight: clock_date.implicitHeight
                anchors.horizontalCenter: parent.horizontalCenter

                // shadow
                Text {
                    x: 1; y: 1
                    text: clock_date.text
                    font: clock_date.font
                    color: "#55000000"
                }
                // Main text
                Text {
                    id: clock_date
                    text: Qt.formatDate(clock.date, "dd MMM yyyy").toUpperCase()
                    font.family: font_poppins.name
                    font.pixelSize: 20
                    color: "#ffffff"
                }
            }

            // ── Time  ─────────────────────────────────
            Item {
                implicitWidth: clock_time.implicitWidth
                implicitHeight: clock_time.implicitHeight
                anchors.horizontalCenter: parent.horizontalCenter

                // shadow
                Text {
                    x: 1; y: 1
                    text: clock_time.text
                    font: clock_time.font
                    color: "#55000000"
                }
                // Main text
                Text {
                    id: clock_time
                    text: "- " + Qt.formatTime(clock.date, "hh:mm") + " -"
                    font.family: font_poppins.name
                    font.pixelSize: 17
                    color: "#ffffff"
                }
            }
        }
    }
}
