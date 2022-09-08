import os

clear = lambda: os.system('cls')

file = open("data.txt", "w+")

napok = ["Hétfő", "Kedd", "Szerda", "Csütörtök", "Péntek"]

for i in range(5):
    print(napok[i])
    db = int(input("Hány óra: "))
    for j in range(db):
        print(f'{j+1}. óra')
        file.write(f'{db}\n')
        #óra
        file.write(f'{input("Óra neve: ")};')
        #típus
        file.write(f'{input("Óra típusa: ")};')
        #hely
        file.write(f'{input("Óra helye: ")};')
        #start
        file.write(f'{input("Óra kezdete: (ó;p) ")};')
        #end
        file.write(f'{input("Óra vége: (ó;p) ")};')
        #páros-páratlan hét
        file.write(f'{input("Melyik héten: (0 - minden, 1 - páratlan, 2 - páros) ")};')
        clear()



file.close()
print("### Kész ###")
input()
