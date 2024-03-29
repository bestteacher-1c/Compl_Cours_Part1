
&НаСервере
Процедура ПолучитьДанныеНаСервере()

	Отбор = Новый Структура("Валюта", Объект.Валюта);
	
	ВыборкаКурсов = РегистрыСведений.КурсыВалют.Выбрать(,Дата,Отбор);
	
	Результат = "";
	
	Пока ВыборкаКурсов.Следующий() Цикл
	
		Результат = Результат + Строка(ВыборкаКурсов.Курс) + "; ";
		
	
	КонецЦикла; 
	
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьДанные(Команда)
	ПолучитьДанныеНаСервере();
КонецПроцедуры

&НаСервере
Процедура ПолучитьКурсНаСервере()
	
	Отбор = Новый Структура("Валюта", Объект.Валюта);
	
	Запись = РегистрыСведений.КурсыВалют.ПолучитьПоследнее(Дата,Отбор);
	
	Результат = Строка(Запись.Курс) + " : " + Строка(Запись.Кратность);
	
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьКурс(Команда)
	ПолучитьКурсНаСервере();
КонецПроцедуры

&НаСервере
Процедура КурсЗапросомНаСервере()
	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	КурсыВалютСрезПоследних.Период,
		|	КурсыВалютСрезПоследних.Курс,
		|	КурсыВалютСрезПоследних.Кратность
		|ИЗ
		|	РегистрСведений.КурсыВалют.СрезПоследних(&Дата, Валюта = &Валюта) КАК КурсыВалютСрезПоследних";
	
	Запрос.УстановитьПараметр("Валюта", Объект.Валюта);
	Запрос.УстановитьПараметр("Дата", Дата);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл

		Результат = Строка(ВыборкаДетальныеЗаписи.Курс) + " : " + Строка(ВыборкаДетальныеЗаписи.Кратность);
		
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

	
	
КонецПроцедуры

&НаКлиенте
Процедура КурсЗапросом(Команда)
	КурсЗапросомНаСервере();
КонецПроцедуры
