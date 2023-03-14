#!/bin/bash

http POST localhost:8080/truncate/tenant/dbone
http POST localhost:8080/truncate/tenant/dbtwo

http POST localhost:8080/procedure tenant=dbone procedure=proc_aa loops=10 sleep=5 msg=A1
http POST localhost:8080/procedure tenant=dbone procedure=proc_bb loops=10 sleep=5 msg=A2
http POST localhost:8080/procedure tenant=dbone procedure=proc_cc loops=10 sleep=5 msg=A3
http POST localhost:8080/procedure tenant=dbone procedure=proc_dd loops=10 sleep=5 msg=A4

http POST localhost:8080/procedure tenant=dbtwo procedure=proc_aa loops=10 sleep=5 msg=B1
http POST localhost:8080/procedure tenant=dbtwo procedure=proc_bb loops=10 sleep=5 msg=B2
http POST localhost:8080/procedure tenant=dbtwo procedure=proc_cc loops=10 sleep=5 msg=B3
http POST localhost:8080/procedure tenant=dbtwo procedure=proc_dd loops=10 sleep=5 msg=B4

echo 'Fired'