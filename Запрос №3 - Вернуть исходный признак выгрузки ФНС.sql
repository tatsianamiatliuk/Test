-- ������ �3.
-- ���������� ������� �������� ��� =��� �������� ��� ������� � �������� ������� �����������, ������� ���� ���������
-- ����� �������� ����� �������� "076029038285" �� �������� �������� INSURER_ID �� XML.

UPDATE ASV_CANCELLATION_OF_DEBT_PROCESS canc_proc
SET canc_proc.IS_MIGRATED_TO_FNS = 0
WHERE canc_proc.INSURER_ID = 076029038285
      AND canc_proc.DEBT_PROCESS_STATUS_ID = 146 -- ������� �������� � ������� �������������� ������� 
with ur;
