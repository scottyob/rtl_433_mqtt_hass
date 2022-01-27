# rtl_433_mqtt_hass

Wanted to use https://github.com/jochocki/rtl2hass on a rPi, but didn't have an ARM version, so figured I'd just pull out the rtl_433_mqtt_hass script.

This just gives you the ability to run https://github.com/merbanan/rtl_433/blob/master/examples/rtl_433_mqtt_hass.py in docker

Pre-built docker image built at:  https://hub.docker.com/repository/docker/scottyob/rtl_433_mqtt_hass

Example deploying in Docker using my Ansible Config
```
- name: Start RTL-433
  docker_container:
    name: rtl433
    image: hertzg/rtl_433
    pull: true
    state: started
    restart_policy: unless-stopped
    command: "-F{{ mqtt_url }}"
    volumes:
      - "/etc/timezone:/etc/timezone:ro"
      - "/etc/localtime:/etc/localtime:ro"

    # Yeah yeah I'm lazy.
    # Don't screw with changing RTL433 USB devices ID changing
    privileged: true

- name: Start RTL-433 to HA proxy
  docker_container:
    name: rtl_433_mqtt_hass
    image: scottyob/rtl_433_mqtt_hass
    pull: true
    state: started
    restart_policy: unless-stopped
    command: "--host {{ mqtt_host }}"

```

