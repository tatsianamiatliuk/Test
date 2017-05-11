-- Вклад в команду Волна

select  
round(sum(med_marks.MDM_VALUE)/
(
select  
sum (med_marks.MDM_VALUE)*1.0 as summa
from abbott.DAYS as days
left join abbott.WAVES as waves on (days.DAY_ID = waves.WAV_DAY_ID_FK)
left join abbott.MEDICAL_REPRESENTATIVES_TEAMS as mr_teams on (mr_teams.MRTM_WAVE_ID_FK = waves.WAV_ID)
left join abbott.MEDICAL_REPRESENTATIVES_PLAYERS_POSITIONS as mr_player_position on (mr_player_position.MRPP_ID = mr_teams.MRTM_MRPP_ID_FK)
left join abbott.MEDICAL_REPRESENTATIVES_TEAMS_POSITIONS as mr_teams_position on (mr_teams_position.MRTP_ID = mr_player_position.MRPP_MRTP_ID_FK)
left join abbott.SESSIONS as sessions on (sessions.SES_MRPP_ID_FK = mr_player_position.MRPP_ID and sessions.SES_WAVE_ID_FK = waves.WAV_ID)
right join abbott.REPRESENTATIVES_TEAMS_DESCRIPTIONS as mr_descr on (mr_descr.RTD_MR_TEAMS_POSITIONS_FK = mr_teams_position.MRTP_ID and mr_descr.RTD_DAYS_FK = days.DAY_ID)
left join abbott.MEDICINES_MARKS as med_marks on (med_marks.MDN_SESSIONS_ID_FK = sessions.SES_ID)
where
  days.DAY_NUMBER in (1) -- номер дня
  and waves.WAV_ORDER = 1 -- номер волны
  and mr_descr.RTD_NAME = 'Команда 2 День 1'
  and med_marks.MDM_VALUE is not null 
)*100,2) as vklad
from abbott.DAYS as days 
left join abbott.WAVES as waves on (days.DAY_ID = waves.WAV_DAY_ID_FK)
left join abbott.MEDICAL_REPRESENTATIVES_TEAMS as mr_teams on (mr_teams.MRTM_WAVE_ID_FK = waves.WAV_ID)
left join abbott.MEDICAL_REPRESENTATIVES_PLAYERS_POSITIONS as mr_player_position on (mr_player_position.MRPP_ID = mr_teams.MRTM_MRPP_ID_FK)
left join abbott.PLAYERS as players_mr on (players_mr.UTT_PLAYER_ID = mr_teams.MRTM_PLAYER_ID_FK)
left join abbott.USERS as users_mr on (users_mr.USR_ID = players_mr.UTT_USER_ID_FK)
left join abbott.MEDICAL_REPRESENTATIVES_TEAMS_POSITIONS as mr_teams_position on (mr_teams_position.MRTP_ID = mr_player_position.MRPP_MRTP_ID_FK)
left join abbott.SESSIONS as sessions on (sessions.SES_MRPP_ID_FK = mr_player_position.MRPP_ID and sessions.SES_WAVE_ID_FK = waves.WAV_ID)
left join abbott.MEDICINES_MARKS as med_marks on (med_marks.MDN_SESSIONS_ID_FK = sessions.SES_ID)
where
  days.DAY_NUMBER in (1) -- номер дня
  and waves.WAV_ORDER = 1 -- номер волны
  and users_mr.USR_LAST_NAME = 'Барсуков'
  and med_marks.MDM_VALUE is not null 
