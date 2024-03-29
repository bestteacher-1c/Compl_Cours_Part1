
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)

	ДанныеПоВалюте = ПолучитьДанныеПоВалюте(ПараметрКоманды);
	
	Сообщить("Наименование валюты " + ДанныеПоВалюте.Наименование);
	Сообщить("Код валюты " + ДанныеПоВалюте.Код);
	Сообщить("Буквенный код валюты " + ДанныеПоВалюте.БуквенныйКод);

КонецПроцедуры

&НаСервере
Функция ПолучитьДанныеПоВалюте(Параметры)
	
	ДанныеПоВалюте = Новый Структура;
	
	ДанныеПоВалюте.Вставить("Наименование", Параметры.Наименование);
	ДанныеПоВалюте.Вставить("Код", Параметры.Код);
	ДанныеПоВалюте.Вставить("БуквенныйКод", Параметры.БуквенныйКод);
	
	Возврат ДанныеПоВалюте;
		
КонецФункции