/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.servlets;

import it.cnr.ibimet.bikeclimate.dbutils.SWH4EConst;
import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import org.primefaces.json.JSONArray;
import org.primefaces.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lerocchi
 */
public class GetDataSummary extends HttpServlet implements SWH4EConst{
	private static final long serialVersionUID = 1L;
	private TDBManager dsm=null;
      //      private TDBManager dsm2=null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
            String macrotipo = request.getParameter("tipo");
            
            try {
                dsm = new TDBManager("jdbc/urbandb");
           //     dsm2 = new TDBManager("jdbc/imetnetdb");
                JSONArray jArray= new JSONArray();
                if(macrotipo.equals(MACROTIPO_MOBILI)){
                     //query per il recupero delle tabelle-entita e le salvo in un array
                    dsm.setPreparedStatementRef("select b.tipo, count(*) "+
                        "from mobile_stations a, station_types b, dati c "+
                        "where a.id_station_type = b.id_station_type "+
                        "and a.id_mobile_station=c.id_mobile_station "+
                        "and b.macro_type = 'M' "+          
                        "group by b.tipo");
                
                
                
               
                
                   
                    dsm.runPreparedQuery();
                

                    
                    while(dsm.next()){
                        JSONObject jobj = new JSONObject();  
                        jobj.put("tipo", dsm.getString(1));
                        jobj.put("numero",dsm.getInteger(2));
                        jArray.put(jobj);
                    }
                
                
                }else{
                        //Ora tiro giu la tabella con le stazioni eddy
                    dsm.setPreparedStatementRef("select b.tipo, count(*) "+
                            "from mobile_stations a, station_types b, dati_eddy c "+
                            "where a.id_station_type = b.id_station_type "+
                            "and a.id_mobile_station=c.id_mobile_station "+
                            "and b.macro_type = 'E'  "+          
                            "group by b.tipo");



                    dsm.runPreparedQuery();



                    while(dsm.next()){
                        JSONObject jobj = new JSONObject();  
                        jobj.put("tipo", dsm.getString(1));
                        jobj.put("numero",dsm.getInteger(2));
                        jArray.put(jobj);
                    }

                    //ora effettuo query per il recupero delle tabelle di dati stazioni fisse
                    dsm.setPreparedStatementRef("select b.tipo, count(*) "+
                            "from mobile_stations a, station_types b, dati_stazioni_fisse c "+
                            "where a.id_station_type = b.id_station_type "+
                            "and a.id_mobile_station=c.id_mobile_station "+
                            "and b.macro_type = 'T' "+          
                            "group by b.tipo");



                    dsm.runPreparedQuery();



                    while(dsm.next()){
                        JSONObject jobj = new JSONObject();  
                        jobj.put("tipo", dsm.getString(1));
                        jobj.put("numero",dsm.getInteger(2));
                        jArray.put(jobj);
                    }
                    
                    
                    
                /*    
                    dsm2.setPreparedStatementRef("select 'AgroMeteo', count(*) "+
                            "from stazioni a, dati c "+
                            "where a.id_stazione = c.id_stazione "+
                            "group by 1");



                    dsm2.runPreparedQuery();
                    while(dsm2.next()){
                        JSONObject jobj = new JSONObject();  
                        jobj.put("tipo", dsm2.getString(1));
                        jobj.put("numero",dsm2.getInteger(2));
                        jArray.put(jobj);
                    }*/
                }
                
                
                response.setContentType("application/json");
                response.getWriter().write(jArray.toString());
            } catch (Exception ex) {
                Logger.getLogger(GetDBSummary.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    dsm.closeConnection();
                } catch (SQLException ex) {
                    Logger.getLogger(GetDBSummary.class.getName()).log(Level.SEVERE, null, ex);
                }
       //         try {
        //            dsm2.closeConnection();
        //        } catch (SQLException eex) {
        //            Logger.getLogger(GetDBSummary.class.getName()).log(Level.SEVERE, null, eex);
        //        }
               
            }
        }
        
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
            
        }	
    
}
