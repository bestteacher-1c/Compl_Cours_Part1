

&НаКлиенте
Процедура Установить(Команда)
	
	Данные = Новый Структура;
	
	Данные.Вставить("КодВалюты", КодВалюты);
	Данные.Вставить("Дата", ДатаДействияКурса);
	Данные.Вставить("Курс", Курс);
	Данные.Вставить("Кратность", Кратность);
	Данные.Вставить("ФИО", ФИООтветственного);
	
	БуквенныйКод = НаСервереМожноВызватьСКлиента.ЗаполнитьКурсВалютыНаДату(Данные);

	Сообщить("Курс валюты " + БуквенныйКод + " установлен");

КонецПроцедуры
