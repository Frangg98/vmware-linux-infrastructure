# Scripts de Automatización – VMware & Linux

Colección de scripts diseñados para automatizar tareas comunes en entornos VMware, Veeam y Linux.  
Este repositorio incluye herramientas reales utilizadas en producción, enfocadas en administración, backup, optimización y operaciones diarias.

---

## 📁 Scripts Disponibles

### 🔹 Ajuste Automático de Límites de CPU en VMware vCenter  
Script en PowerCLI que calcula los MHz reales de CPU basados en vCPUs × frecuencia del host ESXi.  
Ajusta automáticamente el *CPU Limit* de cada VM dentro del vCenter.

- 📄 **Script:**  
  [`Scripts/Ajuste_Limites_CPU_vCenter.ps1`](Scripts/Ajuste_Limites_CPU_vCenter.ps1)

- 📘 **Documentación:**  
  [`Scripts/Ajuste_Limites_CPU_vCenter.md`](Scripts/Ajuste_Limites_CPU_vCenter.md)

---

### 🔹 Validación de OVF's  
Script que permite validar archivo por archivo, a partir de su .mf, si los datos obtenidos no estan corruptos y fueron descargados correctamente.
A travez de manifest valida los archivos descargados y dependiendo de su SHA ejecuta comandos que permiten validar si los archivos no estan corruptos.

- 📄 **Script:**  
  [`Scripts/QuickBackup_VMs_From_TXT.ps1`](Scripts/QuickBackup_VMs_From_TXT.ps1)

- 📘 **Documentación:**  
  [`Scripts/QuickBackup_VMs_From_TXT.md`](Scripts/QuickBackup_VMs_From_TXT.md)

---

### 🔹 Quick Backup de VMs desde archivo .txt (Veeam Backup 12+)  
Script que permite ejecutar un **Quick Backup masivo**, leyendo un archivo .txt con una lista de VMs.  
Localiza las VMs en todos los vCenter registrados en Veeam y ejecuta Quick Backup utilizando el último restore point.

- 📄 **Script:**  
  [`Scripts/QuickBackup_VMs_From_TXT.ps1`](Scripts/QuickBackup_VMs_From_TXT.ps1)

- 📘 **Documentación:**  
  [`Scripts/QuickBackup_VMs_From_TXT.md`](Scripts/QuickBackup_VMs_From_TXT.md)

---


## 🧰 Lenguajes / Tecnologías Utilizadas

- **PowerShell** (PowerCLI, Veeam PowerShell Module)
- **Bash**
- Entornos **VMware vCenter / ESXi**
- **Veeam Backup & Replication 12+**

---

## 🎯 Objetivo del Repositorio
Centralizar scripts prácticos y funcionales utilizados en operaciones reales de infraestructura y automatización.

---

## 👨‍💻 Autor
Francisco González  
Ingeniero en Virtualizacion
