#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 2
CoordMode("Mouse", "Screen")
#HotIf WinActive("Roblox")
~RButton::{
	;OutputDebug("rclick start`n")
	MouseGetPos &mx, &my
	KeyWait("RButton")
	;OutputDebug("rclick end`n")
	DllCall("SetCursorPos", "int", mx, "int", my)
}

global l := false
#HotIf WinActive("Roblox")
PgDn::{
	global l := !l
	;OutputDebug("lock " l "`n")
	while l && !A_IsSuspended && WinActive("Roblox") {
		try {
			WinGetPos(&x, &y, &w, &h, "Roblox")
			DllCall("SetCursorPos", "int", x+(w/2), "int", y+(h/2)+16)
		} catch {
			DllCall("SetCursorPos", "int", A_ScreenWidth/2, "int", A_ScreenHeight/2)
		}
	}
}

#SuspendExempt
Del::Suspend
#SuspendExempt false