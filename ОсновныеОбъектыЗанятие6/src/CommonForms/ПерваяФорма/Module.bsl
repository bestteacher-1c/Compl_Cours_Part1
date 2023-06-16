
&НаКлиенте
Процедура ПриОткрытии_(Отказ)
	
	Текст = Формат(ТекущаяДата(),"ДЛФ=DD");
	
	Сообщить(Текст);
	
КонецПроцедуры

&НаКлиенте
Процедура ВремяРаботы(Команда)
	
	ВремяРаботы = ТекущаяДата() - глНачалоРаботы;
	
	Текст = "Система уже работае " + ВремяРаботы + " сек.";
	
	Сообщить(Текст);
	
КонецПроцедуры


&НаКлиенте
Процедура ФамилияПриИзменении(Элемент)

	//ФИО = Фамилия + " " + Имя + " " + Отчество;
	
	ЧастиФИОСписокЗначений = Новый СписокЗначений();
	//Заполняем список значений данными (Фамилия, Имя, Отчество)

	ЧастиФИОСписокЗначений.Добавить(Фамилия, "Фамилия");

	ЧастиФИОСписокЗначений.Добавить(Имя,"Имя");

	ЧастиФИОСписокЗначений.Добавить(Отчество,"Отчество");

	СобратьФИОИзСпискаЗначений(ЧастиФИОСписокЗначений);

КонецПроцедуры

&НаКлиенте
Процедура ИмяПриИзменении(Элемент)

	//ФИО = Фамилия + " " + Имя + " " + Отчество;
	
	ЧастиФИОМассив = Новый Массив;
	//Заполняем массив данными (Фамилия, Имя, Отчество)

	ЧастиФИОМассив.Добавить(Фамилия);

	ЧастиФИОМассив.Добавить(Имя);

	ЧастиФИОМассив.Добавить(Отчество);

	СобратьФИОИзМассива(ЧастиФИОМассив);

КонецПроцедуры

&НаКлиенте
Процедура ОтчествоПриИзменении(Элемент)

	//ФИО = Фамилия + " " + Имя + " " + Отчество;
	
	ЧастиФИОСтруктура = Новый Структура;
	//Заполняем структуру данными (Фамилия, Имя, Отчество)

	ЧастиФИОСтруктура.Вставить("Ф", Фамилия);

	ЧастиФИОСтруктура.Вставить("И", Имя);

	ЧастиФИОСтруктура.Вставить("О", Отчество);

	СобратьФИОИзСтруктуры(ЧастиФИОСтруктура);

КонецПроцедуры

&НаКлиенте
Процедура СобратьФИОИзМассива(М)
	//..Собираем ФИО из массива

	ФИО = М[0] + " " + М[1] + " " + М[2];

КонецПроцедуры

&НаКлиенте
Процедура СобратьФИОИзСтруктуры(С)
	//Собираем ФИО из структуры	

	ФИО = С.Ф + " " + С.И + " " + С.О;

КонецПроцедуры

&НаКлиенте
Процедура СобратьФИОИзСпискаЗначений(СЗ)
	//Собираем ФИО из Списка значений	

	ФИО = СЗ[0].Значение + " " + СЗ[1].Значение + " " + СЗ[2].Значение;

КонецПроцедуры

&НаКлиенте
Процедура ФИОПриИзменении(Элемент)
	
	Строка_ФИО = СокрЛП(ФИО);
	
	// Удаляем лишние пробелы внутри ФИО:
	Пока СтрЧислоВхождений(Строка_ФИО, "  ") > 0 Цикл
		Строка_ФИО = СтрЗаменить(Строка_ФИО, "  ", " ");
	КонецЦикла; 
	
	//Заменяем внутренние пробелы на символы перевода строки
	//Например: Иванов Иван Иванович будет заменен на:
	//Иванов
	//Иван
	//Иванович
	Строка_ФИО = СтрЗаменить(Строка_ФИО, " ", Символы.ПС);
	
	//Получаем части ФИО с указанных строк многострочныой строки
	Фамилия 	= СтрПолучитьСтроку(Строка_ФИО, 1);
	Имя			= СтрПолучитьСтроку(Строка_ФИО, 2);
	Отчество 	= СтрПолучитьСтроку(Строка_ФИО, 3);
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ФИО = Параметры.ФИО;

КонецПроцедуры

