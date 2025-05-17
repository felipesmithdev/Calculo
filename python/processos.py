import psutil

for processos in psutil.process_iter(['name']):
    if 'python' in processos.name().lower():
        print('Processo encontrado:',processos.name())

        