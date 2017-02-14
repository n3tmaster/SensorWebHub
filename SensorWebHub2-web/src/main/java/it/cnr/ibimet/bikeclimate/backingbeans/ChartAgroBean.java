package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;
import org.primefaces.model.chart.CartesianChartModel;
import org.primefaces.model.chart.LineChartSeries;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;


@ManagedBean(name="chartAgroBean")
@SessionScoped
public class ChartAgroBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final String TITOLO_TEMP= "Temperature";
	private final String TITOLO_RAD= "Radiazione";
	private final String TITOLO_VENTO="Vento";
	private final String TITOLO_UMIDITA="Umidita";
	private final String TITOLO_PRECIPITAZIONE="Precipitazione";
	private final String TITOLO_BAGNATURA="Bagnatura";
	private Date xmin;
	private Date xmax;
	private Date date;
	private Date date2;
	private LineChartSeries temp;
	private LineChartSeries rad;
	private LineChartSeries v;
	private LineChartSeries precipit;
	private LineChartSeries bagnatura;
	private LineChartSeries umid;
	private String titoloTemp,titoloRad, titoloVento, titoloPrecipitazione,titoloUmidita,titoloBagnatura;
	
	private CartesianChartModel tempModel; 
	private CartesianChartModel radModel;
	private CartesianChartModel ventoModel;
	private CartesianChartModel precipitazioneModel;
	private CartesianChartModel umiditaModel;
	private CartesianChartModel bagnaturaModel;
	private double xmindbl;
	private double xmaxdbl;
	private int icount;
	@ManagedProperty(value="#{stationBean}")
	private StationBean stationBean;
	private double minTemp, maxTemp;
	private double minRad, maxRad;
	private double minVento, maxVento;
	private double minPrecipitazione, maxPrecipitazione;
	private double minUmidita, maxUmidita;
	private double minBagnatura, maxBagnatura;
	@ManagedProperty(value="#{loginBean}")
	private LoginBean loginBean;

	public Date getXmin() {
		return xmin;
	}

	public void setXmin(Date xmin) {
		this.xmin = xmin;
	}

	public Date getXmax() {
		return xmax;
	}

	public void setXmax(Date xmax) {
		this.xmax = xmax;
	}

	public CartesianChartModel getRadModel() {
		return radModel;
	}

	public void setRadModel(CartesianChartModel radModel) {
		this.radModel = radModel;
	}

	public CartesianChartModel getVentoModel() {
		return ventoModel;
	}

	public void setVentoModel(CartesianChartModel ventoModel) {
		this.ventoModel = ventoModel;
	}

	public CartesianChartModel getPrecipitazioneModel() {
		return precipitazioneModel;
	}

	public void setPrecipitazioneModel(CartesianChartModel precipitazioneModel) {
		this.precipitazioneModel = precipitazioneModel;
	}

	public CartesianChartModel getUmiditaModel() {
		return umiditaModel;
	}

	public void setUmiditaModel(CartesianChartModel umiditaModel) {
		this.umiditaModel = umiditaModel;
	}

	public CartesianChartModel getBagnaturaModel() {
		return bagnaturaModel;
	}

	public void setBagnaturaModel(CartesianChartModel bagnaturaModel) {
		this.bagnaturaModel = bagnaturaModel;
	}

	public CartesianChartModel getTempModel() {
		return tempModel;
	}

	public void setTempModel(CartesianChartModel tempModel) {
		this.tempModel = tempModel;
	}

	public String getTitoloRad() {
		return titoloRad;
	}

	public void setTitoloRad(String titoloRad) {
		this.titoloRad = titoloRad;
	}

	public String getTitoloVento() {
		return titoloVento;
	}

	public void setTitoloVento(String titoloVento) {
		this.titoloVento = titoloVento;
	}

	public String getTitoloPrecipitazione() {
		return titoloPrecipitazione;
	}

	public void setTitoloPrecipitazione(String titoloPrecipitazione) {
		this.titoloPrecipitazione = titoloPrecipitazione;
	}

	public String getTitoloBagnatura() {
		return titoloBagnatura;
	}
	
	public void setTitoloBagnatura(String titoloBagnatura) {
		this.titoloBagnatura = titoloBagnatura;
	}

	public String getTitoloTemp() {
		return titoloTemp;
	}

	public void setTitoloTemp(String titoloTemp) {
		this.titoloTemp = titoloTemp;
	}

	public String getTitoloUmidita() {
		return titoloUmidita;
	}
	
	public void setTitoloUmidita(String titoloUmidita) {
		this.titoloUmidita = titoloUmidita;
	}
	
	public double getXmindbl() {
		return xmindbl;
	}
	
	public void setXmindbl(double xmindbl) {
		this.xmindbl = xmindbl;
	}

	public double getXmaxdbl() {
		return xmaxdbl;
	}

	public void setXmaxdbl(double xmaxdbl) {
		this.xmaxdbl = xmaxdbl;
	}

	public Date getDate2() {
		return date2;
	}

	public void setDate2(Date date2) {
		this.date2 = date2;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public StationBean getStationBean() {
		return stationBean;
	}
	
	public void setStationBean(StationBean stationBean) {
		this.stationBean = stationBean;
	}

	public double getMinVento() {
		return minVento;
	}

	public void setMinVento(double minVento) {
		this.minVento = minVento;
	}

	public double getMaxVento() {
		return maxVento;
	}

	public void setMaxVento(double maxVento) {
		this.maxVento = maxVento;
	}

	public double getMinPrecipitazione() {
		return minPrecipitazione;
	}

	public void setMinPrecipitazione(double minPrecipitazione) {
		this.minPrecipitazione = minPrecipitazione;
	}

	public double getMaxPrecipitazione() {
		return maxPrecipitazione;
	}

	public void setMaxPrecipitazione(double maxPrecipitazione) {
		this.maxPrecipitazione = maxPrecipitazione;
	}

	public double getMinUmidita() {
		return minUmidita;
	}

	public void setMinUmidita(double minUmidita) {
		this.minUmidita = minUmidita;
	}

	public double getMaxUmidita() {
		return maxUmidita;
	}

	public void setMaxUmidita(double maxUmidita) {
		this.maxUmidita = maxUmidita;
	}

	public double getMinBagnatura() {
		return minBagnatura;
	}

	public void setMinBagnatura(double minBagnatura) {
		this.minBagnatura = minBagnatura;
	}

	public double getMaxBagnatura() {
		return maxBagnatura;
	}

	public void setMaxBagnatura(double maxBagnatura) {
		this.maxBagnatura = maxBagnatura;
	}

	public double getMinTemp() {
		return minTemp;
	}

	public void setMinTemp(double minTemp) {
		this.minTemp = minTemp;
	}

	public double getMaxTemp() {
		return maxTemp;
	}

	public void setMaxTemp(double maxTemp) {
		this.maxTemp = maxTemp;
	}

	public double getMinRad() {
		return minRad;
	}

	public void setMinRad(double minRad) {
		this.minRad = minRad;
	}

	public double getMaxRad() {
		return maxRad;
	}

	public void setMaxRad(double maxRad) {
		this.maxRad = maxRad;
	}

	@PostConstruct
	public void init(){



		this.date = new Date();
		this.date2 = new Date();
	/*	tempModel = new CartesianChartModel();
		radModel = new CartesianChartModel();
		ventoModel = new CartesianChartModel();
		precipitazioneModel = new CartesianChartModel();
		bagnaturaModel = new CartesianChartModel();
		umiditaModel = new CartesianChartModel();

		temp = new LineChartSeries();
		temp.setLabel("Temp.");
		rad = new LineChartSeries();
		rad.setLabel("Rad.");
		v = new LineChartSeries();
		v.setLabel("Vento");
		precipit = new LineChartSeries();
		precipit.setLabel("Precip.");
		bagnatura = new LineChartSeries();
		bagnatura.setLabel("Bagn.");
		umid = new LineChartSeries();
		umid.setLabel("Umidit�");

		temp.set(date.getTime(), 0.0);
		rad.set(date.getTime(), 0.0);
		v.set(date.getTime(), 0.0);
		precipit.set(date.getTime(), 0.0);
		bagnatura.set(date.getTime(), 0.0);
		umid.set(date.getTime(), 0.0);
		this.titoloTemp=TITOLO_TEMP+" -- "+stationBean.getStationSelezionato2().getGsm();
		this.titoloUmidita=TITOLO_UMIDITA+" -- "+stationBean.getStationSelezionato2().getGsm();
		this.titoloPrecipitazione=TITOLO_PRECIPITAZIONE+" -- "+stationBean.getStationSelezionato2().getGsm();
		this.titoloRad=TITOLO_RAD+" -- "+stationBean.getStationSelezionato2().getGsm();
		this.titoloVento=TITOLO_VENTO+" -- "+stationBean.getStationSelezionato2().getGsm();
		this.titoloBagnatura=TITOLO_BAGNATURA+" -- "+stationBean.getStationSelezionato2().getGsm();
		*/
		popolaFromData();


	}
	
	public LoginBean getLoginBean() {
		return loginBean;
	}

	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}

	public void updVal(){
		popolaFromData();
	}
	
	public void popola(){
		
		
	}
	
	public void popolaFromData(){
		
		GregorianCalendar result1 = null; 
        result1 = new GregorianCalendar(); 
        result1.add(Calendar.DAY_OF_MONTH, -1);
        result1.setTimeInMillis(date.getTime()); 
        
        GregorianCalendar result2 = null; 
        result2 = new GregorianCalendar(); 
        result2.add(Calendar.DAY_OF_MONTH, 1);
        result2.setTimeInMillis(date2.getTime()); 
        
        
    	System.out.println("Questo Time: "+date.getTime());
		System.out.println("Questo Time2: "+date2.getTime());
		System.out.println("ecco la data 1: "+result1.get(Calendar.DAY_OF_MONTH)+"-"+(result1.get(Calendar.MONTH)+1)+"-"+result1.get(Calendar.YEAR));
		System.out.println("ecco la data 2: "+result2.get(Calendar.DAY_OF_MONTH)+"-"+(result2.get(Calendar.MONTH)+1)+"-"+result2.get(Calendar.YEAR));

		TDBManager dsm2=null;
		try {
			if(loginBean.getLogged()){
				
				tempModel = new CartesianChartModel();  
				radModel = new CartesianChartModel();  
				ventoModel = new CartesianChartModel();  
				precipitazioneModel = new CartesianChartModel();  
				bagnaturaModel = new CartesianChartModel();  
				umiditaModel = new CartesianChartModel();  
				
					//Prelevo il primo track
					
					
					dsm2 = new TDBManager("jdbc/imetnetdb");
					String sqlString2="select temp_media, rad_media, wind_medio, " +
							"precipitazione, umidita_media,bagnatura_fogliare,  " +
							"date_trunc('hour' , data) as dataout " +
							"from dati  " +
							"where  ";
					
					if(result1.equals(result2)){
						//stesso giorno
						  sqlString2=sqlString2+"data=? ";
					}else{
						//giorni diversi
						 sqlString2=sqlString2+"data between ? and ? ";
					}
					sqlString2=sqlString2+"and id_stazione=? "+
							"order by dataout";
					System.out.println("ecco la query: "+sqlString2);

			
					dsm2.setPreparedStatementRef(sqlString2);
					if(result1.equals(result2)){
						dsm2.setParameter(ParameterType.DATE, result1, 1);
						
						dsm2.setParameter(ParameterType.STRING,stationBean.getStationSelezionato2().getId_stazione(),2);
					
					}else{
						dsm2.setParameter(ParameterType.DATE, result1, 1);
						dsm2.setParameter(ParameterType.DATE,result2, 2);
						dsm2.setParameter(ParameterType.STRING,stationBean.getStationSelezionato2().getId_stazione(),3);
					
					}
					
						
					
					
					dsm2.runPreparedQuery();
					
					
					LineChartSeries temp = new LineChartSeries();  
					temp.setLabel("Temp.");
					LineChartSeries rad = new LineChartSeries();  
					rad.setLabel("Rad.");
					LineChartSeries v = new LineChartSeries();  
					v.setLabel("Vento");
					LineChartSeries precipit = new LineChartSeries();  
					precipit.setLabel("Precip.");
					LineChartSeries bagnatura = new LineChartSeries();  
					bagnatura.setLabel("Bagn.");
					LineChartSeries umid = new LineChartSeries();  
					umid.setLabel("Umidità");
					
					
			        
			        boolean trovato=false;
			        
			        while(dsm2.next()){
			        	trovato=true;
						temp.set(dsm2.getData(7).getTime(), dsm2.getDouble(1));
						rad.set(dsm2.getData(7).getTime(), dsm2.getDouble(2));
						v.set(dsm2.getData(7).getTime(), dsm2.getDouble(3));
						precipit.set(dsm2.getData(7).getTime(), dsm2.getDouble(4));
						bagnatura.set(dsm2.getData(7).getTime(), dsm2.getDouble(6));
						umid.set(dsm2.getData(7).getTime(), dsm2.getDouble(5));
						
					}
					
			        if(!trovato){
			        	temp.set(date.getTime(), 0.0);
						rad.set(date.getTime(), 0.0);
						v.set(date.getTime(), 0.0);
						precipit.set(date.getTime(), 0.0);
						bagnatura.set(date.getTime(), 0.0);
						umid.set(date.getTime(), 0.0);
						this.titoloTemp=TITOLO_TEMP+" -- "+stationBean.getStationSelezionato2().getGsm();
						this.titoloUmidita=TITOLO_UMIDITA+" -- "+stationBean.getStationSelezionato2().getGsm();
						this.titoloPrecipitazione=TITOLO_PRECIPITAZIONE+" -- "+stationBean.getStationSelezionato2().getGsm();
						this.titoloRad=TITOLO_RAD+" -- "+stationBean.getStationSelezionato2().getGsm();
						this.titoloVento=TITOLO_VENTO+" -- "+stationBean.getStationSelezionato2().getGsm();
						this.titoloBagnatura=TITOLO_BAGNATURA+" -- "+stationBean.getStationSelezionato2().getGsm();
						
			        
			        }
			        
			        tempModel.addSeries(temp);
				    radModel.addSeries(rad);
				    ventoModel.addSeries(v);
				    bagnaturaModel.addSeries(bagnatura);
				    precipitazioneModel.addSeries(precipit);
				    umiditaModel.addSeries(umid);
			}
			
			this.titoloTemp=TITOLO_TEMP+" -- "+stationBean.getStationSelezionato2().getGsm();
			this.titoloUmidita=TITOLO_UMIDITA+" -- "+stationBean.getStationSelezionato2().getGsm();
			this.titoloPrecipitazione=TITOLO_PRECIPITAZIONE+" -- "+stationBean.getStationSelezionato2().getGsm();
			this.titoloRad=TITOLO_RAD+" -- "+stationBean.getStationSelezionato2().getGsm();
			this.titoloVento=TITOLO_VENTO+" -- "+stationBean.getStationSelezionato2().getGsm();
			this.titoloBagnatura=TITOLO_BAGNATURA+" -- "+stationBean.getStationSelezionato2().getGsm();
			
        
		
		
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally{
			try {
				dsm2.closeConnection();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		
	}
	
	
	
}
