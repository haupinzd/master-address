create column table address_dictionary (
  
--========================================================================
-- [address_dictionary]
--    - Provides old/new values for address standardization and correction
-- 
--  07.31.2017 - haupinzd - created
--========================================================================

  dictionary_id integer not null generated by default as identity (start with 1000 increment by 1)
  , text_old  varchar(50)
  , text_new varchar(256)
  , context varchar(64)
)
;

alter table address_dictionary add constraint pk_dictionary_text_context primary key (text_old, context);
alter table address_dictionary add constraint undx_text_context unique (dictionary_id);

