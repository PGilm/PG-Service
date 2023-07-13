 ' add.vbs
 ' check for comand line arguements
 if WScript.Arguments.Count > 1 Then
 	a=cint(WScript.Arguments.Item(0))
 	b=cint(WScript.Arguments.Item(1))
 	MsgBox "You entered " & a & " and " & b
 Else ' if none, get two integers
 	a = cInt(InputBox("Enter first integer:"))
 	b = cInt(InputBox("Enter second integer:"))
 	MsgBox "You entered " & a & " + " & b
 End If
 x=a+b ' result
 MsgBox "Going to provide this result: " & x
 
 ' This is how to get the result back to Dragon:
 Dim StdOut : Set StdOut = CreateObject("Scripting.FileSystemObject").GetStandardStream(1)
 StdOut.Write x
