
&НаКлиенте
Процедура ПолучитьКурс(Команда)
	
	АктуальныеДанныеПоВалюте = 
	ОбщийМодульНаСервереМожноВызватьСКлиента.ПолучитьАктуальныеДанныеПоВалюте( 
	Элементы.Список.ТекущаяСтрока, ТекущаяДата());
	
	Курс = АктуальныеДанныеПоВалюте.Курс;
	Кратность = АктуальныеДанныеПоВалюте.Кратность;
	
	СтруктураСДаннымиТекущейСтроки = Элементы.Список.ТекущиеДанные;
	//Элементы.Список.ТекущаяСтрока - Здесь получим ссылку.
	
	БуквенныйКод = СтруктураСДаннымиТекущейСтроки.БуквенныйКод;
	
	Текст = "Курс валюты " + БуквенныйКод + " на сегодня составляет "
	+ Курс + " руб. за " + Кратность + " ед.";
	
	ПоказатьПредупреждение(
	Новый ОписаниеОповещения("ПолучитьКурсЗавершение", ЭтотОбъект)
	, Текст , 10 , "Сегодня " + ТекущаяДата() );
	
	
КонецПроцедуры

&НаКлиенте
Процедура ПолучитьКурсЗавершение(ДополнительныеПараметры) Экспорт
	
	ПоказатьОповещениеПользователя("Курс показан");
	
КонецПроцедуры




