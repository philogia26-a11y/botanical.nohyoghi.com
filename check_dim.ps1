Add-Type -AssemblyName System.Drawing
$imagePath = "c:\Users\Lenovo\Desktop\nohyoghi rev\nohyoghi merah sp.jpg"
$img = [System.Drawing.Image]::FromFile($imagePath)
Write-Host "Red dimensions: $($img.Width)x$($img.Height)"
$img.Dispose()
