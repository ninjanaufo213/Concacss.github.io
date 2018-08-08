#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <NormalMemory.au3>
MsgBox(0,0,"Đang đợi game")
ProcessWait("ac_client.exe")
MsgBox(0,0,"Access !")
HotKeySet("x","exits")
HotKeySet("{F1}","writeammo")
HotKeySet("{F2}","writeheith")
HotKeySet("{F3}","dontho")
Global $open=_MemoryOpen(ProcessExists("ac_client.exe"))
$s="0050F4F4 F8 0150 003C 0158-bom 0180-nembomnhanh 005C-Don tho"
#Region ### START Koda GUI section ### Form=E:\heplai\cstrike\Autoit3\SciTE\Koda\Forms\Form1.kxf
$Form1 = GUICreate("Form1", 257, 230, 281, 156,$WS_POPUPWINDOW )
GUISetBkColor(0x000000)
$Label1 = GUICtrlCreateLabel("XVC Hack", 0, 0, 260, 20, $SS_CENTER)
GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, 0x00FF00)
GUICtrlSetBkColor(-1, 0x298185)
$Label2 = GUICtrlCreateLabel("Vinh dz - Happy hacking", 0, 208, 260, 20, $SS_CENTER)
GUICtrlSetFont(-1, 10, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetBkColor(-1, 0xC0C0C0)
Global $Label3 = GUICtrlCreateLabel("Full Ammo [F1]", 16, 32, 111, 25)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $Label4 = GUICtrlCreateLabel(":)", 192, 32, 26, 25)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $Label5 = GUICtrlCreateLabel("Full Heith [F2]", 16, 64, 111, 25)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $Label6 = GUICtrlCreateLabel(":)", 192, 64, 26, 25)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $Label7 = GUICtrlCreateLabel("Don tho [F3]", 16, 96, 111, 25)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFFFFFF)
Global $Label8 = GUICtrlCreateLabel(":)", 192, 96, 26, 25)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, 0xFFFFFF)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
WinSetTrans($Form1,"",215)
While 1
	setpos()
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd

#Region Func
Func exits()
	exit
EndFunc
Func setpos()
	Local $pos=WinGetPos(WinGetTitle("[CLASS:CrossFire]"))
	WinMove($Form1,"",$pos[0],$pos[1])
	WinSetOnTop($Form1,"",1)
EndFunc
Func writememoryspecial($addresshex,$offset,$data,$type='dword')
	Local $data1=_MemoryRead($addresshex,$open)
	$pointer=$data1+$offset
	_MemoryWrite($pointer,$open,$data,$type)
EndFunc
Func writeheith()
  writememoryspecial(0x0050F4F4,0xF8,9999)
EndFunc
Func writeammo()
	writememoryspecial(0x0050F4F4,0x150,9999)
EndFunc
Func dontho()
	writememoryspecial(0x0050F4F4,0x005C,-3.5,'float')
EndFunc
#EndRegion
