global DvoichKOD k Kol_DvoichKOD Decods

f100=figure()

tps=5;
choix=1
couleuraxes=38 // Меняет цвет разделяющей полосы QAM от Данных
xosin=0.25      // Задаётся рабочую 
yosin=-2.05    // область самого QAM
echsin=8        //  Длина графика снизу
ampsin=0.3       // Высота графика снизу
epsin=2  // ширина жёлтого Сигнала
ampsin=0.26
couleuraxesin=37 // Задаёт цвет Осям в правом нижнем углу
couleursin=7 // Задает цвет Кругу в QAM , Надписям под QAM 

t=[0:0.2:4*%pi];
couleurI=21 // меняет цвет символа I на оси X
couleurQ=29 // меняет цвет символа Q на оси Y

a=gca()
x=[-2:0.1:2];
plot2d(x,0*x-1.39)
a.children(1).children(1).foreground=couleuraxes                //1 горизонтальная линия разъединения
plot2d(x,0*x-1.42)
a.children(1).children(1).foreground=couleuraxes                //2 горизонтальная линия разъединения
a.auto_ticks = ["on","on","on"]
a.data_bounds=[-2,-2.5;2,1.5]

if choix==1  then
    ystr=[ 'Число состояний X=?       16  ';//16 TNT suisse   64 TNT france  256 TV cable
    'Сохранение символов                0  или 1';
    'Скорость работы                           [1   100]';];

    w = x_mdialog(_('...Выберите параметры модуляции X_QAM'),  ystr, ['16';'1';'1']);



    X=evstr(w(1))
    if X<>4 & X<>16 & X<>64  & X<>256  then
        clf
        xstring(0.01,0.5,"Тип модуляции! НЕ СОВМЕСТИМ")                         //Если выбрать число не равное 4|16|64|256 то выводит ошибку 
        a=gca()
        a.children(1).font_color=5
        a.children(1).font_size=6
        X=4
        sleep(2000)
    end

    persistance=evstr(w(2))                                                 //Ввод данных Сохранять предыдущие символы или нет

    vitesse=evstr(w(3))                                                     //Ввод данных Скорость передачи
    if vitesse<1 then
        vitesse=1
    end

    f=gcf() // получить дескриптор модели рисунок
    f.background=color(20,20,20)
    f.background=color(50,50,50)
    f.background=color(70,70,70)
    f.background=color(100,100,100)
    f.background=color(140,140,140)
    f.background=color(180,180,180)
    f.background=color(210,210,210)
    f.background=color(230,230,230)
    f.background=color(190,200,140)
    f.background=color(200,200,10)
    f.background=color(100,100,120)
    f.background=color(0,0,0);// задает цвета Осям в QAM, сетки, надписи "Шум" , "S/N"

    a = gca();
    a.grid = [35 35 35]; //цвет для 3 осей          (Цвет сетки)
    a.background=color(0,0,0);//цвет фона трека
    a = gca();
    a.auto_ticks = ["on","on","on"] // каждая ось с использованием вычислительного алгоритма
    a.data_bounds=[-2,-2.5;2,1.5] // граничные значения для координат x,y

    //НАЧИНАЕМ СТРОИТЬ QAM СЕТКУ

    //  предварительные расчеты                
    d=2/(sqrt(X)-1);//базовое расстояние между 2 символами модуляции на QAM созвездии

    b=sqrt(X); //число символов от -1 до 1 (ПО ОСИ Х)
    mark=tps ;//фиксированный размер
    //исходное положение
    if X==16 then
        origine=5/2
    end

    //расчет позиций созвездия QAM
    for I=1:b
        for Q =1:b 
            const(I,Q)=(I-origine)*d+(Q-origine)*d*%i
        end
    end

    for I=1:b
        for Q =1:b  
            plot2d(imag(const(I,Q)),real(const(I,Q)),-9);
            poly1= a.children(1).children(1)
            poly1.mark_foreground = 15;// 15 tour зеленый
            poly1.mark_background = -1;// -1 черный фон
            poly1.mark_size=mark+1

            if (X==16) then
                plot2d(imag(const(I,Q)),real(const(I,Q)),-9);//сгущение контура
                poly1= a.children(1).children(1)
                poly1.mark_foreground = 15;// 15 tour зеленый
                poly1.mark_background = -1;// -1 черный фон
                poly1.mark_size=mark
            end
        end
    end

    a = gca()
    a.background=-1
    if X == 16 then
        xarc(-1.05,1.05,2.1,2.1,0,64*360);//создаём окружность
        a.children(1).foreground=35
    end

if k == 0 then
    a.box="on";
    a.foreground=38
    a.x_location="origin"
    a.y_location="middle"
    a.box="on"
    a.foreground=38
    a.title.text=". Модуляция "+string(X)+" QAM  ."              // Создаем надписи Модуляция 16 QAM по середине графика
    a.title.font_size=6
    a.title.fill_mode="on"
    a.title.background=color(180,180,200)
else
    a.title.text=". Демодуляция "+string(X)+" QAM  ."              // Создаем надписи Модуляция 16 QAM по середине графика
    a.title.font_size=6
    a.title.fill_mode="on"
    a.title.background=color(180,180,200)
end

    xstring(-1.6,1.3,"Диаграмма созвездия")                      // Слева вверху создаём название Графика = "Диаграмма созвездия"
    a.children(1).font_color=15
    a.children(1).font_size=4
    xstring(0.2,1.3,string(log2(X))+" bits / symbole")
    a.children(1).font_color=13
    a.children(1).font_size=4

    xstring(-1.8,-2.2,"Шум = "+string(k))                       // Создаем надписи Шум =
    a.children(1).font_color=39
    a.children(1).font_size=3
    xstring(-1.8,-1.65,"Символ n°: ")                           // Создаем надписи Символ n°:
    a.children(1).font_color=couleursin
    a.children(1).font_size=3
    xstring(-1.8,-1.9,"Байт отправлено: ")                     // Создаем надписи Байт отправлено:
    a.children(1).font_color=couleursin
    a.children(1).font_size=3

    xstring(1.85,-0.05," I ")                                  // Ось X = I
    a.children(1).font_color=couleurI
    a.children(1).font_size=5                                  //Задаем на осях QAM
    a.children(1).box="on"
    a.children(1).fill_mode="on"
    a.children(1).foreground=-2
    a.children(1).background=35
    xstring(-0.07,1.35," Q ")                                  // Ось Q = I
    a.children(1).font_color=couleurQ
    a.children(1).font_size=5
    a.children(1).box="on"
    a.children(1).fill_mode="on"
    a.children(1).foreground=-2
    a.children(1).background=35

    taillebit=4; couleurbit=36;
    if X==16 then
        xstring(1.2,0.4,"0010")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(-1.34,0.4,"1010")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(1.2,1.1,"0011")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(-1.34,1.1,"1011")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(1.2,-0.5,"0110")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(-1.34,-0.5,"1110")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(1.2,-1.3,"0111")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit                            // Создает название символов в сетке QAM
        xstring(-1.34,-1.3,"1111")
        a.children(1).font_color=couleurbit                          // С 16 разрядами
        a.children(1).font_size=taillebit 
        xstring(-0.6,-1.3,"1101")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(0.4,-1.3,"0101")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(-0.6,-0.56,"1100")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(0.4,-0.56,"0100")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(-0.6,0.45,"1000")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(0.4,0.45,"0000")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(-0.5,1.1,"1001")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
        xstring(0.3,1.1,"0001")
        a.children(1).font_color=couleurbit
        a.children(1).font_size=taillebit
    end

    sleep(2500) // Задержка до начала работы QAM

Kol_DvoichKOD = size(DvoichKOD, 1);

for i=1:Kol_DvoichKOD;// Kol_DvoichKOD = номер отправленного символа

        //Трассировка точки модуляции 16 QAM с шумом
        bruit=k*rand(1,"n")*exp(%i*%pi*400*k*rand(1))  // bruit = шум (генерация шума)

            if DvoichKOD(i) == '1111' then
                Q=1; 
                I=1;
                elseif DvoichKOD(i) == '1110' then
                Q=1; 
                I=2;
                elseif DvoichKOD(i) == '1101' then
                Q=2; 
                I=1;
                elseif DvoichKOD(i) == '1100' then
                Q=2; 
                I=2;
                elseif DvoichKOD(i) == '1011' then
                Q=1; 
                I=4;
                elseif DvoichKOD(i) == '1010' then
                Q=1; 
                I=3;
                elseif DvoichKOD(i) == '1001' then
                Q=2; 
                I=4;
                elseif DvoichKOD(i) == '1000' then
                Q=2; 
                I=3;
                elseif DvoichKOD(i) == '0111' then
                Q=4; 
                I=1;
                elseif DvoichKOD(i) == '0110' then
                Q=4; 
                I=2;
                elseif DvoichKOD(i) == '0101' then
                Q=3; 
                I=1;
                elseif DvoichKOD(i) == '0100' then
                Q=3; 
                I=2;
                elseif DvoichKOD(i) == '0011' then
                Q=4; 
                I=4;
                elseif DvoichKOD(i) == '0010' then
                Q=4; 
                I=3;
                elseif DvoichKOD(i) == '0001' then
                Q=3; 
                I=4;
            else 
                Q=3; 
                I=3;
            end

                const(I,Q)=(I-origine)*d+(Q-origine)*d*%i
                
                I_new = round(I + bruit)
                Q_new = round(Q + bruit)
                
                
                plot2d(imag(bruit+const(I,Q)),real(bruit+const(I,Q)),-9);           // -9 style , цвет
                
                
                if I_new == 1 & Q_new == 1 then
                    Decods(i) = '1111';
                elseif I_new == 2 & Q_new == 1 then
                    Decods(i) = '1110';
                elseif I_new == 1 & Q_new == 2 then
                    Decods(i) = '1101';
                elseif I_new == 2 & Q_new == 2 then
                    Decods(i) = '1100';
                elseif I_new == 4 & Q_new == 1 then
                    Decods(i) = '1011';
                elseif I_new == 3 & Q_new == 1 then
                    Decods(i) = '1010';
                elseif I_new == 4 & Q_new == 2 then
                    Decods(i) = '1001';
                elseif I_new == 3 & Q_new == 2 then
                    Decods(i) = '1000';
                elseif I_new == 1 & Q_new == 4 then
                    Decods(i) = '0111';
                elseif I_new == 2 & Q_new == 4 then
                    Decods(i) = '0110';
                elseif I_new == 1 & Q_new == 3 then
                    Decods(i) = '0101';
                elseif I_new == 2 & Q_new == 3 then
                    Decods(i) = '0100';
                elseif I_new == 4 & Q_new == 4 then
                    Decods(i) = '0011';
                elseif I_new == 3 & Q_new == 4 then
                    Decods(i) = '0010';
                elseif I_new == 4 & Q_new == 3 then
                    Decods(i) = '0001';
                else 
                    Decods(i) = '0000';
                end
                
        // Форматирование осей, цвета символов QAM
        a = gca()
        poly1= a.children(1).children(1)   //
        poly1.mark_foreground = 13;
        poly1.mark_background = couleursin;//цвет фона символа
        poly1.mark_size=tps

        xstring(-1,-1.6,string(i)+" / "+string(Kol_DvoichKOD));       //отображение кол-ва отправленных Символов
        a.children(1).font_color=couleursin
        a.children(1).font_size=3
        a.children(1).fill_mode="on"
        a.children(1).foreground=-1
        a.children(1).box="on"
        xstring(-1,-1.9,string(int(i*log2(X)/8)))                     //отображение кол-ва отправленных Байтов
        a.children(1).fill_mode="on"
        a.children(1).box="on"
        a.children(1).font_color=couleursin
        a.children(1).font_size=3
        a.children(1).foreground=-1

        sleep(1000/vitesse);//  скорость задержки
        if i<3 then
            xstring(-0.5,-0.2,"Кликните, чтобы продолжить")           // Количество раз которое программа 
            a.children(1).font_color=5                                // запросит Кликнуть, чтобы продолжило выводить 
            a.children(1).font_size=4                                 // данные в QAM (в нашем случае <3 это 2 раза)
            xclick()
            delete(a.children(1))
        end

        if persistance==0 then
            delete(poly1);                                            //Удаление старых точек в QAM (больших жёлтых и далее не сохраняются маленькие)
        end

        if persistance ==1 then  
            poly1.mark_foreground = -1;                               // цвет края символ   13 pour зеленый  32 для желто-оранжевого (маленькая точка остается)    (-1 это цвет контура маленького кружка)
            poly1.mark_background = 32                                // цвет маленького кружка внутри
            poly1.mark_size=0                                         // размер маленького кружка
        end
end
    
    croix=32
    if X==16 then
        croix=16
    end

end;
a.auto_ticks = ["on","on","on"]
a.data_bounds=[-2,-2.5;2,1.5]
