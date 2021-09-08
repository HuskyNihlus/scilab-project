global DvoichKOD Tm

pathname = get_absolute_file_path("C_ofdm.sce")
chdir(pathname)

T = 1:Tm;
N = length(T);

//Преобразование сигнала после модуляции в комплексные числа
for i = 1:N
    if DvoichKOD(i) == '0000' then
        Kompl(i) = 'A1^j45°';
    elseif DvoichKOD(i) == '0001' then
        Kompl(i) = 'A1^j67°';
    elseif DvoichKOD(i) == '0010' then
        Kompl(i) = 'A1^j23°';
    elseif DvoichKOD(i) == '0011' then
        Kompl(i) = 'A1^j45°';
    elseif DvoichKOD(i) == '1000' then
        Kompl(i) = 'A1^j135°';
    elseif DvoichKOD(i) == '1001' then
        Kompl(i) = 'A1^j113°';
    elseif DvoichKOD(i) == '1010' then
        Kompl(i) = 'A1^j157°';
    elseif DvoichKOD(i) == '1011' then
        Kompl(i) = 'A1^j135°';
    elseif DvoichKOD(i) == '0100' then
        Kompl(i) = 'A2^j315°';
    elseif DvoichKOD(i) == '0101' then
        Kompl(i) = 'A2^j293°';
    elseif DvoichKOD(i) == '0110' then
        Kompl(i) = 'A2^j337°';
    elseif DvoichKOD(i) == '0111' then
        Kompl(i) = 'A2^j315°';
    elseif DvoichKOD(i) == '1100' then
        Kompl(i) = 'A2^j225°';
    elseif DvoichKOD(i) == '1101' then
        Kompl(i) = 'A2^j247°';
    elseif DvoichKOD(i) == '1110' then
        Kompl(i) = 'A2^j203°';
    else 
        Kompl(i) = 'A2^j225°';
    end
end

f_OFDM=figure();

set(f_OFDM,'figure_name','OFDM');
f_OFDM.figure_position=[200,100]
f_OFDM.figure_size=[1000,600]

img = imread('OFDM.jpg');
imshow(img);

for i = 1:N
    mprintf ('%d) - %s\n',i,Kompl(i));
end

f_OFDM_1=figure();

set(f_OFDM_1,'figure_name','OFDM');
f_OFDM_1.figure_position=[200,0]
f_OFDM_1.figure_size=[900,1000]

img_1 = imread('OFDM1.jpg');
imshow(img_1);

N1 = N/8;

for i = 1:N1
    OFDM_KOMPL_1 = uicontrol(f_OFDM_1, "style", "text", ...
                       'HorizontalAlignment', 'center',...
                       "position", [500,690,150,20],...
                       "tag","Kompl(i)");
                       
                       set(OFDM_KOMPL_1,"string",string(Kompl(i)));  
                       i = i+1;
    OFDM_KOMPL_2 = uicontrol(f_OFDM_1, "style", "text", ...
                       'HorizontalAlignment', 'center',...
                       "position", [500,628,150,20],...
                       "tag","Kompl(i)");
                       
                       set(OFDM_KOMPL_2,"string",string(Kompl(i))); 
                       i = i+1;
    OFDM_KOMPL_3 = uicontrol(f_OFDM_1, "style", "text", ...
                       'HorizontalAlignment', 'center',...
                       "position", [500,575,150,20],...
                       "tag","Kompl(i)");
                       
                       set(OFDM_KOMPL_3,"string",string(Kompl(i)));
                       i = i+1;
    OFDM_KOMPL_4 = uicontrol(f_OFDM_1, "style", "text", ...
                       'HorizontalAlignment', 'center',...
                       "position", [500,520,150,20],...
                       "tag","Kompl(i)");
                       
                       set(OFDM_KOMPL_4,"string",string(Kompl(i)));
                       i = i+1;
    OFDM_KOMPL_5 = uicontrol(f_OFDM_1, "style", "text", ...
                       'HorizontalAlignment', 'center',...
                       "position", [500,465,150,20],...
                       "tag","Kompl(i)");
                       
                       set(OFDM_KOMPL_5,"string",string(Kompl(i)));
                       i = i+1;
    OFDM_KOMPL_6 = uicontrol(f_OFDM_1, "style", "text", ...
                       'HorizontalAlignment', 'center',...
                       "position", [500,410,150,20],...
                       "tag","Kompl(i)");
                       
                       set(OFDM_KOMPL_6,"string",string(Kompl(i)));
                       i = i+1;
    OFDM_KOMPL_7 = uicontrol(f_OFDM_1, "style", "text", ...
                       'HorizontalAlignment', 'center',...
                       "position", [500,360,150,20],...
                       "tag","Kompl(i)");
                       
                       set(OFDM_KOMPL_7,"string",string(Kompl(i)));
                       i = i+1;
    OFDM_KOMPL_8 = uicontrol(f_OFDM_1, "style", "text", ...
                       'HorizontalAlignment', 'center',...
                       "position", [500,305,150,20],...
                       "tag","Kompl(i)");
                       
                       set(OFDM_KOMPL_8,"string",string(Kompl(i)));
                       
                       sleep(4500)
end
