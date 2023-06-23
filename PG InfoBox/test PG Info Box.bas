'#Language "WWB-COM"
Option Explicit
' PG InfoBox (C) PG Service 2013
Sub Main
  DoEvents
	pgInfoBox("Your PG InfoBox (C) PG Service is working."&vbCrLf&vbCrLf&vbTab&"Just Wait . . .",2)
End Sub
'
' A self-dismissing Info box https://www.knowbrainer.com/forums/forum/messageview.cfm?catid=4&threadid=17305&discTab=true&messid=96759&parentid=96691&FTVAR_FORUMVIEWTMP=Single
' pgInfoBox(dispText As String, dispTime As Integer)
'
'  Note: if dispTime = 0, no auto-dismiss
'  In some instances (usually when a script leaves whatever it is called
'  from to operate in another application), the pgInfoBox does not show
'  up because it is hidden under the active window. In such a case, use
'  the "Type" value of 4096 (instead of 0) to make it a topmost modal window.
'
'  And, if you need the Return Value, be aware that auto-dismissing gets a
'  return value of -1, while the OK button gets a 1.
'
Function pgInfoBox(dispText As String, dispTime As Integer)
    ' An auto-dismissing MsgBox (courtesy of MS Windows Scripting Host)
    ' Reference: Popup Method at http://msdn.microsoft.com/en-us/library/x83z1d9f(v=vs.84).aspx
    Dim ib
    Set ib = CreateObject("WScript.Shell")
    DoEvents
    pgInfoBox = ib.Popup ( dispText & _
	    vbCrLf & vbCrLf & _
	    "Click OK or just wait . . ." , dispTime , _
	    "pgInfoBox" , 0 )
    Set ib = Nothing
End Function
'
