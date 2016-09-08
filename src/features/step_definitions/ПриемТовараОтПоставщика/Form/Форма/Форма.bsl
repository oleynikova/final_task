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

	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПодготавливаюВспомогательныеДанные()","ЯПодготавливаюВспомогательныеДанные","Допустим я подготавливаю вспомогательные данные");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСоздаюПоступлениеТоваровИУслуг()","ЯСоздаюПоступлениеТоваровИУслуг","Когда я создаю поступление товаров и услуг");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПровожуДокумент()","ЯПровожуДокумент","И Я провожу документ");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"РезультатПроведенияКорректен()","РезультатПроведенияКорректен","Тогда результат проведения корректен");

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
&НаКлиенте
Функция ПолучитьПутьКФайлуОтносительноКаталогоFeatures(ИмяФайлаСРасширением)
	
	ПутьКФайлу = "";
	СостояниеVanessaBehavior = Ванесса.ПолучитьСостояниеVanessaBehavior();
	ПутьКТекущемуFeatureФайлу = СостояниеVanessaBehavior.ТекущаяФича.ПолныйПуть;
	ПутьКФайлу = Лев(ПутьКТекущемуFeatureФайлу, СтрНайти(ПутьКТекущемуFeatureФайлу, "features") - 1) + ИмяФайлаСРасширением;
	Возврат ПутьКФайлу;
	
КонецФункции

&НаКлиенте
Процедура ЗагрузитьFixtureИзМакета(ИмяМакета)
	
	Ванесса.ЗапретитьВыполнениеШагов();
	НачальноеИмяФайла = ПолучитьПутьКФайлуОтносительноКаталогоFeatures("tools\Выгрузка и загрузка данных XML.epf");
	Адрес = "";
	НачатьПомещениеФайла(
		Новый ОписаниеОповещения("ЗагрузитьFixtureИзМакетаЗавершение", ЭтотОбъект, ИмяМакета), 
		Адрес, 
		НачальноеИмяФайла, 
		Ложь);

КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьFixtureИзМакетаЗавершение(УдалосьПоместитьФайл, Адрес, ВыбранноеИмяФайла, ИмяМакета) Экспорт
	
	ЗагрузитьFixtureИзМакетаЗавершениеНаСервере(Адрес, ИмяМакета);
	Ванесса.ПродолжитьВыполнениеШагов();

КонецПроцедуры

&НаСервере
Процедура ЗагрузитьFixtureИзМакетаЗавершениеНаСервере(Адрес, ИмяМакета)
	
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла();
	ДвоичныеДанные = ПолучитьИзВременногоХранилища(Адрес);
	ДвоичныеДанные.Записать(ИмяВременногоФайла);
	
	ВнешняяОбработка = ВнешниеОбработки.Создать(ИмяВременногоФайла, Ложь);
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла();
	Текст = РеквизитФормыВЗначение("Объект").ПолучитьМакет(ИмяМакета).ПолучитьТекст();
	
	ВременныйДокумент = Новый ТекстовыйДокумент;
	ВременныйДокумент.УстановитьТекст(Текст);
	ВременныйДокумент.Записать(ИмяВременногоФайла, КодировкаТекста.UTF8);
	
	ВнешняяОбработка.ВыполнитьЗагрузку(ИмяВременногоФайла);

КонецПроцедуры

///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

//&НаКлиенте
////Допустим я подготавливаю вспомогательные данные
////@ЯПодготавливаюВспомогательныеДанные()
//Процедура ЯПодготавливаюВспомогательныеДанные() Экспорт
//	
//	ЗагрузитьFixtureИзМакета("Операторы");
//	ЗагрузитьFixtureИзМакета("Номенклатура");

//КонецПроцедуры

&НаКлиенте
//Когда я создаю поступление товаров и услуг
//@ЯСоздаюПоступлениеТоваровИУслуг()
Процедура ЯСоздаюПоступлениеТоваровИУслуг() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	ВызватьИсключение "Не реализовано.";
КонецПроцедуры

&НаКлиенте
//И Я провожу документ
//@ЯПровожуДокумент()
Процедура ЯПровожуДокумент() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	ВызватьИсключение "Не реализовано.";
КонецПроцедуры

&НаКлиенте
//Тогда результат проведения корректен
//@РезультатПроведенияКорректен()
Процедура РезультатПроведенияКорректен() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	ВызватьИсключение "Не реализовано.";
КонецПроцедуры

//окончание текста модуля
