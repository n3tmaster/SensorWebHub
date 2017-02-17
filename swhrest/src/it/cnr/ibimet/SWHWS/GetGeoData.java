package it.cnr.ibimet.SWHWS;

import it.cnr.ibimet.dbutils.ChartParams;
import it.cnr.ibimet.dbutils.TDBManager;
import it.cnr.ibimet.dbutils.TableSchema;
import it.lr.libs.DBManager;

import javax.ws.rs.*;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;
import java.sql.SQLException;
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

    final static String MOBILE_DATA_TABLE = "dati";
    final static String FIXED_DATA_TABLE = "dati_stazioni_mobili";
    final static String EDDY_DATA_TABLE = "dati_eddi";




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
    @Produces(MediaType.APPLICATION_XML)
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

        String retData="", tblName="",clName="";
        int stid=0;

        TDBManager dsm = null, dsm2 = null;

        if(language == null){
            language = "it";
        }

        GregorianCalendar gc1, gc2;

        gc1 = new GregorianCalendar(Integer.parseInt(y1),(Integer.parseInt(m1) - 1),Integer.parseInt(d1),0,0);
        gc2 = new GregorianCalendar(Integer.parseInt(y2),(Integer.parseInt(m2) - 1),Integer.parseInt(d2),0,0);


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

                sqlString="select id_mobile_station, ST_asKML(the_geom,15),tipo from mobile_stations where nome=?";
                dsm2.setPreparedStatementRef(sqlString);
                dsm2.setParameter(DBManager.ParameterType.STRING, station_id, 1);
                dsm2.runPreparedQuery();
                if(dsm2.next()){
                    stid = dsm2.getInteger(1);

                    if(dsm2.getString(3).matches(MOBILE_STAT)){
                        tblName = MOBILE_DATA_TABLE;
                        clName = GEOM_COL;
                    }else if(dsm2.getString(3).matches(FIXED_STAT)){
                        tblName = FIXED_DATA_TABLE;
                        clName = "";
                    }else  if(dsm2.getString(3).matches(EDDY_STAT)){
                        tblName = EDDY_DATA_TABLE;
                        clName = "";
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
                sqlString="select "+selectStr+GEOM_COL+"a.data as data,a.id_bikedata "
                        + "from "+tblName+" a "
                        + "where  "
                        + " a.id_mobile_station=? "
                        + "and a.data between ? and ? "
                        + "order by a.data desc";

            //    System.out.println("ecco sql: "+sqlString);

                dsm2.setPreparedStatementRef(sqlString);
                dsm2.setParameter(DBManager.ParameterType.INT, ""+stid, 1);
                dsm2.setParameter(DBManager.ParameterType.DATE, gc1, 2);
                dsm2.setParameter(DBManager.ParameterType.DATE, gc2, 3);
                dsm2.runPreparedQuery();

                retData = retData + "<kml xmlns=\"http://www.opengis.net/kml/2.2\"><Placemark>";
                while(dsm2.next()){
                    String  descrTxt="";

                    for(int i=0; i<cp.getParamNumbers(); i++){
                        descrTxt = descrTxt + cp.getParam().get(i) + "=" + dsm2.getString(cp.getParam().get(i)) + "\n";
                    }



                    retData = retData + dsm2.getString("tgeom");
                    retData = retData + "<description>" + descrTxt + "</description>";
                    retData = retData + "<name>" + station_id + "</name>";

                }
                retData = retData + "</Placemark></kml>";

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
    @Produces(MediaType.APPLICATION_XML)
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

        String retData="", tblName="",clName="";
        int stid=0;

        TDBManager dsm = null, dsm2 = null;

        if(language == null){
            language = "it";
        }

        GregorianCalendar gc1, gc2;

        gc1 = new GregorianCalendar(Integer.parseInt(y1),(Integer.parseInt(m1) - 1),Integer.parseInt(d1),0,0);
        gc2 = new GregorianCalendar(Integer.parseInt(y2),(Integer.parseInt(m2) - 1),Integer.parseInt(d2),0,0);


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

                sqlString="select id_mobile_station, ST_asKML(the_geom,15),tipo from mobile_stations where nome=?";
                dsm2.setPreparedStatementRef(sqlString);
                dsm2.setParameter(DBManager.ParameterType.STRING, station_id, 1);
                dsm2.runPreparedQuery();
                if(dsm2.next()){
                    stid = dsm2.getInteger(1);

                    if(dsm2.getString(3).matches(MOBILE_STAT)){
                        tblName = MOBILE_DATA_TABLE;
                        clName = GEOM_COL;
                    }else if(dsm2.getString(3).matches(FIXED_STAT)){
                        tblName = FIXED_DATA_TABLE;
                        clName = "";
                    }else  if(dsm2.getString(3).matches(EDDY_STAT)){
                        tblName = EDDY_DATA_TABLE;
                        clName = "";
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
                sqlString="select "+selectStr+GEOM_COL+"a.data as data,a.id_bikedata "
                        + "from "+tblName+" a "
                        + "where  "
                        + " a.id_mobile_station=? "
                        + "and a.data between ? and ? "
                        + "order by a.data desc";

                //    System.out.println("ecco sql: "+sqlString);

                dsm2.setPreparedStatementRef(sqlString);
                dsm2.setParameter(DBManager.ParameterType.INT, ""+stid, 1);
                dsm2.setParameter(DBManager.ParameterType.DATE, gc1, 2);
                dsm2.setParameter(DBManager.ParameterType.DATE, gc2, 3);
                dsm2.runPreparedQuery();

                retData = retData + "<kml xmlns=\"http://www.opengis.net/kml/2.2\"><Placemark>";
                while(dsm2.next()){
                    String  descrTxt="";

                    for(int i=0; i<cp.getParamNumbers(); i++){
                        descrTxt = descrTxt + cp.getParam().get(i) + "=" + dsm2.getString(cp.getParam().get(i)) + "\n";
                    }



                    retData = retData + dsm2.getString("tgeom");
                    retData = retData + "<description>" + descrTxt + "</description>";
                    retData = retData + "<name>" + station_id + "</name>";

                }
                retData = retData + "</Placemark></kml>";

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
