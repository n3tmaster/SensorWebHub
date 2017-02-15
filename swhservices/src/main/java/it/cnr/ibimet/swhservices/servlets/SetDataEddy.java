package it.cnr.ibimet.swhservices.servlets;


import it.cnr.ibimet.dbutils.TDBManager;
import it.cnr.ibimet.swhservices.entities.EddyDataServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;


public class SetDataEddy extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
			int userLevel=-1;
			String userLevelStr=null;
			String rigaLetta=null;
			StringTokenizer st=null;
			TDBManager dsm=null;
			EddyDataServlet questeBikeData;
			
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
				dsm = new TDBManager("jdbc/urbandb");
				
				//recupero stringa
				rigaLetta=request.getParameter("dato_in");
				
				st=new StringTokenizer(rigaLetta,",");
				System.out.println(rigaLetta);	
				questeBikeData=new EddyDataServlet(dsm);
				
				
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
				questeBikeData.setNome_mobile_station((st.nextToken())); //ideddy
				
				questeBikeData.setTair(Double.parseDouble(st.nextToken()));
				questeBikeData.setCo2(Double.parseDouble(st.nextToken()));
				questeBikeData.setH2o(Double.parseDouble(st.nextToken()));
				questeBikeData.setUstar(Double.parseDouble(st.nextToken()));
				questeBikeData.setCo2_flux(Double.parseDouble(st.nextToken()));
				questeBikeData.setH2o_flux(Double.parseDouble(st.nextToken()));
				questeBikeData.setLe(Double.parseDouble(st.nextToken()));
				questeBikeData.setHx(Double.parseDouble(st.nextToken()));
				questeBikeData.setTau(Double.parseDouble(st.nextToken()));
				
				questeBikeData.setPacchetti(Integer.parseInt(st.nextToken()));
				questeBikeData.setWind(Double.parseDouble(st.nextToken()));
				questeBikeData.setWind_ang(Double.parseDouble(st.nextToken()));
				questeBikeData.setAnalog_3(-9999);
				questeBikeData.setAnalog_4(-9999);
				
				questeBikeData.insertDato();
				
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userAgent =  request.getHeader("user-agent");
		String clientBrowser =  "Not known!";	
		String valoreRitorno = "-2";
		int userLevel=-1;
		String userLevelStr=null;
		String rigaLetta=null;
		StringTokenizer st=null;
		TDBManager dsm=null;
		EddyDataServlet questeBikeData;
		
		if( userAgent != null)
			clientBrowser = userAgent;

		
		
		//Effettuo controllo sul db
		try {
			dsm = new TDBManager("jdbc/urbandb");
			
			//recupero stringa
			rigaLetta=request.getParameter("dato_in");
			
			st=new StringTokenizer(rigaLetta,",");
			System.out.println(rigaLetta);	
			questeBikeData=new EddyDataServlet(dsm);
			
			
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
			questeBikeData.setNome_mobile_station((st.nextToken())); //ideddy
			
			questeBikeData.setTair(Double.parseDouble(st.nextToken()));
			questeBikeData.setCo2(Double.parseDouble(st.nextToken()));
			questeBikeData.setH2o(Double.parseDouble(st.nextToken()));
			questeBikeData.setUstar(Double.parseDouble(st.nextToken()));
			questeBikeData.setCo2_flux(Double.parseDouble(st.nextToken()));
			questeBikeData.setH2o_flux(Double.parseDouble(st.nextToken()));
			questeBikeData.setLe(Double.parseDouble(st.nextToken()));
			questeBikeData.setHx(Double.parseDouble(st.nextToken()));
			questeBikeData.setTau(Double.parseDouble(st.nextToken()));
			
			questeBikeData.setPacchetti(-9999);
			questeBikeData.setWind(-9999);
			questeBikeData.setWind_ang(-9999);
			questeBikeData.setAnalog_3(-9999);
			questeBikeData.setAnalog_4(-9999);
			
			questeBikeData.insertDato();
			
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
