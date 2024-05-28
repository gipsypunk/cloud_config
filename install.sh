#! /bin/bash

sudo cp -r /home/user/vms/images/debian-12.qcow2 ./

VM_NAME="bookworm"


DESIRED_SIZE=8G

sudo qemu-img resize \
  debian-12.qcow2 \
  $DESIRED_SIZE


sudo cloud-localds /home/user/vms/cloud-init.iso /home/user/vms/cloud_config/cloud-config.yaml


sudo virt-install \
  --name $VM_NAME \
  --memory 1024 \
  --disk /home/user/vms/debian-12.qcow2,device=disk,bus=virtio \
  --disk /home/user/vms/cloud-init.iso,device=cdrom \
  --os-variant debian12 \
  --virt-type kvm \
  --graphics none \
  --network network=default,model=virtio \
  --import



