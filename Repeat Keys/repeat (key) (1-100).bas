'#Language "WWB-COM"

Option Explicit

' Repeat Keys (C) PG Service 2023
' repeat <key> <1-100>
Sub Main
	Dim x as Integer
	For x = 1 To CInt(ListVar2)
		EngineControl.RecognitionMimic("press " & ListVar1 _
			& IIf( (ListVar1="up" And ListVar1<>"page up") Or _
				(ListVar1="down" And ListVar1<>"page down") Or _
				ListVar1="left" Or ListVar1="right" , " arrow", _
				IIf(ListVar1="tab"," key","")) )
	Next x
End Sub
'
