package it.cnr.ibimet.ckan_filler;

import it.cnr.ibimet.dbutils.TDBManager;
import it.lr.libs.DBManager;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;


/**
 * Created by lerocchi on 20/03/17.
 */
public class CkanFiller {

    //procedure consts
    private final static String REST_BASE_URL = "/api/3/action/";
    private final static String PACKAGE_CREATE = "package_create";
    private final static String PACKAGE_SHOW = "package_show";
    private final static String RESOURCE_CREATE = "resource_create";
    private final static String SWHREST_KML_BASE_URL = "/swhrest/rest/download/get_geodata_kml1?";
    private final static String SWHREST_CSV_BASE_URL = "/swhrest/rest/download/get_geodata_csv1?";
    private final static String SWHREST_STATION_ID = "station_id";
    private final static String SWHREST_DAY = "day";
    private final static String SWHREST_MONTH = "month";
    private final static String SWHREST_YEAR = "year";
    private final static String SWHREST_CREDENTIAL = "user_id=guest&pwd_id=guest";
    private final static String SWHREST_LANG = "language=it";
    private final static String NAME_SUFFIX = "_id_v4";
    private final static String KML_FORMAT = "KML";
    private final static String CSV_FORMAT = "CSV";
    //input parameters
    private final static String CREATE_PACKAGE = "create_package";
    private final static String INIT_NEW_STATION = "init_new_station";
    private final static String CREATE_ALL_RESOURCES = "create_all_resources";
    private final static String UPDATE_ALL_STATIONS = "update_all_stations";
    private final static String CCBY = "cc-by";
    private final String MOBILE_DATA_TABLE = "dati";
    private final String STATIC_DATA_TABLE = "dati_stazioni_fisse";
    private final String EDDY_DATA_TABLE = "dati_eddy";
    private String station_name;
    private String auth_id;
    private String owner;
    private String base_url;
    private String package_id;
    private int id_mobile_station;
    private String table_type;
    private String swhrest_base_url;
    private String mantainer, mantainer_email;
    private GregorianCalendar gdata;
    private String dbcontext;
    private String dburl;
    private String dbpass;
    private String dbuser;


    public CkanFiller(String station_name, String auth_id, String owner,
                      String base_url, String swhrest_base_url,
                      String dburl, String dbuser, String dbpass){



        this.station_name = station_name;
        this.auth_id = auth_id;
        this.owner = owner;
        this.base_url = base_url;
        this.swhrest_base_url = swhrest_base_url;
        this.dburl = dburl;
        this.dbuser = dbuser;
        this.dbpass = dbpass;
        this.dbcontext = "";

    }

    // constructor used by J2EE services
    // it uses context name in order to retrieve postgresql information
    public CkanFiller(String station_name, String auth_id, String owner,
                      String base_url, String swhrest_base_url,
                      String dbcontex){



        this.station_name = station_name;
        this.auth_id = auth_id;
        this.owner = owner;
        this.base_url = base_url;
        this.swhrest_base_url = swhrest_base_url;
        this.dbcontext = dbcontex;

    }

    /**
     *
     *
     * @param: station_name : station_id (ALL if you want to load all stations' data)
     * @param: authorization : auth_id
     * @param: owner : owner
     * @param: base_url : base url of CKAN installation
     * @param: swhrest_base_url : base url of SensorWeb Hub restful api
     * @param: dburl : dburl of SensorWeb Hub db
     * @param: dbuser : username for db access
     * @param: dbpass : password for db access
     * @param: mode : create_package - create new package in ckan db from mobile_sensors of Sensor Web Hub
     *              : create_all_resources - sync all resource of mobile_station
     *              : init_new_station - create new package from mobile_sensors of SWH and init it with all collected data
     *              : update_all_stations - sync today data of existing stations. if it doesn't exist it will be created in ckan database with all resources
     *
     * @throws: Exception
     */
    public static void main(String[] args) throws Exception {

        if(args.length != 9){
            System.out.println("Parameter error");
        }else{
            CkanFiller cf = new CkanFiller(args[0], args[1], args[2], args[3],args[4],args[5],args[6],args[7]);


            try{
                if(args[8].toLowerCase().matches(INIT_NEW_STATION) || args[8].toLowerCase().matches(CREATE_ALL_RESOURCES)){
                    //check station existance
                    if(cf.checkExists()){
                        //it exists : now sync data
                        cf.createAllResources();

                    }else{
                        if(cf.createPackage()==0){

                            cf.createAllResources();

                        }
                    }
                }else if(args[8].toLowerCase().matches(UPDATE_ALL_STATIONS)){
                    cf.updateAllStations();
                }else if(args[8].toLowerCase().matches(CREATE_PACKAGE)){
                    if(cf.checkExists()){
                        System.out.println("Dataset exists");
                    }else{
                        cf.createPackage();

                        System.out.println("New dataset created");
                    }
                }


            }catch(Exception ex){
                System.out.println(ex.getMessage());

                System.out.println("CKAN_FILLER for SensorWebHub platform");
                System.out.println("USAGE:  java -jar ./ckan_filler.jar station_id auth_id owner base_url dburl dbuser dbpass mode \t\t\n" );
                System.out.println("OPTIONS: ");
                System.out.println("station_id: name of mobile_station stored into SensorWebHub Database");
                System.out.println("auth_id: authorization id of the user who registered into ckan database");
                System.out.println("owner: organization id of datasets");
                System.out.println("base_url: base url of CKAN installation");
                System.out.println("swhrest_base_url: base url of SensorWeb Hub RESTful API");
                System.out.println("dburl: SensorWeb Hub database url (PostgreSQL) ");
                System.out.println("dbuser: username for SWH database");
                System.out.println("dbpass: password for SWH database");
                System.out.println("mode: type of operation:");
                System.out.println("\t\tcreate_package: create new dataset from specific station_id stored into SWH database");
                System.out.println("\t\tcreate_all_resources: create all resources of specific mobile_station");
                System.out.println("\t\tinit_new_station: create new dataset and init it bringing all data (daily)");
                System.out.println("\t\tupdate_all_stations: update data of existing stations, automatically. if it doesn't exist it will be created in ckan database with all resources");

            }finally{

            }
        }





        //

        return;
    }

    /**
     *
     * checkExists: check is the packageid is exists
     *
     * @return true : yes it exists
     *         false : no it doesn't
     */

    public boolean checkExists(){
        TDBManager tdb=null;


        try {
            JSONObject json = new JSONObject();
            String url = base_url + REST_BASE_URL + PACKAGE_SHOW;
            json.put("id",station_name.toLowerCase()+NAME_SUFFIX);

            //send json structure for package creation process
            JSONObject retData = sendPost(json, url);

            //Check success or failure
            if(retData.getBoolean("success")){
                System.out.println("Package exists");
                package_id = retData.getJSONObject("result").getString("id");
                return true;
            }else{
                System.out.println("Package doesn't exist");

                return false;
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.err.println(e.getMessage());
            e.printStackTrace();
        }finally{

        }



        return true;
    }

    /**
     * setLastUpdate: save last data's timestamp of last processed station
     *
     * @return 0: ok
     * @return -1: error
     */
    public int setLastUpdate(){
        TDBManager tdb=null;
        GregorianCalendar lastdata=null;

        try {

            if(dbcontext.matches("")){
                tdb = new TDBManager("org.postgresql.Driver", this.dburl, this.dbuser, this.dbpass);
            }else{
                tdb = new TDBManager(dbcontext);
            }

            tdb.openConnection();
            String url_of_resource_kml = "", url_of_resource_csv = "";


            //get last date of this station
            String sqlString = "select max(data) " +
                    "from " + table_type + " "+
                    "where id_mobile_station = ? ";

            tdb.setPreparedStatementRef(sqlString);
            tdb.setParameter(DBManager.ParameterType.INT,""+ id_mobile_station,1);

            tdb.runPreparedQuery();

            if(tdb.next()){
                lastdata = tdb.getData(1);
            }

            //update last_update field in mobile_stations table

            sqlString = "update mobile_stations set last_update=? where id_mobile_station = ?";


            tdb.setPreparedStatementRef(sqlString);
            tdb.setParameter(DBManager.ParameterType.DATE,lastdata,1);

            tdb.setParameter(DBManager.ParameterType.INT,""+ id_mobile_station,2);
            tdb.performInsert();

            System.out.println("Last timestamp updated");

        }catch (Exception e){
            System.out.println(e.getMessage());
            System.err.println(e.getMessage());

            e.printStackTrace();
        }finally{
            try{
                tdb.closeConnection();
            }catch(Exception e){
                System.out.println(e.getMessage());
                System.err.println(e.getMessage());
                e.printStackTrace();
            }
        }

        return 0;
    }

    /**
     * createAllResources: create resources for all data of package
     *
     * @return 0: ok
     * @return -1: error
     */

    public int createAllResources(){
        TDBManager tdb=null;
        String monthString, dayString;

        try {
            if(dbcontext.matches("")){
                tdb = new TDBManager("org.postgresql.Driver", this.dburl, this.dbuser, this.dbpass);
            }else{
                tdb = new TDBManager(dbcontext);
            }


            tdb.openConnection();
            String url_of_resource_kml = "", url_of_resource_csv = "";

            String sqlString = "select distinct extract(day from data) as \"day\", " +
                    "extract(month from data) as \"month\", " +
                    "extract(year from data) as \"year\" " +
                    "from " + table_type + " "+
                    "where id_mobile_station = ? AND " +
                    "data > ? "+
                    "order by 3,2,1";

            tdb.setPreparedStatementRef(sqlString);
            tdb.setParameter(DBManager.ParameterType.INT,""+ id_mobile_station,1);
            tdb.setParameter(DBManager.ParameterType.DATE,gdata,2);
            tdb.runPreparedQuery();
            String url = base_url + REST_BASE_URL + RESOURCE_CREATE;
            //create json structure
            JSONObject json = new JSONObject();
            json.put("package_id",package_id);
            json.put("description"," ");

            json.put("url"," ");

            while(tdb.next()){

                json.remove("url");
                json.remove("description");
                json.remove("name");


                if(tdb.getString(2).length()<2){
                    monthString = "0"+tdb.getString(2);
                }else{
                    monthString = tdb.getString(2);
                }

                if(tdb.getString(1).length()<2){
                    dayString = "0"+tdb.getString(1);
                }else{
                    dayString = tdb.getString(1);
                }


                url_of_resource_kml = swhrest_base_url+SWHREST_KML_BASE_URL+SWHREST_YEAR+"="+tdb.getString(3)+"&"+
                                SWHREST_MONTH+"="+tdb.getString(2)+"&"+
                                SWHREST_DAY+"="+tdb.getString(1)+"&"+
                                SWHREST_STATION_ID+"="+station_name+"&"+
                                SWHREST_CREDENTIAL+"&"+SWHREST_LANG;


                url_of_resource_csv = swhrest_base_url+SWHREST_CSV_BASE_URL+SWHREST_YEAR+"="+tdb.getString(3)+"&"+
                        SWHREST_MONTH+"="+tdb.getString(2)+"&"+
                        SWHREST_DAY+"="+tdb.getString(1)+"&"+
                        SWHREST_STATION_ID+"="+station_name+"&"+
                        SWHREST_CREDENTIAL+"&"+SWHREST_LANG;

                json.put("description",dayString+"-"+monthString+"-"+tdb.getString(3));
                json.put("url",url_of_resource_kml);
                json.put("format","KML");
                json.put("name","Data of "+dayString+"-"+monthString+"-"+tdb.getString(3));

                //send json structure for package creation process
                JSONObject retData = sendPost(json, url);

                //Check success or failure
                if(retData.getBoolean("success")){
                    System.out.println("Resource KML created. Id: "+retData.getJSONObject("result").getString("id"));

                }else{
                    System.out.println("Resource KML Creation Error: ");
                    System.out.println("======================= ");
                    System.out.println(retData.toString());

                    tdb.closeConnection();

                    return -1;
                }


                //prepare CSV resource
                json.remove("url");
                json.put("url",url_of_resource_csv);
                json.remove("format");
                json.put("format","CSV");
                retData = sendPost(json, url);

                //Check success or failure
                if(retData.getBoolean("success")){
                    System.out.println("Resource CSV created. Id: "+retData.getJSONObject("result").getString("id"));

                }else{
                    System.out.println("Resource CSV Creation Error: ");
                    System.out.println("======================= ");
                    System.out.println(retData.toString());

                    tdb.closeConnection();

                    return -1;
                }

            }

            return 0;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.err.println(e.getMessage());
            e.printStackTrace();
        }finally{
            try{
                tdb.closeConnection();
            }catch(Exception e){
                System.out.println(e.getMessage());
                System.err.println(e.getMessage());
                e.printStackTrace();
            }
        }

        return 0;
    }

    /**
     * updateAllStations: update data (add new resource) for each station
     *
     * @return 0: ok
     * @return -1: error
     */

    public int updateAllStations(){
        TDBManager tdb=null;


        try {

            if(dbcontext.matches("")){
                tdb = new TDBManager("org.postgresql.Driver", this.dburl, this.dbuser, this.dbpass);
            }else{
                tdb = new TDBManager(dbcontext);
            }

            tdb.openConnection();

            String url_of_resource = "";
            String sqlString = "select id_mobile_station, tipo, nome, last_update "+
                    "from mobile_stations order by nome";

            tdb.setPreparedStatementRef(sqlString);
            tdb.runPreparedQuery();


            while(tdb.next()){



                id_mobile_station = tdb.getInteger(1);
                station_name = tdb.getString(3);
                gdata = tdb.getData(4);

                if(tdb.getString(2).matches("M")){
                    table_type=MOBILE_DATA_TABLE;
                }else if(tdb.getString(2).matches("T")){
                    table_type=STATIC_DATA_TABLE;
                }else if(tdb.getString(2).matches("E")){
                    table_type=EDDY_DATA_TABLE;
                }else{
                    table_type = "";
                }


                if(!table_type.matches("")) {
                    if (checkExists()) {
                        //it exists : now sync data
                        addNewResource();

                    } else {
                        if (createPackage() == 0) {

                            createAllResources();

                        }
                    }

                    //update last_update field in mobile_stations table
                    setLastUpdate();

                }else{
                    System.out.println("Station Type wasn't recognized. Skipped");
                }
            }

            return 0;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.err.println(e.getMessage());
            e.printStackTrace();
        }finally{
            try{
                tdb.closeConnection();
            }catch(Exception e){
                System.out.println(e.getMessage());
                System.err.println(e.getMessage());
                e.printStackTrace();
            }
        }

        return 0;
    }

    /**
     * addNewResource: add today resources to all mobile_station
     *
     * @return 0: ok
     * @return -1: error
     */

    public int addNewResource(){
        TDBManager tdb=null;
        String monthString, dayString;

        try {

            if(dbcontext.matches("")){
                tdb = new TDBManager("org.postgresql.Driver", this.dburl, this.dbuser, this.dbpass);
            }else{
                tdb = new TDBManager(dbcontext);
            }

            tdb.openConnection();

            GregorianCalendar gc = new GregorianCalendar();


            String url_of_resource_kml = "", url_of_resource_csv = "";
            String sqlString = "select distinct extract(day from data) as \"day\", " +
                    "extract(month from data) as \"month\", " +
                    "extract(year from data) as \"year\" " +
                    "from " + table_type + " "+
                    "where id_mobile_station = ? AND " +
                    "data >= ? "+
                    "order by 3,2,1";

            tdb.setPreparedStatementRef(sqlString);
            tdb.setParameter(DBManager.ParameterType.INT,""+ id_mobile_station,1);
            tdb.setParameter(DBManager.ParameterType.DATE,gdata,2);

            //  tdb.setParameter(DBManager.ParameterType.INT,""+ gc.get(Calendar.DAY_OF_MONTH),2);
          //  tdb.setParameter(DBManager.ParameterType.INT,""+ (gc.get(Calendar.MONTH) +1),3);
          //  tdb.setParameter(DBManager.ParameterType.INT,""+ gc.get(Calendar.DAY_OF_MONTH),4);


            tdb.runPreparedQuery();
            String url = base_url + REST_BASE_URL + RESOURCE_CREATE;
            //create json structure
            JSONObject json = new JSONObject();
            json.put("package_id",package_id);
            json.put("description"," ");

            json.put("url"," ");

            if(tdb.next()){

                if(tdb.getString(2).length()<2){
                    monthString = "0"+tdb.getString(2);
                }else{
                    monthString = tdb.getString(2);
                }

                if(tdb.getString(1).length()<2){
                    dayString = "0"+tdb.getString(1);
                }else{
                    dayString = tdb.getString(1);
                }



                json.remove("url");
                json.remove("description");
                json.remove("name");

                url_of_resource_kml = swhrest_base_url+SWHREST_KML_BASE_URL+SWHREST_YEAR+"="+tdb.getString(3)+"&"+
                        SWHREST_MONTH+"="+tdb.getString(2)+"&"+
                        SWHREST_DAY+"="+tdb.getString(1)+"&"+
                        SWHREST_STATION_ID+"="+station_name+"&"+
                        SWHREST_CREDENTIAL+"&"+SWHREST_LANG;

                url_of_resource_csv = swhrest_base_url+SWHREST_KML_BASE_URL+SWHREST_YEAR+"="+tdb.getString(3)+"&"+
                        SWHREST_MONTH+"="+tdb.getString(2)+"&"+
                        SWHREST_DAY+"="+tdb.getString(1)+"&"+
                        SWHREST_STATION_ID+"="+station_name+"&"+
                        SWHREST_CREDENTIAL+"&"+SWHREST_LANG;

                json.put("description",dayString+"-"+monthString+"-"+tdb.getString(3));
                json.put("url",url_of_resource_kml);
                json.put("format","KML");

                json.put("name","Data of "+dayString+"-"+monthString+"-"+tdb.getString(3));

                //send json structure for package creation process
                JSONObject retData = sendPost(json, url);

                //Check success or failure
                if(retData.getBoolean("success")){
                    System.out.println("Resource KML created. Id: "+retData.getJSONObject("result").getString("id"));

                }else{
                    System.out.println("Resource KML Creation Error: ");
                    System.out.println("======================= ");
                    System.out.println(retData.toString());

                    tdb.closeConnection();

                    return -1;
                }


                //prepare CSV resource

                json.remove("url");
                json.put("url",url_of_resource_csv);
                json.remove("format");
                json.put("format","CSV");

                retData = sendPost(json, url);

                //Check success or failure
                if(retData.getBoolean("success")){
                    System.out.println("Resource CSV created. Id: "+retData.getJSONObject("result").getString("id"));

                }else{
                    System.out.println("Resource CSV Creation Error: ");
                    System.out.println("======================= ");
                    System.out.println(retData.toString());

                    tdb.closeConnection();

                    return -1;
                }

            }

            return 0;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.err.println(e.getMessage());
            e.printStackTrace();
        }finally{
            try{
                tdb.closeConnection();
            }catch(Exception e){
                System.out.println(e.getMessage());
                System.err.println(e.getMessage());
                e.printStackTrace();
            }
        }

        return 0;
    }

    /**
     * createPackage: create new package on CKAN
     *
     * @return 0: ok
     * @return -1: no data retrieved
     */
    public int createPackage() {
        TDBManager tdb=null;


        try{
            System.out.print("createPackage: connecting...");

            if(dbcontext.matches("")){
                tdb = new TDBManager("org.postgresql.Driver", this.dburl, this.dbuser, this.dbpass);
            }else{
                tdb = new TDBManager(dbcontext);
            }


            tdb.openConnection();
            System.out.println("OK");
            String url = base_url + REST_BASE_URL + PACKAGE_CREATE;
            String sqlString = "select a.id_mobile_station, a.descrizione, " +
                    "a.tipo, b.responsabile, b.email, " +
                    "b.tags, b.catalogue_tag_groups " +
                    "from mobile_stations a, metadati b " +
                    "where a.nome = ? and " +
                    "a.id_mobile_station = b.id_mobile_station";

            tdb.setPreparedStatementRef(sqlString);
            tdb.setParameter(DBManager.ParameterType.STRING, station_name,1);
            tdb.runPreparedQuery();
            if(tdb.next()){



                id_mobile_station = tdb.getInteger(1);
                mantainer = tdb.getString(4);
                mantainer_email = tdb.getString(5);


                if(tdb.getString(3).matches("M")){
                    table_type=MOBILE_DATA_TABLE;
                }else if(tdb.getString(3).matches("T")){
                    table_type=STATIC_DATA_TABLE;
                }else if(tdb.getString(3).matches("E")){
                    table_type=EDDY_DATA_TABLE;
                }else{
                    table_type = "";
                }



                JSONObject json = new JSONObject();
                JSONArray extras = new JSONArray();
                JSONArray tags = new JSONArray();
                JSONArray groups = new JSONArray();

                json.put("name",station_name.toLowerCase()+NAME_SUFFIX);
                json.put("private","false");
                json.put("title",tdb.getString(2));
                json.put("notes",tdb.getString(2) + " - "+ station_name);
                json.put("owner_org",owner);
                json.put("author",mantainer);
                json.put("maintainer",mantainer);
                json.put("author_email",mantainer_email);
                json.put("maintainer_email",mantainer_email);
                json.put("version","1.0");
                json.put("license_id",CCBY);

                //preparing groups
                StringTokenizer stin = new StringTokenizer(tdb.getString(7),",");

                while(stin.hasMoreTokens()){
                    JSONObject j1 = new JSONObject();

                    j1.put("name",stin.nextToken());

                    groups.put(j1);
                }

                json.put("groups",groups);

                //preparing tags
                stin = new StringTokenizer(tdb.getString(6),",");

                while(stin.hasMoreTokens()){
                    JSONObject j1 = new JSONObject();

                    j1.put("name",stin.nextToken());

                    tags.put(j1);
                }

                json.put("tags",tags);

                sqlString = "select param_name_it,unit,min_limit,max_limit "+
                            "from   chart_params " +
                            "where  id_mobile_station = ?";


                tdb.setPreparedStatementRef(sqlString);
                tdb.setParameter(DBManager.ParameterType.INT,""+ id_mobile_station,1);
                tdb.runPreparedQuery();


                //preparing extras
                while(tdb.next()){
                    JSONObject j1 = new JSONObject();

                    j1.put("key",tdb.getString(1));
                    j1.put("value",tdb.getString(2)+"["+tdb.getString(3)+" - "+tdb.getString(4)+"]");

                    extras.put(j1);
                }

                JSONObject j1 = new JSONObject();
                j1.put("key","System Ref.");
                j1.put("value","EPSG: 4326");
                extras.put(j1);
                json.put("extras",extras);

                //send json structure for package creation process
                JSONObject retData = sendPost(json,url);

                //Check success or failure
                if(retData.getBoolean("success")){

                    System.out.println("Package created. Id: "+retData.getJSONObject("result").getString("id"));
                    package_id = retData.getJSONObject("result").getString("id");

                }else{
                    System.out.println("Package Creation Error: ");
                    System.out.println("======================= ");
                    System.out.println(retData.toString());

                    tdb.closeConnection();

                    return -1;
                }


                //Get package id

            }else{
                return -1;
            }
        }catch(Exception e){

            System.out.println(e.getMessage());

            e.printStackTrace();
        }finally{
            try{
                tdb.closeConnection();
            }catch(Exception e){
                System.out.println(e.getMessage());

                e.printStackTrace();
            }
        }


        return 0;
    }

    public JSONObject sendPost(JSONObject json2send,String url) throws Exception {



        HttpClient httpClient = new DefaultHttpClient();

        System.out.println("Create HTTP-POST connection with id: "+auth_id);
        System.out.println("URL: "+url);

        //Prepare HttpPost connection
        HttpPost request = new HttpPost(url);

        System.out.println("Entity to send: "+json2send.toString());

        StringEntity params =new StringEntity(json2send.toString(), "UTF-8");   //passing json structure
        request.addHeader("content-type", "application/x-www-form-urlencoded");
        request.addHeader("Authorization", auth_id);   //passing authorization id
        request.setEntity(params);

        System.out.println("Sending data");

        HttpResponse response = httpClient.execute(request);

        //check response
        if(response.getStatusLine().getStatusCode() == HttpStatus.SC_CONFLICT){

            System.out.println("Error code: "+response.getStatusLine().getStatusCode());

            throw new Exception((response.getStatusLine().getReasonPhrase()));
        }

        System.out.println("OK it was sent");
        //retrieve response data
        HttpEntity retData = response.getEntity();


        InputStream in = retData.getContent();


        //convert into JSON structure
        BufferedReader bReader = new BufferedReader(new InputStreamReader(in));
        StringBuilder sBuilder = new StringBuilder();
        String line = null;

        while ((line = bReader.readLine()) != null) {
            sBuilder.append(line + "\n");
        }


       // System.out.println("RetString: "+sBuilder.toString());

        JSONObject out = new JSONObject(sBuilder.toString());


        return out;

    }



}
