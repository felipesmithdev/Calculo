import psutil
import time


while True:

    time.sleep(5)
    cpu = psutil.cpu_times()
    print(cpu)

    print(psutil.cpu_percent(interval= 1, percpu= True))

    print(psutil.cpu_count())
    print(psutil.cpu_count(logical=False))

    print(psutil.cpu_freq())
    print(psutil.cpu_freq())
    print(psutil.cpu_freq(percpu=True))


    #print(psutil.disk_partitions())
    #print(psutil.disk_partitions('/dev/'))
    #print(psutil.disk_partitions(all=False))
    print(psutil.virtual_memory())

    print()


