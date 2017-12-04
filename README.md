# freeipa-planet
Sources for **planet.freeipa.org**

## Setting up regular planet rebuild
```
$ oc run freeipa-org-planet-rebuild --image=python --schedule='0 6 * * *' --restart=Never --labels parent="freeipa-org-planet-rebuild-job" --command -- curl -X POST -k GENERIC_TRIGGER_URL
```

## Local Testing
```
$ sudo s2i build -c . rhscl/php-70-rhel7 freeipa-org-planet
```
and then
```
$ sudo docker run -p 8080:8080 freeipa-org-planet
```
if you want to test what was built in your browser, or
```
$ sudo docker run -it --rm freeipa-org-planet /bin/bash
```
if you just want to debug what was built.
