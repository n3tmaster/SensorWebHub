package it.cnr.ibimet.swhservices.servlets;

import it.cnr.ibimet.dbutils.TDBManager;
import it.cnr.ibimet.swhservices.entities.BikeDataServlet;
import it.lr.libs.DBManager.ParameterType;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.StringTokenizer;

public class CheckLogin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
			int userLevel=-1;
			String userLevelStr=null;
			String rigaLetta=null;
			StringTokenizer st=null;
			TDBManager dsm=null;
			BikeDataServlet questeBikeData;
			
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				dsm = new TDBManager("jdbc/urbandb");
				
				//recupero stringa
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				String sqlString="select livello,id_utente " +
						"from utenti "+
						"where userid=? and pwd=?";
	
				dsm.setPreparedStatementRef(sqlString);
				dsm.setParameter(ParameterType.STRING, username, 1);
				dsm.setParameter(ParameterType.STRING, password, 2);
				dsm.runPreparedQuery();
				
				String loggedIn="";
				if(dsm.next()){
					loggedIn="1";
				}else{
					loggedIn="0";
				}
				
				response.setContentType("text/plain");              //Setto il tipo di content
				OutputStream os = response.getOutputStream();      //recupero lo stream chiamante per riempirlo
				BufferedOutputStream  bos = new BufferedOutputStream(os);  
					
				bos.write(loggedIn.getBytes(),0,loggedIn.getBytes().length);   //scrivo nello stream
				bos.close();
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
