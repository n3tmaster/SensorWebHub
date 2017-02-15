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


public class GetData extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	/**
         * 
         * Recupero dati mobili
         * @param request
         * @param response
         * @throws ServletException
         * @throws IOException 
         */
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
				
				
				
				GregorianCalendar result1 = new GregorianCalendar(Integer.parseInt(request.getParameter("anno1")),
						(Integer.parseInt(request.getParameter("mese1"))-1),
						Integer.parseInt(request.getParameter("giorno1")),
                                                Integer.parseInt(request.getParameter("ora1")),
                                                Integer.parseInt(request.getParameter("minuto1")),
                                                Integer.parseInt(request.getParameter("secondo1")));
                                GregorianCalendar result2 = new GregorianCalendar(Integer.parseInt(request.getParameter("anno2")),
                                                (Integer.parseInt(request.getParameter("mese2"))-1),
						Integer.parseInt(request.getParameter("giorno2")),
                                                Integer.parseInt(request.getParameter("ora2")),
                                                Integer.parseInt(request.getParameter("minuto2")),
                                                Integer.parseInt(request.getParameter("secondo2")));
				
				
				
				questaStazione = request.getParameter("stazione");
				
				String queryStr = "select ST_X(a.the_geom),ST_Y(a.the_geom),a.tair,a.co2,a.rad,a.utc, " +
							"a.data,a.o3,a.ntc, a.ds18, a.pk, a.no2, a.co, a.voc, a.utcstr from dati a, mobile_stations b " +
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
				
				
				while(dsm.next()){
					JSONObject jobj = new JSONObject();
						
					jobj.put("lat", dsm.getDouble(2));
					jobj.put("long", dsm.getDouble(1));
                                        
                                        jobj.put("data", dsm.getData(7).get(Calendar.DAY_OF_MONTH) + "-" +
							(dsm.getData(7).get(Calendar.MONTH) + 1) + "-" +
							dsm.getData(7).get(Calendar.YEAR) + " " +
							dsm.getData(7).get(Calendar.HOUR_OF_DAY) + ":" +
							dsm.getData(7).get(Calendar.MINUTE)+ ":"+
                                                        dsm.getData(7).get(Calendar.SECOND));
                                        
                                        
                                        jobj.put("t_air", dsm.getDouble(3));
					
					if( dsm.getInteger(4)<0){
						jobj.put("co2", 0);
					}else{
						jobj.put("co2", dsm.getInteger(4));
					}
					
                                        
                                        jobj.put("umidita", dsm.getDouble(5));
					
					if(dsm.getInteger(8)<0){
						jobj.put("o3", 0);
					}else{
						jobj.put("o3", dsm.getInteger(8));
					}
					
                                        if(dsm.getDouble(9)<0){
						jobj.put("ntc", 0);
					}else{
						jobj.put("ntc", dsm.getDouble(9));
					}

                                        if(dsm.getDouble(10)<0){
						jobj.put("ds18", 0);
					}else{
						jobj.put("ds18", dsm.getDouble(10));
					}

                                        if(dsm.getInteger(11)<0){
						jobj.put("pk", 0);
					}else{
						jobj.put("pk", dsm.getInteger(11));
					}
                                        
					jobj.put("utc", dsm.getInteger(6));
					
					
                                        
					if(dsm.getInteger(12)<0){
						jobj.put("no2", 0);
					}else{
						jobj.put("no2", dsm.getInteger(12));
					}
                                        if(dsm.getInteger(13)<0){
						jobj.put("co", 0);
					}else{
						jobj.put("co", dsm.getInteger(13));
					}
                                        if(dsm.getInteger(14)<0){
						jobj.put("voc", 0);
					}else{
						jobj.put("voc", dsm.getInteger(14));
					}
                                    
				         jobj.put("utcstr", dsm.getString(15));
				
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
	
}
