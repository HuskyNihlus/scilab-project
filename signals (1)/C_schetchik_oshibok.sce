global DvoichKOD Decods Kol_DvoichKOD

oshibka = 0;
//С помощью данного цикла сверяем количество ошибок после передачи сигнала по Wi-fi каналу
for i = 1:Kol_DvoichKOD
    if DvoichKOD(i) ~= Decods(i) then
        oshibka = oshibka + 1;
    end
end

f_Kol_Oshibok=figure();
            set(f_Kol_Oshibok,'figure_name','Счётчик');
            f_Kol_Oshibok.figure_position=[200,200];
            f_Kol_Oshibok.figure_size=[400,300];

    str_oshibka = uicontrol(f_Kol_Oshibok,'style', 'text',...
                       'HorizontalAlignment', 'center',...
                       'string','Количество ошибок',...
                       'position',[200,150,150,20]);
    h_osibka = uicontrol(f_Kol_Oshibok, "style", "text", ...
                       'HorizontalAlignment', 'center',...
                       "position", [200,130,150,20],...
                       "tag","oshibka");
                       
                       set(h_osibka,"string",string(oshibka));  
