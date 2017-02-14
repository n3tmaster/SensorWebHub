/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.servlets;

import it.cnr.ibimet.bikeclimate.dbutils.SWH4EConst;
import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;

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
public class GetDataSummaryALL extends HttpServlet implements SWH4EConst{
	private static final long serialVersionUID = 1L;
	private TDBManager dsm=null;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try {
                dsm = new TDBManager("jdbc/urbandb");
               
                double totalone=0;
                //query per il recupero delle tabelle-entita e le salvo in un array
                dsm.setPreparedStatementRef("select count(*) "+
                        "from mobile_stations a, station_types b, dati c "+
                        "where a.id_station_type = b.id_station_type "+
                        "and a.id_mobile_station=c.id_mobile_station "+
                        "and b.macro_type = 'M' ");
                
                
                   
                dsm.runPreparedQuery();
                

                if(dsm.next()){
                    totalone=(double)dsm.getInteger(1);
                }
                //Ora tiro giu la tabella con le stazioni eddy
                dsm.setPreparedStatementRef("select  count(*) "+
                        "from mobile_stations a, station_types b, dati_eddy c "+
                        "where a.id_station_type = b.id_station_type "+
                        "and a.id_mobile_station=c.id_mobile_station "+
                        "and b.macro_type = 'E' ");
                
                
                   
                dsm.runPreparedQuery();
                

                if(dsm.next()){
                    totalone+=(double)dsm.getInteger(1);
                }
                
                //ora effettuo query per il recupero delle tabelle di dati stazioni fisse
                dsm.setPreparedStatementRef("select count(*) "+
                        "from mobile_stations a, station_types b, dati_stazioni_fisse c "+
                        "where a.id_station_type = b.id_station_type "+
                        "and a.id_mobile_station=c.id_mobile_station "+
                        "and b.macro_type = 'T' ");
                
                
                   
                dsm.runPreparedQuery();
                

               
                 if(dsm.next()){
                    totalone+=(double)dsm.getInteger(1);
                }
                
                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().write(""+totalone);
            } catch (Exception ex) {
                Logger.getLogger(GetDBSummary.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    dsm.closeConnection();
                } catch (SQLException ex) {
                    Logger.getLogger(GetDBSummary.class.getName()).log(Level.SEVERE, null, ex);
                }
                
               
            }
        }
        
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
            
        }	
    
}
