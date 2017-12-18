Dim objShell 
Dim objNetwork 
Set objNetwork=CreateObject("WScript.Network") 
strTitle="Telnet Demo" 
strDefaultServer="Server01" 
strDefaultUser=objNetwork.UserDomain & "\" & objNetwork.UserName 
'strDefaultPassword="nEig8bor" 
strComputer="10.103.159.7" 'InputBox("What server or device do you want to connect to?", strTitle,strDefaultServer) 
If Len(strComputer)=0 Then WScript.quit 
strUsername="gmlocalops" 'InputBox("What credential do you want to use",strTitle,strDefaultUser) 
If Len (strUsername)=0 Then WScript.Quit 
strPassword="a5teroId" 'InputBox("What password do you want to use?",strTitle,strDefaultPassword) 
If Len (strPassword)=0 Then WScript.Quit 
Set objShell=CreateObject("wscript.shell") 
'Start Telnet 
objShell.Run "Telnet " & strComputer 
'Give app a chance to get started 
WScript.Sleep 500 
objShell.AppActivate "Telnet " & strComputer 
'Send login credentials 
objShell.SendKeys strUsername & "~" 
WScript.Sleep 500 
objShell.SendKeys strPassword & "~" 
WScript.Sleep 500








