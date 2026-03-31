Add-Type -AssemblyName System.Drawing
$imagePath = "c:\Users\Lenovo\Desktop\nohyoghi rev\nohyoghi ijo sp2.png"
$img = [System.Drawing.Image]::FromFile($imagePath)

# We want the green box (approx 470px high) to be ~70% of the image height
# 470 / 0.70 = 671px
[int]$cropHeight = 671
# Maintain red aspect ratio: 1024 / 585 = 1.7504
[int]$cropWidth = [math]::Round($cropHeight * 1.7504)

[int]$cropX = [math]::Round(($img.Width - $cropWidth) / 2)
[int]$cropY = [math]::Round(($img.Height - $cropHeight) / 2)

$rect = New-Object System.Drawing.Rectangle($cropX, $cropY, $cropWidth, $cropHeight)
$bmp = New-Object System.Drawing.Bitmap($cropWidth, $cropHeight)

$graphics = [System.Drawing.Graphics]::FromImage($bmp)
$graphics.DrawImage($img, (New-Object System.Drawing.Rectangle(0, 0, $cropWidth, $cropHeight)), $rect, [System.Drawing.GraphicsUnit]::Pixel)

$outputPath = "c:\Users\Lenovo\Desktop\nohyoghi rev\nohyoghi ijo sp2_cropped.png"
$bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
Write-Host "Perfectly proportioned image saved to $outputPath with dimensions: $($bmp.Width)x$($bmp.Height)"

$graphics.Dispose()
$bmp.Dispose()
$img.Dispose()
