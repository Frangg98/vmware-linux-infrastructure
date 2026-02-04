
$ruta = "C:\Descargas"

if (-not (Test-Path $ruta)) {
    Write-Host "❌ La ruta especificada no existe: $ruta" -ForegroundColor Red
    exit
}

Set-Location $ruta

# ================================
# BUSCAR ARCHIVO MANIFEST
# ================================
$manifest = Get-ChildItem -Filter *.mf -ErrorAction SilentlyContinue

if (-not $manifest) {
    Write-Host "❌ No se encontró ningún archivo manifest (.mf) en la ruta." -ForegroundColor Red
    Write-Host "📁 Archivos detectados en la ruta:" -ForegroundColor Yellow
    Get-ChildItem | Select-Object Name
    exit
}

Write-Host "📄 Manifest encontrado: $($manifest.Name)" -ForegroundColor Cyan

# ================================
# LEER CONTENIDO DEL MANIFEST
# ================================
$lineas = Get-Content $manifest.FullName

# ================================
# DETECTAR ALGORITMO
# ================================
if ($lineas -match "^SHA256") {
    $algoritmo = "SHA256"
} elseif ($lineas -match "^SHA1") {
    $algoritmo = "SHA1"
} else {
    Write-Host "❌ No se pudo detectar el algoritmo (SHA1/SHA256)." -ForegroundColor Red
    exit
}

Write-Host "🔐 Algoritmo detectado: $algoritmo" -ForegroundColor Green

# ================================
# EXTRAER ARCHIVOS DEL MANIFEST
# ================================
$archivosManifest = @()

foreach ($linea in $lineas) {
    if ($linea -match "$algoritmo\((.+)\)=") {
        $archivosManifest += $matches[1]
    }
}

# ================================
# VALIDAR EXISTENCIA DE ARCHIVOS
# ================================
$faltantes = @()

foreach ($archivo in $archivosManifest) {
    if (-not (Test-Path $archivo)) {
        $faltantes += $archivo
    }
}

if ($faltantes.Count -gt 0) {
    Write-Host "❌ Faltan los siguientes archivos listados en el manifest:" -ForegroundColor Red
    $faltantes | ForEach-Object { Write-Host "   - $_" }
    exit
}

Write-Host "📦 Todos los archivos del manifest existen." -ForegroundColor Green

# ================================
# VALIDAR HASHES
# ================================
$errores = 0

foreach ($linea in $lineas) {
    if ($linea -match "$algoritmo\((.+)\)=\s*(.+)") {
        $archivo = $matches[1]
        $hashManifest = $matches[2].ToUpper()

        Write-Host "🔍 Validando $archivo ..." -ForegroundColor Cyan

        $hashCalculado = (Get-FileHash $archivo -Algorithm $algoritmo).Hash

        if ($hashManifest -eq $hashCalculado) {
            Write-Host "   ✔ OK" -ForegroundColor Green
        } else {
            Write-Host "   ❌ ERROR - Hash no coincide" -ForegroundColor Red
            $errores++
        }
    }
}

# ================================
# RESULTADO FINAL
# ================================
if ($errores -eq 0) {
    Write-Host "`n✅ VALIDACIÓN COMPLETA: Todos los archivos coinciden con el manifest." -ForegroundColor Green
} else {
    Write-Host "`n❌ VALIDACIÓN FALLIDA: Se encontraron $errores errores de integridad." -ForegroundColor Red
}
