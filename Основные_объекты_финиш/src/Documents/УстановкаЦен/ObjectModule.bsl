

Процедура ОбработкаПроведения(Отказ, Режим)

	Движения.НашиЦены.Записывать = Истина;
	
	Для Каждого ТекСтрокаЦены Из Цены Цикл
			
			Движение = Движения.НашиЦены.Добавить();
			
			Движение.Период = Дата;
			
			Движение.Номенклатура = ТекСтрокаЦены.Номенклатура;
			Движение.Контрагент = Контрагент;
			
			Движение.Цена = ТекСтрокаЦены.Цена;

	КонецЦикла;
	


КонецПроцедуры



