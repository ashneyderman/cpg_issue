# cpg_issue

to run this project -

make run

These beahve as expected -
```
(experiments@127.0.0.1)3> whereis(zippo1).            
<0.98.0>
(experiments@127.0.0.1)4> exit(whereis(zippo1), kill).
true
(experiments@127.0.0.1)5> whereis(zippo1).            
<0.102.0>
(experiments@127.0.0.1)6> whereis(zippo2).            
<0.53.0>
(experiments@127.0.0.1)7> exit(whereis(zippo2), kill).
true
(experiments@127.0.0.1)8> whereis(zippo2).            
<0.107.0>

(experiments@127.0.0.1)9> cpg:get_members(test_scope, "zippo").
{ok,"zippo",[<0.54.0>,<0.55.0>]}
(experiments@127.0.0.1)10> exit(pid(0,55,0), kill).             
true
(experiments@127.0.0.1)11> cpg:get_members(test_scope, "zippo").
{ok,"zippo",[<0.54.0>,<0.112.0>]}
(experiments@127.0.0.1)12> exit(pid(0,112,0), kill).            
true
(experiments@127.0.0.1)13> cpg:get_members(test_scope, "zippo").
{ok,"zippo",[<0.54.0>,<0.116.0>]}
(experiments@127.0.0.1)14> exit(pid(0,54,0), kill).             
true
(experiments@127.0.0.1)15> 
=INFO REPORT==== 7-Nov-2015::19:01:17 ===
    application: experiments
    exited: shutdown
    type: permanent
Child (unknown) crashed exiting:  <0.74.0> shutdown
(experiments@127.0.0.1)15> {"Kernel pid terminated",application_controller,"{application_terminated,experiments,shutdown}"}

Crash dump is being written to: erl_crash.dump...done
Kernel pid terminated (application_controller) ({application_terminated,experiments,shutdown})
make: *** [run] Error 1
```
