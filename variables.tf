variable "cluster_name" {
  description = "The name of the Kubernetes cluster to create."
  type        = string
}

variable "k3os_version" {
  description = "The k3os version to use."
  type        = string
  default     = "v0.11.1"
}

variable "worker_count" {
  description = "Number of workers to deploy"
  type        = number
  default     = 2
}

variable "wait_for_cluster_cmd" {
  description = "Custom local-exec command to execute for determining if the eks cluster is healthy. Cluster endpoint will be available as an environment variable called ENDPOINT"
  type        = string
  default     = "for i in `seq 1 60`; do if `command -v wget > /dev/null`; then wget --no-check-certificate -O - -q $ENDPOINT/ping >/dev/null && exit 0 || true; else curl -k -s $ENDPOINT/ping >/dev/null && exit 0 || true;fi; sleep 5; done; echo TIMEOUT && exit 1"
}

variable "wait_for_cluster_interpreter" {
  description = "Custom local-exec command line interpreter for the command to determining if the eks cluster is healthy."
  type        = list(string)
  default     = ["/bin/sh", "-c"]
}

variable "master_vcpu" {
  description = "The amount of virtual CPUs to allocate for masters."
  type        = number
  default     = 1
}

variable "master_memory" {
  description = "The amount of memory in MiB to allocate for masters."
  type        = number
  default     = 1024
}

variable "worker_vcpu" {
  description = "The amount of virtual CPUs to allocate for workers."
  type        = number
  default     = 1
}

variable "worker_memory" {
  description = "The amount of memory in MiB to allocate for workers."
  type        = number
  default     = 1024
}
