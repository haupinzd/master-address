alter procedure etl_master

  --======================================
  -- [etl_master]
  --    - Master proc - calls subordinate procedures
  -- 
  --  07.31.2017 - haupinzd - created 
  --======================================

  language sqlscript as
    cursor c_cols for 
      select column_name
        from m_temporary_table_columns
        where table_name = 'T_ADDRESS_MASTER'
        order by position
      ;

    cursor c_dict (v_context varchar(64)) for
      select text_old, text_new
        from address_dictionary
        where context = :v_context
        ;

    l_run_id integer;
    l_row_count integer = 0;
  begin
    -- Start run session - keeps track of run IDs, start/end dates
    insert into address_cleanse_runs(start_ts) values (current_timestamp);
    select current_identity_value()
      into l_run_id
      from dummy;

    -- Clear out and load temporary working table (t_address_master):
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
      , address_room
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
      , address_number_suffix
      , address_building_unit
      , address_history
      , address_description
      , address_type

      , address_source_type
      , address_source_id
    )
    select addnum --address_number
      , pre_dir --address_street_prefix_direction
      , pre_type --address_street_prefix_type
      , st_name --address_street_name
      , st_type --address_street_suffix_type
      , pos_dir --address_street_suffix_direction
      , unit --address_unit_number
      , null --address_unit_type
      , room --address_room
      , municipal --address_city
      , postal_comm --address_place
      , county --address_county
      , state --address_state
      , country --address_country
      , nullif(zip, '') --address_zip
      , nullif(zip4, '') --address_zip4
      , address --address
      -- Use address field if full_addr is empty:
      , ifnull(nullif(trim(full_addr), ''), address) --address_full
      , nullif(lat, '') --address_latitude
      , null --address_longitude
      , 'LETA' --address_source
      , addnum_suf --address_number_suffix
      , building --address_building_unit
      , null address_history
      , loc_notes --address_description
      , place_type --address_type  

      , 'LETA' -- address_source_type
      , objectid -- address_source_id
    from stage_address_leta
    where county = 'LARIMER'
    ;

    update t_address_master
      set address_hash = hash_md5(to_binary(address_full) || to_binary(address_unit_number) || to_binary(address_building_unit) || to_binary(address_room) || to_binary(address_city))
      ;

    -- For every column in t_address_master:
    for c as c_cols do      
      -- Select from address_dictionary for text replacements related to that field:
      for d as c_dict(c.column_name) do
        -- Update all old/new values in column:
        execute immediate 'update t_address_master set ' || c.column_name || ' = replace_regexpr(''\b' || d.text_old || '\b'' in ' || c.column_name || ' with ''' || d.text_new || ''')';

        select ::rowcount + l_row_count into l_row_count from dummy;
      end for;
    end for;
    
    close c_dict;

    -- Merge into final address_master here:
    --  ** todo: make this smarter than trunc/reload
    truncate table address_master;
    insert into address_master (
      address_number
      , address_street_prefix_direction
      , address_street_prefix_type
      , address_street_name
      , address_street_suffix_type
      , address_street_suffix_direction
      , address_unit_number
      , address_unit_type
      , address_room
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
      , address_hash
      , address_number_suffix
      , address_building_unit
      , address_history
      , address_description
      , address_type
    )
    select distinct
      first_value(address_number) over (partition by address_hash order by address_source_id desc) as address_number
      , first_value(address_street_prefix_direction) over (partition by address_hash order by address_source_id desc) as address_street_prefix_direction
      , first_value(address_street_prefix_type) over (partition by address_hash order by address_source_id desc) as address_street_prefix_type
      , first_value(address_street_name) over (partition by address_hash order by address_source_id desc) as address_street_name
      , first_value(address_street_suffix_type) over (partition by address_hash order by address_source_id desc) as address_street_suffix_type
      , first_value(address_street_suffix_direction) over (partition by address_hash order by address_source_id desc) as address_street_suffix_direction
      , first_value(address_unit_number) over (partition by address_hash order by address_source_id desc) as address_unit_number
      , first_value(address_unit_type) over (partition by address_hash order by address_source_id desc) as address_unit_type
      , first_value(address_room) over (partition by address_hash order by address_source_id desc) as address_room
      , first_value(address_city) over (partition by address_hash order by address_source_id desc) as address_city
      , first_value(address_place) over (partition by address_hash order by address_source_id desc) as address_place
      , first_value(address_county) over (partition by address_hash order by address_source_id desc) as address_county
      , first_value(address_state) over (partition by address_hash order by address_source_id desc) as address_state
      , first_value(address_country) over (partition by address_hash order by address_source_id desc) as address_country
      , first_value(address_zip) over (partition by address_hash order by address_source_id desc) as address_zip
      , first_value(address_zip4) over (partition by address_hash order by address_source_id desc) as address_zip4
      , first_value(address) over (partition by address_hash order by address_source_id desc) as address
      , first_value(address_full) over (partition by address_hash order by address_source_id desc) as address_full
      , first_value(address_latitude) over (partition by address_hash order by address_source_id desc) as address_latitude
      , first_value(address_longitude) over (partition by address_hash order by address_source_id desc) as address_longitude
      , address_hash
      , first_value(address_number_suffix) over (partition by address_hash order by address_source_id desc) as address_number_suffix
      , first_value(address_building_unit) over (partition by address_hash order by address_source_id desc) as address_building_unit
      , first_value(address_history) over (partition by address_hash order by address_source_id desc) as address_history
      , first_value(address_description) over (partition by address_hash order by address_source_id desc) as address_description
      , first_value(address_type) over (partition by address_hash order by address_source_id desc) as address_type
    from t_address_master
    ;

    update address_master
      set address_street_name_full = address_street_prefix_direction || ' ' || address_street_prefix_type || ' ' || address_street_name || ' ' || address_street_suffix_type || ' ' || address_street_suffix_direction
    ;

    truncate table address_history;
    insert into address_history (address_id, address_source_type, address_source_id, run_id)
    select am.address_id, xam.address_source_type, xam.address_source_id, l_run_id
      from address_master am
      inner join t_address_master xam
        on am.address_hash = xam.address_hash
    ;

    -- end run
    update address_cleanse_runs
      set end_ts = current_timestamp
        , notes = 'Updates: ' || l_row_count
      where run_id = l_run_id
    ;
  end;