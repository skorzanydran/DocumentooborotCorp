
&НаСервере
Процедура ВыгрузитьВБПНаСервере()
	Узел = ПланыОбмена.ОбменСБухгалтерией.НайтиПоКоду("БП");
	ИмяФайла = ПолучитьИмяВременногоФайла("xml");
	ЗаписьСообщения = ПланыОбмена.СоздатьЗаписьСообщения();
	Запись = Новый ЗаписьXML;
	Запись.ОткрытьФайл(ИмяФайла);
	ЗаписьСообщения.НачатьЗапись(Запись, Узел);
	Выборка = ПланыОбмена.ВыбратьИзменения(ЗаписьСообщения.Получатель,ЗаписьСообщения.НомерСообщения);
	Пока Выборка.Следующий() Цикл
		Объект = Выборка.Получить();
		ЗаписатьXML(Запись, Объект);
	КонецЦикла;
	ЗаписьСообщения.ЗакончитьЗапись();
	Запись.Закрыть();
КонецПроцедуры

&НаКлиенте
Процедура ВыгрузитьВБП(Команда)
	ВыгрузитьВБПНаСервере();
КонецПроцедуры
