package it.cnr.ibimet.SWHWS;

import it.cnr.ibimet.dbutils.ChartParams;
import it.cnr.ibimet.dbutils.TDBManager;
import it.cnr.ibimet.dbutils.TableSchema;
import it.lr.libs.DBManager;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.ws.rs.*;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

/**
 * Created by lerocchi on 16/02/17.
 *
 * GetGeoData
 *
 * retrieves data of specific mobile/standard stations with geo data as KML
 */
@Path("download")
public class GetGeoData  extends Application {

    final static String MOBILE_STAT = "M";
    final static String FIXED_STAT = "T";
    final static String EDDY_STAT = "E";
    final static String GEOM_COL = "ST_asKML(a.the_geom, 15) as tgeom,";



    final static String COORD_COLS = "ST_X(ST_Transform(the_geom,4326)) as coordx,ST_Y(ST_Transform(the_geom,4326)) as coordy,";


    final static String MOBILE_DATA_TABLE = "dati";
    final static String FIXED_DATA_TABLE = "dati_stazioni_fisse";
    final static String EDDY_DATA_TABLE = "dati_eddy";




    /**
     *
     * Get geo data of specific station in JSON format
     *
     *
     * @param y1 beginning year
     * @param m1 beginning month
     * @param d1 beginning day
     * @param y2 ending year
     * @param m2 ending month
     * @param d2 endig day
     * @param station_id station identify
     * @param usr_id username
     * @param pwd_id password
     * @param language language adopted : "it", "en", "fr"
     * @return data in JSON format, point coordinates will be released in text format
     */

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/get_geodata_json")
    public String getJSONGet(@QueryParam("from_year") String y1,
                        @QueryParam("from_month") String m1,
                        @QueryParam("from_day") String d1,
                        @QueryParam("to_year") String y2,
                        @QueryParam("to_month") String m2,
                        @QueryParam("to_day") String d2,
                        @QueryParam("station_id") String station_id,
                        @QueryParam("user_id") String usr_id,
                        @QueryParam("pwd_id") String pwd_id,
                        @QueryParam("language") String language

    ) {

        return get_data_json(y1,m1,d1,y2,m2,d2,station_id,usr_id,pwd_id,language);
    }

    /**
     *
     * Get geo data of specific station in JSON format
     *
     *
     * @param y1 beginning year
     * @param m1 beginning month
     * @param d1 beginning day
     * @param y2 ending year
     * @param m2 ending month
     * @param d2 endig day
     * @param station_id station identify
     * @param usr_id username
     * @param pwd_id password
     * @param language language adopted : "it", "en", "fr"
     * @return data in JSON format, point coordinates will be released in text format
     */

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/get_geodata_json")
    public String getJSONPost(@QueryParam("from_year") String y1,
                             @QueryParam("from_month") String m1,
                             @QueryParam("from_day") String d1,
                             @QueryParam("to_year") String y2,
                             @QueryParam("to_month") String m2,
                             @QueryParam("to_day") String d2,
                             @QueryParam("station_id") String station_id,
                             @QueryParam("user_id") String usr_id,
                             @QueryParam("pwd_id") String pwd_id,
                             @QueryParam("language") String language

    ) {

        return get_data_json(y1,m1,d1,y2,m2,d2,station_id,usr_id,pwd_id,language);
    }




    /**
     *
     * Get geo data of specific station in KML format
     *
     *
     * @param y1 beginning year
     * @param m1 beginning month
     * @param d1 beginning day
     * @param y2 ending year
     * @param m2 ending month
     * @param d2 endig day
     * @param station_id station identify
     * @param usr_id username
     * @param pwd_id password
     * @param language language adopted : "it", "en", "fr"
     * @return data in KML format
     */

    @GET
    @Produces("application/vnd.google-earth.kml+xml")
    @Path("/get_geodata_kml")
    public String getGD(@QueryParam("from_year") String y1,
                          @QueryParam("from_month") String m1,
                          @QueryParam("from_day") String d1,
                          @QueryParam("to_year") String y2,
                          @QueryParam("to_month") String m2,
                          @QueryParam("to_day") String d2,
                          @QueryParam("station_id") String station_id,
                          @QueryParam("user_id") String usr_id,
                          @QueryParam("pwd_id") String pwd_id,
                        @QueryParam("language") String language

                        ) {

        return get_data_xml(y1,m1,d1,y2,m2,d2,station_id,usr_id,pwd_id,language);
    }


    @GET
    @Produces("text/csv")
    @Path("/get_geodata_csv")
    public String getGDcsv2(@QueryParam("year") String y1,
                           @QueryParam("month") String m1,
                           @QueryParam("day") String d1,
                            @QueryParam("year2") String y2,
                            @QueryParam("month2") String m2,
                            @QueryParam("day2") String d2,
                           @QueryParam("station_id") String station_id,
                           @QueryParam("user_id") String usr_id,
                           @QueryParam("pwd_id") String pwd_id,
                           @QueryParam("language") String language

    ) {

        return get_data_csv(y1,m1,d1,y2,m2,d2,station_id,usr_id,pwd_id,language);
    }


    @GET
    @Produces("text/csv")
    @Path("/get_geodata_csv1")
    public String getGDcsv(@QueryParam("year") String y1,
                        @QueryParam("month") String m1,
                        @QueryParam("day") String d1,
                        @QueryParam("station_id") String station_id,
                        @QueryParam("user_id") String usr_id,
                        @QueryParam("pwd_id") String pwd_id,
                        @QueryParam("language") String language

    ) {

        return get_data_csv(y1,m1,d1,null,null,null,station_id,usr_id,pwd_id,language);
    }

    @POST
    @Produces("text/csv")
    @Path("/get_geodata_csv1")
    public String getGDpostcsv(@QueryParam("year") String y1,
                           @QueryParam("month") String m1,
                           @QueryParam("day") String d1,
                           @QueryParam("station_id") String station_id,
                           @QueryParam("user_id") String usr_id,
                           @QueryParam("pwd_id") String pwd_id,
                           @QueryParam("language") String language

    ) {

        return get_data_csv(y1,m1,d1,null,null,null,station_id,usr_id,pwd_id,language);
    }

    /**
     *
     * Get geo data of specific station in KML format
     *
     *
     * @param y1 beginning year
     * @param m1 beginning month
     * @param d1 beginning day
     * @param y2 ending year
     * @param m2 ending month
     * @param d2 endig day
     * @param station_id station identify
     * @param usr_id username
     * @param pwd_id password
     * @param language language adopted : "it", "en", "fr"
     * @return data in KML format
     */

    @POST
    @Produces("application/vnd.google-earth.kml+xml")
    @Path("/get_geodata_kml")
    public String getGDpost(@QueryParam("from_year") String y1,
                        @QueryParam("from_month") String m1,
                        @QueryParam("from_day") String d1,
                        @QueryParam("to_year") String y2,
                        @QueryParam("to_month") String m2,
                        @QueryParam("to_day") String d2,
                        @QueryParam("station_id") String station_id,
                        @QueryParam("user_id") String usr_id,
                        @QueryParam("pwd_id") String pwd_id,
                        @QueryParam("language") String language

    ) {


        return get_data_xml(y1,m1,d1,y2,m2,d2,station_id,usr_id,pwd_id,language);
    }



    @GET
    @Produces("application/vnd.google-earth.kml+xml")
    @Path("/get_geodata_kml1")
    public String getGDgetSingle(@QueryParam("year") String y1,
                                  @QueryParam("month") String m1,
                                  @QueryParam("day") String d1,

                                  @QueryParam("station_id") String station_id,
                                  @QueryParam("user_id") String usr_id,
                                  @QueryParam("pwd_id") String pwd_id,
                                  @QueryParam("language") String language

    ) {

        return get_data_xml(y1,m1,d1,null,null,null,station_id,usr_id,pwd_id,language);
    }

    @POST
    @Produces("application/vnd.google-earth.kml+xml")
    @Path("/get_geodata_kml1")
    public String getGDpostSingle(@QueryParam("year") String y1,
                            @QueryParam("month") String m1,
                            @QueryParam("day") String d1,

                            @QueryParam("station_id") String station_id,
                            @QueryParam("user_id") String usr_id,
                            @QueryParam("pwd_id") String pwd_id,
                            @QueryParam("language") String language

    ) {

        return get_data_xml(y1,m1,d1,null,null,null,station_id,usr_id,pwd_id,language);
    }

    private String get_data_json(String y1, String m1, String d1,
                                String y2, String m2, String d2, String station_id,
                                String usr_id, String pwd_id, String language){


        String retData="", tblName="",clName="", whereStr="", coordx="", coordy="";
        int stid=0;

        TDBManager dsm = null, dsm2 = null;

        if(language == null){
            language = "it";
        }

        GregorianCalendar gc1, gc2=null;

        gc1 = new GregorianCalendar(Integer.parseInt(y1),(Integer.parseInt(m1) - 1),Integer.parseInt(d1),0,0);

        //check if there is end date
        if(y2 != null && m2 != null && d2 != null) {
            gc2 = new GregorianCalendar(Integer.parseInt(y2),(Integer.parseInt(m2) - 1),Integer.parseInt(d2),0,0);
            whereStr =  "and a.data between ? and ? ";
        }else{
            whereStr =  "and a.data = ? ";
        }



        try {
            dsm = new TDBManager("jdbc/urbandb");
            dsm2 = new TDBManager("jdbc/urbandb");

            String sqlString="select id_utente " +
                    "from utenti "+
                    "where userid=? and pwd=?";



            dsm.setPreparedStatementRef(sqlString);
            dsm.setParameter(DBManager.ParameterType.STRING, usr_id, 1);
            dsm.setParameter(DBManager.ParameterType.STRING, pwd_id, 2);
            dsm.runPreparedQuery();


            if(dsm.next()){

                //check station type

                sqlString="select id_mobile_station, ST_X(the_geom) as coordx,ST_Y(the_geom) as coordy,tipo from mobile_stations where nome=?";
                dsm2.setPreparedStatementRef(sqlString);
                dsm2.setParameter(DBManager.ParameterType.STRING, station_id, 1);
                dsm2.runPreparedQuery();
                if(dsm2.next()){
                    stid = dsm2.getInteger(1);

                    if(dsm2.getString(4).matches(MOBILE_STAT)){
                        tblName = MOBILE_DATA_TABLE;
                        clName =COORD_COLS;
                        coordx = "";
                        coordy = "";

                    }else if(dsm2.getString(4).matches(FIXED_STAT)){
                        tblName = FIXED_DATA_TABLE;
                        clName = "";
                        coordx = dsm2.getString(2);
                        coordy = dsm2.getString(3);
                    }else  if(dsm2.getString(4).matches(EDDY_STAT)){
                        tblName = EDDY_DATA_TABLE;
                        clName = "";
                        coordx = dsm2.getString(2);
                        coordy = dsm2.getString(3);
                    }


                }

                //Check station type and get fields
                TableSchema tSchema = new TableSchema(dsm2, tblName);


                ChartParams cp = new ChartParams(dsm2, stid,language );
                cp.getTableParams(); //prepare table params


                String selectStr ="";

                for(int i=0; i<cp.getParamNumbers(); i++){
                    selectStr = selectStr + cp.getSQL_SelectStr(i,"numeric", "a.", 2) + " as "+cp.getParam().get(i) + ",";
                }


                //get data with geographical information
                sqlString="select "+selectStr+clName+"a.data as data "
                        + "from "+tblName+" a "
                        + "where  "
                        + " a.id_mobile_station=? " + whereStr
                        + "order by a.data desc";


                dsm2.setPreparedStatementRef(sqlString);
                dsm2.setParameter(DBManager.ParameterType.INT, ""+stid, 1);
                dsm2.setParameter(DBManager.ParameterType.DATE, gc1, 2);
                if(y2 != null && m2 != null && d2 != null) {
                    dsm2.setParameter(DBManager.ParameterType.DATE, gc2, 3);
                }
                dsm2.runPreparedQuery();

                JSONArray jArray= new JSONArray();
                SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                while(dsm2.next()){

                    JSONObject jobj = new JSONObject();

                    for(int i=0; i<cp.getParamNumbers(); i++){
                        jobj.put(cp.getParam_name().get(i), dsm2.getString(cp.getParam().get(i)));
                    }

                    if(!clName.matches("") ) {
                        jobj.put("x_coord", dsm2.getString("coordx"));
                        jobj.put("y_coord", dsm2.getString("coordy"));
                    }else {
                        jobj.put("x_coord", coordx);
                        jobj.put("y_coord", coordy);
                    }


                    jobj.put("data",""+formatter.format(dsm2.getData("data").getTime()));
                    jArray.add(jobj);
                }

                retData = jArray.toJSONString();
            }else{
                retData = "Authentication error";
            }


        } catch (Exception e) {
            e.printStackTrace();
            retData = e.getMessage();
        }finally{
            try {
                dsm.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
                retData = e.getMessage();
            }
            try {
                dsm2.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
                retData = e.getMessage();
            }
        }


        // System.out.println("ecco uscita: "+retData);

        return retData;


    }

    private String get_data_xml(String y1, String m1, String d1,
                                String y2, String m2, String d2, String station_id,
                                String usr_id, String pwd_id, String language){
        String retData="", tblName="",clName="", whereStr="", coords="";
        int stid=0;

        TDBManager dsm = null, dsm2 = null;

        if(language == null){
            language = "it";
        }

        GregorianCalendar gc1, gc2=null;

        gc1 = new GregorianCalendar(Integer.parseInt(y1),(Integer.parseInt(m1) - 1),Integer.parseInt(d1),0,0);

        //check if there is end date
        if(y2 != null && m2 != null && d2 != null) {
            gc2 = new GregorianCalendar(Integer.parseInt(y2),(Integer.parseInt(m2) - 1),Integer.parseInt(d2),0,0);
        }else{
            gc2 = new GregorianCalendar(Integer.parseInt(y1),(Integer.parseInt(m1) - 1),Integer.parseInt(d1),23,59);
        }

        whereStr =  "and a.data between ? and ? ";

        try {
            dsm = new TDBManager("jdbc/urbandb");
            dsm2 = new TDBManager("jdbc/urbandb");

            String sqlString="select id_utente " +
                    "from utenti "+
                    "where userid=? and pwd=?";



            dsm.setPreparedStatementRef(sqlString);
            dsm.setParameter(DBManager.ParameterType.STRING, usr_id, 1);
            dsm.setParameter(DBManager.ParameterType.STRING, pwd_id, 2);


            dsm.runPreparedQuery();


            if(dsm.next()){

                //check station type

                sqlString="select id_mobile_station, ST_asKML(the_geom,15) ,tipo from mobile_stations where nome=?";
                dsm2.setPreparedStatementRef(sqlString);
                dsm2.setParameter(DBManager.ParameterType.STRING, station_id, 1);
                dsm2.runPreparedQuery();
                if(dsm2.next()){
                    stid = dsm2.getInteger(1);

                    if(dsm2.getString(3).matches(MOBILE_STAT)){
                        tblName = MOBILE_DATA_TABLE;
                        clName = GEOM_COL;
                        coords = "";
                    }else if(dsm2.getString(3).matches(FIXED_STAT)){
                        tblName = FIXED_DATA_TABLE;
                        clName = "";
                        coords = dsm2.getString(2);
                    }else if(dsm2.getString(3).matches(EDDY_STAT)){
                        tblName = EDDY_DATA_TABLE;
                        clName = "";
                        coords = dsm2.getString(2);
                    }


                }

                //Check station type and get fields
                TableSchema tSchema = new TableSchema(dsm2, tblName);


                ChartParams cp = new ChartParams(dsm2, stid,language );
                cp.getTableParams(); //prepare table params


                String selectStr ="";

                for(int i=0; i<cp.getParamNumbers(); i++){
                    selectStr = selectStr + cp.getSQL_SelectStr(i,"numeric", "a.", 2) + " as "+cp.getParam().get(i) + ",";
                }


                //get data with geographical information
                sqlString="select "+selectStr+clName+"a.data as data "
                        + "from "+tblName+" a "
                        + "where  "
                        + " a.id_mobile_station=? " + whereStr
                        + " order by a.data desc";


                dsm2.setPreparedStatementRef(sqlString);
                dsm2.setParameter(DBManager.ParameterType.INT, ""+stid, 1);
                dsm2.setParameter(DBManager.ParameterType.DATE, gc1, 2);
                dsm2.setParameter(DBManager.ParameterType.DATE, gc2, 3);

                dsm2.runPreparedQuery();

                retData = retData + "<kml xmlns=\"http://www.opengis.net/kml/2.2\" xmlns:ns2=\"http://www.google.com/kml/ext/2.2\" xmlns:ns3=\"http://www.w3.org/2005/Atom\" " +
                        "xmlns:ns4=\"urn:oasis:names:tc:ciq:xsdschema:xAL:2.0\"><Document>";
                retData = retData + "<Schema name=\""+station_id+"\" id=\""+station_id+"\">";
                retData = retData + "<SimpleField type=\"string\" name=\"data\"/>";


                //Create schema strcuture
                for(int i=0; i<cp.getParamNumbers(); i++){
                    retData = retData + "<SimpleField type=\"double\" name=\""+cp.getParam().get(i)+"\"/>";
                }


                retData = retData + "</Schema><Folder>";

                retData = retData + "<name>" + station_id + "</name>";

                SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                System.out.println("sqlString: "+sqlString);
                int icount = 0;
                while(dsm2.next()){


                    icount++;
                    retData = retData + "<Placemark id=\""+station_id+"."+icount+"\">";
                    retData = retData + "<ExtendedData>";
                    retData = retData + "<SchemaData schemaUrl=\"#"+station_id+"\">";

                    retData = retData + "<SimpleData name=\"data\">" + formatter.format(dsm2.getData("data").getTime()) + "</SimpleData>";
                    for(int i=0; i<cp.getParamNumbers(); i++){
                        retData = retData + "<SimpleData name=\"" + cp.getParam_name().get(i) + "\">" + dsm2.getString(cp.getParam().get(i)) + "</SimpleData>";
                    }


                    retData = retData + "</SchemaData></ExtendedData>";


                    if(!clName.matches("") )
                        retData = retData + dsm2.getString("tgeom");
                    else
                        retData = retData + "," + coords;

                    retData = retData + "</Placemark>";

                    System.out.println("i: "+icount);

                }
                retData = retData + "</Folder></Document></kml>";

            }else{
                retData = "Authentication error";
            }


        } catch (Exception e) {
            e.printStackTrace();
            retData = e.getMessage();
        }finally{
            try {
                dsm.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
                retData = e.getMessage();
            }
            try {
                dsm2.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
                retData = e.getMessage();
            }
        }


        // System.out.println("ecco uscita: "+retData);

        return retData;


    }



    private String get_data_csv(String y1, String m1, String d1,
                                String y2, String m2, String d2, String station_id,
                                String usr_id, String pwd_id, String language){
        String retData="", tblName="",clName="", whereStr="", coords="";
        int stid=0;

        TDBManager dsm = null, dsm2 = null;

        if(language == null){
            language = "it";
        }

        GregorianCalendar gc1, gc2=null;

        gc1 = new GregorianCalendar(Integer.parseInt(y1),(Integer.parseInt(m1) - 1),Integer.parseInt(d1),0,0);

        //check if there is end date
        if(y2 != null && m2 != null && d2 != null) {
            gc2 = new GregorianCalendar(Integer.parseInt(y2),(Integer.parseInt(m2) - 1),Integer.parseInt(d2),23,59);
        }else{
            gc2 = new GregorianCalendar(Integer.parseInt(y1),(Integer.parseInt(m1) - 1),Integer.parseInt(d1),23,59);
        }

        whereStr =  "and a.data between ? and ? ";

        try {
            dsm = new TDBManager("jdbc/urbandb");
            dsm2 = new TDBManager("jdbc/urbandb");

            String sqlString="select id_utente " +
                    "from utenti "+
                    "where userid=? and pwd=?";



            dsm.setPreparedStatementRef(sqlString);
            dsm.setParameter(DBManager.ParameterType.STRING, usr_id, 1);
            dsm.setParameter(DBManager.ParameterType.STRING, pwd_id, 2);


            dsm.runPreparedQuery();


            if(dsm.next()){

                //check station type

                sqlString="select id_mobile_station, ST_X(ST_Transform(the_geom,4326)),ST_Y(ST_Transform(the_geom,4326)) ,tipo from mobile_stations where nome=?";
                dsm2.setPreparedStatementRef(sqlString);
                dsm2.setParameter(DBManager.ParameterType.STRING, station_id, 1);
                dsm2.runPreparedQuery();
                if(dsm2.next()){
                    stid = dsm2.getInteger(1);

                    if(dsm2.getString(4).matches(MOBILE_STAT)){
                        tblName = MOBILE_DATA_TABLE;
                        clName = COORD_COLS;
                        coords = "";
                    }else if(dsm2.getString(4).matches(FIXED_STAT)){
                        tblName = FIXED_DATA_TABLE;
                        clName = "";
                        coords = dsm2.getString(2) + "," +dsm2.getString(3);
                    }else if(dsm2.getString(4).matches(EDDY_STAT)){
                        tblName = EDDY_DATA_TABLE;
                        clName = "";
                        coords = dsm2.getString(2) + "," +dsm2.getString(3) ;
                    }


                }

                //Check station type and get fields
                TableSchema tSchema = new TableSchema(dsm2, tblName);


                ChartParams cp = new ChartParams(dsm2, stid,language );
                cp.getTableParams(); //prepare table params


                String selectStr ="";

                for(int i=0; i<cp.getParamNumbers(); i++){
                    selectStr = selectStr + cp.getSQL_SelectStr(i,"numeric", "a.", 2) + " as "+cp.getParam().get(i) + ",";
                }


                //get data with geographical information
                sqlString="select "+selectStr+clName+"a.data as data "
                        + "from "+tblName+" a "
                        + "where  "
                        + " a.id_mobile_station=? " + whereStr
                        + " order by a.data desc";


                System.out.println(sqlString);

                dsm2.setPreparedStatementRef(sqlString);
                dsm2.setParameter(DBManager.ParameterType.INT, ""+stid, 1);
                dsm2.setParameter(DBManager.ParameterType.DATE, gc1, 2);
                dsm2.setParameter(DBManager.ParameterType.DATE, gc2, 3);

                dsm2.runPreparedQuery();


                retData = station_id+",longitude,latitude";
                retData = retData + ",data";


                //Create schema strcuture
                for(int i=0; i<cp.getParamNumbers(); i++){
                    retData = retData +","+cp.getParam().get(i);
                }



                retData = retData + "\r\n";
                int icount = 0;
                while(dsm2.next()){


                    icount++;
                    retData = retData + station_id +"."+icount;
                    if(!clName.matches("") ){
                        retData = retData + "," + dsm2.getString("coordx") + "," + dsm2.getString("coordy");
                    }else{
                        retData = retData + "," + coords;
                    }


                    retData = retData + "," + dsm2.getString("data");

                    for(int i=0; i<cp.getParamNumbers(); i++){
                        retData = retData + "," + dsm2.getString(cp.getParam().get(i));
                    }


                    retData = retData + "\r\n";

                }


            }else{
                retData = "Authentication error";
            }


        } catch (Exception e) {
            e.printStackTrace();
            retData = e.getMessage();
        }finally{
            try {
                dsm.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
                retData = e.getMessage();
            }
            try {
                dsm2.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
                retData = e.getMessage();
            }
        }


        // System.out.println("ecco uscita: "+retData);

        return retData;


    }
}
