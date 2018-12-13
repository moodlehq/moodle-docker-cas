#!/bin/bash

ln -s /usr/bin/whereis /usr/bin/which

#keytool -genkeypair -alias cas -keyalg RSA -keypass changeit -storepass changeit -keystore /etc/cas/thekeystore -dname "CN=localhost,OU=Moodle,OU=Ore,C=AU" -ext SAN="ip:127.0.0.1"

/bin/bash /cas-overlay/build.sh gencert
/bin/bash /cas-overlay/bin/run-cas.sh
