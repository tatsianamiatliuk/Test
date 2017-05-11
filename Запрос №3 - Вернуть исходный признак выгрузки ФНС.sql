-- Запрос №3.
-- Установить признак выгрузки ФНС =«Не выгружен» для решения о списании данного плательщика, которые были выгружены
-- Перед запуском нужно заменить "076029038285" на значение атрибута INSURER_ID из XML.

UPDATE ASV_CANCELLATION_OF_DEBT_PROCESS canc_proc
SET canc_proc.IS_MIGRATED_TO_FNS = 0
WHERE canc_proc.INSURER_ID = 076029038285
      AND canc_proc.DEBT_PROCESS_STATUS_ID = 146 -- Процесс списания в статусе «Задолженность списана» 
with ur;
