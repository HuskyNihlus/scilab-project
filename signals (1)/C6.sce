global DvoichKOD f3 k_slider priznakf3 F N

N = size(DvoichKOD, 1);
Phase = %pi;
Amp = 2;

x = 1;

B = [];
//Расчет как выглядит сигнал после модуляции QAM
function f = ModulSig(T, Amp, shift)
    f = Amp * sin((2 * %pi * 400 * T / 8000) + shift);
endfunction

x=1;
for i = 1:1:N;
    if DvoichKOD(i) == '0000' then
        
        shift = 45;
        AmpTemp = Amp/4 + Amp;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));     //фаза 45 И амплитуды/2
        
    elseif DvoichKOD(i) == '0001' then
        
        shift = 67;
        AmpTemp = Amp/4 + Amp;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));   //фаза 135 И амплитуды/2
        
    elseif DvoichKOD(i) == '0010' then
        
        shift = 23;
        AmpTemp = 3*Amp/4 + Amp;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));    //фаза 225 И амплитуды/2
        
    elseif DvoichKOD(i) == '0011' then
        
        shift = 45;
        AmpTemp = 3*Amp/4 + Amp;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));   //фаза 315 И амплитуды/2
        
    elseif DvoichKOD(i) == '0100' then
        
        shift = 315;
        AmpTemp = Amp/4 + Amp;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));    //фаза 45
        
    elseif DvoichKOD(i) == '0101' then
        
        shift = 293;
        AmpTemp = Amp/4 + Amp;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));   //фаза 135
        
    elseif DvoichKOD(i) == '0110' then
        
        shift = 337;
        AmpTemp = 3*Amp/4 + Amp;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));   //фаза 225
        
    elseif DvoichKOD(i) == '0111' then
        
        shift = 315;
        AmpTemp = 3*Amp/4 + Amp;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));    //фаза 315
        
    elseif DvoichKOD(i) == '1000' then
        
        shift = 135;
        AmpTemp = Amp - Amp/4;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));    //фаза 45 И амплитуда+1
        
    elseif DvoichKOD(i) == '1001' then
        
        shift = 113;
        AmpTemp = Amp - Amp/4;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));   //фаза 135 И амплитуда+1
        
    elseif DvoichKOD(i) == '1010' then
        
        shift = 157;
        AmpTemp = Amp - 3*Amp/4;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));   //фаза 225 И амплитуда+1
        
    elseif DvoichKOD(i) == '1011' then
        
        shift = 135;
        AmpTemp = Amp - 3*Amp/4;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));   //фаза 315 И амплитуда+1
        
    elseif DvoichKOD(i) == '1100' then
        
        shift = 225;
        AmpTemp = Amp - Amp/4;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));   //фаза 45 И амплитуда+2
        
    elseif DvoichKOD(i) == '1101' then
        
        shift = 247;
        AmpTemp = Amp - Amp/4;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));   //фаза 135 И амплитуда+2
        
    elseif DvoichKOD(i) == '1110' then
        
        shift = 203;
        AmpTemp = Amp - 3*Amp/4;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));   //фаза 225 И амплитуда+2
        
    else
         
        shift = 225;
        AmpTemp = Amp - 3*Amp/4;
        T = x:0.1:(x+15);
        x = x+15;
        B = cat(2, B, ModulSig(T, AmpTemp, shift));   //фаза 315 И амплитуда+2
        
    end
end

    if isscalar(k_slider)
        bnoise=grand(1,length(B),"unf",-k_slider,k_slider);  // Добавление шума от -Значения_слайдера до +Значение_слайдера
        B = B + bnoise;// добавляем шум
    end

y = 1;
toplot = y:0.1:(y+15);
y = y + 15;

for i=1:N-1 
    G = y:0.1:(y+15);
    toplot = cat(2, toplot, G);
    y = y + 15;
end


// построение графика
        if priznakf3==0
            f3=figure(); clf;
            set(f3,'figure_name','THIRD WINDOW');
            f3.figure_position=[200,200];
            f3.figure_size=[1500,700];
            priznakf3=1;
        end
     
        //subplot(2,1,1);
        subplot(1,1,1);
        plot2d(toplot, B);
        if k_slider == 0 then
           xtitle("Сигнал с 16-QAM модуляцией","t - (15 делений = 1 секунде)","Amplitude");
           else xtitle("Сигнал с Шумом","t ","Amplitude");
        end
        //xtitle("Сигнал с 16-QAM модуляцией","t","Amplitude");
        
        a=gca();
        a.children;                         //Косметическая часть для графика
        poly1= a.children(1).children(1);
        //poly1.foreground = 24; фиолетовый
        poly1.foreground = 1; //черный
        poly1.thickness = 2;
        a.title.font_size=5;
        set(gca(),"auto_clear","on");
        xgrid(); 
