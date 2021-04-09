﻿
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	КлючОбъекта  = "ОбработкаНастройкаИнтеграции";
	КлючНастроек = "УРЛСервиса";
	
	ДанныеПонастройкамИнтеграции = ХранилищеОбщихНастроек.Загрузить(КлючОбъекта, КлючНастроек);

	Если ДанныеПонастройкамИнтеграции <> Неопределено Тогда
		Если ДанныеПонастройкамИнтеграции.Количество() > 0 Тогда  
			АдресУчетнойСистемы = ?(ДанныеПонастройкамИнтеграции.Количество() >= 1, ДанныеПонастройкамИнтеграции[0], "");
			Логин = ?(ДанныеПонастройкамИнтеграции.Количество() >= 2, ДанныеПонастройкамИнтеграции[1], "");
			Пароль = ?(ДанныеПонастройкамИнтеграции.Количество() >= 3, ДанныеПонастройкамИнтеграции[2], "");
		КонецЕсли;
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ЗаписатьИЗакрыть(Команда)
	СохранитьНастройкиИнтеграции();
	ЭтаФорма.Закрыть();
КонецПроцедуры

&НаСервере
Процедура СохранитьНастройкиИнтеграции()

	КлючОбъекта  = "ОбработкаНастройкаИнтеграции";
	КлючНастроек = "УРЛСервиса";
		
	НастройкиИнтеграции = Новый Массив;
	НастройкиИнтеграции.Добавить(АдресУчетнойСистемы);
	НастройкиИнтеграции.Добавить(Логин);
	НастройкиИнтеграции.Добавить(Пароль);
	
	ХранилищеОбщихНастроек.Сохранить(КлючОбъекта, КлючНастроек, НастройкиИнтеграции);
	
КонецПроцедуры

&НаКлиенте
Процедура Логирование(Команда)
	ОткрытьФорму("РегистрСведений.ЛогиЗапросов.Форма.ФормаСписка",,,,,,, РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
КонецПроцедуры

&НаКлиенте
Процедура НастройкаОтбораПодразделенийОрганиазций(Команда)
	ОткрытьФорму("Справочник.Расш1_ЗУПСправочник1НастройкиОтбора.ФормаСписка",,,,,,, РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);	
КонецПроцедуры
