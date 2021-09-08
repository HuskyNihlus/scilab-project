clear,clc, xdel(winsid());

pathname = get_absolute_file_path("СХЕМА.sce")
chdir(pathname)

winnum=1;  win=string(winnum);                      //Создаем рабочую панель
cf=figure(winnum);

set(cf,'figure_name','ОКНО УПРАВЛЕНИЯ');
cf.figure_position=[200,100]
cf.figure_size=[1500,600]

startButton_Nazvanie = uicontrol(cf,'unit','normalized','BackgroundColor',[-1,-1,-1],...
'FontAngle','normal','FontName','Tahoma','FontSize',[16],'FontWeight','bold',...
'ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','Position',[0.0001,0.95,0.9999,0.05],...
'Relief','default','String','Система передачи сигнала в Wi-fi канале','Style','text','VerticalAlignment','middle')

startButton_IS = uicontrol("Style","pushbutton",...                   //Создаём кнопку ИС
    "String","ИС",...
    "fontSize", 18, ...
    "ForegroundColor", [0.7,0,0], ...
    "units", "normalized", ...
    "position", [0.02 0.5 0.07 0.2],...
    "callback", "Ishodniy_Signal"); 

startButton_Coder = uicontrol("Style","pushbutton",...                //Создаём кнопку Кодер
    "String","Кодер",...
    "fontSize", 18, ...
    "ForegroundColor", [0.7,0,0], ...
    "units", "normalized", ...
    "position", [0.145 0.5 0.07 0.2],...
    "callback", "Coder");
    
startButton_Signal_Modul = uicontrol("Style","pushbutton",...         //Создаём кнопку Вывод сигнала с Модуляцией
    "String","Сигнал после QAM",...
    "fontSize", 13, ...
    "ForegroundColor", [0.7,0,0], ...
    "units", "normalized", ...
    "position", [0.270 0.7 0.1 0.1],...
    "callback", "Signal_Modul"); 
    
startButton_Modul = uicontrol("Style","pushbutton",...                //Создаём кнопку Модуляция
    "String","Модуляция",...
    "fontSize", 18, ...
    "ForegroundColor", [0.7,0,0], ...
    "units", "normalized", ...
    "position", [0.270 0.5 0.1 0.2],...
    "callback", "Modul"); 
    
startButton_OFDM = uicontrol("Style","pushbutton",...                 //Создаём кнопку OFDM
    "String","OFDM",...
    "fontSize", 18, ...
    "ForegroundColor", [0.7,0,0], ...
    "units", "normalized", ...
    "position", [0.425 0.5 0.07 0.2],...
    "callback", "OFDM"); 
    
startButton_Channel = uicontrol("Style","pushbutton",...              //Создаём кнопку Wi-fi канал
    "String","Wi-fi Канал",...
    "fontSize", 18, ...
    "ForegroundColor", [0.7,0,0], ...
    "units", "normalized", ...
    "position", [0.55 0.5 0.15 0.2],...
    "callback", "Channel");
    
startButton_Shum = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],...           //Создаём надпись шум
'FontAngle','italic','FontName','Tahoma','FontSize',[15],'FontWeight','normal',...
'ForegroundColor',[1,1,1],'HorizontalAlignment','center','Position',[0.6,0.72,0.05,0.05],...
'Relief','default','String','Шум','Style','text','VerticalAlignment','middle')
    
startButton_Demodul = uicontrol("Style","pushbutton",...              //Создаём кнопку Демодуляция
    "String","Демодуляция",...
    "fontSize", 18, ...
    "ForegroundColor", [0.7,0,0], ...
    "units", "normalized", ...
    "position", [0.75 0.5 0.12 0.2],...
    "callback", "Demodul");
    
startButton_Decod = uicontrol("Style","pushbutton",...                //Создаём кнопку Декод
    "String","Декод",...
    "fontSize", 18, ...
    "ForegroundColor", [0.7,0,0], ...
    "units", "normalized", ...
    "position", [0.92 0.5 0.07 0.2],...
    "callback", "Decod");
    
startButton_Schetchik_Oshibok = uicontrol("Style","pushbutton",...    //Создаём кнопку Счётчик
    "String","Счётчик",...
    "fontSize", 18, ...
    "ForegroundColor", [0.7,0,0], ...
    "units", "normalized", ...
    "position", [0.92 0.2 0.07 0.2],...
    "callback", "Schetchik_Oshibok");
    
startButton_Exit = uicontrol("Style","pushbutton",...                 //Создаём кнопку Выход
    "String","Выход",...
    "fontSize", 18, ...
    "ForegroundColor", [0.7,0,0], ...
    "units", "normalized", ...
    "position", [0.92 0.01 0.07 0.07],...
    "callback", "Exit");
    
     // верхняя линия
     Line1 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.0887,0.6,0.0578,0.008],'Style','frame')
     Line2 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.213,0.6,0.058,0.008],'Style','frame')
     Line3 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.369,0.6,0.057,0.008],'Style','frame')
     Line4 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.4935,0.6,0.058,0.008],'Style','frame')
     Line5 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.699,0.6,0.053,0.008],'Style','frame')
     Line6 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.869,0.6,0.0529,0.008],'Style','frame')
     Line7 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.952,0.398,0.004,0.103],'Style','frame')
     // нижняя линия
     Line8 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,1,0],'ForegroundColor',[-1,-1,-1],'Position',[0.08,0.25,0.08,0.008],'Style','frame')
     Line9 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,1,0],'ForegroundColor',[-1,-1,-1],'Position',[0.20,0.25,0.08,0.008],'Style','frame')
     Line10 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,1,0],'ForegroundColor',[-1,-1,-1],'Position',[0.32,0.25,0.08,0.008],'Style','frame')
     Line11 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,1,0],'ForegroundColor',[-1,-1,-1],'Position',[0.44,0.25,0.08,0.008],'Style','frame')
     Line12 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,1,0],'ForegroundColor',[-1,-1,-1],'Position',[0.56,0.25,0.08,0.008],'Style','frame')
     Line13 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,1,0],'ForegroundColor',[-1,-1,-1],'Position',[0.68,0.25,0.08,0.008],'Style','frame')
     Line14 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,1,0],'ForegroundColor',[-1,-1,-1],'Position',[0.80,0.25,0.08,0.008],'Style','frame')
     Line15 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,1,0],'ForegroundColor',[-1,-1,-1],'Position',[0.90,0.25,0.021,0.008],'Style','frame')
     // левые линии
     Line16 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,1,0],'ForegroundColor',[-1,-1,-1],'Position',[0.06,0.398,0.004,0.103],'Style','frame')
     Line17 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,1,0],'ForegroundColor',[-1,-1,-1],'Position',[0.06,0.25,0.004,0.103],'Style','frame')
     // линии канала
     Line18 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.52,0.70,0.001,0.25],'Style','frame')
     Line19 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.52,0.3,0.001,0.20],'Style','frame')
     Line20 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.52,0.01,0.001,0.18],'Style','frame')
     
     Line21 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.725,0.70,0.001,0.25],'Style','frame')
     Line22 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.725,0.3,0.001,0.20],'Style','frame')
     Line23 = uicontrol(cf,'unit','normalized','BackgroundColor',[0,0,0],'ForegroundColor',[-1,-1,-1],'Position',[0.725,0.01,0.001,0.18],'Style','frame')
     // Отключаем кнопки, чтобы поочередно включались на схеме
set(startButton_Coder,"enable","off")
set(startButton_Modul,"enable","off")
set(startButton_Signal_Modul,"enable","off")
set(startButton_OFDM,"enable","off")
set(startButton_Channel,"enable","off")
set(startButton_Demodul,"enable","off")
set(startButton_Decod,"enable","off")
set(startButton_Schetchik_Oshibok,"enable","off")

k_slider = 0; // начальное значение коэффициента слайдера
              // чтобы не было пустым множеством для С6
priznakf3 = 0;
    
    function Ishodniy_Signal()
    exec("C1.sce");
    set(startButton_Coder,"enable","on");
    endfunction

    function Coder()
    exec("C4.sce");
    set(startButton_Modul,"enable","on");
    endfunction

    function Modul()
    exec("C5.sce");
    set(startButton_OFDM,"enable","on");
    set(startButton_Signal_Modul,"enable","on");
    endfunction

    function Signal_Modul()
    exec("C6.sce");
    endfunction

    function OFDM()
    exec("C_ofdm.sce");
    set(startButton_Channel,"enable","on");
    endfunction

    function Channel()
    exec("C1337.sce");
    set(startButton_Demodul,"enable","on");
    endfunction

    function Demodul()
    exec("C5.sce");
    set(startButton_Decod,"enable","on");
    endfunction  

    function Decod()
    exec("C_decod.sce");
    set(startButton_Schetchik_Oshibok,"enable","on");
    endfunction

    function Schetchik_Oshibok()
    exec("C_schetchik_oshibok.sce");
    endfunction

    function Exit()
    xdel(winsid())
    return
    endfunction
