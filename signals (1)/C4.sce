global Signal DvoichKOD Tm

T = 1:Tm;
N = length(T);

for i=1:N
    Zakod(i) = -99;
end

flag = 1;
z = 0;

for i=1:N
    Signal(i) = round(Signal(i) * 1000) / 1000;                   //с помощью этого цикла мы округлили значения сигнала до тысячных, чтобы удобней было работать с ним
end
// Цикл для кодирования сигнала
for i=1:N                                                       //с помощью этого двойного цикла мы отсчёты распределяем по уровню их кодирования 
    for j=1:N
        if Signal(i) == Zakod(j) then
            DvoichKOD(i) = DvoichKOD(j);
            flag = -1;
            break
        end
    end
    if flag ~= -1 then
        DvoichKOD(i) = dec2bin(z,4);
        Zakod(i) = Signal(i);  
        z = z + 1;
    else
        flag = 1;
    end
end
// Вывод закодированой комбинации
for i=1:N
    mprintf('%d) %f - %s\n',i,Signal(i),DvoichKOD(i));                 //с помощью этого цикла мы выводим в консоль работу предыдущего цикла, чтобы убедиться в правильности его работы
end
