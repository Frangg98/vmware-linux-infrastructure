# ============================================================
# Script: Ajuste_Limites_CPU_vCenter.ps1
# Descripción:
# Ajusta el límite de CPU (MHz) de máquinas virtuales
# en función del número de vCPUs y la frecuencia del host ESXi.
#
# Autor: Francisco González
# ============================================================

# ---------------- CONFIGURACIÓN ----------------

# vCenter al que se conectará el script
$vCenterServer = "tu-vcenter"

# Frecuencia base de los ESXi (MHz)
$frecuenciaESXiMHz = 2500

# Archivo con la lista de VMs (una por línea)
$rutaArchivoVMs = "C:\Users\Administrador\Desktop\vmslimitecpu.txt"

# ------------------------------------------------

# Conexión al vCenter
Connect-VIServer -Server $vCenterServer -Force -Verbose

# Cargar lista de VMs
$vmsLimitadas = Get-Content $rutaArchivoVMs

foreach ($vmNombre in $vmsLimitadas) {

    # Obtener la VM
    $vm = Get-VM -Name $vmNombre -ErrorAction SilentlyContinue

    if ($vm) {

        # Número de vCPUs
        $cpuCount = $vm.NumCpu

        # Cálculo del límite de CPU
        $cpuLimitMHz = $cpuCount * $frecuenciaESXiMHz

        # Aplicar el límite
        Get-VMResourceConfiguration -VM $vm |
        Set-VMResourceConfiguration -CpuLimitMHz $cpuLimitMHz

        Write-Host "VM: $($vm.Name) | vCPUs: $cpuCount | Límite aplicado: $cpuLimitMHz MHz"

    } else {
        Write-Host "⚠️ VM no encontrada: $vmNombre"
    }
}

# Desconexión del vCenter
Disconnect-VIServer -Confirm:$false
