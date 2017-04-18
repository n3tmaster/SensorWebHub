# CkanFiller
Module for data syncronization with CKAN platforms

CkanFiller is able to syncronize SWH stations and data with ckan platform, creating new packages and resources.

All data will be grouped day by day and exported into daily resources of CKAN.

CkanFiller works in two modes:

-- procedural mode

it can be launched in a shell or batch file with following parameters:

- 1) StationID: station id (name) that we want to export into CKAN platform (ALL for all stations stored into SWH db)
- 2) Sysadmin ID of CKAN installation: is the hash code of sysadmin (or user with administration properties)
- 3) ownerid: is the owner name, stored in CKAN installation, that will contain all SWH stations and data
- 4) ckan_baseurl: base url of CKAN installation
- 5) swh_baseurl: base url of SWH installation
- 6) swhdb_url: url for SWH postgresql db (jdbc:postgresql://URL/dbname)
- 7) db user: username for SWH postgresql db
- 8) db password: password for SWH postgresql db
- 9) mode:  update_all_statitions - update (or create) new stations and all their data
            init_new_station - create new package from mobile_sensors of SWH and init it with all collected data
            create_all_resources - sync all resource of mobile_station
            create_package - create new package in ckan db from mobile_sensors of Sensor Web Hub


-- Version

0.9 preliminary version



