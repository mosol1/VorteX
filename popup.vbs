Dim objFSO
Dim checkboxFilePath
Dim isSelected

' Check if any command-line arguments were provided
If WScript.Arguments.Count > 0 Then
    checkboxFilePath = WScript.Arguments.Item(0)
Else
    WScript.Echo "Hmm, We are still waiting for you to agree to our Terms befor using Vortex."
    WScript.Quit(1)
End If

' Check if the checkbox_selected.txt file exists
Set objFSO = CreateObject("Scripting.FileSystemObject")
If objFSO.FileExists(checkboxFilePath) Then
    ' The checkbox was previously selected
    isSelected = True
Else
    ' The checkbox was not previously selected
    isSelected = False
End If

' Output the result
If isSelected Then
    ' The agreement was previously accepted
    WScript.Echo "You have!"
Else
    ' The agreement was not previously accepted
    Dim intResult
    Dim strMessage1
    Dim strMessage2
    ' Define the agreement message - part 1
    strMessage1 = "Warning: VorteX Usage" & vbCrLf & vbCrLf & _
                  "Attention: Before proceeding, please carefully review the following information." & vbCrLf & vbCrLf & _
                  "Using the Vortex software to optimize your system's performance can yield significant benefits, but it is crucial to understand and acknowledge the potential risks involved." & vbCrLf & vbCrLf & _
                  "To mitigate these risks and ensure a smooth experience:" & vbCrLf & vbCrLf & _
                  "1. Exercise caution: When making adjustments with Vortex, proceed with caution. Make changes incrementally and observe their effects on your system's performance before proceeding further." & vbCrLf & vbCrLf & _
                  "2. Create a system restore point: Before implementing any changes, it is highly recommended to create a system restore point. This allows you to revert your system back to its previous state in the event of any unexpected issues or undesired outcomes." & vbCrLf & vbCrLf & _
                  "3. Backup important data: Prior to making significant modifications to your system, ensure that you have backed up all essential data and files. This precautionary measure helps safeguard against potential data loss or corruption."

    ' Define the agreement message - part 2
    strMessage2 = vbCrLf & vbCrLf & _
                  "4. We are NOT responsible for any damages or changes involved even though it has been Critically tested." & vbCrLf & vbCrLf & _
                  "5. Prohibited actions: Redistribution or resale of the Vortex software is strictly prohibited. The software is intended for personal use only and may not be shared, distributed, or sold without explicit permission from the developers." & vbCrLf & vbCrLf & _
                  "By choosing to use this Tweaker, you acknowledge and accept these inherent risks. The developers cannot be held liable for any damages, loss of data, or issues that may arise as a result of using this software." & vbCrLf & vbCrLf & _
                  "Exercise diligence, proceed with caution, and enjoy the benefits of optimizing your system's performance with the VorteX Tweaker." & vbCrLf & vbCrLf & _
                  "Do you accept the terms and conditions?"

    ' Display the agreement message
    intResult = MsgBox(strMessage1, vbOKCancel + vbExclamation, "VorteX Warning")
    ' If the user clicks OK, display the second part of the message
    If intResult = vbOK Then
        intResult = MsgBox(strMessage2, vbYesNo + vbExclamation, "VorteX Warning")
        ' Check the user's choice
        If intResult = vbYes Then
            ' User accepted the agreement
            ' Create a file to indicate acceptance
            Set objFile = objFSO.CreateTextFile(checkboxFilePath, True)
            objFile.Close
            WScript.Echo "true"
        Else
            ' User declined the agreement
            WScript.Echo "false"
        End If
    Else
        ' User clicked Cancel
        WScript.Echo "false"
    End If
End If
