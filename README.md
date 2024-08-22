# freeipa-planet
Sources for **planet.freeipa.org**

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
