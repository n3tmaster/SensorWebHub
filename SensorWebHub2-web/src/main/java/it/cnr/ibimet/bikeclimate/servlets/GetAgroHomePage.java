package it.cnr.ibimet.bikeclimate.servlets;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.AgroDataMobile;
import it.lr.libs.DBManager.ParameterType;

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

public class GetAgroHomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
			int userLevel=-1;
			String userLevelStr=null;
			String daQui=null, finoAQui=null,questaStazione=null;
			StringTokenizer st=null;
			String sqlString, sqlString2;
	
			TDBManager dsm=null,dsm2=null;
			ByteBuffer outputBB;
			String questoDominio;
			
			AgroDataMobile questoRec;
			Vector<AgroDataMobile> questoResult;
			
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				System.out.println("GetAgroHomePage Servlet - sono dentro");
				dsm = new TDBManager("jdbc/imetnetdb");
				dsm2 = new TDBManager("jdbc/imetnetdb");
				
	//			questoResult = new Vector<StationAndroid>();
				
				sqlString="select id_stazione from stazioni order by 1";
				sqlString2="select data,temp_media, rad_media, wind_medio, precipitazione, " +
						"umidita_media, bagnatura_fogliare, id_dato from stazioni where id_stazione=? order by 1 desc";
				dsm.setPreparedStatementRef(sqlString);
				dsm2.setPreparedStatementRef(sqlString2);
				dsm.runPreparedQuery();
				questoResult = new Vector<AgroDataMobile> ();
				
				while(dsm.next()){
					questaStazione=dsm.getString(1);
					dsm2.setParameter(ParameterType.STRING, questaStazione, 1);
					dsm2.runPreparedQuery();
					
					
					if(dsm2.next()){
						questoRec  = new AgroDataMobile(dsm2.getData(1).getTimeInMillis(),dsm2.getDouble(2), 
							dsm2.getDouble(3), dsm2.getDouble(4), dsm2.getDouble(5),
						    dsm2.getDouble(6), dsm2.getDouble(7), questaStazione, dsm2.getInteger(8) );
					
						questoResult.add(questoRec);
					}
					
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
			try {
				dsm.closeConnection();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
