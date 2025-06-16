# Proxmox provider
variable "pm_api_url" {
  description = "URL dell'API Proxmox"
  type        = string
}

variable "pm_user" {
  description = "Utente Proxmox (es. root@pam)"
  type        = string
}

variable "pm_password" {
  description = "Password Proxmox"
  type        = string
  sensitive   = true
}

variable "pm_tls_insecure" {
  description = "Ignora certificato TLS non valido"
  type        = bool
  default     = true
}

# VM configuration
variable "vm_count" {
  description = "Numero di VM da creare"
  type        = number
  default     = 3
}

variable "vm_base_name" {
  description = "Nome base per le VM"
  type        = string
  default     = "swarm-node"
}

variable "vm_template" {
  description = "Template Proxmox da clonare"
  type        = string
}

variable "vm_node" {
  description = "Nodo Proxmox di destinazione"
  type        = string
}

variable "vm_storage" {
  description = "Storage Proxmox da usare"
  type        = string
}

variable "vm_bridge" {
  description = "Bridge di rete"
  type        = string
  default     = "vmbr0"
}

variable "vm_disk_size" {
  description = "Dimensione disco (es. 20G)"
  type        = string
  default     = "20G"
}

variable "vm_cores" {
  description = "Numero di vCPU"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "RAM in MB"
  type        = number
  default     = 2048
}

# Cloud-init
variable "ci_user" {
  description = "Utente cloud-init"
  type        = string
  default     = "ubuntu"
}

variable "ci_password" {
  description = "Password cloud-init"
  type        = string
  sensitive   = true
}

variable "ssh_public_key_path" {
  description = "Percorso chiave pubblica SSH"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
