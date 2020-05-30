# Home automation playbooks

Ansibile playbooks for provisioning raspberry pi instances.

Required packages:

- ansible
- sshpass

## Examples

Provision mysensors gateway:

```
ansible-playbook -i hosts sensorhub.yml
```
