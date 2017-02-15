package it.cnr.ibimet.swhservices.servlets;


import it.cnr.ibimet.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;


public class GetDataTotem2 extends HttpServlet {
	
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

			
			
			String questoDominio;
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				questoDominio = request.getParameter("dominio");
				System.out.println("GetData Servlet - sono dentro");
				dsm = new TDBManager("jdbc/"+questoDominio);
				GregorianCalendar result1=null;
                                GregorianCalendar result2=null;
                                if(request.getParameter("ora1")!=null){
                                        result1 = new GregorianCalendar(Integer.parseInt(request.getParameter("anno1")),
						(Integer.parseInt(request.getParameter("mese1"))-1),
						Integer.parseInt(request.getParameter("giorno1")),
                                                Integer.parseInt(request.getParameter("ora1")),
                                                Integer.parseInt(request.getParameter("minuto1")),
                                                Integer.parseInt(request.getParameter("secondo1")));
                                        result2 = new GregorianCalendar(Integer.parseInt(request.getParameter("anno2")),
                                                (Integer.parseInt(request.getParameter("mese2"))-1),
						Integer.parseInt(request.getParameter("giorno2")),
                                                Integer.parseInt(request.getParameter("ora2")),
                                                Integer.parseInt(request.getParameter("minuto2")),
                                                Integer.parseInt(request.getParameter("secondo2"))); 
                                }else{
                                    result1 = new GregorianCalendar(Integer.parseInt(request.getParameter("anno1")),
						(Integer.parseInt(request.getParameter("mese1"))-1),
						Integer.parseInt(request.getParameter("giorno1")));
                                    result2 = new GregorianCalendar(Integer.parseInt(request.getParameter("anno2")),
                                                (Integer.parseInt(request.getParameter("mese2"))-1),
						Integer.parseInt(request.getParameter("giorno2")));
                                }
				
				
				
				
				
				
				questaStazione = request.getParameter("stazione");
				
				String queryStr = "select a.tair, a.co2, a.rad, a.noise, a.utc, " +
							"a.data, a.o3, ST_X(b.the_geom) as x, ST_Y(b.the_geom) as y,"
                                        + "   no2 as no2, co as co, voc as voc, utcstr as utcstr  "
                                        + " from dati_stazioni_fisse a, mobile_stations b " +
							"where   a.data between ? and ? " +
							"and   b.nome=? "+
							"and   a.id_mobile_station=b.id_mobile_station " +
							"order by data";
				dsm.setPreparedStatementRef(queryStr);
				
			
				dsm.setParameter(ParameterType.DATE, result1, 1);
				dsm.setParameter(ParameterType.DATE,result2, 2);
				dsm.setParameter(ParameterType.STRING, questaStazione, 3);
				
				dsm.runPreparedQuery();
				
				
				//JSONObject jobj = new JSONObject();
				JSONArray jArray= new JSONArray();
				
				String giorno, mese, ora, minuto;
				
				while(dsm.next()){
					JSONObject jobj = new JSONObject();
				
					giorno=riformattaElemento(dsm.getData(6).get(Calendar.DAY_OF_MONTH));
					mese=riformattaElemento((dsm.getData(6).get(Calendar.MONTH) + 1));
					ora=riformattaElemento(dsm.getData(6).get(Calendar.HOUR_OF_DAY));
					minuto=riformattaElemento(dsm.getData(6).get(Calendar.MINUTE));
			
					jobj.put("t_air", dsm.getDouble(1));
					
					if( dsm.getInteger(2)<0){
						jobj.put("co2", 0);
					}else{
						jobj.put("co2", dsm.getInteger(2));
					}
					jobj.put("hum", dsm.getDouble(3));
					jobj.put("noise", dsm.getDouble(4));
					if(dsm.getInteger(7)<0){
						jobj.put("o3", 0);
					}else{
						jobj.put("o3", dsm.getInteger(7));
					}
					jobj.put("utc", dsm.getDouble(5));
					jobj.put("data", giorno + "-" +
							mese + "-" +
							dsm.getData(6).get(Calendar.YEAR) + " " +
							ora + ":" +
							minuto);
					
                                        jobj.put("long", dsm.getDouble(8));
					jobj.put("lat", dsm.getDouble(9));
                                        
                                        jobj.put("no2", dsm.getDouble(10));
                                        jobj.put("co", dsm.getDouble(11));
                                        jobj.put("voc", dsm.getDouble(12));
                                        jobj.put("utcstr", dsm.getDouble(13));
				
					jArray.add(jobj);
				}
				response.setContentType("application/json");
				response.getWriter().write(jArray.toJSONString());
			
				
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
