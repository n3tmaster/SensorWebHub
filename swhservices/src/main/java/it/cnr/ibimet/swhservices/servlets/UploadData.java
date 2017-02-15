package it.cnr.ibimet.swhservices.servlets;


import it.cnr.ibimet.dbutils.TDBManager;
import it.cnr.ibimet.swhservices.entities.BikeDataServlet;
import it.cnr.ibimet.swhservices.entities.EddyDataServlet;
import it.cnr.ibimet.swhservices.entities.TotemDataServlet;
import it.lr.libs.DBManager.ParameterType;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

/**
 * UploadData: versione generale per l'upload generico di dati
 * @author lerocchi
 */

public class UploadData extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			String valoreRitorno = "-2";
			int userLevel=-1;
			String userLevelStr=null;
			String rigaLetta=null;
			StringTokenizer st=null;
			TDBManager dsm=null;
                        
                        Map<String, String> parametriIn = new HashMap<String, String>();
                        String nomeStazione, tipoStazione, elementIn;
                        
                        
			EddyDataServlet questeEddyData;
                        BikeDataServlet questeBikeData;
			TotemDataServlet questeTotemData;
                        
                        
			if( userAgent != null)
				clientBrowser = userAgent;
	
			
			
			//Effettuo controllo sul db
			try {
                            //recupero stringa
                            nomeStazione=request.getParameter("station");
                            tipoStazione=request.getParameter("stationType");
                            dsm = new TDBManager("jdbc/urbandb");
                            
                            if(nomeStazione != null && tipoStazione != null){
                                
                                GregorianCalendar gc = new GregorianCalendar();
				elementIn = request.getParameter("year");
                                System.out.print("Year: "+elementIn+" ");
				gc.set(Calendar.YEAR,Integer.parseInt(elementIn));
				
                                elementIn = request.getParameter("month");
				System.out.print("..mese: "+elementIn+" ");
				gc.set(Calendar.MONTH,(Integer.parseInt(elementIn)-1));
				
				
				elementIn = request.getParameter("day");
				System.out.print("..giorno: "+elementIn+" ");
				gc.set(Calendar.DAY_OF_MONTH,Integer.parseInt(elementIn));
				
				elementIn = request.getParameter("hour");
				System.out.print("..ora: "+elementIn+" ");
				gc.set(Calendar.HOUR_OF_DAY,Integer.parseInt(elementIn));
			
				elementIn = request.getParameter("minute");
				System.out.print("..minuti: "+elementIn+" ");
				gc.set(Calendar.MINUTE,Integer.parseInt(elementIn));
                                
                                elementIn = request.getParameter("second");
				System.out.print("..secondi: "+elementIn+" ");
				gc.set(Calendar.SECOND,Integer.parseInt(elementIn));
                                
                                gc.set(Calendar.MILLISECOND, 0);
                                
                                // controllo il tipo
                                if(tipoStazione.equals("MOBILE")){
                                    questeBikeData = new BikeDataServlet(dsm);
                                    questeBikeData.setDataDato(gc);
                                    questeBikeData.setNome_mobile_station(nomeStazione);
                                    
                                    
                                    elementIn = request.getParameter("hum_rel");   //umidita relativa
                                    if(elementIn != null){
                                        questeBikeData.setHum_rel(Double.parseDouble(elementIn));
                                    }
                                    
                                    elementIn = request.getParameter("temp");   //umidita relativa
                                    if(elementIn != null){
                                        questeBikeData.setTair(Double.parseDouble(elementIn));
                                    }
                                    
                                    elementIn = request.getParameter("rain");   //umidita relativa
                                    if(elementIn != null){
                                        questeBikeData.setRain(Double.parseDouble(elementIn));
                                    }
                                    
                                    questeBikeData.insertDato();
                                }else if(tipoStazione.equals("FISSO")){
                                    
                                    //faccio query direttamente qui
                                    //cancello prima il dato eventuale che era già registrato
                                    
                                    
                                    String sqlString = "insert into dati_stazioni_fisse (data, id_mobile_station, hum_rel,"+
					"tair, pioggia) " +
                                        "values "+
					"(?,?,?,"+  
					"?,?)";
	
                                    
                                    
                                    questeTotemData = new TotemDataServlet(dsm);
                                    questeTotemData.setDataDato(gc);
                                    questeTotemData.setNome_mobile_station(nomeStazione);
                                     dsm.setPreparedStatementRef("delete from dati_stazioni_fisse where id_mobile_station = ? and data = ?");
                                   
                                    dsm.setParameter(ParameterType.INT, ""+questeTotemData.getId_mobile_station(), 1);
                                    dsm.setParameter(ParameterType.DATE, gc, 2);
                                    dsm.performInsert();
                                    
                                    //ora carico
                                    dsm.setPreparedStatementRef(sqlString);
                                    dsm.setParameter(ParameterType.DATE, gc, 1);
                                    dsm.setParameter(ParameterType.INT, ""+questeTotemData.getId_mobile_station(), 2);
                                    
                                    
                                    
                                    elementIn = request.getParameter("hum_rel");   //umidita relativa
                                    if(elementIn != null){
                                        dsm.setParameter(ParameterType.DOUBLE, elementIn, 3);
                                    }else{
                                        dsm.setParameterNull(3);
                                    }
                                    
                                    elementIn = request.getParameter("temp");   //umidita relativa
                                    if(elementIn != null){
                                       dsm.setParameter(ParameterType.DOUBLE, elementIn, 4);
                                    }else{
                                        dsm.setParameterNull(4);
                                    }
                                    
                                    elementIn = request.getParameter("rain");   //umidita relativa
                                    if(elementIn != null){
                                        dsm.setParameter(ParameterType.DOUBLE, elementIn, 5);
                                    }else{
                                        dsm.setParameterNull(5);
                                    }
                                    
                                    dsm.performInsert();
                                //    dsm.commit();
                                }else if(tipoStazione.equals("EDDY")){
                                    
                                }else if(tipoStazione.equals("FISSO2")){
                                    
                                    //faccio query direttamente qui
                                    //cancello prima il dato eventuale che era già registrato
                                    
                                    
                                    String sqlString = "insert into dati_stazioni_fisse (data, id_mobile_station, hum_rel,"+
					"tair, pioggia,hum_rel_prev, "+
                                        "tair_prev,rain_prev,wind_speed) " +
                                        "values "+
					"(?,?,?,"+
                                        "?,?,?,"+
					"?,?,?)";
	
                                    
                                    
                                    
                                    
                                    questeTotemData = new TotemDataServlet(dsm);
                                    questeTotemData.setDataDato(gc);
                                    questeTotemData.setNome_mobile_station(nomeStazione);
                                    dsm.setPreparedStatementRef("select count(*) from dati_stazioni_fisse where id_mobile_station = ? and data = ?");
                                   
                                    dsm.setParameter(ParameterType.INT, ""+questeTotemData.getId_mobile_station(), 1);
                                    dsm.setParameter(ParameterType.DATE, gc, 2);
                                    dsm.runPreparedQuery();
                                    
                                    if(dsm.next()){
                                        if(dsm.getInteger(1)>0){
                                            System.out.println("Esiste gia.... faccio update");
                                            String doUpdate = "update dati_staztioni_fisse set ";
                                            
                                            elementIn = request.getParameter("hum_rel");   //umidita relativa
                                            if(elementIn != null){
                                                doUpdate = doUpdate + "hum_rel = "+elementIn+ ",";
                                            }
                                            

                                            elementIn = request.getParameter("temp");   //temp
                                            if(elementIn != null){
                                                doUpdate = doUpdate + "tair = "+elementIn+ ",";
                                            }

                                            elementIn = request.getParameter("rain");   //rain
                                            if(elementIn != null){
                                               doUpdate = doUpdate + "pioggia = "+elementIn+ ",";
                                            }
                                    
                                            elementIn = request.getParameter("hum_rel_prev");   //umidita relativa prev
                                            if(elementIn != null){
                                                doUpdate = doUpdate + "hum_rel_prev = "+elementIn+ ",";
                                            }
                                            

                                            elementIn = request.getParameter("temp_prev");   //temp prev
                                            if(elementIn != null){
                                                doUpdate = doUpdate + "tair_prev = "+elementIn+ ",";
                                            }

                                            elementIn = request.getParameter("rain_prev");   //rain prev
                                            if(elementIn != null){
                                               doUpdate = doUpdate + "rain_prev = "+elementIn+ ",";
                                            }
                                            
                                            elementIn = request.getParameter("wind_speed");   //wind_speed
                                            if(elementIn != null){
                                               doUpdate = doUpdate + "wind_speed = "+elementIn+ ",";
                                            }
                                            
                                            doUpdate = doUpdate + "id_mobile_station = ? where id_mobile_station=? and data=?";
                                            dsm.setPreparedStatementRef(doUpdate);
                                   
                                            dsm.setParameter(ParameterType.INT, ""+questeTotemData.getId_mobile_station(), 1);
                                            dsm.setParameter(ParameterType.INT, ""+questeTotemData.getId_mobile_station(), 2);
                                            dsm.setParameter(ParameterType.DATE, gc, 3);
                                            dsm.performInsert();
                                            
                                        }else{
                                            System.out.println("non esiste... faccio insert");
                                            //ora carico
                                            dsm.setPreparedStatementRef(sqlString);
                                            dsm.setParameter(ParameterType.DATE, gc, 1);
                                            dsm.setParameter(ParameterType.INT, ""+questeTotemData.getId_mobile_station(), 2);



                                            elementIn = request.getParameter("hum_rel");   //umidita relativa
                                            if(elementIn != null){
                                                dsm.setParameter(ParameterType.DOUBLE, elementIn, 3);
                                            }else{
                                                dsm.setParameterNull(3);
                                            }

                                            elementIn = request.getParameter("temp");   //temp
                                            if(elementIn != null){
                                               dsm.setParameter(ParameterType.DOUBLE, elementIn, 4);
                                            }else{
                                                dsm.setParameterNull(4);
                                            }

                                            elementIn = request.getParameter("rain");   //rain
                                            if(elementIn != null){
                                                dsm.setParameter(ParameterType.DOUBLE, elementIn, 5);
                                            }else{
                                                dsm.setParameterNull(5);
                                            }

                                            elementIn = request.getParameter("hum_rel_prev");   //umidita relativa prev
                                            if(elementIn != null){
                                                dsm.setParameter(ParameterType.DOUBLE, elementIn, 6);
                                            }else{
                                                dsm.setParameterNull(6);
                                            }

                                            elementIn = request.getParameter("temp_prev");   //temp prev
                                            if(elementIn != null){
                                               dsm.setParameter(ParameterType.DOUBLE, elementIn, 7);
                                            }else{
                                                dsm.setParameterNull(7);
                                            }

                                            elementIn = request.getParameter("rain_prev");   //rain prev
                                            if(elementIn != null){
                                                dsm.setParameter(ParameterType.DOUBLE, elementIn, 8);
                                            }else{
                                                dsm.setParameterNull(8);
                                            }
                                            
                                            elementIn = request.getParameter("wind_speed");   //wind_speed
                                            if(elementIn != null){
                                                dsm.setParameter(ParameterType.DOUBLE, elementIn, 9);
                                            }else{
                                                dsm.setParameterNull(9);
                                            }
                                            
                                            dsm.performInsert();
                                            
                                        }
                                    }
                                    
                                    
                                    
                                    
                                    
                                //    dsm.commit();
                                }
                                
                            
                                
                            }else if(tipoStazione != null){
                                if(tipoStazione.equals("NEWS")){
                                     
                                    GregorianCalendar gc = new GregorianCalendar();
				elementIn = request.getParameter("year");
                                System.out.print("Year: "+elementIn+" ");
				gc.set(Calendar.YEAR,Integer.parseInt(elementIn));
				
                                elementIn = request.getParameter("month");
				System.out.print("..mese: "+elementIn+" ");
				gc.set(Calendar.MONTH,(Integer.parseInt(elementIn)-1));
				
				
				elementIn = request.getParameter("day");
				System.out.print("..giorno: "+elementIn+" ");
				gc.set(Calendar.DAY_OF_MONTH,Integer.parseInt(elementIn));
				
				elementIn = request.getParameter("hour");
				System.out.print("..ora: "+elementIn+" ");
				gc.set(Calendar.HOUR_OF_DAY,Integer.parseInt(elementIn));
			
				elementIn = request.getParameter("minute");
				System.out.print("..minuti: "+elementIn+" ");
				gc.set(Calendar.MINUTE,Integer.parseInt(elementIn));
                                
                                elementIn = request.getParameter("second");
				System.out.print("..secondi: "+elementIn+" ");
				gc.set(Calendar.SECOND,Integer.parseInt(elementIn));
                                gc.set(Calendar.MILLISECOND,0);
                                    
                                    
                                    String sqlString = "insert into news (title, owner, data) "+
					"values "+
					"(?,?,?)";
                                    
                                    dsm.setPreparedStatementRef(sqlString);
                                    
                                    
                                    dsm.setParameter(ParameterType.STRING, request.getParameter("title"), 1);
                                    dsm.setParameter(ParameterType.STRING, request.getParameter("owner"), 2);
                                    dsm.setParameter(ParameterType.DATE,gc, 3);
                                    dsm.performInsert();
                                   
                                }
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
			gc.set(Calendar.SECOND,0);
                        gc.set(Calendar.MILLISECOND, 0);
	
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
