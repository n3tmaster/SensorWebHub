package it.cnr.ibimet.swhservices.servlets;


import it.cnr.ibimet.dbutils.TDBManager;
import it.cnr.ibimet.swhservices.entities.EddyData;
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
import java.util.GregorianCalendar;
import java.util.StringTokenizer;
import java.util.Vector;


public class GetAllEddyData extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Vector<EddyData> questiRisultati = new Vector<EddyData>();
		
		String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
			int userLevel=-1;
			String userLevelStr=null;
			String questaStazione=null;
			StringTokenizer st=null;
			TDBManager dsm=null;
			ByteBuffer outputBB;

			
			
			String questoDominio;
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				questoDominio = request.getParameter("dominio");
				System.out.println("DB Sync - sono dentro");
				dsm = new TDBManager("jdbc/"+questoDominio);
				
				
				
				GregorianCalendar result1 = new GregorianCalendar(Integer.parseInt(request.getParameter("anno1")),
						(Integer.parseInt(request.getParameter("mese1"))-1),
						Integer.parseInt(request.getParameter("giorno1")));
		        GregorianCalendar result2 = new GregorianCalendar(Integer.parseInt(request.getParameter("anno2")),
		        		(Integer.parseInt(request.getParameter("mese2"))-1),
						Integer.parseInt(request.getParameter("giorno2")));
				
				
				
				questaStazione = request.getParameter("stazione");
				
				String queryStr = "select  a.data,a.co2_flux,a.hx,a.pacchetti,"
						+ "a.le,a.ustar,a.co2,a.wind,a.wind_ang,a.tair,a.analog_3,a.analog_4,a.tau,a.h2o,a.h2o_flux  "
						+ "from dati_eddy a, mobile_stations b " +
							"where   a.data between ? and ? " +
							"and   b.nome=? "+
							"and   a.id_mobile_station = b.id_mobile_station "+
							"order by data";
				dsm.setPreparedStatementRef(queryStr);
				
			
				dsm.setParameter(ParameterType.DATE, result1, 1);
				dsm.setParameter(ParameterType.DATE,result2, 2);
				dsm.setParameter(ParameterType.STRING, questaStazione, 3);
				
				dsm.runPreparedQuery();
				
				
				//JSONObject jobj = new JSONObject();
				

				while(dsm.next()){
					EddyData questoElem=new EddyData(dsm.getData(1), dsm.getInteger(4),
							dsm.getDouble(2), dsm.getDouble(3), dsm.getDouble(5), dsm.getDouble(6),
							dsm.getDouble(7),dsm.getDouble(8), dsm.getDouble(9),dsm.getDouble(10),
							dsm.getInteger(11), dsm.getInteger(12),
							questaStazione,0,dsm.getDouble(13), dsm.getDouble(14), dsm.getDouble(15));
					
					questiRisultati.add(questoElem);
					
				}
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				ObjectOutputStream oos = new ObjectOutputStream(baos);
				oos.writeObject(questiRisultati);
				outputBB=ByteBuffer.wrap(baos.toByteArray());
				ServletOutputStream sos = response.getOutputStream();
			    
				if(outputBB != null){
					response.setContentType("application/octet-stream");
					
					response.setContentLength(outputBB.capacity());
					System.out.println("settato la capacita :"+outputBB.capacity());
					sos.write(outputBB.array());
					sos.flush();
					sos.close();
					
				}else{
					System.out.println("Errore!!!");
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
	private String riformattaElemento(int questoElem){
		if(questoElem<10){
			return "0"+questoElem;
		}else{
			return ""+questoElem;
		}
	}
}
