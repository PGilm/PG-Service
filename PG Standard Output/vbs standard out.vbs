' This is a Dragon Advanced Scripting command
Option Explicit
Sub Main
	Dim sh As Object
	Dim ex As Object
	Dim a As Integer
	Dim b As Integer
	Dim result As String
	a = 2
	b = 3
	Set sh = CreateObject("WScript.Shell")
	Set ex = sh.Exec(Environ("ComSpec") & " /C cScript ""C:\Users\Philip\add.vbs"" " & a & " " & b)
	result = Mid(ex.StdOut.ReadAll(), 111)
	MsgBox """" & result & """"
End Sub
