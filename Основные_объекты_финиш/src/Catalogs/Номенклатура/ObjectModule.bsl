
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)
	
	Если ТипЗнч(ДанныеЗаполнения) = Тип("Структура") Тогда
		
		Если ДанныеЗаполнения.Свойство("Склад") Тогда
			
			Склад = ДанныеЗаполнения.Склад;
			
		КонецЕсли;
		
	КонецЕсли; 
	
КонецПроцедуры
