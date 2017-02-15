package it.cnr.ibimet.swhservices.servlets;


import it.cnr.ibimet.dbutils.TDBManager;
import it.cnr.ibimet.dbutils.TableSchema;
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
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * UploadData: versione generale per l'upload generico di dati
 * @author lerocchi
 */

public class DownloadData extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userAgent =  request.getHeader("user-agent");
			String clientBrowser =  "Not known!";	
			
                        int id_nome_stazione=-1;
			TDBManager dsm=null;
                        String delimiter = ";";
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
                                GregorianCalendar gc2 = new GregorianCalendar();
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
                                
                                elementIn = request.getParameter("year2");
                                System.out.print("Year2: "+elementIn+" ");
				gc2.set(Calendar.YEAR,Integer.parseInt(elementIn));
				
                                elementIn = request.getParameter("month2");
				System.out.print("..mese2: "+elementIn+" ");
				gc2.set(Calendar.MONTH,(Integer.parseInt(elementIn)-1));
				
				
				elementIn = request.getParameter("day2");
				System.out.print("..giorno2: "+elementIn+" ");
				gc2.set(Calendar.DAY_OF_MONTH,Integer.parseInt(elementIn));
				
				elementIn = request.getParameter("hour2");
				System.out.print("..ora2: "+elementIn+" ");
				gc2.set(Calendar.HOUR_OF_DAY,Integer.parseInt(elementIn));
			
				elementIn = request.getParameter("minute2");
				System.out.print("..minuti2: "+elementIn+" ");
				gc2.set(Calendar.MINUTE,Integer.parseInt(elementIn));
                                
                                elementIn = request.getParameter("second2");
				System.out.print("..secondi2: "+elementIn+" ");
				gc2.set(Calendar.SECOND,Integer.parseInt(elementIn));
                                
                                elementIn = request.getParameter("delimiter");
				if(elementIn!=null)
                                    delimiter=elementIn;
                                
                                System.out.println("Delimiter: "+delimiter);
                                
                                //recupero id stazione
                                dsm.setPreparedStatementRef("select id_mobile_station from mobile_stations where nome = ?");
                                dsm.setParameter(ParameterType.STRING, nomeStazione, 1);
                                dsm.runPreparedQuery();
                                if(dsm.next()){
                                    id_nome_stazione = dsm.getInteger(1);
                                }
                                
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
                                    if(delimiter.equals("json")){
                                        //TODO: da implementare
                                    }else{
                                        String ret = getTable(dsm, "dati_stazioni_fisse", gc, gc2, delimiter,id_nome_stazione);
                                        response.setContentType("text/plain");
                                        response.getWriter().write(ret);
                                    }
                                    
                                 
			
                                }else if(tipoStazione.equals("FOTOVOLTAICO")){
                                    
                                    //faccio query direttamente qui
                                    //cancello prima il dato eventuale che era già registrato
                                    if(delimiter.equals("json")){
                                        //TODO: da implementare
                                    }else{
                                        String ret = getTable(dsm, "dati_fotovoltaico", gc, gc2, delimiter,id_nome_stazione);
                                        response.setContentType("text/plain");
                                        response.getWriter().write(ret);
                                    }
                                    
                                 
			
                                }else if(tipoStazione.equals("EDDY")){
                                    
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

        /**
         * Restituisce la tabella in formato ascii comma delimited
         * 
         * @param dsm
         * @param tableName
         * @param from
         * @param to 
         */
        private String getTable(TDBManager dsm,String tableName, GregorianCalendar from, GregorianCalendar to, String delimited, int id_nome_stazione){
           
        String returnString="";
        List<String> columns;
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
         try{
          
           
          
            
            TableSchema questoSchema = new TableSchema(dsm,  tableName);    
            columns = new ArrayList<String>();
         
          
            //creo lista colonne
            
            //Inizio a costruire lo schema sia per la classe che fa da chiave sia per l'hash map dinamico
            for(int i=0; i < questoSchema.getColumnList().size(); i++) {  
                columns.add(questoSchema.getColumnList().get(i));
            }
            
            returnString = questoSchema.getCompleteColumnList() + "\r\n";
            
            dsm.setPreparedStatementRef("select "+questoSchema.getCompleteColumnList()+" "+
                            " from \""+questoSchema.getTableName()+"\" where id_mobile_station=? and data between ? and ?");  //recupero sql
                 
            dsm.setParameter(ParameterType.INT, ""+id_nome_stazione,1);
            dsm.setParameter(ParameterType.DATE, from, 2);
            dsm.setParameter(ParameterType.DATE, to, 3);
            
            System.out.println("Ecco la query: "+"select "+questoSchema.getCompleteColumnList()+" "+
                            " from \""+questoSchema.getTableName()+"\" where id_mobile_station="+id_nome_stazione+" and data between ? and ?");
            
            
            System.out.println("Ecco data from: "+formatter.format(from.getTime()) + " to: "+formatter.format(to.getTime()));
            
            dsm.runPreparedQuery();

            
            System.out.println("inizio a preparare");
         
            while(dsm.next()){
                
            
             
                //ciclo tra le colonne
                for(int i=0; i < questoSchema.getColumnList().size(); i++) {  
                    if(questoSchema.getColumnType().get(i).equalsIgnoreCase(it.cnr.ibimet.dbutils.SWH4EConst.DATA_TYPE_INTEGER)){
                        returnString = returnString + dsm.getInteger(i+1) + delimited;
                        
                    }else if(questoSchema.getColumnType().get(i).equalsIgnoreCase(it.cnr.ibimet.dbutils.SWH4EConst.DATA_TYPE_STRING)){
                        returnString = returnString + dsm.getString(i+1) + delimited;
                        
                    }else if(questoSchema.getColumnType().get(i).equalsIgnoreCase(it.cnr.ibimet.dbutils.SWH4EConst.DATA_TYPE_NUMERIC) ||
                            questoSchema.getColumnType().get(i).equalsIgnoreCase(it.cnr.ibimet.dbutils.SWH4EConst.DATA_TYPE_DOUBLE_PRECISION)){
                        returnString = returnString + dsm.getDouble(i+1) + delimited;
                    }else if(questoSchema.getColumnType().get(i).equalsIgnoreCase(it.cnr.ibimet.dbutils.SWH4EConst.DATA_TYPE_TIMESTAMP) ||
                            questoSchema.getColumnType().get(i).equalsIgnoreCase(it.cnr.ibimet.dbutils.SWH4EConst.DATA_TYPE_TIMESTAMP_WT)){
                        returnString = returnString + formatter.format(dsm.getData(i+1).getTime()) + delimited;
                    }
                    
                    
                    
              //      System.out.print(""+i);
                }
                //elimino ultimo delimitatore
                returnString = returnString.substring(0, returnString.length() - 1);
                returnString = returnString + "\r\n";
                
            }       
        }catch(Exception ex){
                 System.out.println("Error: "+ex.getMessage());
        }
         
        return returnString; 
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
