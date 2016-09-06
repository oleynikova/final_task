﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПодготавливаюДанныеПоЭлементуСправочникаСНаименованием(Парам01,Парам02)","ЯПодготавливаюДанныеПоЭлементуСправочникаСНаименованием","Допустим я подготавливаю данные по элементу справочника ""_ДемоНоменклатура"" с наименованием ""Стул""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ПоНоменклатуреСНаименованиемНетОстатков(Парам01)","ПоНоменклатуреСНаименованиемНетОстатков","Допустим по номенклатуре с наименованием ""Стул"" нет остатков");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСоздаюДокументПродажиИУказываюТоварКоторогоНетВСистеме()","ЯСоздаюДокументПродажиИУказываюТоварКоторогоНетВСистеме","Когда я создаю документ продажи и указываю товар, которого нет в системе");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДокументНеПровелся()","ДокументНеПровелся","Тогда документ не провелся");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ПоНоменклатуреСНаименованиемЕстьОстатки(Парам01)","ПоНоменклатуреСНаименованиемЕстьОстатки","Допустим по номенклатуре с наименованием ""Стул"" есть остатки");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСоздаюДокументПродажиИУказываюТоварКоторыйЕстьВСистеме()","ЯСоздаюДокументПродажиИУказываюТоварКоторыйЕстьВСистеме","Когда я создаю документ продажи и указываю товар, который есть в системе");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Допустим я подготавливаю данные по элементу справочника "_ДемоНоменклатура" с наименованием "Стул"
//@ЯПодготавливаюДанныеПоЭлементуСправочникаСНаименованием(Парам01,Парам02)
Процедура ЯПодготавливаюДанныеПоЭлементуСправочникаСНаименованием(Парам01,Парам02) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	ВызватьИсключение "Не реализовано.";
КонецПроцедуры

&НаКлиенте
//Допустим по номенклатуре с наименованием "Стул" нет остатков
//@ПоНоменклатуреСНаименованиемНетОстатков(Парам01)
Процедура ПоНоменклатуреСНаименованиемНетОстатков(Парам01) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	ВызватьИсключение "Не реализовано.";
КонецПроцедуры

&НаКлиенте
//Когда я создаю документ продажи и указываю товар, которого нет в системе
//@ЯСоздаюДокументПродажиИУказываюТоварКоторогоНетВСистеме()
Процедура ЯСоздаюДокументПродажиИУказываюТоварКоторогоНетВСистеме() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	ВызватьИсключение "Не реализовано.";
КонецПроцедуры

&НаКлиенте
//Тогда документ не провелся
//@ДокументНеПровелся()
Процедура ДокументНеПровелся() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	ВызватьИсключение "Не реализовано.";
КонецПроцедуры

&НаКлиенте
//Допустим по номенклатуре с наименованием "Стул" есть остатки
//@ПоНоменклатуреСНаименованиемЕстьОстатки(Парам01)
Процедура ПоНоменклатуреСНаименованиемЕстьОстатки(Парам01) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	ВызватьИсключение "Не реализовано.";
КонецПроцедуры

&НаКлиенте
//Когда я создаю документ продажи и указываю товар, который есть в системе
//@ЯСоздаюДокументПродажиИУказываюТоварКоторыйЕстьВСистеме()
Процедура ЯСоздаюДокументПродажиИУказываюТоварКоторыйЕстьВСистеме() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	ВызватьИсключение "Не реализовано.";
КонецПроцедуры

//окончание текста модуля