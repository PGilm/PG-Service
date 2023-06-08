'#Language "WWB-COM"
Option Explicit
' PG Spots (C) PG Service
' shows or hides SpeechStart+ spots
Sub Main
	If InStr(ListVar1, "Hide") Then
		EngineControl.RecognitionMimic("CANCEL")
	ElseIf InStr(ListVar1, "\") Then
		EngineControl.RecognitionMimic("SHOW " + Left(ListVar1, InStr(ListVar1, "\")-1))
	Else
		EngineControl.RecognitionMimic("SHOW " + ListVar1)
	End If
End Sub
'
