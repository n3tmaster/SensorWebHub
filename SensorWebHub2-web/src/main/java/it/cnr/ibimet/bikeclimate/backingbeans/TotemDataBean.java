package it.cnr.ibimet.bikeclimate.backingbeans;


import it.cnr.ibimet.bikeclimate.dbutils.ChartParams;
import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.dbutils.TableSchema;
import it.cnr.ibimet.bikeclimate.entities.TotemData;
import it.cnr.ibimet.bikeclimate.entities.TotemStatistics;
import it.lr.libs.DBManager.ParameterType;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.primefaces.context.RequestContext;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import static it.cnr.ibimet.bikeclimate.dbutils.SWH4EConst.*;

@ManagedBean(name="totemDataBean")
@SessionScoped
public class TotemDataBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private final static String CSV_FORMAT="csv";
	private final static String XLS_FORMAT="xls";
	private final static String FILENAME = "/analysis.csv";
	private final static int MAX_QUEUE = 1000;
	/**
	 *
	 */



	private StreamedContent file;
	private boolean preparatoFile;
	private boolean statodownload;
        private List<BikeDataBean.ColumnModel> columns;
        private List<  Map<String, String>> dati;
        private List<BikeDataBean.ColumnModel> columnsStat;
        private List<  Map<String, String>> datiStat;
	@ManagedProperty(value="#{graphConsistencyBean}")
	private GraphConsistencyBean graphConsistencyBean;
    @ManagedProperty(value="#{loginBean}")
	private LoginBean loginBean;
	@ManagedProperty(value="#{totemStationBean}")
	private TotemStationBean totemStationBean;
	private Date data1, data2;
	private String formatoRadio;
	private boolean consenso;
	private Date fromData;
	private Date toData;
	private List<TotemStatistics> totemStatisticsList;
	private TotemStatistics totemStatisticsSelected;
	private List<TotemData> totemDataList;
	private TotemData totemDataSelected;

	public GraphConsistencyBean getGraphConsistencyBean() {
		return graphConsistencyBean;
	}

	public void setGraphConsistencyBean(GraphConsistencyBean graphConsistencyBean) {
		this.graphConsistencyBean = graphConsistencyBean;
	}

	public LoginBean getLoginBean() {
		return loginBean;
	}
        
	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}
	
	public TotemStationBean getTotemStationBean() {
		return totemStationBean;
	}
	
	public void setTotemStationBean(TotemStationBean totemStationBean) {
		this.totemStationBean = totemStationBean;
	}

	public boolean isStatodownload() {
		return statodownload;
	}

	public void setStatodownload(boolean statodownload) {
		this.statodownload = statodownload;
	}

	public StreamedContent getFile() {
		return file;
	}

	public void setFile(StreamedContent file) {
		this.file = file;
	}
	
    public List<BikeDataBean.ColumnModel> getColumnsStat() {
        return columnsStat;
    }

    public void setColumnsStat(List<BikeDataBean.ColumnModel> columnsStat) {
        this.columnsStat = columnsStat;
    }
	
    public List<Map<String, String>> getDatiStat() {
        return datiStat;
    }

    public void setDatiStat(List<Map<String, String>> datiStat) {
        this.datiStat = datiStat;
    }

    public List<BikeDataBean.ColumnModel> getColumns() {
        return columns;
    }

    public void setColumns(List<BikeDataBean.ColumnModel> columns) {
        this.columns = columns;
    }

    public List<Map<String, String>> getDati() {
        return dati;
    }

    public void setDati(List<Map<String, String>> dati) {
        this.dati = dati;
    }

	public boolean isConsenso() {
		return consenso;
	}

	public void setConsenso(boolean consenso) {
		this.consenso = consenso;
	}

	public String getFormatoRadio() {
		return formatoRadio;
	}

	public void setFormatoRadio(String formatoRadio) {
		this.formatoRadio = formatoRadio;
	}
	
	public Date getFromData() {
		return fromData;
	}

	public void setFromData(Date fromData) {
		this.fromData = fromData;
	}
	
	public Date getToData() {
		return toData;
	}

	public void setToData(Date toData) {
		this.toData = toData;
	}

	public List<TotemStatistics> getTotemStatisticsList() {
		return totemStatisticsList;
	}

	public void setTotemStatisticsList(List<TotemStatistics> totemStatisticsList) {
		this.totemStatisticsList = totemStatisticsList;
	}

	public TotemStatistics getTotemStatisticsSelected() {
		return totemStatisticsSelected;
	}

	public void setTotemStatisticsSelected(TotemStatistics totemStatisticsSelected) {
		this.totemStatisticsSelected = totemStatisticsSelected;
	}

	public List<TotemData> getTotemDataList() {
		return totemDataList;
	}

	public void setTotemDataList(List<TotemData> totemDataList) {
		this.totemDataList = totemDataList;
	}


	
	
	
	public TotemData getTotemDataSelected() {
		return totemDataSelected;
	}

	public void setTotemDataSelected(TotemData totemDataSelected) {
		this.totemDataSelected = totemDataSelected;
	}

	@PostConstruct
	public void init(){
		System.out.println("TotemData - init");
		consenso=false;
		statodownload=true;
		formatoRadio=CSV_FORMAT;
		fromData=new Date();
		toData=new Date();
		preparatoFile=false;
		
	}
	
	
        public void populate(){

			graphConsistencyBean.setThisMobile2(totemStationBean.getTotemStationSelezionato().getId_bike_sensor());
			graphConsistencyBean.doCons4Fixed();



			TDBManager dsm=null;
                Map<String,String> questoElemento=null;
                
		try {
                        SimpleDateFormat formatter=new SimpleDateFormat("dd-MM-yyyy HH:mm");
                    
			dsm = new TDBManager("jdbc/urbandb");
			
				//giardino=idgiardini.get(0);
			  
                        //Retrieve table information
                        TableSchema tSchema = new TableSchema(dsm, "dati_stazioni_fisse");
                        
                        System.out.println("Ecco la stazione "+ totemStationBean.getTotemStationSelezionato().getId_bike_sensor());
                        
                        ChartParams cp = new ChartParams(dsm, totemStationBean.getTotemStationSelezionato().getId_bike_sensor(), loginBean.getLingua());
                        cp.getTableParams(); //prepare table params
                         
                        
                        String selectStr ="";
                        
                        for(int i=0; i<cp.getParamNumbers(); i++){
                            selectStr = selectStr + cp.getSQL_SelectStr(i,"numeric", "a.", 2) + " as "+cp.getParam().get(i) + ",";
                        }
			
			String sqlString="select "+selectStr+"b.nome as nome,a.data as data,a.id_dato "
					+ "from dati_stazioni_fisse a, mobile_stations b " 
					+ "where a.id_mobile_station=b.id_mobile_station and a.id_mobile_station=?  order by a.data desc";
	
			
			columns = new ArrayList<BikeDataBean.ColumnModel>();
                        dati =  new ArrayList<Map<String, String>>();
                        
                        //create table schema 
                        //TODO: make column name dinamic
                        columns.add(new BikeDataBean.ColumnModel("Data","data"));
                        columns.add(new BikeDataBean.ColumnModel("Nome","nome"));
                        for(int i=0; i<cp.getParamNumbers(); i++){
                          
                            columns.add(new BikeDataBean.ColumnModel(cp.getParam_name().get(i)+ " "+cp.getUnit().get(i),cp.getParam().get(i)));
                        }
                        
                     //   System.out.println("SQLSTring: "+sqlString);
                        
			dsm.setPreparedStatementRef(sqlString);
			
			dsm.setParameter(ParameterType.INT, ""+totemStationBean.getTotemStationSelezionato().getId_bike_sensor(), 1);
			
			
			dsm.runPreparedQuery();
		//	bikeDataList = new ArrayList<BikeData>();
			
			while(dsm.next()){
                            questoElemento = new HashMap<String,String>();
                      //      System.out.println("Ecco i numeri di campi: "+cp.getParamNumbers());
                            questoElemento.put("data",""+formatter.format(dsm.getData(cp.getParamNumbers()+2).getTime())); 
                            questoElemento.put("nome",""+dsm.getString(cp.getParamNumbers()+1)); 
                            for(int i=0; i<cp.getParamNumbers(); i++){
                                
                 //               System.out.println("analizzo questo:  "+cp.getParam().get(i));
                               
                                String CType = tSchema.getColumnType(cp.getParam().get(i));
                                
                                if(CType.equalsIgnoreCase(DATA_TYPE_INTEGER)){
                                    questoElemento.put(cp.getParam().get(i),""+dsm.getInteger(i+1)); 
                                }else if(CType.equalsIgnoreCase(DATA_TYPE_STRING)){
                                    questoElemento.put(cp.getParam().get(i),dsm.getString(i+1)); 
                                }else if(CType.equalsIgnoreCase(DATA_TYPE_NUMERIC) || CType.equalsIgnoreCase(DATA_TYPE_DOUBLE_PRECISION)){
                                    questoElemento.put(cp.getParam().get(i),""+dsm.getDouble(i+1)); 
                                }else{
                                    questoElemento.put(cp.getParam().get(i),"Data error"); 
                                }
                               
                            }
                            dati.add(questoElemento);
			}
                       
                                
                        
                        //completato riempimento
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally{
			try{
				dsm.closeConnection();
			}catch(Exception e){
				e.getStackTrace();
			}
		}
		
		
	}
	
        
	
	


        public void populateStatistics(){
            TDBManager dsm=null;
                Map<String,String> questoElemento=null;
                
		try {
                    
                    SimpleDateFormat formatter=new SimpleDateFormat("dd-MM-yyyy HH");   //
                    
                    dsm = new TDBManager("jdbc/urbandb");
                    
                    
                    TableSchema tSchema = new TableSchema(dsm, "dati_stazioni_fisse");
                        
                    System.out.println("Ecco la stazione "+totemStationBean.getTotemStationSelezionato2().getId_bike_sensor());
                    ChartParams cp = new ChartParams(dsm, totemStationBean.getTotemStationSelezionato2().getId_bike_sensor(), loginBean.getLingua());
                        cp.getTableParams(); //prepare table totemStationBean
                        
                        
                        
               
                        
                        String selectStr="";
                        
                        for(int i=0; i<cp.getParamNumbers(); i++){
                            selectStr = selectStr + cp.getSQL_SelectStr(i,"numeric", "a.", 2, cp.getParam().get(i),true) + ",";
                        }
			
			selectStr="select "+selectStr+"b.nome as nome,date_trunc('hour', a.data) as dataOut "
					+ "from dati_stazioni_fisse a, mobile_stations b " 
					+ "where a.id_mobile_station=b.id_mobile_station and a.id_mobile_station=? group by nome, dataOut   order by dataOut desc";
	
                        
                        System.out.println("ecco : "+selectStr);
                        
                        columnsStat = new ArrayList<BikeDataBean.ColumnModel>();
                        datiStat =  new ArrayList<Map<String, String>>();
                        
                        //create table schema 
                        //TODO: make column name dinamic
                        columnsStat.add(new BikeDataBean.ColumnModel("Data e Ora","data"));
                        columnsStat.add(new BikeDataBean.ColumnModel("Nome","nome"));
                        for(int i=0; i<cp.getParamNumbers(); i++){
                          
                            columnsStat.add(new BikeDataBean.ColumnModel(cp.getParam_name().get(i)+ "- Min "+cp.getUnit().get(i),"min"+cp.getParam().get(i)));
                            columnsStat.add(new BikeDataBean.ColumnModel(cp.getParam_name().get(i)+ "- Max "+cp.getUnit().get(i),"max"+cp.getParam().get(i)));
                            columnsStat.add(new BikeDataBean.ColumnModel(cp.getParam_name().get(i)+ "- Avg "+cp.getUnit().get(i),"avg"+cp.getParam().get(i)));
                        }
                        
                        dsm.setPreparedStatementRef(selectStr);
			
			dsm.setParameter(ParameterType.INT, ""+totemStationBean.getTotemStationSelezionato2().getId_bike_sensor(), 1);
			
			
			dsm.runPreparedQuery();
		//	bikeDataList = new ArrayList<BikeData>();
			
			while(dsm.next()){
                            questoElemento = new HashMap<String,String>();
                      //      System.out.println("Ecco i numeri di campi: "+cp.getParamNumbers());
                            questoElemento.put("data",""+formatter.format(dsm.getData((cp.getParamNumbers()*3)+2).getTime())); 
                            questoElemento.put("nome",""+dsm.getString((cp.getParamNumbers()*3)+1)); 
                            for(int i=0; i<cp.getParamNumbers(); i++){
                                
                 //               System.out.println("analizzo questo:  "+cp.getParam().get(i));
                               
                        //        String CType = tSchema.getColumnType(cp.getParam().get(i));
                                
                        /*        if(CType.equalsIgnoreCase(DATA_TYPE_INTEGER)){
                                    questoElemento.put("min"+cp.getParam().get(i),""+dsm.getInteger((i*3)+1)); 
                                    questoElemento.put("max"+cp.getParam().get(i),""+dsm.getInteger((i*3)+2)); 
                                    questoElemento.put("avg"+cp.getParam().get(i),""+dsm.getInteger((i*3)+3)); 
                                }else if(CType.equalsIgnoreCase(DATA_TYPE_STRING)){
                                    questoElemento.put("min"+cp.getParam().get(i),dsm.getString((i*3)+1)); 
                                    questoElemento.put("max"+cp.getParam().get(i),dsm.getString((i*3)+2)); 
                                    questoElemento.put("avg"+cp.getParam().get(i),dsm.getString((i*3)+3)); 
                                }else if(CType.equalsIgnoreCase(DATA_TYPE_NUMERIC) || CType.equalsIgnoreCase(DATA_TYPE_DOUBLE_PRECISION)){*/
                                
                                    questoElemento.put("min"+cp.getParam().get(i),""+dsm.getDouble((i*3)+1)); 
                                    questoElemento.put("max"+cp.getParam().get(i),""+dsm.getDouble((i*3)+2)); 
                                    questoElemento.put("avg"+cp.getParam().get(i),""+dsm.getDouble((i*3)+3)); 
                      /*          }else{
                                    questoElemento.put(cp.getParam().get(i),"Data error"); 
                                }*/
                               
                            }
                            datiStat.add(questoElemento);
			}
                } catch (Exception e) {
			
			e.printStackTrace();
		} finally{
			try{
				dsm.closeConnection();
			}catch(Exception e){
				e.getStackTrace();
			}
		}
            
        }
        
        	public void postProcessXLS(Object document) {
            HSSFWorkbook wb = (HSSFWorkbook) document;
            HSSFSheet sheet = wb.getSheetAt(0);
            HSSFRow header = sheet.getRow(0);
            HSSFCellStyle cellStyle = wb.createCellStyle();
            cellStyle.setFillForegroundColor(HSSFColor.GREEN.index);
            cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            
            
            //Create header
            for(int i=0; i < header.getPhysicalNumberOfCells();i++) {
                header.getCell(i).setCellStyle(cellStyle);
                header.getCell(i).setCellValue(columns.get(i).getHeader());
                
            }
            
            //create data table
            
            for(int i=1 ; i < sheet.getPhysicalNumberOfRows(); i++){
                header = sheet.getRow(i);
                
                for(int j=0; j < header.getPhysicalNumberOfCells(); j++){
                    header.getCell(j).setCellValue(dati.get(i).get(columns.get(j).getProperty()));
                }
            }
        }
        
        public void postProcessXLSStat(Object document) {
            HSSFWorkbook wb = (HSSFWorkbook) document;
            HSSFSheet sheet = wb.getSheetAt(0);
            HSSFRow header = sheet.getRow(0);
            HSSFCellStyle cellStyle = wb.createCellStyle();
            cellStyle.setFillForegroundColor(HSSFColor.GREEN.index);
            cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            
            
            //Create header
            for(int i=0; i < header.getPhysicalNumberOfCells();i++) {
                header.getCell(i).setCellStyle(cellStyle);
                header.getCell(i).setCellValue(columnsStat.get(i).getHeader());
                
            }
            
            //create data table
            
            for(int i=1 ; i < sheet.getPhysicalNumberOfRows(); i++){
                header = sheet.getRow(i);
                
                for(int j=0; j < header.getPhysicalNumberOfCells(); j++){
                    header.getCell(j).setCellValue(datiStat.get(i).get(columnsStat.get(j).getProperty()));
                }
            }
        }

        

	
	
	public void changeFrom(){
	
	}
	
	public void changeTo(){
	        
	}
	
	private String Data2String(GregorianCalendar gc){
		
		String a1, b1;
		
		if(gc.get(Calendar.DAY_OF_MONTH)<10)
			a1="0"+gc.get(Calendar.DAY_OF_MONTH);
		else
			a1=""+gc.get(Calendar.DAY_OF_MONTH);
		
		if((gc.get(Calendar.MONTH)+1)<10)
			b1="0"+(gc.get(Calendar.MONTH)+1);
		else
			b1=""+(gc.get(Calendar.MONTH)+1);
		
		return a1+"-"+b1+"-"+gc.get(Calendar.YEAR);
	}
	
	private String Time2String(GregorianCalendar gc){
		String a1, b1;
		
		
		if(gc.get(Calendar.MINUTE)<10)
			a1="0"+gc.get(Calendar.MINUTE);
		else
			a1=""+gc.get(Calendar.MINUTE);
		
		if(gc.get(Calendar.HOUR_OF_DAY)<10)
			b1="0"+gc.get(Calendar.HOUR_OF_DAY);
		else
			b1=""+gc.get(Calendar.HOUR_OF_DAY);
		
		return b1+":"+a1;
		
	}
	
	public void createFile() {
		GregorianCalendar result1 = null; 
        result1 = new GregorianCalendar(); 
        result1.setTimeInMillis(fromData.getTime()); 
   
        GregorianCalendar result2 = null; 
        result2 = new GregorianCalendar(); 
        result2.setTimeInMillis(toData.getTime()); 
        
        TDBManager dsm=null;
	    try {

	        
			
				dsm = new TDBManager("jdbc/urbandb");
				
					//giardino=idgiardini.get(0);
				
				
				String sqlString="select a.tair,a.co2,a.rad,a.noise,b.nome,a.data,a.id_dato,a.utc,a.o3 from dati a, mobile_stations b " +
						"where a.id_mobile_station=b.id_mobile_station and a.data between ? and ? order by 5,6";
		
				
				System.out.println("BikeListBean - query: "+sqlString);
				
				dsm.setPreparedStatementRef(sqlString);
				
				dsm.setParameter(ParameterType.DATE, result1, 1);
				dsm.setParameter(ParameterType.DATE,result2, 2);
				
				System.out.println("BikeListBean-" + dsm.getPStmt().toString());
				
				dsm.runPreparedQuery();
				
				String risultatoToFile="nome;data;time;utc;temperatura;co2;rumore;umidita;o3\n";
				int i=0;
				ByteArrayOutputStream ostream = new ByteArrayOutputStream();
				
				while(dsm.next()){
					
					if(i<MAX_QUEUE){
					
						risultatoToFile=risultatoToFile+dsm.getString(5)+";"+Data2String(dsm.getData(6))+";"+Time2String(dsm.getData(6)) +";"+
								dsm.getDouble(8)+";"+dsm.getDouble(1)+";"+dsm.getInteger(2)+";"+dsm.getDouble(3)+";"+dsm.getDouble(4)+";"+dsm.getDouble(8)+"\n";
						i++;
					}else{
						i=0;
						ostream.write(risultatoToFile.getBytes());
						risultatoToFile="";
						
					}
				}
				
				byte b[]=ostream.toByteArray();
				
				InputStream is = new ByteArrayInputStream(b);
				
				file = new DefaultStreamedContent(is, "text/csv", "dataexported.csv"); 
				this.statodownload=false;
	    } catch (IOException e) {
	    	
	    	e.getStackTrace();
	    	this.statodownload=true;
	    } catch (Exception e) {
		
			e.printStackTrace();
			this.statodownload=true;
		} finally{
			try{
				dsm.closeConnection();
				
				
			}catch(Exception e){
				e.getStackTrace();
			}
		}
	}

	public void daiConsenso(){
		//boolean eccolo=Boolean.parseBoolean( event.getNewValue().toString());
		
		if(consenso){
			 RequestContext.getCurrentInstance().execute("panelDownload.show()");
		}else{
			
		}
		
	}
}
