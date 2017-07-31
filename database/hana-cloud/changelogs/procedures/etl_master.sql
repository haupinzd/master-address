alter procedure etl_master

  --======================================
  -- [etl_master]
  --    - Master proc - calls subordinate procedures
  -- 
  --  07.31.2017 - haupinzd - created 
  --======================================

  language sqlscript as
  begin
    truncate table t_address_master;

    insert into t_address_master (
      address_number
      , address_street_prefix_direction
      , address_street_prefix_type
      , address_street_name
      , address_street_suffix_type
      , address_street_suffix_direction
      , address_unit_number
      , address_unit_type
      , address_city
      , address_place
      , address_county
      , address_state
      , address_country
      , address_zip
      , address_zip4
      , address
      , address_full
      , address_latitude
      , address_longitude
      , address_source
      , address_hash
      , address_number_suffix
      , address_building_unit
      , address_history
      , address_description
      , address_type
    )
    select addnum --address_number
      , pre_dir --address_street_prefix_direction
      , pre_type --address_street_prefix_type
      , st_name --address_street_name
      , st_type --address_street_suffix_type
      , pos_dir --address_street_suffix_direction
      , unit --address_unit_number
      , null --address_unit_type
      , municipal --address_city
      , postal_comm --address_place
      , county --address_county
      , state --address_state
      , country --address_country
      , nullif(zip, '') --address_zip
      , nullif(zip4, '') --address_zip4
      , address --address
      , full_addr --address_full
      , nullif(lat, '') --address_latitude
      , null --address_longitude
      , 'LETA' --address_source
      , null address_hash
      , addnum_suf --address_number_suffix
      , building --address_building_unit
      , null address_history
      , loc_notes --address_description
      , place_type --address_type  
    from stage_address_leta
    ;

  end;