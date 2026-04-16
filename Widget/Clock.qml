import Quickshell
import Quickshell.Wayland
import QtQuick

ShellRoot {
	//--Color#--
	property color textColor: "#ffffff"

	//--Font--
    property string activeTopFont: font_anurati .name
    
	///////////////////////////////////////////////////
    // font_anurati font_beyno font_azedo font_serif //
	///////////////////////////////////////////////////
	
    property string activeDownFont: font_varela .name

	////////////////////////////////////////
	// font_poppins font_varela font_lato //
	////////////////////////////////////////
	
    // --- Fonts ---
    FontLoader { id: font_anurati;  source: Qt.resolvedUrl("Anurati.otf")  }
	FontLoader { id: font_beyno; source: Qt.resolvedUrl("BEYNO.otf") }
	FontLoader { id: font_azedo;  source: Qt.resolvedUrl("Azedo-Bold.otf")  }
	FontLoader { id: font_serif;  source: Qt.resolvedUrl("InstrumentSerif-Regular.ttf")  }

	FontLoader { id: font_poppins;  source: Qt.resolvedUrl("Poppins.ttf")  }
	FontLoader { id: font_varela;  source: Qt.resolvedUrl("VarelaRound-Regular.ttf") }
	FontLoader { id: font_lato;  source: Qt.resolvedUrl("Lato-Italic.ttf")  }
    
	//--Size--
	property int sizeTop:  90
	property int sizeCenter: 23
	property int sizeDown:  20

    //--Spacing--
	property int spaceWith: 4

	//--Spacing between text--
	property int spaceBetweenTopText: 10
	property int spaceBetweenDownText: 0
	
    PanelWindow {
        // ┌─────────────────────────────────────┐
        // │           Widget position           │
        // ├─────────────────────────────────────┤
        // │  Active side (true/false)           │
            anchors.top: true                  
            anchors.right: true                
            anchors.left: true                 
            anchors.bottom: true               
        //    Position     
            margins.top: 0                   
            margins.right: 0              
            margins.left: 0                   
            margins.bottom: 0                   
        // └─────────────────────────────────────┘
 
 //─────────────────────────────────────────────────────────────────────────

        WlrLayershell.layer: WlrLayer.Background
        WlrLayershell.namespace: "clock-widget"
        WlrLayershell.exclusiveZone: -1
        color: "transparent"

        // --- Time ---
 		SystemClock { id: clock; precision: SystemClock.Seconds }

        // --- Content ---
        Column {
            id: container
            anchors.centerIn: parent
            spacing: spaceWith

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
                    font.family: activeTopFont
                    font.pixelSize: sizeTop
                    color: textColor
                    font.letterSpacing: spaceBetweenTopText
                    
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
                    font.family: activeDownFont
                    font.pixelSize: sizeCenter
                    color: textColor
                    font.letterSpacing: spaceBetweenDownText
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
                    font.family: activeDownFont
                    font.pixelSize: sizeDown
                    color: textColor
                    font.letterSpacing: spaceBetweenDownText
                }
            }
        }
    }
}
