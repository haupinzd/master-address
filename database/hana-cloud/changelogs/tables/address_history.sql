create table address_history (

--===============================================
-- [address_history]
--    - Links raw address info to cleansed record in address_master
-- 
--  02.16.2017 - gryskijr - created
--===============================================

  address_id integer not null
  , address_source_type varchar(8) not null
  , address_source_id integer not null
  
  , run_id integer not null
)
;