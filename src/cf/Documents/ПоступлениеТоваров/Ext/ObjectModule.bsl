﻿
Процедура ОбработкаПроведения(Отказ, Режим)

		// регистр ОстаткиТоваров Приход
		Движения.ОстаткиТоваров.Записывать = Истина;
		Движения.ОстаткиТоваров.Очистить();
		
		// регистр СебестоимостьТовара Приход
		Движения.СебестоимостьТовара.Записывать = Истина;
		Движения.СебестоимостьТовара.Очистить();    
		
		Для Каждого ТекСтрокаСписокТоваров Из СписокТоваров Цикл
			Движение = Движения.ОстаткиТоваров.Добавить();
			Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
			Движение.Период = Дата;
			Движение.Номенклатура = ТекСтрокаСписокТоваров.Номенклатура;
			Движение.Количество = ТекСтрокаСписокТоваров.Количество;
			
			Движение = Движения.СебестоимостьТовара.Добавить();
			Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
			Движение.Период = Дата;
			Движение.Номенклатура = ТекСтрокаСписокТоваров.Номенклатура;
			Движение.Партия = Ссылка;
			Движение.Количество = ТекСтрокаСписокТоваров.Количество;
			Движение.Стоимость = ТекСтрокаСписокТоваров.Стоимость;

		КонецЦикла;

КонецПроцедуры
