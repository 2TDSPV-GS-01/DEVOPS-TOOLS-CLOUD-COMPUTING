az group create --name rg-FonteViva --location brazilsouth --tags environment-FonteViva

# Usuario e senha ilustrativos
az vm create \
    --name vm-lnx-FonteViva \
    --resource-group rg-FonteViva \
    --accelerated-networking false \
    --accept-term \
    --additional-events false \
    --admin-password Senha@Senha \
    --admin-username user \
    --authentication-type password \
    --computer-name FonteViva-01 \
    --enable-agent true \
    --enable-auto-update true \
    --enable-hibernation false \
    --enable-redeploy true \
    --image almalinux:almalinux-x86_64:9-gen2:latest \
    --location brazilsouth \
    --nic-delete-option Delete \
    --nsg-rule SSH \
    --os-disk-delete-option Delete \
    --os-disk-name FonteViva-disk \
    --patch-mode ImageDefault \
    --priority Spot \
    --size Standard_B2als_v2 \
    --tags environment-FonteViva \
    --ultra-ssd-enabled false \
    --zone 1

az vm open-port --port 80 -g rg-FonteViva \
    -n vm-lnx-FonteViva --priority 1100

az vm open-port --port 1521 -g rg-FonteViva \
    -n vm-lnx-FonteViva --priority 1200

az vm open-port --port 8080 -g rg-FonteViva \
    -n vm-lnx-FonteViva --priority 1300

# desligar de forma automatica a VM
az vm auto-shutdown -g rg-FonteViva -n vm-lnx-FonteViva --time 2359 --email "email@gmail.com"

