-- Обновить дату создания справки ПФР на дату, меньшую текущей

update ASV_EC_REFERENCE_PFR
set EC_REFERENCE_PFR_CREATE_DATE = '2016-11-18 00:00:00'
where EC_REFERENCE_PFR_NUMBER = '506P02160047897';