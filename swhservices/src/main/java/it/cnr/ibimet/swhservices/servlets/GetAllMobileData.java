package it.cnr.ibimet.swhservices.servlets;


import it.cnr.ibimet.swhservices.entities.BikeData;
import it.cnr.ibimet.swhservices.libs.BCDBManager;
import it.lr.libs.DBManager.ParameterType;
import org.apache.poi.util.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.nio.ByteBuffer;
import java.sql.SQLException;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;
import java.util.Vector;


public class GetAllMobileData extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Vector<BikeData> questiRisultati = new Vector<BikeData>();
		
		String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
			int userLevel=-1;
			String userLevelStr=null;
			String questaStazione=null;
			StringTokenizer st=null;
			BCDBManager dsm=null;
			ByteBuffer outputBB;
			
			InputStream is;
			
			
			String questoDominio;
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				questoDominio = request.getParameter("dominio");
				System.out.println("DB Sync - sono dentro");
				dsm = new BCDBManager("jdbc/"+questoDominio);
				
				
				
				GregorianCalendar result1 = new GregorianCalendar(Integer.parseInt(request.getParameter("anno1")),
						(Integer.parseInt(request.getParameter("mese1"))-1),
						Integer.parseInt(request.getParameter("giorno1")));
		        GregorianCalendar result2 = new GregorianCalendar(Integer.parseInt(request.getParameter("anno2")),
		        		(Integer.parseInt(request.getParameter("mese2"))-1),
						Integer.parseInt(request.getParameter("giorno2")));
				
				
				
				questaStazione = request.getParameter("stazione");
				
				
				String queryStr = "select  a.data,ST_AsBinary(a.the_geom),a.co2,a.tair,"
						+ "a.rad,a.noise,a.utc,a.o3,a.ntc,a.ds18,a.pk, a.no2 as no2, a.co as co, a.voc as voc, a.utcstr as utcstr  "
						+ "from dati a, mobile_stations b " +
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
				   
				    
				    is = dsm.getBinary(2);
				    byte []questiByte = IOUtils.toByteArray(is);
				
				    System.out.println("Lunghezza byte "+questiByte.length);
				    
					BikeData questoElem=new BikeData(dsm.getData(1), dsm.getInteger(4),
							dsm.getDouble(6), dsm.getDouble(5), dsm.getInteger(3), questaStazione,
							0,dsm.getInteger(8), dsm.getDouble(9),dsm.getDouble(10),
							dsm.getInteger(11), questiByte, dsm.getDouble(7),
                                                        dsm.getInteger(12),dsm.getInteger(13),dsm.getInteger(14),dsm.getString(15));
					
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
