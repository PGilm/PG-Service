' This is a Dragon Advanced Scripting command
Option Explicit
Sub Main
	Dim sh As Object
	Dim ex As Object
	Dim a As Integer
	Dim b As Integer
	Dim result As String
	a = InputBox("First number: ",,"23")
	b = InputBox("Second number: ",,"45")
	Set sh = CreateObject("WScript.Shell")
	Set ex = sh.Exec(Environ("ComSpec") & " /C cScript /nologo ""C:\Users\Philip\add.js"" " & a & " " & b)
	result = ex.StdOut.ReadAll()
	MsgBox """" & result & """"
End Sub
