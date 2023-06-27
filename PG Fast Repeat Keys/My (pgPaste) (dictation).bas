'#Language "WWB-COM"

Option Explicit
'
' pgPaste Commands (C) PG Service 2022
'
Option Explicit

Sub Main
	If UtilityProvider.IsDebugMode Then  '  for debugging 
		UtilityProvider.SetContextValue ( 0 , "title" )
		UtilityProvider.SetContextValue ( 1 , "This is a test of a Case change" )
		MsgBox "This is the current clipboard: "+Clipboard
		Wait .2
	End If

	Dim clipOrig As String
	clipOrig=Clipboard ' save current clipboard

	Select Case ListVar1
		Case "all caps" 'paste dictation in "ALL CAPS"
			Clipboard(UCase(ListVar2)+" ")

		Case "title" 'paste dictation in "Title Case"
			Dim titleCase, tempStr, xWords, word, i
			tempStr=Split(ListVar2," ")
			For i=0 To UBound(tempStr)
				titleCase=titleCase&UCase(Left(tempStr(i),1))& _
					Mid(tempStr(i),2)&" "
			Next

			xWords=Array("A","An","And","Is","Nor", _
					"Of","Or","The") ' Add? "As","But","For","If","So","Yet",
			For Each word In xWords ' Above words don't get caps in Title Case
    			titleCase=Replace(titleCase," "&word&" ", _
					" "&LCase(word)&" ")
			Next

			Clipboard(titleCase)

		Case "camel" 'paste dictation in "camelCase"
			Dim camelCase
			tempStr=Split(ListVar2," ")
			camelCase=LCase(tempStr(0))
			For i=1 To UBound(tempStr)
				camelCase=camelCase&UCase(Left(tempStr(i),1))& _
					Mid(tempStr(i),2)
			Next
			Clipboard(camelCase)

		Case "shift", "cap" 'paste dictation with "Init cap first letter"
			Clipboard(UCase(Left(ListVar2,1))+Mid(ListVar2,2)+" ")

		Case "paste", "type" 'paste "recognized uttered dictation"
			Clipboard(ListVar2+" ")

		Case Else
			MsgBox "Hmmmm"
	End Select
	Wait .3

		If UtilityProvider.IsDebugMode Then MsgBox("New "+ListVar1+": "+Clipboard)

	'If UtilityProvider.IsDebugMode=0 Then SendKeys "^v",1 ' Perhaps faster?
	If UtilityProvider.IsDebugMode=0 Then SendSystemKeys "{Ctrl+v}" ' Perhaps more dependable?

	Wait .3
	Clipboard(clipOrig)
	Wait .3

		If UtilityProvider.IsDebugMode Then MsgBox ("Restored Clipboard: "+Clipboard)

End Sub
'
