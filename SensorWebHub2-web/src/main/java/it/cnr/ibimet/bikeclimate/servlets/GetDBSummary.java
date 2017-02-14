/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.servlets;

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
public class GetDBSummary extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TDBManager dsm=null;
	private TDBManager dsm2=null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try {
                dsm = new TDBManager("jdbc/urbandb");
                dsm2 = new TDBManager("jdbc/urbandb");
                
                dsm.setPreparedStatementRef("select a.table_name, b.data_type from data_table a, data_table_type b where a.id_data_table_type=b.id_data_table_type");
                
                dsm.runPreparedQuery();
                
                while(dsm.next()){
                    //Ora tabella per tabella calcolerò il totale
                }
                
            } catch (Exception ex) {
                Logger.getLogger(GetDBSummary.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    dsm.closeConnection();
                } catch (SQLException ex) {
                    Logger.getLogger(GetDBSummary.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                try {
                    dsm2.closeConnection();
                } catch (SQLException ex) {
                    Logger.getLogger(GetDBSummary.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
            
        }	
    
}
