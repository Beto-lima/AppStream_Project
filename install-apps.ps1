$bucket = "your-bucket-appstream"
$prefix = "installers"
$localPath = "C:\Temp\AppInstallers"

New-Item -ItemType Directory -Force -Path $localPath

function Install-App {
    param (
        [string]$S3Key,
        [string]$FileName,
        [string]$SilentArgs
    )

    $s3Uri = "https://$bucket.s3.amazonaws.com/$prefix/$FileName"
    $localFile = "$localPath\$FileName"

    Invoke-WebRequest -Uri $s3Uri -OutFile $localFile
    Start-Process -FilePath $localFile -ArgumentList $SilentArgs -Wait -NoNewWindow
}

Install-App -S3Key "$prefix/ChromeSetup.exe"      -FileName "ChromeSetup.exe"    -SilentArgs "/silent /install"
Install-App -S3Key "$prefix/npp.exe"              -FileName "npp.exe"            -SilentArgs "/S"
Install-App -S3Key "$prefix/pgadmin4.msi"         -FileName "pgadmin4.msi"       -SilentArgs "/quiet"
Install-App -S3Key "$prefix/LibreOffice.msi"      -FileName "LibreOffice.msi"    -SilentArgs "/quiet"
Install-App -S3Key "$prefix/VSCodeSetup.exe"      -FileName "VSCodeSetup.exe"    -SilentArgs "/silent"

Write-Host "All applications have been installed successfully."
