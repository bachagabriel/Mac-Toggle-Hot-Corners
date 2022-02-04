#!/usr/bin/env osascript

tell application "System Preferences"
	activate
	set current pane to pane id "com.apple.preference.expose"
end tell
delay 1
property theSavedValues : {"Application Windows", "Mission Control", "Desktop", "Quick Note"} -- for example
tell application "System Events"
	tell window "Mission Control" of process "System Preferences"
		click button "Hot Corners…"
		tell sheet 1
			tell group 1
				set theCurrentValues to value of pop up buttons
				if theCurrentValues is {"-", "-", "-", "-"} then
					repeat with i from 1 to 4
						set thisValue to item i of theSavedValues
						tell pop up button i
							click
							click menu item thisValue of menu 1
						end tell
					end repeat
				else
					copy theCurrentValues to theSavedValues
					repeat with i from 1 to 4
						tell pop up button i
							click
							click last menu item of menu 1
						end tell
					end repeat
				end if
			end tell
			click button "OK"
			tell application "System Preferences" to quit
		end tell
	end tell
end tell