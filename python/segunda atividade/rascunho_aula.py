import psutil
import time
while True:
    time.sleep(5)
    cpu = psutil.cpu_times()
    print(
    " user: {:.2f}\n".format(cpu.user),
    "nice: {:.2f}\n".format(cpu.nice),
    "system: {:.2f}\n".format(cpu.system),
    "idle: {:.2f}\n".format(cpu.idle),
    "iowait: {:.2f}\n".format(cpu.iowait),
    "irq: {:.2f}\n".format(cpu.irq),
    "softirq: {:.2f}\n".format(cpu.softirq),
    "steal: {:.2f}\n".format(cpu.steal),
    "guest: {:.2f}\n".format(cpu.guest),
    "guest_nice: {:.2f}\n".format(cpu.guest_nice)

)