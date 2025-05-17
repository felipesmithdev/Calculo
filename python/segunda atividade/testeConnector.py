import psutil
import time
 
time.sleep(5)
porcentual_cpu = psutil.cpu_percent(interval=1)
memoria_massa = psutil.swap_memory()
percentual_memoria = memoria_massa.percent

temp = psutil.cpu_stats()
print("cpu porcent",temp)



