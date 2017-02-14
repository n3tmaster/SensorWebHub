package it.cnr.ibimet.bikeclimate.servlets;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.StationAndroid;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.nio.ByteBuffer;
import java.sql.SQLException;
import java.util.StringTokenizer;
import java.util.Vector;

public class GetStationList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
			int userLevel=-1;
			String userLevelStr=null;
			String daQui=null, finoAQui=null,questaStazione=null;
			StringTokenizer st=null;
			String sqlString;
			TDBManager dsm=null;
			ByteBuffer outputBB;
			String questoDominio;
			
			StationAndroid questoRec;
			Vector<StationAndroid> questoResult;
			
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				questoDominio = request.getParameter("dominio");
				System.out.println("GetStationList Servlet - sono dentroa");
				System.out.println("GetStationList dominio: "+questoDominio);
				dsm = new TDBManager("jdbc/"+questoDominio);
				
				questoResult = new Vector<StationAndroid>();
				
				sqlString="select a.id_stazione, a.id_ente, a.id_azienda, a.gsm, c.nome_ente, b.nome_azienda " +
						"from stazioni a, aziende b, enti c "+
						"where a.id_azienda=b.id_azienda "+
						"and   c.id_ente=a.id_ente";
				dsm.setPreparedStatementRef(sqlString);
			
				dsm.runPreparedQuery();
				long questoLong=0000000000L;
				while(dsm.next()){
					questoRec = new StationAndroid(dsm.getString(1), dsm.getInteger(2), 
							dsm.getInteger(3),  questoLong, dsm.getString(5), dsm.getString(6));
					
					questoResult.add(questoRec);
				}
				
				
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				ObjectOutputStream oos = new ObjectOutputStream(baos);
				oos.writeObject(questoResult);
				outputBB = ByteBuffer.wrap(baos.toByteArray());
				ServletOutputStream sos = response.getOutputStream();
							
				if(outputBB != null){
					response.setContentType("application/octet-stream");
					response.setContentLength(outputBB.capacity());
					System.out.println("isAndroid : settato la capacita :"+outputBB.capacity());
					sos.write(outputBB.array());
					System.out.println("isAndroid : ho messo array :");
					sos.flush();
					sos.close();
					
				}else{
					System.out.println("isAndroid : ERRORE!!!");
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
