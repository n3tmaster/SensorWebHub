/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.servlets;

import it.cnr.ibimet.bikeclimate.dbutils.SWH4EConst;
import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;
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
public class GetStationSum extends HttpServlet implements SWH4EConst{
	private static final long serialVersionUID = 1L;
	private TDBManager dsm=null;
	//private TDBManager dsm2=null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try {
                int totalone=0;
                String tipoout = "";
                String macrotipo = request.getParameter("macrotipo");
                 
                dsm = new TDBManager("jdbc/urbandb");
           //      dsm2 = new TDBManager("jdbc/imetnetdb");  //TODO: toglierlo quando si unira i db
                
                if(macrotipo.equals(MACROTIPO_MOBILI)){
                    tipoout="Stazioni Mobili";
                    dsm.setPreparedStatementRef("select count(*) "
                        + "from mobile_stations "
                        + "where tipo=? and id_domain in (?,?) ");
                    
                    dsm.setParameter(ParameterType.STRING, TIPO_M, 1);
                    dsm.setParameter(ParameterType.INT,""+ DOMINIO_URBAN, 2);
                      dsm.setParameter(ParameterType.INT,""+ DOMINIO_AGROMETEO, 3);
                    dsm.runPreparedQuery();
                    
                    if(dsm.next()){
                        totalone=dsm.getInteger(1);
                    }
                    
                } else {
                    tipoout="Stazioni Fisse";
                    dsm.setPreparedStatementRef("select count(*) "
                        + "from mobile_stations "
                        + "where tipo<>? and id_domain in (?,?) ");
                    
                    dsm.setParameter(ParameterType.STRING, TIPO_M, 1);
                    dsm.setParameter(ParameterType.INT,""+ DOMINIO_URBAN, 2);
                    dsm.setParameter(ParameterType.INT,""+ DOMINIO_AGROMETEO, 3);
                    dsm.runPreparedQuery();
                    
                    if(dsm.next()){
                        totalone=dsm.getInteger(1);
                    }
                    //TODO: da togliere quando fonderemo i db
                      
                /*    dsm2.setPreparedStatementRef("select count(*) "
                        + "from stazioni ");
                    dsm2.runPreparedQuery();
                    
                    if(dsm2.next()){
                        totalone+=dsm2.getInteger(1);
                    }
                  */  
                }
                
            

                //Ora tabella per tabella calcolerò il totale
                JSONArray jArray= new JSONArray();
                    
             
                    JSONObject jobj = new JSONObject();  
                 
                        jobj.put("categoria", tipoout);
                        jobj.put("numero",totalone);
                   
                    
                    jArray.put(jobj);
                    
              
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
                
           //     try {
           //         dsm2.closeConnection();
           //     } catch (SQLException ex) {
           //         Logger.getLogger(GetDBSummary.class.getName()).log(Level.SEVERE, null, ex);
           //     }
            }
        }
        
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
            
        }	
    
}
