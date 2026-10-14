# Builds PdfCraft Thai for Windows x64: the upstream craft-fonts revision plus TH Sarabun PSK
# (thai/fonts), statically linked like the official release. Needs Rust (rustup) and the
# Visual Studio Build Tools (C++ workload). Output: target\release\pdfcraft.exe and pdfcraft-cli.exe.
#
#   powershell -ExecutionPolicy Bypass -File thai\build-windows.ps1

$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
$CraftFontsRef = '3d9ab3a132ed0eff457e424226a435a901da30d3'
$Work = Join-Path $Root 'target\thai-fonts'
$Fonts = Join-Path $Work "craft-fonts-$CraftFontsRef"

if (-not (Test-Path (Join-Path $Fonts 'fonts\manifest.txt'))) {
    New-Item -ItemType Directory -Force -Path $Work | Out-Null
    $zip = Join-Path $Work 'craft-fonts.zip'
    Invoke-WebRequest "https://github.com/storytold/craft-fonts/archive/$CraftFontsRef.zip" -OutFile $zip -UseBasicParsing
    Expand-Archive $zip $Work -Force
}

# Add TH Sarabun PSK to the font set (once).
$manifest = Join-Path $Fonts 'fonts\manifest.txt'
Copy-Item -Recurse -Force (Join-Path $PSScriptRoot 'fonts\th-sarabun-psk') (Join-Path $Fonts 'fonts')
if (-not (Select-String -Path $manifest -Pattern '^TH Sarabun PSK' -Quiet)) {
    $add = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot 'fonts\manifest-additions.txt'))
    [System.IO.File]::AppendAllText($manifest, "`n" + $add.Trim() + "`n", (New-Object System.Text.UTF8Encoding $false))
}

$env:CRAFT_FONTS_DIR = $Fonts
$env:CRAFT_FONTS_REQUIRED = '1'
$env:CARGO_TARGET_X86_64_PC_WINDOWS_MSVC_RUSTFLAGS = '-C target-feature=+crt-static'
if (-not $env:PDFCRAFT_BUILD_SHA) { $env:PDFCRAFT_BUILD_SHA = (git -C $Root rev-parse HEAD) }
if (-not $env:PDFCRAFT_BUILD_DATE) { $env:PDFCRAFT_BUILD_DATE = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd') }

Push-Location $Root
try {
    cargo build --release --locked -p pdfcraft -p pdfcraft-cli
    if ($LASTEXITCODE -ne 0) { throw "cargo build failed ($LASTEXITCODE)" }
} finally {
    Pop-Location
}
Write-Output "Built: $(Join-Path $Root 'target\release')"
