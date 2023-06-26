'#Language "WWB-COM"

Option Explicit

' Fast Repeat Keys (C) PG Service
' Repeat a directional keypress up to 100 times!
' Say: "Fast <pgKey> <pg1-100>"
Sub Main
	Dim j As String ' output
	Dim k As String ' parsed input
	k = ListVar1
	If InStr(k,"control ") Then
		'j+="^"
		j=j+"^"
		k=Mid(k,9)
	End If
	If InStr(k,"shift ") Then
		'j+="+"
		j=j+"+"
		k=Mid(k,7)
	End If
	'j+="{" & Replace(k,"page ","pg")
	j=j+"{" & Replace(k,"page ","pg")
	j=Replace(j,"pgdown","pgdn")
	SendKeys j & " " & ListVar2 & "}",1
End Sub
'
