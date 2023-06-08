Declare Function keybd_event Lib "user32.dll" _
	(ByVal vK As Long, bS As Long, _
		ByVal Fl As Long, ByVal exI As Long) As Long
' PG Spots (C) PG Service
' For holding and releasing modifier keys
Sub Main
	If ListVar1 = "Hold" Then
		If ListVar2 = "Control" Then
			keybd_event(&H11, 0, &H0, 0)  ' CTRL key Down
		Else  '  "Shift"
			keybd_event(&H10, 0, &H0, 0)  ' SHIFT key Down
		End If
	Else  '  "Release"
		If ListVar2 = "Control" Then
			keybd_event(&H11, 0, &H2, 0)  ' CTRL key Up
		Else  '  "Shift"
			keybd_event(&H10, 0, &H2, 0)  ' SHIFT key Up
		End If
	End If
End Sub
'
	
