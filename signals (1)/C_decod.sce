global Kol_DvoichKOD Decods
//Выводим Задекодированный сигнал после демодуляции
for i = 1:Kol_DvoichKOD
    mprintf('%d) %s\n',i,Decods(i))
end
