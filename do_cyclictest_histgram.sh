#!/bin/bash

OPTIONS=""

## cyclictest V 1.90
## Usage:
## cyclictest <options>
## 
## -a [CPUSET] --affinity     Run thread #N on processor #N, if possible, or if CPUSET
##                            given, pin threads to that set of processors in round-
##                            robin order.  E.g. -a 2 pins all threads to CPU 2,
##                            but -a 3-5,0 -t 5 will run the first and fifth
##                            threads on CPU (0),thread #2 on CPU 3, thread #3
##                            on CPU 4, and thread #5 on CPU 5.
## -A USEC  --aligned=USEC    align thread wakeups to a specific offset
## -b USEC  --breaktrace=USEC send break trace command when latency > USEC
## -c CLOCK --clock=CLOCK     select clock
##                            0 = CLOCK_MONOTONIC (default)
##                            1 = CLOCK_REALTIME
OPTIONS+=" --clock=1"
## -d DIST  --distance=DIST   distance of thread intervals in us, default=500
## -D       --duration=TIME   specify a length for the test run.
##                            Append 'm', 'h', or 'd' to specify minutes, hours or days.
OPTIONS+=" --duration=10s"
## 	 --latency=PM_QOS  write PM_QOS to /dev/cpu_dma_latency
## -F       --fifo=<path>     create a named pipe at path and write stats to it
## -h       --histogram=US    dump a latency histogram to stdout after the run
##                            US is the max latency time to be be tracked in microseconds
## 			   This option runs all threads at the same priority.
OPTIONS+=" --histogram=1000"
## -H       --histofall=US    same as -h except with an additional summary column
## 	 --histfile=<path> dump the latency histogram to <path> instead of stdout
## -i INTV  --interval=INTV   base interval of thread in us default=1000
OPTIONS+=" --interval=1000"
## -l LOOPS --loops=LOOPS     number of loops: default=0(endless)
## 	 --laptop	   Save battery when running cyclictest
## 			   This will give you poorer realtime results
## 			   but will not drain your battery so quickly
## -m       --mlockall        lock current and future memory allocations
OPTIONS+=" --mlockall"
## -M       --refresh_on_max  delay updating the screen until a new max
## 			   latency is hit. Useful for low bandwidth.
## -N       --nsecs           print results in ns instead of us (default us)
## -o RED   --oscope=RED      oscilloscope mode, reduce verbose output by RED
## -p PRIO  --priority=PRIO   priority of highest prio thread
OPTIONS+=" --priority=80"
## 	 --policy=NAME     policy of measurement thread, where NAME may be one
##                            of: other, normal, batch, idle, fifo or rr.
## 	 --priospread      spread priority levels starting at specified value
## -q       --quiet           print a summary only on exit
OPTIONS+=" --quiet"
## -r       --relative        use relative timer instead of absolute
OPTIONS+=" --relative"
## -R       --resolution      check clock resolution, calling clock_gettime() many
##                            times.  List of clock_gettime() values will be
##                            reported with -X
##          --secaligned [USEC] align thread wakeups to the next full second
##                            and apply the optional offset
## -s       --system          use sys_nanosleep and sys_setitimer
## -S       --smp             Standard SMP testing: options -a -t and same priority
##                            of all threads
OPTIONS+=" --snapshot 10"
OPTIONS+=" --smp"
## 	--spike=<trigger>  record all spikes > trigger
## 	--spike-nodes=[num of nodes]
## 			   These are the maximum number of spikes we can record.
## 			   The default is 1024 if not specified
##          --smi             Enable SMI counting
## -t       --threads         one thread per available processor
## -t [NUM] --threads=NUM     number of threads:
##                            without NUM, threads = max_cpus
##                            without -t default = 1
##          --tracemark       write a trace mark when -b latency is exceeded
OPTIONS+=" --tracemark"
## -u       --unbuffered      force unbuffered output for live processing
## -v       --verbose         output values on stdout for statistics
##                            format: n:c:v n=tasknum c=count v=value in us
## 	 --dbg_cyclictest  print info useful for debugging cyclictest
## -x	 --posix_timers    use POSIX timers instead of clock_nanosleep.

echo ./cyclictest ${OPTIONS}
sudo ./cyclictest ${OPTIONS} | grep -v "000000	000000	000000	000000	000000	000000	000000	000000"
