# NixOSConfiguration


## Types of systems

#### Orchestrator

The orchestrator is responsible for managing the NixOS configurations of the systems in the k3s cluster.

#### Control Plane

The control plane is responsible for managing the kubernetes cluster and it's worker nodes

#### Worker



## Hosts

#### orchestrator-hv



#### controlplane-hv

#### orchestrator-rp5

#### controlplane-rp5

#### worker1-rp5

#### worker2-rp5

Before anything: 
export NIX_CONFIG="experimental-features = nix-command flakes"

#### Building the Installer ISO

```bash
# From the root project directory
$(export NIX_CONFIG="experimental-features = nix-command flakes" && mkdir -p ./dist && cd ./installer && nix build .#installer && sudo mv ./result/iso/*.iso ../dist);
```

#### Buidling the Orchestrator

nix run github:nix-community/nixos-anywhere -- --build-on-remote --flake .#orchestrator installer@192.168.0.54

Mount the NFS:
mount -o anon \\192.168.0.165/export/kubernetes N:

Rotate K3S certs:
sudo systemctl stop k3s
k3s certificate rotate
sudo systemctl start k3s

Get ArgoCD admin password:
kubectl get secret argocd-initial-admin-secret --namespace system-argocd -o jsonpath={.data.password} | base64 -d

#### Building a Control Plane

#### Building a Worker Node