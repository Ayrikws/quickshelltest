import QtQuick
import Quickshell
import Quickshell.Io

Item {
	id: root

    property color base: "#282828"      // bg / bg0
    property color mantle: "#1d2021"    // bg0_h / dark background
    property color crust: "#141617"     // darkest background accent
    property color text: "#ebdbb2"      // fg / fg0
    property color subtext0: "#a89984"  // gray / fg4
    property color subtext1: "#bdae93"  // fg3
    property color surface0: "#3c3836"  // bg1
    property color surface1: "#504945"  // bg2
    property color surface2: "#665c54"  // bg3
    property color overlay0: "#7c6f64"  // bg4
    property color overlay1: "#928374"  // gray
    property color overlay2: "#a89984"  // light gray
    property color blue: "#83a598"     // blue
    property color sapphire: "#689d6a" // aqua / teal alternative
    property color peach: "#fe8019"    // orange
    property color green: "#b8bb26"    // green
    property color red: "#fb4934"      // red
    property color mauve: "#edcbdc"    // purple
    property color pink: "#edcbdc"     // purple accent
    property color yellow: "#fabd2f"   // yellow
    property color maroon: "#cc241d"   // dark red
    property color teal: "#8ec07c"     // aqua

	property string rawJson: ""

	Process {
		id: themeReader
		command: ["cat", "/tmp/qs_colors.json"]
		stdout: StdioCollector {
			onStreamFinished: {
				let txt = this.text.trim();
				if (txt !== "" && txt !== root.rawJson) {
					root.rawJson = txt;
					try {
						let c = JSON.parse(txt);
						if (c.base) root.base = c.base;
						if (c.mantle) root.mantle = c.mantle;
						if (c.crust) root.crust = c.crust;
						if (c.text) root.text = c.text;
						if (c.subtext0) root.subtext0 = c.subtext0;
						if (c.subtext1) root.subtext1 = c.subtext1;
						if (c.surface0) root.surface0 = c.surface0;
						if (c.surface1) root.surface1 = c.surface1;
						if (c.surface2) root.surface2 = c.surface2;
						if (c.overlay0) root.overlay0 = c.overlay0;
						if (c.overlay1) root.overlay1 = c.overlay1;
						if (c.overlay2) root.overlay2 = c.overlay2;
						if (c.blue) root.blue = c.blue;
						if (c.sapphire) root.sapphire = c.sapphire;
						if (c.peach) root.peach = c.peach;
						if (c.green) root.green = c.green;
						if (c.red) root.red = c.red;
						if (c.mauve) root.mauve = c.mauve;
						if (c.pink) root.pink = c.pink;
						if (c.yellow) root.yellow = c.yellow;
						if (c.maroon) root.maroon = c.maroon;
						if (c.teal) root.teal = c.teal;
					} catch(e) {}
				}
			}
		}
	}

	Timer {
		interval: 1000 
		running: true
		repeat: true
		triggeredOnStart: true
		onTriggered: themeReader.running = true
	}
}
