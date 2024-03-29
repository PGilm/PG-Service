'#Language "WWB-COM"
Option Explicit
' PG Spots (C) PG Service 2022
' Special "clicks" and keep those SpeechStart+ Circles appearing!
Declare Function keybd_event Lib "user32.dll" _
	(ByVal vK As Long, bS As Long, ByVal Fl As Long, ByVal exI As Long) As Long
'
' <click> is a lisy of mouse actions that work with PcByVoice SpeechStart+ as extended herein
' <1-999> is a list of numerals 1 through 999 (you could make it shorter which may help performance)
' <spots> is a list of the PCbyVoice SpeechStart+ indicators plus the complex word "[preferred indicator]\Spots" 
'  which lets you pick what happens with "Spots" commands (perhaps add a "SHOW Spots" too?)
'
'  Say: "<click> <1-99> <spots>"
Sub Main
	Dim m, n, o, p
	p = EngineControl.RecognitionMode  '  svae current mode
	EngineControl.RecognitionMode = dgnrecmodeCommand  '  set to command mode
	' Beep
	o = ListVar3  '  numbers, circles or flags
		If InStr(o, "\") Then o = Left(o, InStr(o,"\")-1)  '  handle complex "spots"
	n = NumtoStr(ListVar2)  '  need to stringify numbers
	m = Left(ListVar1, InStr(ListVar1,"\")-1)  '  SpeechStart+ prefix
	If InStr(ListVar1, "Control") Or InStr(ListVar1, "Shift") Then
		keybd_event(&H11,0,&H0,0)  '  hold control
		EngineControl.RecognitionMimic("SHOW " & o)  '  may or may not be necessary
	End If
	If InStr(ListVar1, "Shift") Then keybd_event(&H10,0,&H0,0)  '  hold shift
	EngineControl.RecognitionMimic(m & " " & n)  '  The real magic
	If InStr(ListVar1, "Shift") Then EngineControl.RecognitionMimic("Release Shift")
	If InStr(ListVar1, "Control") Or InStr(ListVar1, "Shift") Then EngineControl.RecognitionMimic("Release Control")
'  restore the mode from p (cannot use RecognitionMode as it will cancel Command Mode before the above RecognitionMimics fire
	If p = 0 Then EngineControl.RecognitionMimic("start normal mode")
	If p = 1 Then EngineControl.RecognitionMimic("start dictation mode")
	If p = 2 Then EngineControl.RecognitionMimic("start command mode")
	If p = 3 Then EngineControl.RecognitionMimic("start numbers mode")
	If p = 4 Then EngineControl.RecognitionMimic("start spell mode")
	EngineControl.RecognitionMimic("SHOW " & o)  '  The magic SpeechStart+ incantation
End Sub
'
Function NumtoStr(x)
	If Len(x)=3 Then  '  there is a hundreds digit
		NumtoStr = ones(Left(x,1)) & " hundred "
		x = Mid(x,2)  '  trim off hundreds 
	End If  '  End hundreds processing
	If Len(x)=2 Then  '  there is a tens digit
		If CInt(x) < 20 Then
			NumtoStr = Trim(NumtoStr & ones(x))
		Else
			NumtoStr = Trim(NumtoStr & tones(Left(x,1)) & " " & ones(Right(x,1)))
		End If
	Else
		NumtoStr = ones(x)
	End If  '  End tens processing
End Function
'
Function ones(a)
    Select Case a
        Case "0", "00"
            ones=""
	Case "1", "01"
            ones="one"
        Case "2", "02"
            ones="two"
        Case "3", "03"
            ones="three"
        Case "4", "04"
            ones="four"
	Case "5", "05"
            ones="five"
        Case "6", "06"
            ones="six"
        Case "7", "07"
            ones="seven"
        Case "8", "08"
            ones="eight"
        Case "9", "09"
            ones="nine"
        Case "10"
            ones="ten"
        Case "11"
            ones="eleven"
        Case "12"
            ones="twelve"
        Case "13"
            ones="thirteen"
        Case "14"
            ones="fourteen"
        Case "15"
            ones="fifteen"
        Case "16"
            ones="sixteen"
        Case "17"
            ones="seventeen"
        Case "18"
            ones="eighteen"
        Case "19"
            ones="nineteen"
    End Select
End Function
'
Function tones(a)
    Select Case a
        Case "2"
            tones="twenty"
        Case "3"
            tones="thirty"
        Case "4"
            tones="forty"
        Case "5"
            tones="fifty"
        Case "6"
            tones="sixty"
        Case "7"
            tones="seventy"
        Case "8"
            tones="eighty"
        Case "9"
            tones="ninety"
    End Select
End Function
'
