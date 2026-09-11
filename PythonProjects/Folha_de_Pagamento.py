import time

#Vale Transporte
def VTCalc(salario):
  valorVT = 44 * 6

  totalVT = salario * 0.06

  if valorVT > totalVT:
    valorVT = totalVT

  return valorVT;

#Plano de saúde
def planoSaude(dependentes):
  valorPlano = 0
  opt = ""

  while True:
    opt = input("Digite 1 para escolher a opção Enfermaria (89.90$) ou 2 para escolher a opção Quarto (119.90$): ")

    if opt == "1":
      valorPlano = 89.90 * (dependentes + 1)
      break

    elif opt == "2":
      valorPlano = 119.90 * (dependentes + 1)
      break

    else:
      print("Opção Invalida")

  return valorPlano

# FGTS
def FGTS(salario, gratificacao):

  valorFGTS = (salario + gratificacao) * 0.08
  return valorFGTS

# Salario Familia
def familia(salario, dependentesMenor14):
  valorFamilia = 0

  if salario < 1819.27:
    valorFamilia = 62.04 * dependentesMenor14
    return valorFamilia

  else:
    return 0

#INSS
def inss(salario, gratificacao):
  inss = 0

  if salario + gratificacao < 1411.99:
    inss = (salario + gratificacao) * 0.075
    return inss;

  elif salario + gratificacao < 2666.99:
    inss = (salario + gratificacao) * 0.09
    return inss;
  elif salario + gratificacao < 4000.04:
    inss = (salario + gratificacao) * 0.12
    return inss;
  elif salario + gratificacao < 7786.03:
    inss = (salario + gratificacao) * 0.14
    return inss;
  else:
    inss = 7786.02 * 0.14
    return inss;

#IR
def ir(salario, gratificacao, INSS, dependentes):
  ir = 0

  deduc_dependente = dependentes * 189.59

  base_calc = (salario + gratificacao) - INSS - deduc_dependente
  if base_calc < 2259.21 :
    ir = 0
    return ir;
  elif base_calc < 2826.66 :
    ir = (base_calc * 0.075) - 169.44
    return ir;
  elif base_calc < 3751.06 :
    ir = (base_calc * 0.15) - 381.44
    return ir;
  elif base_calc < 4664.68 :
    ir = (base_calc * 0.225) - 662.77
    return ir;
  else:
    ir = (base_calc * 0.275) - 896.00
    return ir;

#Salario Líquido
def salario_Liquido(salario, gratificacao, INSS, VT, Plano_saude, salario_familia, IR):
  salario_Liquido = salario + gratificacao - INSS - VT - Plano_saude + salario_familia - IR
  return salario_Liquido;

#variaveis
while True:
  dependentes = int(input("Qual a quantidade de dependentes: "))
  if dependentes < 0:
    print("isso não faz sentido")
  elif dependentes > 0:
    while True:
      dependentes14 = int(input("quantos desses são menores de 14? "))
      if dependentes14 > dependentes:
        print("isso não faz sentido")
      else:
        break
  else:
    dependentes14 = 0
    break
  if dependentes > -1 and dependentes14 > -1:
    break

while True:
  salario_B = float(input("Qual o salário bruto: "))
  if salario_B < 0:
    print("isso não faz sentido")
  else:
    break

salario_extra = float(input("Qual o valor da gratificação (insira 0 caso não se aplique)"))

#utilização Vale Transporte
while True:
  ValeT = (input("vai ser utilizado VT? (S ou N)"))
  if ValeT.lower() == "s":
    ValeT = VTCalc(salario_B)
    break

  elif ValeT.lower() == "n":
    ValeT = 0
    break

  else:
    print("isso não é uma opção!")
    time.sleep(1.5)

#utilização Plano de saude
while True:
  PlanoS = str(input("vai ser utilizado Plano de saúde? (S ou N)"))
  if PlanoS.lower() == "s":
    PlanoS = planoSaude(dependentes)
    print(PlanoS)
    break

  elif PlanoS.lower() == "n":
    PlanoS = 0
    break
  else:
    print("isso não é uma opção!")
    time.sleep(1.5)

#Interface
saida = False
while saida == False:
  menu = '''
funções gerais do sistema:
1. Cálculo Vale Transporte
2. Cálculo Plano de saúde
3. Cálculo FGTS
4. Cálculo INSS
5. Cálculo salário família
6. Cálculo imposto de renda
7. Salário Líquido
8. Sair
'''
#Menu de escolhas
  time.sleep(1)
  print(menu)
  time.sleep(1.5)
  func_escolhida = int(input("Qual função você quer escolher? "))
  match func_escolhida:
    case 1 :
      print(f"O valor do vale transporte é: {ValeT:.2f}")
      time.sleep(1.5)
      print()
      print("voltando ao menu")
      print()


    case 2 :
      print(f"O valor do plano de saúde é: {PlanoS:.2f}")
      time.sleep(1.5)
      print()
      print("voltando ao menu")
      print()


    case 3 :
      print(f"o valor do FGTS é: {FGTS(salario_B, salario_extra):.2f}")
      time.sleep(1.5)
      print()
      print("voltando ao menu")
      print()


    case 4 :
      print(f"o valor do INSS é: {inss(salario_B, salario_extra):.2f}")
      time.sleep(1.5)
      print()
      print("voltando ao menu")
      print()


    case 5 :
      print(f"o bônus do salário família: {familia(salario_B, dependentes14):.2f}")
      time.sleep(1.5)
      print()
      print("voltando ao menu")
      print()


    case 6 :
      print(f"o valor do imposto de renda é: {ir(salario_B, salario_extra, inss(salario_B, salario_extra), dependentes):.2f}")
      time.sleep(1.5)
      print()
      print("voltando ao menu")
      print()


    case 7 :
      print(f"o salário líquido é: {(salario_Liquido(salario_B, salario_extra, inss(salario_B, salario_extra), VTCalc(salario_B), PlanoS, familia(salario_B, dependentes14), ir(salario_B, salario_extra, inss(salario_B, salario_extra), dependentes))):.2f}")
      time.sleep(1.5)
      print()
      print("voltando ao menu")
      print()

    case 8 :
      saida = True