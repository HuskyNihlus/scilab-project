global A F Tm Fd T k Signal

      //A = evstr(x_dialog("Введи значение Амплитуды от 1-3",'')); 
      //F = evstr(x_dialog("Введи значение Частота сигнала (Гц)",'')); 
      //Tm = evstr(x_dialog("Введи значение Длительность сигнала (с)",'')); 
      //Fd = evstr(x_dialog("Введи значение Частоты дискретизации(8000) (Гц)",''));
      
k = 0;
A = 10;
Tm = 48; // От 15 иначе кодер не работает    // кратное 8 должно быть
F = 400;
Fd = 8000;

T = 1:Tm;
Is = A * sin(2 * %pi * T / (Fd/F));
      
      
      f1=figure(); clf;                             // Создаём окно для вывода графиков
      set(f1,'figure_name','FIRST WINDOW'); 
      f1.figure_position=[200,200]
      f1.figure_size=[1500,700]

      subplot(3,1,1); 
      plot(T,Is); xtitle("Человеческий голос");

      a=gca();
      a.children                                    //Косметическая часть для графика
      poly1= a.children(1).children(1);
      poly1.thickness = 2;
      poly1.foreground = 2;
      a.title.font_size=5;

      xgrid(); 
      xlabel("t (c)");                              //Задаем название осям
      ylabel("Amplitude (dB)")
      
      sleep(3000);
        
              //fs = evstr(x_dialog("Введи значение Fs, чтобы высчитать интервал дискретизации",'')); 
        
fs = 4000;
// Расчёт для вывода дискретизированного сигнала
b=Fd/fs;                                    //По этой формуле мы высчитываем интервал дискретизации

        samp = zeros(1,Tm); 
        for p = 1 : b : Tm
            samp(p) = Is(p);
        end
        subplot(3,1,1);
        plot2d3(samp);                              //Вывод Дискретизированного сигнала
        title("Дискретный вид сигнала");
        
        a=gca();
        a.children                                  //Косметическая часть для графика
        poly1= a.children(1).children(1);
        poly1.thickness = 2; 
        a.title.font_size=5;
        
        sleep(3000);
        //Ra = evstr(x_dialog("Введи значение Разрядность АЦП (3)",'')); 
        // Рассчёт для вывода квантованого сигнала
Ra=13;
Ru = Ra^2; 
Koef = Ru / (2*A); 
N = length(T);
for i = 1:N;
    Signal(:,i) = round(Is(T(i)) * Koef) / Koef; 
end;

subplot(3,1,2); 
plot2d2(T, Signal);                          //Вывод цифрового сигнала
xtitle("Квантованный сигнал","t","Amplitude");

a=gca();
a.children                                   //Косметическая часть для графика
poly1= a.children(1).children(1);
poly1.foreground = 5;
poly1.thickness = 2;
a.title.font_size=5;

xgrid(); 
xlabel("t");                                //Задаем название осям
ylabel("Amplitude")

// Расчёт для вывода FFT аналогового сигнала
T = 1: 1/Fd : Tm;                           //Не работало FFT потому что не было этой строки
N_T = size(T,'*');
FFT = abs(fft(Is(T)));

FFT_Hz = Fd*(0:(Tm/2))/Tm;
n_Hz = size(FFT_Hz,'*')
subplot(3,1,3);
plot(FFT_Hz,FFT(1:n_Hz))
xtitle("FFT");

a=gca();
a.children                                    //Косметическая часть для графика
poly1= a.children(1).children(1);
poly1.thickness = 1;
poly1.foreground = 2;
a.title.font_size = 5;

xgrid(); 
xlabel("Гц"); 
ylabel("dB"),
