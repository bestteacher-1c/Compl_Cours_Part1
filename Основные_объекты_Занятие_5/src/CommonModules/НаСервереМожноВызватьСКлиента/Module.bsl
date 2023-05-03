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
		
		МассивДолжностей.Добавить(ТекСтрока.Должность.Наименование);
		
	КонецЦикла;
	
	Возврат МассивДолжностей;
	
КонецФункции

