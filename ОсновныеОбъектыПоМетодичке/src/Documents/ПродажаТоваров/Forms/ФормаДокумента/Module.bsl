
&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	Стр = Элементы.Товары.ТекущиеДанные;
	
	Стр.Сумма = Стр.Количество * Стр.Цена;
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ТоварыНоменклатураПриИзмененииНаСервере(Номенклатура)

	Возврат Номенклатура.ЦенаПродажи;

КонецФункции 

&НаКлиенте
Процедура ТоварыНоменклатураПриИзменении(Элемент)
	
	Стр = Элементы.Товары.ТекущиеДанные;
	
	Стр.Цена = ТоварыНоменклатураПриИзмененииНаСервере(Стр.Номенклатура);
	
	ТоварыКоличествоПриИзменении(Элемент);
		
КонецПроцедуры

&НаСервереБезКонтекста
Функция КонтактноеЛицоПриИзмененииНаСервере(КонтактноеЛицо)

	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	КонтактныеЛица.Владелец
		|ИЗ
		|	Справочник.КонтактныеЛица КАК КонтактныеЛица
		|ГДЕ
		|	КонтактныеЛица.Ссылка = &КонтактноеЛицо";
	
	Запрос.УстановитьПараметр("КонтактноеЛицо", КонтактноеЛицо);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл

		Возврат ВыборкаДетальныеЗаписи.Владелец;
		
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

	
КонецФункции

&НаКлиенте
Процедура КонтактноеЛицоПриИзменении(Элемент)
	
	Объект.Контрагент = КонтактноеЛицоПриИзмененииНаСервере(Объект.КонтактноеЛицо);
	
КонецПроцедуры
