Перем мВажноеСообщение;
Перем глНачалоРаботы Экспорт;

Процедура СформироватьВажноеСообщение(Сообщение)

	мВажноеСообщение = Сообщение;

КонецПроцедуры

Процедура ПередНачаломРаботыСистемы(Отказ)
	
	Возврат;
	
	#Область ДЗ_Занятие3
	
	Если ДеньНедели(ТекущаяДата()) > 5 Тогда                                                  
		Отказ = Истина;                                                                       
	Иначе                                                                                     
		Если Час(ТекущаяДата()) < 9 Или Час(ТекущаяДата()) >= 18 Тогда                        
			Отказ = Истина;                                                                  
		КонецЕсли;                                                                            
	КонецЕсли;                                                                                
	                                                                                          
	#КонецОбласти

КонецПроцедуры

Процедура ПриНачалеРаботыСистемы()
	
	глНачалоРаботы = ТекущаяДата();
	
	КлиентскоеПриложение.УстановитьКраткийЗаголовок(НаСервереМожноВызватьСКлиента.ПолучитьНаименованиеОрганизации());
	
	СформироватьВажноеСообщение("Hello, World!");
	
	Сообщить(мВажноеСообщение);

КонецПроцедуры


Процедура ПередЗавершениемРаботыСистемы(Отказ, ТекстПредупреждения)
	
	Возврат;

	#Область ДЗ_Занятие3

	Если Час(ТекущаяДата()) < 18 Тогда                                                        
		                                                                                      
		ТекстПредупреждения = "Ай, ай, ай. Как не стыдно ухoдить с работы раньше 18-00."      
		+ Символы.ПС + " Это нарушение трудового законодательства!";                          
		                                                                                      
		Отказ = Истина;                                                                       
		                                                                                      
	КонецЕсли;

	#КонецОбласти                                                                                
	
КонецПроцедуры












