SensorWeb Hub REST Services for interoperability features.


Supplied capabilities

Download

base url: http://server_ip:8080/swhrest/rest/download



get_geodata_kml: getting geodata of specific station in KML (2.2) format - this format is OGC compliant
                  Data can be obtained on single day or given period

Parameters

from_year:  beginning year
from_month: beginning month
from_day:   beginning day
to_year:    ending year
to_month:   ending month
to_day:     ending day
user_id:    user id
pwd_id:     password
station_id: station id
language:   language applied to labels (it, en, fr)
                  
get_geodata_json: getting geodata of specific station in JSON format
                     Data can be obtained on single day or given period
  

Parameters

from_year:  beginning year
from_month: beginning month
from_day:   beginning day
to_year:    ending year
to_month:   ending month
to_day:     ending day
user_id:    user id
pwd_id:     password
station_id: station id
language:   language applied to labels (it, en, fr)