﻿# encoding: utf-8
# language: ru

@tree

Функционал: ПриемТовараОтПоставщика
	Как Оператор
	Хочу оформлять товар в системе и правильно формировать остаток и себестоимость по принятому товару
	Чтобы продажи товара проходили корректно
	
Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	и Пауза 8
	И ЯПодготавливаюДанныеИзМакета "Операторы" 
	И ЯПодготавливаюДанныеИзМакета "Номенклатура"

Сценарий: Поступление товаров	
	Когда я создаю поступление товаров и услуг
		Когда В панели разделов я выбираю "(ТО) Итоговое задание"
		И     В панели функций я выбираю "Поступление товаров"
		Тогда открылось окно "Поступление товаров"
		И     я нажимаю на кнопку "Создать"
		Тогда открылось окно "Поступление товаров (создание)"
		И     в ТЧ "СписокТоваров" я нажимаю на кнопку "Добавить"
		И     в ТЧ "СписокТоваров" я выбираю значение реквизита "Номенклатура" из формы списка
		Тогда открылось окно "Демо: Номенклатура"
		И     я нажимаю на кнопку "Список"
		И     В форме "Демо: Номенклатура" в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'Стул'         |
		И     я нажимаю на кнопку "Выбрать" 
		И     в ТЧ "СписокТоваров" я активизирую поле "Количество"
		И     в ТЧ "СписокТоваров" в поле "Количество" я ввожу текст "4,000"
		И     в ТЧ "СписокТоваров" я активизирую поле "Стоимость"
		И     в ТЧ "СписокТоваров" в поле "Стоимость" я ввожу текст "4 000,00"
		И     В форме "Поступление товаров (создание) *" в ТЧ "СписокТоваров" я завершаю редактирование строки
		И     в ТЧ "СписокТоваров" я нажимаю на кнопку "Добавить"
		И     в ТЧ "СписокТоваров" я выбираю значение реквизита "Номенклатура" из формы списка
		Тогда открылось окно "Демо: Номенклатура"
		И     я нажимаю на кнопку "Список"
		И     В форме "Демо: Номенклатура" в таблице "Список" я перехожу к строке:
		| 'Наименование' |
		| 'Кровать'      |
		И     я нажимаю на кнопку "Выбрать" 
		Тогда открылось окно "Поступление товаров (создание) *"
		И     в ТЧ "СписокТоваров" я активизирую поле "Количество"
		И     в ТЧ "СписокТоваров" в поле "Количество" я ввожу текст "2,000"
		И     в ТЧ "СписокТоваров" я активизирую поле "Стоимость"
		И     в ТЧ "СписокТоваров" в поле "Стоимость" я ввожу текст "50 000,00"
		И     В форме "Поступление товаров (создание) *" в ТЧ "СписокТоваров" я завершаю редактирование строки
	    И     я открываю выпадающий список "Оператор"
		И     я выбираю значение реквизита "Оператор" из формы списка
		Тогда открылось окно "Выбор пользователя"
		И     В форме "Выбор пользователя" в таблице "ПользователиСписок" я перехожу к строке:
		| 'Полное имя' |
		| 'Оператор1'  |
		И     В форме "Выбор пользователя" в ТЧ "ПользователиСписок" я выбираю текущую строку
		Тогда открылось окно "Поступление товаров (создание) *" 
	    И     В форме "Поступление товаров (создание) *" в ТЧ "СписокТоваров" я завершаю редактирование строки

	И Я провожу документ
		Тогда открылось окно "Поступление товаров (создание) *"
		И     я нажимаю на кнопку "Провести"
 
	Тогда результат проведения корректен
		Когда открылось окно "Поступление товаров * от *"
		И     В текущем окне я нажимаю кнопку командного интерфейса "Остатки товаров"
		Тогда таблица формы с именем "Список" стала равной:
		| 'Период'   | 'Регистратор'  | 'Номер строки' | 'Номенклатура'    |  'Количество' |
		| '*' 		 | '*'            | '1'            | 'Стул'            |   '4,000'     |
		| '*' 		 | '*'            | '2'            | 'Кровать'         |   '2,000'     |
		Когда открылось окно "Поступление товаров * от *"
		И     В текущем окне я нажимаю кнопку командного интерфейса "Себестоимость товара"
		Тогда таблица формы с именем "Список" стала равной:
		| 'Номенклатура'    | 'Номер строки' | 'Регистратор'           | 'Партия'                | 'Период'     | 'Количество' | 'Стоимость' |
		| 'Стул'            | '1'            | '*' 					   | '*' 					 | '*'			| '4,000'      | '4 000,00'  |
		| 'Кровать'         | '2'            | '*' 					   | '*' 					 | '*' 			| '2,000'      | '50 000,00' |




