Add-Type -AssemblyName System.Drawing

$outDir = "C:\Users\fabia\OneDrive\Documentos\Projetos Antigravity\PostaFit\logotipos"
$size = 192

foreach ($orig in @("logo_opcao1_512.png", "logo_opcao2_512.png", "logo_opcao3_512.png")) {
  $img = [System.Drawing.Image]::FromFile("$outDir\$orig")
  $bmp = New-Object System.Drawing.Bitmap($size, $size)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $g.DrawImage($img, 0, 0, $size, $size)
  $g.Dispose()
  $dest = $orig.Replace("_512.png", "_192.png")
  $bmp.Save("$outDir\$dest", [System.Drawing.Imaging.ImageFormat]::Png)
  $bmp.Dispose()
  $img.Dispose()
}

# Create HTML preview
$html = @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Prévia das Logos - PostaFit</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: 'Segoe UI', sans-serif; background: #0f172a; color: #fff; padding: 40px; }
    h1 { text-align: center; font-size: 28px; margin-bottom: 8px; }
    p { text-align: center; color: #94a3b8; margin-bottom: 40px; }
    .grid { display: flex; gap: 40px; justify-content: center; flex-wrap: wrap; }
    .card { background: #1e293b; border-radius: 24px; padding: 24px; text-align: center; width: 300px; border: 1px solid #334155; }
    .card h2 { font-size: 16px; margin: 16px 0 8px; color: #f97316; }
    .card p { font-size: 13px; color: #94a3b8; margin-bottom: 12px; }
    .card img { width: 100%; border-radius: 16px; background: #020617; }
    .tag { display: inline-block; padding: 4px 12px; border-radius: 20px; font-size: 11px; font-weight: bold; margin-top: 8px; }
    .tag1 { background: rgba(249,115,22,0.2); color: #fb923c; }
    .tag2 { background: rgba(59,130,246,0.2); color: #60a5fa; }
    .tag3 { background: rgba(168,85,247,0.2); color: #c084fc; }
  </style>
</head>
<body>
  <h1>🎨 Opções de Logo — PostaFit</h1>
  <p>Escolha uma e me diga qual prefere! Depois substituímos no app.</p>
  <div class="grid">
    <div class="card">
      <img src="logo_opcao1_512.png" alt="Opção 1">
      <h2>Opção 1 — PF Bold</h2>
      <p>Ícone "PF" em círculo laranja com gradiente. Moderno, direto, perfeito para ícone de app.</p>
      <span class="tag tag1">🔶 Destaque laranja</span>
    </div>
    <div class="card">
      <img src="logo_opcao2_512.png" alt="Opção 2">
      <h2>Opção 2 — P + Carrossel</h2>
      <p>Letra "P" estilizada com 3 bolinhas (carrossel). Fundo escuro, ideal para dark mode.</p>
      <span class="tag tag2">🔵 Minimalista escuro</span>
    </div>
    <div class="card">
      <img src="logo_opcao3_512.png" alt="Opção 3">
      <h2>Opção 3 — PostaFit Completo</h2>
      <p>Nome completo com barra laranja, subtítulo e bolinhas decorativas. Mais institucional.</p>
      <span class="tag tag3">🟣 Completo</span>
    </div>
  </div>
</body>
</html>
"@

Set-Content -Path "$outDir\preview.html" -Value $html -Encoding UTF8
Write-Output "Preview HTML criada: $outDir\preview.html"
