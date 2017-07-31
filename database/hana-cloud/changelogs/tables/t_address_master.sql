create global temporary table t_address_master (
  
--======================================
-- [t_address_master]
--    - Master address data temporary working table
-- 
--  07.31.2017 - haupinzd - created
--======================================

  address_number integer
  , address_street_prefix_direction varchar(16)
  , address_street_prefix_type varchar(32)
  , address_street_name varchar(32)
  , address_street_suffix_type varchar(32)
  , address_street_suffix_direction varchar(16)
  , address_unit_number varchar(8)
  , address_unit_type varchar(16)
  , address_city varchar(32)
  , address_place varchar(32)
  , address_county varchar(32)
  , address_state varchar(32)
  , address_country varchar(32)
  , address_zip integer
  , address_zip4 integer
  , address varchar(64)
  , address_full varchar(128)
  , address_latitude decimal(12,8)
  , address_longitude decimal(12,8)
  , address_date_created timestamp
  , address_date_modified timestamp
  , address_last_update timestamp
  , address_source varchar(32)
  , address_active tinyint
  , address_hash varchar(32)
  , address_usps_standard varchar(64)
  , address_number_suffix varchar(8)
  , address_building_unit varchar(64)
  , address_history varchar(64)
  , address_description varchar(64)
  , address_type varchar(64)
  --, address_leta_id integer
  , address_source_type varchar(8)
  , address_source_id integer
)
;