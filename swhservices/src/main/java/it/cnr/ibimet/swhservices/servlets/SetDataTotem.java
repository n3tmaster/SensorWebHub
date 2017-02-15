package it.cnr.ibimet.swhservices.servlets;


import it.cnr.ibimet.dbutils.TDBManager;
import it.cnr.ibimet.swhservices.entities.BikeDataServlet;
import it.cnr.ibimet.swhservices.entities.TotemDataServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;


public class SetDataTotem extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userAgent =  request.getHeader("user-agent");
		String clientBrowser =  "Not known!";	
		String valoreRitorno = "-2";
		int userLevel=-1;
		String userLevelStr=null;
		String rigaLetta=null;
		StringTokenizer st=null;
		TDBManager dsm=null;
		TotemDataServlet questeBikeData;
		
		if( userAgent != null)
			clientBrowser = userAgent;

		
		
		//Effettuo controllo sul db
		try {
			dsm = new TDBManager("jdbc/urbandb");
			
			//recupero stringa
			rigaLetta=request.getParameter("dato_in");
			
			st=new StringTokenizer(rigaLetta,",");
			System.out.println(rigaLetta);	
			questeBikeData=new TotemDataServlet(dsm);
			
			
			GregorianCalendar gc = new GregorianCalendar();
			int questoYear=Integer.parseInt(st.nextToken());
			System.out.print("Year: "+questoYear+" ");
			gc.set(Calendar.YEAR,questoYear);
			
			questoYear= Integer.parseInt(st.nextToken());
			System.out.print("..mese: "+questoYear+" ");
			gc.set(Calendar.MONTH,(questoYear-1));
			
			
			questoYear= Integer.parseInt(st.nextToken());
			System.out.print("..giorno: "+questoYear+" ");
			gc.set(Calendar.DAY_OF_MONTH,(questoYear));
			
			questoYear= Integer.parseInt(st.nextToken());
			System.out.print("..ora: "+questoYear+" ");
			gc.set(Calendar.HOUR_OF_DAY,(questoYear));
		
			questoYear= Integer.parseInt(st.nextToken());
			System.out.print("..ora: "+questoYear+" ");
			gc.set(Calendar.MINUTE,(questoYear));
				
			questeBikeData.setDataDato(gc);
			questeBikeData.setNome_mobile_station((st.nextToken()));
			questeBikeData.setCo2(Integer.parseInt(st.nextToken()));
			questeBikeData.setTair(Double.parseDouble(st.nextToken()));
			questeBikeData.setRad(Double.parseDouble(st.nextToken()));
			questeBikeData.setNoise(Double.parseDouble(st.nextToken()));
			
			questeBikeData.setO3(Integer.parseInt(st.nextToken()));
			questeBikeData.setUtc(Double.parseDouble(st.nextToken()));
				
			questeBikeData.insertDato();
			
			response.setContentType("text/html");
			response.getWriter().write("1");
			
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
				rigaLetta=request.getParameter("dato_in");
				rigaLetta=rigaLetta.replace(",,",",nan,");
				rigaLetta=rigaLetta.replace(",,",",nan,");
				st=new StringTokenizer(rigaLetta,",");
				System.out.println(rigaLetta);	
				questeBikeData=new BikeDataServlet(dsm);
				
				
				GregorianCalendar gc = new GregorianCalendar();
				int questoYear=Integer.parseInt(st.nextToken());
				System.out.print("Year: "+questoYear+" ");
				gc.set(Calendar.YEAR,questoYear);
				
				questoYear= Integer.parseInt(st.nextToken());
				System.out.print("..mese: "+questoYear+" ");
				gc.set(Calendar.MONTH,(questoYear-1));
				
				
				questoYear= Integer.parseInt(st.nextToken());
				System.out.print("..giorno: "+questoYear+" ");
				gc.set(Calendar.DAY_OF_MONTH,(questoYear));
				
				questoYear= Integer.parseInt(st.nextToken());
				System.out.print("..ora: "+questoYear+" ");
				gc.set(Calendar.HOUR_OF_DAY,(questoYear));
			
				questoYear= Integer.parseInt(st.nextToken());
				System.out.print("..ora: "+questoYear+" ");
				gc.set(Calendar.MINUTE,(questoYear));
					
				questeBikeData.setDataDato(gc);
				questeBikeData.setNome_mobile_station((st.nextToken()));
				questeBikeData.setCo2(Integer.parseInt(st.nextToken()));
				questeBikeData.setTair(Double.parseDouble(st.nextToken()));
				questeBikeData.setRad(Double.parseDouble(st.nextToken()));
				questeBikeData.setNoise(Double.parseDouble(st.nextToken()));
				
				questeBikeData.setO3(Integer.parseInt(st.nextToken()));
				questeBikeData.setGpsstring((st.nextToken()));
				String questaCoord = st.nextToken();
			if(!questaCoord.equalsIgnoreCase("nan")){
				questeBikeData.setUtc(Double.parseDouble(questaCoord));
					
				
				
				st.nextToken(); //skippo parametro v
				
				questaCoord=st.nextToken();
				if(!questaCoord.equalsIgnoreCase("nan")){
					
				
					questeBikeData.setLatitudine(questaCoord);
					st.nextToken(); //skippo parametro N
					questaCoord=st.nextToken();
					
					if(!questaCoord.equalsIgnoreCase("nan")){
						questeBikeData.setLongitudine(questaCoord);
				
						System.out.print("salvo il dato...");
						questeBikeData.insertDato();
					}else{
						System.out.println("Longitudine: none");
						questeBikeData.insertDatoNoGeo();
					}
				}else{
					System.out.println("Latitudine: nan");
					questeBikeData.insertDatoNoGeo();
				}
			}else{
			
				System.out.println("utc: nan");
				questeBikeData.insertDatoNoGeo();
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
