Add-Type -AssemblyName System.Drawing

$outDir = "C:\Users\fabia\OneDrive\Documentos\Projetos Antigravity\PostaFit\logotipos"
$size = 512
$colors = @{
  orange1 = [System.Drawing.Color]::FromArgb(249, 115, 22)
  orange2 = [System.Drawing.Color]::FromArgb(234, 88, 12)
  orange3 = [System.Drawing.Color]::FromArgb(251, 146, 60)
  darkB   = [System.Drawing.Color]::FromArgb(2, 6, 23)
  darkM   = [System.Drawing.Color]::FromArgb(15, 23, 42)
  white   = [System.Drawing.Color]::FromArgb(255, 255, 255)
  gray    = [System.Drawing.Color]::FromArgb(148, 163, 184)
}

# ─── Opção 1: "PF" Moderno em círculo com gradiente ───────────────
$bmp1 = New-Object System.Drawing.Bitmap($size, $size)
$g1 = [System.Drawing.Graphics]::FromImage($bmp1)
$g1.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$g1.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

$grad1 = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
  (New-Object System.Drawing.Point(0, 0)),
  (New-Object System.Drawing.Point($size, $size)),
  $colors.orange1, $colors.orange2)
$g1.FillRectangle($grad1, 0, 0, $size, $size)

$brushBg = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 255, 255))
$g1.FillEllipse($brushBg, 56, 56, 400, 400)

$brushCircle = New-Object System.Drawing.SolidBrush($colors.orange1)
$g1.FillEllipse($brushCircle, 66, 66, 380, 380)

$fontPF = New-Object System.Drawing.Font("Segoe UI Black", 180, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
$brushWhite = New-Object System.Drawing.SolidBrush($colors.white)
$pfSize = $g1.MeasureString("PF", $fontPF)
$pfX = ($size - $pfSize.Width) / 2
$pfY = ($size - $pfSize.Height) / 2 - 6
$g1.DrawString("PF", $fontPF, $brushWhite, $pfX, $pfY)

$fontSub = New-Object System.Drawing.Font("Segoe UI", 20, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$subSize = $g1.MeasureString("POSTAFIT", $fontSub)
$g1.DrawString("POSTAFIT", $fontSub, $brushWhite, ($size - $subSize.Width) / 2, $pfY + $pfSize.Height - 10)
$g1.Dispose()
$bmp1.Save("$outDir\logo_opcao1_512.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp1.Dispose()

# ─── Opção 2: "P" estilizado + PostaFit completo ────────────────
$bmp2 = New-Object System.Drawing.Bitmap($size, $size)
$g2 = [System.Drawing.Graphics]::FromImage($bmp2)
$g2.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$g2.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

$grad2 = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
  (New-Object System.Drawing.Point(0, 0)),
  (New-Object System.Drawing.Point($size, 0)),
  $colors.darkB, $colors.darkM)
$g2.FillRectangle($grad2, 0, 0, $size, $size)

# Quadrado inferior direito decorativo
$brushAccent = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(30, 249, 115, 22))
$g2.FillRectangle($brushAccent, 310, 310, 180, 180)

# 3 círculos (carrossel)
$brushDots = New-Object System.Drawing.SolidBrush($colors.orange3)
$dotR = 22
for ($i = 0; $i -lt 3; $i++) {
  $g2.FillEllipse($brushDots, 376 - 60 + $i * 60, 368, $dotR, $dotR)
}

# Letra P grande
$fontP = New-Object System.Drawing.Font("Segoe UI Black", 280, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
$pSize = $g2.MeasureString("P", $fontP)
$g2.DrawString("P", $fontP, $brushWhite, ($size - $pSize.Width) / 2 - 10, ($size - $pSize.Height) / 2 - 10)

# Texto PostaFit
$fontTitle = New-Object System.Drawing.Font("Segoe UI Black", 38, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
$titleSize = $g2.MeasureString("POSTAFIT", $fontTitle)
$g2.DrawString("POSTAFIT", $fontTitle, $brushWhite, ($size - $titleSize.Width) / 2, 390)

$fontSub2 = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$sub2Size = $g2.MeasureString("GERADOR DE CARROSSEL", $fontSub2)
$g2.DrawString("GERADOR DE CARROSSEL", $fontSub2, (New-Object System.Drawing.SolidBrush($colors.gray)), ($size - $sub2Size.Width) / 2, 440)
$g2.Dispose()
$bmp2.Save("$outDir\logo_opcao2_512.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp2.Dispose()

# ─── Opção 3: "PF" Minimalista com gradiente diagonal ──────────
$bmp3 = New-Object System.Drawing.Bitmap($size, $size)
$g3 = [System.Drawing.Graphics]::FromImage($bmp3)
$g3.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$g3.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

# Fundo escuro com cantos arredondados
$grad3 = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
  (New-Object System.Drawing.Point(0, 0)),
  (New-Object System.Drawing.Point($size, $size)),
  $colors.darkB, $colors.darkM)
$g3.FillRectangle($grad3, 0, 0, $size, $size)

# Barra laranja superior
$brushBar = New-Object System.Drawing.SolidBrush($colors.orange1)
$g3.FillRectangle($brushBar, 0, 0, $size, 28)

# Círculo laranja no canto
$brushCircle2 = New-Object System.Drawing.SolidBrush($colors.orange1)
$g3.FillEllipse($brushCircle2, 30, 50, 120, 120)

# PF dentro do círculo
$fontPFsmall = New-Object System.Drawing.Font("Segoe UI Black", 52, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
$pfSize3 = $g3.MeasureString("PF", $fontPFsmall)
$g3.DrawString("PF", $fontPFsmall, $brushWhite, (30 + 120 - $pfSize3.Width) / 2, (50 + 120 - $pfSize3.Height) / 2)

# POSTAFIT grande central
$fontBig = New-Object System.Drawing.Font("Segoe UI Black", 72, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
$bigSize = $g3.MeasureString("POSTAFIT", $fontBig)
$g3.DrawString("POSTAFIT", $fontBig, $brushWhite, ($size - $bigSize.Width) / 2, 220)

# Subtitle
$fontSub3 = New-Object System.Drawing.Font("Segoe UI", 24, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$sub3Size = $g3.MeasureString("Gerador de Carrossel", $fontSub3)
$g3.DrawString("Gerador de Carrossel", $fontSub3, (New-Object System.Drawing.SolidBrush($colors.gray)), ($size - $sub3Size.Width) / 2, 300)

# Linha decorativa laranja
$g3.DrawLine((New-Object System.Drawing.Pen($colors.orange1, 4)), 100, 360, 412, 360)

# 3 bolinhas (carrossel) na base
$brushDot3 = New-Object System.Drawing.SolidBrush($colors.orange1)
$dotR3 = 12
for ($i = 0; $i -lt 3; $i++) {
  $g3.FillEllipse($brushDot3, ($size/2 - 60) + $i * 60, 420, $dotR3, $dotR3)
}

$fontFooter = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$footerSize = $g3.MeasureString("Osorio AI Labs", $fontFooter)
$g3.DrawString("Osorio AI Labs", $fontFooter, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(100, 148, 163, 184))), ($size - $footerSize.Width) / 2, 460)
$g3.Dispose()
$bmp3.Save("$outDir\logo_opcao3_512.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp3.Dispose()

Write-Output "3 logos gerados em: $outDir"
Get-ChildItem $outDir
