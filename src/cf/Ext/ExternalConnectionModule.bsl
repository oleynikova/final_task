﻿// _Демо начало примера

#Область ОбработчикиСобытий

Процедура ПриНачалеРаботыСистемы()
	
	// Пропустить инициализацию, если обновление информационной базы еще не завершено.
	Если ОбновлениеИнформационнойБазы.НеобходимоОбновлениеИнформационнойБазы() Тогда
		Возврат;
	КонецЕсли;
	
	ЗаписатьИнформацию(НСтр("ru = 'Демо: Начат сеанс внешнего соединения'"));
	
КонецПроцедуры

Процедура ПриЗавершенииРаботыСистемы()
	
	// Пропустить обработку, если обновление информационной базы еще не завершено.
	Если ОбновлениеИнформационнойБазы.НеобходимоОбновлениеИнформационнойБазы() Тогда
		Возврат;
	КонецЕсли;
	
	ЗаписатьИнформацию(НСтр("ru = 'Демо: Завершен сеанс внешнего соединения'"));
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ЗаписатьИнформацию(Знач Текст)
	
	ЗаписьЖурналаРегистрации(НСтр("ru = 'Внешнее соединение'", ОбщегоНазначенияКлиентСервер.КодОсновногоЯзыка()),
		УровеньЖурналаРегистрации.Информация,,, Текст);
	
КонецПроцедуры

#КонецОбласти

// _Демо конец примера
