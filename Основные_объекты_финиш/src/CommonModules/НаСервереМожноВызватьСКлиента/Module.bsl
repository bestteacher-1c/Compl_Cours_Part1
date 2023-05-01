Функция ПолучитьНаименованиеОрганизации() Экспорт

	Возврат Константы.НазваниеОрганизации.Получить();

КонецФункции // ПолучитьНаименованиеОрганизации()

Функция ЗаполнитьКурсВалютыНаДату(Данные) Экспорт
	
	СсылкаНаВалюту = Справочники.Валюты.НайтиПоКоду(Данные.КодВалюты);

	Если ЗначениеЗаполнено(СсылкаНаВалюту) Тогда

		ЗаписьРегистраСведений = РегистрыСведений.КурсыВалют.СоздатьМенеджерЗаписи();
		ЗаписьРегистраСведений.Период = Данные.Дата;
		ЗаписьРегистраСведений.Валюта = СсылкаНаВалюту;
		ЗаписьРегистраСведений.Курс = Данные.Курс;
		ЗаписьРегистраСведений.Кратность = ?(Данные.Кратность = 0, 1, Данные.Кратность);
		ЗаписьРегистраСведений.Ответственный = Справочники.Сотрудники.НайтиПоНаименованию(Данные.ФИО, Ложь);

		ЗаписьРегистраСведений.Записать();

		СпрВалютыОбъект = СсылкаНаВалюту.ПолучитьОбъект();
		СпрВалютыОбъект.Курс = Данные.Курс;
		СпрВалютыОбъект.Кратность = Данные.Кратность;
		СпрВалютыОбъект.ДатаКурса = Данные.Дата;
		СпрВалютыОбъект.Записать();
		
		Возврат СсылкаНаВалюту.БуквенныйКод;

	КонецЕсли;

КонецФункции


Процедура ЗаменитьОтветственного(СтарыйОтветственный, НовыйОтветственный) Экспорт 

	 Выборка = Справочники.Склады.Выбрать();
	 
	 Пока Выборка.Следующий() Цикл
	 
	 	   Если Выборка.Ответственный = СтарыйОтветственный Тогда
				 
				 СкладОбъект = Выборка.ПолучитьОбъект();
				 
				 СкладОбъект.Ответственный = НовыйОтветственный;
				 
				 СкладОбъект.Записать();
			 
			 КонецЕсли;
	 
	 КонецЦикла;

КонецПроцедуры

Функция СформироватьСписокДолжностей(Подразделение) Экспорт
	
	МассивДолжностей = Новый Массив;
	
	ТЧДолжности = Подразделение.Должности;
	
	Для Каждого ТекСтрока Из ТЧДолжности Цикл
		
		МассивДолжностей.Добавить(ТекСтрока.Должность);
		
	КонецЦикла;
	
	Возврат МассивДолжностей;
	
КонецФункции

// Описание
// 
// Параметры:
// 	СсылкаНаВалюту - СправочникСсылка - Ссылка на справочник "Валюты"
// 	Дата - Дата
// Возвращаемое значение:
// 	Структура - Описание:
// * Курс - Число - 
// * Кратность - Число -
Функция ПолучитьАктуальныеДанныеПоВалюте(СсылкаНаВалюту, Дата) Экспорт

	Вернем = Новый Структура;

	Вернем.Вставить("Курс", 0);

	Вернем.Вставить("Кратность", 0);


	Запрос = Новый Запрос;

	Запрос.Текст =
	"ВЫБРАТЬ
	|	КурсыВалютСрезПоследних.Курс,
	|	КурсыВалютСрезПоследних.Кратность
	|ИЗ
	|	РегистрСведений.КурсыВалют.СрезПоследних(&Дата, Валюта = &СсылкаНаВалюту) КАК КурсыВалютСрезПоследних";

	Запрос.УстановитьПараметр("СсылкаНаВалюту", СсылкаНаВалюту);

	Запрос.УстановитьПараметр("Дата", Дата);

	РезультатЗапроса = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();

	Если (ВыборкаДетальныеЗаписи.Следующий() = Истина) Тогда

		Вернем.Курс = ВыборкаДетальныеЗаписи.Курс;

		Вернем.Кратность = ВыборкаДетальныеЗаписи.Кратность;

	КонецЕсли;

	Возврат Вернем;

КонецФункции // ПолучитьАктуальныеДанныеПоВалюте()
