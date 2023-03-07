#!/bin/bash

http POST localhost:8080/truncate/tenant/dbone
http POST localhost:8080/truncate/tenant/dbtwo

http POST localhost:8080/package/tenant/dbone/msg/1A/sleep/5
http POST localhost:8080/package/tenant/dbone/msg/1B/sleep/5
http POST localhost:8080/package/tenant/dbone/msg/1C/sleep/5
http POST localhost:8080/package/tenant/dbone/msg/1D/sleep/5
http POST localhost:8080/package/tenant/dbone/msg/1E/sleep/5
http POST localhost:8080/package/tenant/dbone/msg/1F/sleep/5

echo 'Fired'