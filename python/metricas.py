import mysql.connector
import psutil
import time
from mysql.connector import errorcode
from datetime import datetime


def executar():
    cursor = conexao.cursor()
    while True:

        temps = psutil.sensors_temperatures()
        time.sleep(10)
        hora_atual = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        cpuCore = ""
        if "coretemp" in temps:
            for entry in temps["coretemp"]:
                if entry.label.lower() == "package id 0":
                    if entry.current > 70:
                        print("A cpu está superaquecida! Entre com uma ação urgentemente!")
                    cpuCore = entry.current
                    break  
            else:
                print("package id 0 não encontrado.")
        else:
            print("sensor 'coretemp' não encontrado.")
        
        memoriaRamCaptura = psutil.virtual_memory()
        ramUtilizada = (memoriaRamCaptura.used / 1024 ** 3)
        ramTotal = (memoriaRamCaptura.total / 1024 ** 3)
        if ramUtilizada > ramTotal * 0.8:
            print("A memória RAM está ultrapassando 80% de uso, Entre com uma ação urgentemente!")

        discoCaptura = psutil.disk_usage("/")
        discoUtilizado = discoCaptura.used / (1024 ** 3)
        discoTotal = discoCaptura.total / (1024 ** 3)
        if discoUtilizado > discoTotal * 0.85:
            print("Memória de disco quase cheia! Esvazie imediatamente para manter o funcionamento do processo")

        print("disco utilizado: {:.1f}GB de um total de {:.1f}GB".format(discoUtilizado,discoTotal))
    
        print("memoria ram utilizada: {:.1f}GB de um total de {:.1f}GB".format(ramUtilizada, ramTotal))

        print("Temperatura atual da CPU (core principal): ", cpuCore, "%\n")

        #para a memoria ram
        sqlRam = "INSERT INTO ram (horaCaptura, emUso, qtdTotal) VALUES (%s, %s, %s);"
        valuesRam = (hora_atual, ramUtilizada, ramTotal)
        cursor.execute(sqlRam, valuesRam)
        conexao.commit()

        #para a memoria de disco
        sqlDisco = "INSERT INTO disco (horaCaptura, emUso, qtdTotal) VALUES (%s, %s, %s);"
        valuesDisco = (hora_atual, discoUtilizado, discoTotal)
        cursor.execute(sqlDisco, valuesDisco)
        conexao.commit()

        #para a temperatura da CPU
        sqlCpu = "INSERT INTO cpu (horaCaptura, temperatura) VALUES (%s, %s);"
        valuesCpu = (hora_atual, cpuCore)
        cursor.execute(sqlCpu, valuesCpu)
        conexao.commit()

#função para animar o texto do terminal, para garantir algo mais dinâmico ao usuário 
def animarTexto(texto, delay=0.1):
    for i in range(len(texto) + 1):
        print(texto[:i], end="\r")
        time.sleep(delay)
    print()

try:
    conexao = mysql.connector.connect(
        host='localhost',
        user='root',
        password='11092004eF.',
        database='python_connect'
    )
    introducao = "OLÁ! Bem vindo ao nosso sistema de monitoramento de componentes do hardware. Primeiramente, nos informe o seu nome!"
    animarTexto(introducao, delay=0.1)
    nome = input("Digite o seu nome: ")
    irParaOCodigo = "Muito bem " + nome + ", vamos prosseguir para o funcionamento das capturas!\n"
    animarTexto(irParaOCodigo, delay=0.1)
    executar()

except mysql.connector.Error as error:
    if error.errno == errorcode.ER_BAD_DB_ERROR:
        print("Banco de dados nao existe!")
    elif error.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Nome de usuario ou senha inválidos")
    else:
        print(error)
else:
    conexao.close


