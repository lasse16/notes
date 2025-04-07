---
date: 2025-04-03
categories: [ kubernetes talos-os ]
---

# Talos OS

Operating system with declarative config file for running Kubernetes only ( no ssh, no nothing, only K8s)

- Talos OS config can be generated on Masternode with the `talosctl`.
- Single node clusters need to allow job scheduling on  controlplane node with 
```yaml
cluster:
  allowSchedulingOnControlPlanes: true
```

## My journey with Talos OS

1. Installed on USB instead of disk (nuking Ventoy, but setup static IP address already)
1. Wiped everything
1. Setup Bios Password so I could enable SecureBoot with Admin login (with CAPSLOCK on -_-)
1. Created new install medium with Ventoy and GParted
1. Failed to setup SecureBoot (After setting up live usb with image from TalosOS factory, no clue why it failed -_-)
1. Wasnt able to open BIOS again due to SecureBoot policy violation ( managed to get it when booting into live usb and then access firmware from Grub Bootloader)
1. Recreate live usb with "normal" ISO image
1. Wipe entire disk again and install ISO ( with adjusted install disk )
1. Wait, while TalosOS creates itself (Following normal install guide, `bootstrap` etc.)
1. Switched from linked at my local access point to directly to the router, which somehow turned into the LAN port not working.
Lucky, there are two on the CHUWI LarkBox X, but switching ports meant a new Mac address/Host, IP address and so I had to delete the old static IP and assign the IP to the new host.
IP must be the same due to certificates signed during Talos setup.

PITA! but working now.



## References

- [Talos website](https://www.talos.dev) 
- [Youtube Video #1](https://www.youtube.com/watch?v=YdQCeU7NOak) 
- [Youtube Video #2 by Talos Publisher](https://www.youtube.com/watch?v=VKfE5BuqlSc) 
