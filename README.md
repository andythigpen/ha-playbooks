# Home automation playbooks

Ansibile playbooks for provisioning raspberry pi instances.

Required packages:

- ansible
- sshpass

## Installing dependencies

```
ansible-galaxy install -r requirements.yml
```

## Examples

Update home-assistant:

```
ansible-playbook -i hosts -l homeassistant homeassistant.yml
```

Update only home-assistant (not system):

```
ansible-playbook -i hosts -l homeassistant -t hass homeassistant.yml
```

Provision mysensors gateway:

```
ansible-playbook -i hosts sensorhub.yml
```

Update server:

```
ansible-playbook -i hosts --ask-become-pass server.yml
```
