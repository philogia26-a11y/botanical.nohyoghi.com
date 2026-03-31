Add-Type -AssemblyName System.Drawing
$imagePath = "c:\Users\Lenovo\Desktop\nohyoghi rev\logo nohyoghi.png"
$img = [System.Drawing.Image]::FromFile($imagePath)

# Leaf is roughly a circle on top. 
# Total Width: 739, Total Height: 338
# Let's crop a square from the top center
[int]$size = 300 
[int]$cropX = [math]::Max(0, [math]::Round((739 - $size) / 2))
[int]$cropY = 0

$rect = New-Object System.Drawing.Rectangle($cropX, $cropY, $size, $size)
$bmp = New-Object System.Drawing.Bitmap($size, $size)
$graphics = [System.Drawing.Graphics]::FromImage($bmp)
$graphics.Clear([System.Drawing.Color]::Transparent)
$graphics.DrawImage($img, (New-Object System.Drawing.Rectangle(0, 0, $size, $size)), $rect, [System.Drawing.GraphicsUnit]::Pixel)

$outputPath = "c:\Users\Lenovo\Desktop\nohyoghi rev\nohyoghi-icon.png"
$bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

$graphics.Dispose()
$bmp.Dispose()
$img.Dispose()
Write-Host "Icon saved to $outputPath"
