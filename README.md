# Desc

Example of how to call database Procedure in a Multi-Tenant env.  
You can use parameters to control how much time the procedure will take to execute.

## Procedure

See file `run_procedure.sh`:  

```sh
# Using https://httpie.io/ 
http POST localhost:8080/truncate/tenant/dbone
http POST localhost:8080/truncate/tenant/dbtwo

http POST localhost:8080/procedure tenant=dbone procedure=proc_aa loops=10 sleep=5 msg=A1
http POST localhost:8080/procedure tenant=dbtwo procedure=proc_bb loops=10 sleep=5 msg=B1
```

## Package

Run `run_package.sh` output (see same session var):  

```
234	Thread: task-6 - DB Session:131	    After: 1F	07/03/2023 21:17:26
233	Thread: task-6 - DB Session:131	    Before: 1B	07/03/2023 21:17:26
232	Thread: task-5 - DB Session:1230	After: 1E	07/03/2023 21:17:25
231	Thread: task-5 - DB Session:1230	Before: 1A	07/03/2023 21:17:25
230	Thread: task-4 - DB Session:620	    After: 1D	07/03/2023 21:17:21
229	Thread: task-4 - DB Session:620	    Before: 	07/03/2023 21:17:21
228	Thread: task-3 - DB Session:497	    After: 1C	07/03/2023 21:17:21
227	Thread: task-3 - DB Session:497	    Before: 	07/03/2023 21:17:21
226	Thread: task-2 - DB Session:131	    After: 1B	07/03/2023 21:17:20
225	Thread: task-2 - DB Session:131	    Before: 	07/03/2023 21:17:20
224	Thread: task-1 - DB Session:1230	After: 1A	07/03/2023 21:17:20
223	Thread: task-1 - DB Session:1230	Before: 	07/03/2023 21:17:20
```
