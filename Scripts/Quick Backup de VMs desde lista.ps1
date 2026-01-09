# Ruta del archivo con la lista de VMs
$archivoVMs = "C:\Ruta\lista_vms.txt"

# Validar existencia del archivo
if (-not (Test-Path $archivoVMs)) {
    Write-Host "El archivo no existe: $archivoVMs"
    exit
}

# Leer lista de VMs
$VMsNombres = Get-Content -Path $archivoVMs
Write-Host "Cantidad de VMs a procesar: $($VMsNombres.Count)"
Write-Host " "

# Obtener TODOS los vCenter registrados en Veeam
$vCenters = Get-VBRServer -Type VC

# Lista final de VMs encontradas
$VMs = @()

foreach ($VM in $VMsNombres) {
    Write-Host "Buscando la VM: $VM"
    $VMEntity = $null

    foreach ($vCenter in $vCenters) {
        Write-Host "  → Buscando en: $($vCenter.Name)"
        try {
            $VMEntity = Find-VBRViEntity -Server $vCenter -Name $VM
            if ($VMEntity) {
                Write-Host "    ✔ VM encontrada en $($vCenter.Name)"
                $VMs += $VMEntity
                break
            }
        } catch {
            Write-Host "    ✖ Error en $($vCenter.Name): $_"
        }
    }

    if (-not $VMEntity) {
        Write-Host "    ✖ VM NO encontrada: $VM"
    }

    Write-Host " "
}

Write-Host "Listado final de VMs para Quick Backup:"
$VMs | ForEach-Object { Write-Host $_.Name }

Read-Host "Presiona Enter para iniciar el Quick Backup"

# Ejecutar Quick Backup
Start-VBRQuickBackup -VM $VMs

Read-Host "Proceso finalizado. Presiona Enter para salir"
