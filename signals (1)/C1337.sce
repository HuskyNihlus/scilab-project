global k

//Задаём шум в Wi-fi канале
SHUMstr=[ 'Интенсивность шума                             [от 0 до 1]'];

w = x_mdialog(_('Введите интенсивность шума'),  SHUMstr, ['0']);

    k=evstr(w(1))                                                           //Ввод данных Интенсивность шума
    kdb = "infini"
    if k<>0 then
        kdb=string(round(-200*log10(k))/10)
    end
