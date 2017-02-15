package it.cnr.ibimet.swhservices.servlets;


import it.cnr.ibimet.dbutils.TDBManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.ByteBuffer;
import java.sql.SQLException;
import java.util.StringTokenizer;


public class GetLogFile extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
			int userLevel=-1;
			String userLevelStr=null;
			String questaStazione=null;
			StringTokenizer st=null;
			TDBManager dsm=null;
			ByteBuffer outputBB;

			
			
			String  tipoStazione, questoDominio, anno,mese,giorno;
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				
                                tipoStazione = request.getParameter("stationType");
                                
                                anno = request.getParameter("year");
                                mese = request.getParameter("month");
                                giorno = request.getParameter("day");
                                String nomeFile=tipoStazione+"_logfile"+giorno+"-"+mese+"-"+anno+".txt";
                                String sCurrentLine;
				System.out.println("GetLog Servlet - leggo file: "+nomeFile);
				
                                BufferedReader br = new BufferedReader(new FileReader("/var/www/html/log/"+nomeFile));
                                
                                
                                response.setContentType("text/plain");
                      //          response.setHeader("Content-Disposition", "attachment;filename="+nomeFile);
                                
                                PrintWriter out = response.getWriter();
                              //  ServletContext srvct = this.getServletContext();
                                while((sCurrentLine=br.readLine()) != null){
                                    out.println(sCurrentLine);
                                }
                                
                                
				
		} catch (Exception e) {
				
				e.printStackTrace();
		} finally {
			try {
				dsm.closeConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
}
