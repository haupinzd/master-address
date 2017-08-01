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
    -- Start run session
    insert into address_cleanse_runs(start_ts) values (current_timestamp);
    select current_identity_value()
      into l_run_id
      from dummy;

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

    for c as c_cols do
      insert into debug_messages (msg) values ('inside outer loop - ' || c.column_name);

      --open c_dict(c.column_name);
      
      for d as c_dict(c.column_name) do
        execute immediate 'update t_address_master set ' || c.column_name || ' = replace_regexpr(''\b' || d.text_old || '\b'' in ' || c.column_name || ' with ''' || d.text_new || ''')';
        --execute immediate 'update t_address_master set ' || c.column_name || ' = replace(' || c.column_name || ', ''' || d.text_old || ''', ''' || d.text_new || ''')';

        select ::rowcount + l_row_count into l_row_count from dummy;
      end for;
    end for;

    -- Merge into address_master here

    close c_dict;

    -- end run
    update address_cleanse_runs
      set end_ts = current_timestamp
        , notes = 'Updates: ' || l_row_count
      where run_id = l_run_id
    ;
  end;