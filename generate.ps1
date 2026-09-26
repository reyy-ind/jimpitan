Add-Type -AssemblyName System.Drawing

function New-Icon {
    param([int]$Size, [string]$OutputPath)
    
    $bmp = New-Object System.Drawing.Bitmap($Size, $Size)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = 'HighQuality'
    $g.TextRenderingHint = 'AntiAliasGridFit'
    
    # Background hijau
    $brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(31, 90, 68))
    $g.FillRectangle($brush, 0, 0, $Size, $Size)
    
    # Tulis teks J sebagai ikon
    $fontSize = [int]($Size * 0.5)
    $font = New-Object System.Drawing.Font('Segoe UI', $fontSize, [System.Drawing.FontStyle]::Bold)
    $sf = New-Object System.Drawing.StringFormat
    $sf.Alignment = 'Center'
    $sf.LineAlignment = 'Center'
    $rect = New-Object System.Drawing.RectangleF(0, 0, $Size, $Size)
    $whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    $g.DrawString('J', $font, $whiteBrush, $rect, $sf)
    
    $bmp.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
    $brush.Dispose()
    $whiteBrush.Dispose()
    $font.Dispose()
    Write-Host "Created: $OutputPath"
}

$iconsDir = "c:\Users\LENOVO THINKPAD T490\Downloads\files (4)\icons"
New-Icon -Size 192 -OutputPath "$iconsDir\icon-192.png"
New-Icon -Size 512 -OutputPath "$iconsDir\icon-512.png"
Write-Host "Done!"
