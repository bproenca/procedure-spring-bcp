# Desc

Example of how to call database Procedure in a Multi-Tenant env.  
You can use parameters to control how much time the procedure will take to execute.

## Example

See file `run.sh`:  

```sh
# Using https://httpie.io/ 
http POST localhost:8080/truncate/tenant/dbone
http POST localhost:8080/truncate/tenant/dbtwo

http POST localhost:8080/procedure tenant=dbone procedure=proc_aa loops=10 sleep=5 msg=A1
http POST localhost:8080/procedure tenant=dbtwo procedure=proc_bb loops=10 sleep=5 msg=B1
```
