--===================================================
-- [address_dictionary_load]
--    - Seeds initial value for address dictionary / translation
-- 
--  07.31.2017 - haupinzd - created
--===================================================

upsert address_dictionary (text_old, text_new, context)
select 'US' as text_old, 'UNITED STATES' as text_new, 'COUNTRY' as context from dummy

union all select 'CO' as text_old, 'COLORADO' as text_new, 'STATE' as context from dummy

union all select 'N' as text_old, 'NORTH' as text_new, 'STREET PREFIX DIRECTION' as context from dummy
union all select 'S' as text_old, 'SOUTH' as text_new, 'STREET PREFIX DIRECTION' as context from dummy
union all select 'E' as text_old, 'EAST' as text_new, 'STREET PREFIX DIRECTION' as context from dummy
union all select 'W' as text_old, 'WEST' as text_new, 'STREET PREFIX DIRECTION' as context from dummy
union all select 'NE' as text_old, 'NORTH EAST' as text_new, 'STREET PREFIX DIRECTION' as context from dummy
union all select 'NW' as text_old, 'NORTH WEST' as text_new, 'STREET PREFIX DIRECTION' as context from dummy
union all select 'SE' as text_old, 'SOUTH EAST' as text_new, 'STREET PREFIX DIRECTION' as context from dummy
union all select 'SW' as text_old, 'SOUTH WEST' as text_new, 'STREET PREFIX DIRECTION' as context from dummy

union all select 'WCRD' as text_old, 'WELD COUNTY ROAD' as text_new, 'STREET PREFIX TYPE' as context from dummy
union all select 'WCR' as text_old, 'WELD COUNTY ROAD' as text_new, 'STREET PREFIX TYPE' as context from dummy
union all select 'STHY' as text_old, 'STHY' as text_new, 'STREET PREFIX TYPE' as context from dummy
union all select 'LCR' as text_old, 'LARIMER COUNTY ROAD' as text_new, 'STREET PREFIX TYPE' as context from dummy
union all select 'HWY' as text_old, 'HIGHWAY' as text_new, 'STREET PREFIX TYPE' as context from dummy
union all select 'FRD' as text_old, 'FOREST ROAD' as text_new, 'STREET PREFIX TYPE' as context from dummy
union all select 'CR' as text_old, 'COUNTY ROAD' as text_new, 'STREET PREFIX TYPE' as context from dummy
union all select 'CORD' as text_old, 'COUNTY ROAD' as text_new, 'STREET PREFIX TYPE' as context from dummy
union all select 'CALLE' as text_old, 'CALLE' as text_new, 'STREET PREFIX TYPE' as context from dummy

union all select 'WY' as text_old, 'WAY' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'VIRT' as text_old, 'VIRTUAL' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'TRL' as text_old, 'TRAIL' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'TER' as text_old, 'TERRACE' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'ST' as text_old, 'STREET' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'SQ' as text_old, 'SQUARE' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'RUN' as text_old, 'RUN' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'RDG' as text_old, 'RIDGE' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'RD' as text_old, 'ROAD' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'PT' as text_old, 'POINT' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'PL' as text_old, 'PLACE' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'PKWY' as text_old, 'PARKWAY' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'ML' as text_old, 'MALL' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'LNDG' as text_old, 'LANDING' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'LN' as text_old, 'LANE' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'HWY' as text_old, 'HIGHWAY' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'HBR' as text_old, 'HARBOR' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'DR' as text_old, 'DRIVE' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'CYN' as text_old, 'CANYON' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'CV' as text_old, 'COVE' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'CT' as text_old, 'COURT' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'CRSE' as text_old, 'COURSE' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'CIR' as text_old, 'CIRCLE' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'BND' as text_old, 'BEND' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'BLVD' as text_old, 'BOULEVARD' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'BAY' as text_old, 'BAY' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'AVE' as text_old, 'AVENUE' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'AV' as text_old, 'AVENUE' as text_new, 'STREET SUFFIX TYPE' as context from dummy
union all select 'ALY' as text_old, 'ALLEY' as text_new, 'STREET SUFFIX TYPE' as context from dummy

union all select 'N' as text_old, 'NORTH' as text_new, 'STREET SUFFIX DIRECTION' as context from dummy
union all select 'S' as text_old, 'SOUTH' as text_new, 'STREET SUFFIX DIRECTION' as context from dummy
union all select 'E' as text_old, 'EAST' as text_new, 'STREET SUFFIX DIRECTION' as context from dummy
union all select 'W' as text_old, 'WEST' as text_new, 'STREET SUFFIX DIRECTION' as context from dummy
union all select 'NE' as text_old, 'NORTH EAST' as text_new, 'STREET SUFFIX DIRECTION' as context from dummy
union all select 'NW' as text_old, 'NORTH WEST' as text_new, 'STREET SUFFIX DIRECTION' as context from dummy
union all select 'SE' as text_old, 'SOUTH EAST' as text_new, 'STREET SUFFIX DIRECTION' as context from dummy
union all select 'SW' as text_old, 'SOUTH WEST' as text_new, 'STREET SUFFIX DIRECTION' as context from dummy

union all select 'EXT' as text_old, 'EXIT' as text_new, 'UNIT' as context from dummy
union all select 'RECPT' as text_old, 'RECEPTION' as text_new, 'UNIT' as context from dummy
union all select 'CSUPD' as text_old, 'COLORADO STATE UNIVERSITY POLICE DEPARTMENT' as text_new, 'UNIT' as context from dummy
union all select 'CONF' as text_old, 'CONFERENCE' as text_new, 'UNIT' as context from dummy
union all select 'APT' as text_old, 'APARTMENT' as text_new, 'UNIT' as context from dummy
union all select 'BLD' as text_old, 'BUILDING' as text_new, 'UNIT' as context from dummy
union all select 'BLDG' as text_old, 'BUILDING' as text_new, 'UNIT' as context from dummy
union all select 'RM' as text_old, 'ROOM' as text_new, 'UNIT' as context from dummy
union all select 'SUIT' as text_old, 'SUITE' as text_new, 'UNIT' as context from dummy
union all select 'UNIT' as text_old, 'UNIT' as text_new, 'UNIT' as context from dummy
union all select 'FL' as text_old, 'FLOOR' as text_new, 'UNIT' as context from dummy
union all select 'FLR' as text_old, 'FLOOR' as text_new, 'UNIT' as context from dummy
union all select 'BSMT' as text_old, 'BASEMENT' as text_new, 'UNIT' as context from dummy
union all select 'MANG' as text_old, 'MANAGEMENT' as text_new, 'UNIT' as context from dummy
union all select 'COTT' as text_old, 'COTTAGE' as text_new, 'UNIT' as context from dummy
union all select 'LVLD' as text_old, 'LOVELAND' as text_new, 'UNIT' as context from dummy
union all select 'CTR' as text_old, 'CENTER' as text_new, 'UNIT' as context from dummy
union all select 'VM' as text_old, 'VM' as text_new, 'UNIT' as context from dummy
union all select 'TRLR' as text_old, 'TRAILER' as text_new, 'UNIT' as context from dummy
union all select 'TOPFLR' as text_old, 'TOP FLOOR' as text_new, 'UNIT' as context from dummy

union all select 'ELEM' as text_old, 'ELEMENTRY' as text_new, 'DESCRIPTION' as context from dummy
union all select 'MS' as text_old, 'MIDDLE SCHOOL' as text_new, 'DESCRIPTION' as context from dummy
union all select 'HS' as text_old, 'HIGH SCHOOL' as text_new, 'DESCRIPTION' as context from dummy
union all select 'VOC' as text_old, 'VOCATIONAL' as text_new, 'DESCRIPTION' as context from dummy
union all select 'ED' as text_old, 'EDUCATION' as text_new, 'DESCRIPTION' as context from dummy
union all select 'VTH' as text_old, 'VET TECHNICAL HOSPITAL' as text_new, 'DESCRIPTION' as context from dummy
union all select 'VERNS' as text_old, 'VERNS' as text_new, 'DESCRIPTION' as context from dummy
union all select 'MHP' as text_old, 'MOBILE HOME PARK' as text_new, 'DESCRIPTION' as context from dummy
union all select 'UNIV' as text_old, 'UNIVERSITY' as text_new, 'DESCRIPTION' as context from dummy
union all select 'UCA' as text_old, 'UNIVERSITY CENTER FOR THE ARTS' as text_new, 'DESCRIPTION' as context from dummy
union all select 'TILT' as text_old, 'THE INSTITUTE FOR LEARNING AND TEACHING' as text_new, 'DESCRIPTION' as context from dummy
union all select 'REC' as text_old, 'RECREATION' as text_new, 'DESCRIPTION' as context from dummy
union all select 'RV' as text_old, 'RECREATIONAL VEHICLE' as text_new, 'DESCRIPTION' as context from dummy
union all select 'KOA' as text_old, 'KAMPGROUNDS OF AMERICA' as text_new, 'DESCRIPTION' as context from dummy
union all select 'RIC' as text_old, 'RESEARCH INNOVATION CENTER' as text_new, 'DESCRIPTION' as context from dummy
union all select 'PSAP' as text_old, 'PUBLIC-SAFETY ANSWERING POINT' as text_new, 'DESCRIPTION' as context from dummy
union all select 'PERC' as text_old, 'THE PLANT ENVIRONMENTAL RESEARCH CENTER' as text_new, 'DESCRIPTION' as context from dummy
union all select 'NUM' as text_old, 'NUMBER' as text_new, 'DESCRIPTION' as context from dummy
union all select 'NRRL' as text_old, 'NATURAL RESOURCES RESEARCH LAB' as text_new, 'DESCRIPTION' as context from dummy
union all select 'NRRC' as text_old, 'NATURAL RESOURCES RESEARCH CENTER' as text_new, 'DESCRIPTION' as context from dummy
union all select 'NESB' as text_old, 'NATURAL AND ENVIRONMENTAL SERVICES BUILDING' as text_new, 'DESCRIPTION' as context from dummy
union all select 'MRB' as text_old, 'MOLECULAR RADIOLOGICAL BIOSCIENCES' as text_new, 'DESCRIPTION' as context from dummy
union all select 'SVC' as text_old, 'SERVICES' as text_new, 'DESCRIPTION' as context from dummy
union all select 'SCI' as text_old, 'SCIENCES' as text_new, 'DESCRIPTION' as context from dummy
union all select 'MERC' as text_old, 'MERC' as text_new, 'DESCRIPTION' as context from dummy
union all select 'ADDR' as text_old, 'ADDRESS' as text_new, 'DESCRIPTION' as context from dummy
union all select 'GSB' as text_old, 'GENERAL SERVICES BUILDING' as text_new, 'DESCRIPTION' as context from dummy
union all select 'ERL' as text_old, 'EQUINE REPRODUCTION LABORATORY' as text_new, 'DESCRIPTION' as context from dummy
union all select 'ERC' as text_old, 'ENGINEERING RESEARCH CENTER' as text_new, 'DESCRIPTION' as context from dummy
union all select 'ENSR' as text_old, 'ENSR' as text_new, 'DESCRIPTION' as context from dummy
union all select 'CSFS' as text_old, 'COLORADO STATE FOREST SERVICES' as text_new, 'DESCRIPTION' as context from dummy
union all select 'CLP' as text_old, 'CACHE LA POUDRE' as text_new, 'DESCRIPTION' as context from dummy
union all select 'CIRA' as text_old, 'COOPERATIVE INSTITUTE FOR RESEARCH IN THE ATMOSPHERE' as text_new, 'DESCRIPTION' as context from dummy
union all select 'CDC' as text_old, 'CENTER FOR DISEASE CONTROL AND PREVENTION' as text_new, 'DESCRIPTION' as context from dummy
union all select 'BRB' as text_old, 'BIO-ENVIRONMENTAL RESEARCH BUILDING' as text_new, 'DESCRIPTION' as context from dummy
union all select 'FCLTY' as text_old, 'FACILITY' as text_new, 'DESCRIPTION' as context from dummy
union all select 'ATS' as text_old, 'ATMOSPHERIC SCIENCE' as text_new, 'DESCRIPTION' as context from dummy
union all select 'ATMOS' as text_old, 'ATMOSPHERIC' as text_new, 'DESCRIPTION' as context from dummy
union all select 'ARBL' as text_old, 'ANIMAL REPRODUCTION & BIOTECHNOLOGY LABORATORY' as text_new, 'DESCRIPTION' as context from dummy
union all select 'AZ' as text_old, 'ANATOMY - ZOOLOGY' as text_new, 'DESCRIPTION' as context from dummy
;