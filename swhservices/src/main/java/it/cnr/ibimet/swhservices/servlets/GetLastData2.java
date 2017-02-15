/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.swhservices.servlets;

import it.cnr.ibimet.dbutils.TDBManager;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.StringTokenizer;

/**
 *
 * @author lerocchi
 */
public class GetLastData2 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	/**
         * 
         * Recupero dati mobili
         * @param dominio : indica se usare dati di bologna, siracusa o altro
         * @param limit : indica il numero massimo di dati da scaricare
       
         * @throws ServletException
         * @throws IOException 
         */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
                        int colshift = 0;
                        String tipotab = "";
			int userLevel=-1;
                        String sqlPre = "";
			String userLevelStr=null;
			String questaStazione=null;
			StringTokenizer st=null;
			TDBManager dsm=null, dsm2=null;
			ByteBuffer outputBB;

			
			
			String questoDominio;
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				
                                questoDominio = request.getParameter("dominio");
                                
				System.out.println("GetData Servlet - sono dentro");
				dsm = new TDBManager("jdbc/urbandb");
				dsm2 = new TDBManager("jdbc/urbandb");
				
				String listaStations = "select  id_mobile_station, nome, ST_X(the_geom) as x,ST_Y(the_geom) as y from mobile_stations where id_dominio="+questoDominio+" and "
                                        + "tipo = 'T' order by id_mobile_station";
                                
                                
				dsm.setPreparedStatementRef(listaStations);
				
				dsm.runPreparedQuery();
                                
                                
                                
                                
				//JSONObject jobj = new JSONObject();
				JSONObject jOutput= new JSONObject();
                                
                                while(dsm.next()){
                                    JSONArray jobjStation = new JSONArray();
                                            
                                    String queryStr = "select * from "+
                                            " (select tair as tair,co2 as co2,rad as hum,utc as utc, " +
							"data as data,o3 as o3,ntc as ntc,ds18 as ds18,pk as pk, no2 as no2, co as co, voc as voc, utcstr as utcstr "
                                            + " from dati_Stazioni_fisse " +
							"where   id_mobile_station =  "+dsm.getInteger(1)  + " " +
							"order by data desc limit "+request.getParameter("limit") + ") as query1 order by data asc";
                                    dsm2.setPreparedStatementRef(queryStr);
                                    dsm2.runPreparedQuery();
                                    while(dsm2.next()){
                                        JSONObject jobj = new JSONObject();
                                         
                                   
                                        jobj.put("lat", dsm.getDouble(4));
					jobj.put("long", dsm.getDouble(3));
                                       
                                        jobj.put("data", dsm2.getData(5).get(Calendar.DAY_OF_MONTH) + "-" +
							(dsm2.getData(5).get(Calendar.MONTH) + 1) + "-" +
							dsm2.getData(5).get(Calendar.YEAR) + " " +
							dsm2.getData(5).get(Calendar.HOUR_OF_DAY) + ":" +
							dsm2.getData(5).get(Calendar.MINUTE)+ ":"+
                                                
                                                        dsm2.getData(5).get(Calendar.SECOND));
                                        
                                        
                                        jobj.put("t_air", dsm2.getDouble(1));
					
					if( dsm2.getInteger(2)<0){
						jobj.put("co2", 0);
					}else{
						jobj.put("co2", dsm2.getInteger(2));
					}
					
                                        
                                        jobj.put("umidita", dsm2.getDouble(3));
					
					if(dsm2.getInteger(6)<0){
						jobj.put("o3", 0);
					}else{
						jobj.put("o3", dsm2.getInteger(6));
					}
					
                                        if(dsm2.getDouble(7)<0){
						jobj.put("ntc", 0);
					}else{
						jobj.put("ntc", dsm2.getDouble(7));
					}

                                        if(dsm2.getDouble(8)<0){
						jobj.put("ds18", 0);
					}else{
						jobj.put("ds18", dsm2.getDouble(8));
					}

                                        if(dsm2.getInteger(9)<0){
						jobj.put("pk", 0);
					}else{
						jobj.put("pk", dsm2.getInteger(9));
					}
                                        
					jobj.put("utc", dsm2.getDouble(4));
				              
                                                 if(dsm2.getInteger(10)<0){
						jobj.put("no2", 0);
					}else{
						jobj.put("no2", dsm2.getInteger(10));
					}
                                         
                                        if(dsm2.getInteger(11)<0){
						jobj.put("co", 0);
					}else{
						jobj.put("co", dsm2.getInteger(11));
					}
                                        
                                        if(dsm2.getInteger(12)<0){
						jobj.put("voc", 0);
					}else{
						jobj.put("voc", dsm2.getInteger(12));
					}
                                        
                                        jobj.put("utcstr", dsm2.getString(13));
					
                                        jobjStation.add(jobj);
                                    }
                                    
                                    jOutput.put(dsm.getString(2), jobjStation);
                                }
				
				
				
				response.setContentType("application/json");
				response.getWriter().write(jOutput.toJSONString());
			
				
		} catch (Exception e) {
				
				e.printStackTrace();
		} finally {
			try {
				dsm.closeConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
                        try {
				dsm2.closeConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
}
