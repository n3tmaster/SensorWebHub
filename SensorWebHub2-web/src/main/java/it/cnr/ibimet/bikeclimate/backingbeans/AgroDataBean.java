package it.cnr.ibimet.bikeclimate.backingbeans;


import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.AgroData;
import it.cnr.ibimet.bikeclimate.entities.AgroDataModel;
import it.cnr.ibimet.bikeclimate.entities.AgroMeteoStatistics;
import it.cnr.ibimet.bikeclimate.entities.AgroMeteoStatisticsDataModel;
import it.lr.libs.DBManager.ParameterType;
import org.primefaces.model.StreamedContent;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@ManagedBean(name="agroDataBean")
@SessionScoped
public class AgroDataBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private final static String CSV_FORMAT="csv";
	private final static String XLS_FORMAT="xls";
	private final static String FILENAME = "/analysis.csv";
	/**
	 *
	 */

	private StreamedContent file;
	private boolean preparatoFile;
	private Date data1, data2;
	private String formatoRadio;
	private boolean consenso;
	private Date fromData;
	private Date toData;
	private List<AgroData> agroDataList;
	private AgroData agroDataSelected;
	private AgroDataModel agroListModel;
	private List<AgroMeteoStatistics> bikeStatisticsList;
	private AgroMeteoStatistics bikeStatisticsSelected;
    private AgroMeteoStatisticsDataModel dataStatisticsDataModel;
	@ManagedProperty(value="#{loginBean}")
	private LoginBean loginBean;
	@ManagedProperty(value="#{stationBean}")
	private StationBean stationBean;
    private List<AgroMeteoStatistics> filteredStatList2;
	private List<AgroMeteoStatistics> filteredStatList;
	private List<AgroData> bikeDataList;
	private AgroData bikeDataSelected;

	public StreamedContent getFile() {
		return file;
	}
	
	public void setFile(StreamedContent file) {
		this.file = file;
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

	public AgroMeteoStatisticsDataModel getDataStatisticsDataModel() {
		return dataStatisticsDataModel;
	}

	public void setDataStatisticsDataModel(
			AgroMeteoStatisticsDataModel dataStatisticsDataModel) {
		this.dataStatisticsDataModel = dataStatisticsDataModel;
	}

	public AgroDataModel getAgroListModel() {
		return agroListModel;
	}
	
	public void setAgroListModel(AgroDataModel agroListModel) {
		this.agroListModel = agroListModel;
	}

	public List<AgroData> getAgroDataList() {
		return agroDataList;
	}

	public void setAgroDataList(List<AgroData> agroDataList) {
		this.agroDataList = agroDataList;
	}
	
	public AgroData getAgroDataSelected() {
		return agroDataSelected;
	}

	public void setAgroDataSelected(AgroData agroDataSelected) {
		this.agroDataSelected = agroDataSelected;
	}

	public LoginBean getLoginBean() {
		return loginBean;
	}
	
	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}
	
	public StationBean getStationBean() {
		return stationBean;
	}
	
	public void setStationBean(StationBean stationBean) {
		this.stationBean = stationBean;
	}

	@PostConstruct
	public void init(){
		System.out.println("AgroData - init");
		consenso=false;
		formatoRadio=CSV_FORMAT;
		fromData=new Date();
		toData=new Date();
		preparatoFile=false;
		popola();
		popolaStatisticsOra();
	}

	public void popolaTutto(){
		popola();
		popolaStatisticsOra();
	}

	public void popola(){
		TDBManager dsm=null;
		try {
			dsm = new TDBManager("jdbc/imetnetdb");

				//giardino=idgiardini.get(0);
			System.out.println("AgroDataBean - main - connessione aperta");


			String sqlString="select id_dato, data, temp_media, rad_media, "+
					"wind_medio, precipitazione, umidita_media, bagnatura_fogliare, id_stazione "+
					"from dati "+
					"where id_stazione=? order by data desc";


			System.out.println("AgroListBean - query: "+sqlString);
			System.out.println("Stazione ID: "+stationBean.getStationSelezionato().getId_stazione());
			dsm.setPreparedStatementRef(sqlString);
			dsm.setParameter(ParameterType.STRING,stationBean.getStationSelezionato().getId_stazione(),1);

			dsm.runPreparedQuery();

			agroDataList = new ArrayList<AgroData>();

			while(dsm.next()){
				this.agroDataList.add(new AgroData(dsm.getData(2),dsm.getDouble(3),dsm.getDouble(4),
						dsm.getDouble(5),dsm.getDouble(6),dsm.getDouble(7),
						dsm.getDouble(8),dsm.getString(9),dsm.getPStmt().getResultSet().getLong(1)));

			}

			agroListModel= new AgroDataModel(agroDataList);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try{
				dsm.closeConnection();
			}catch(Exception e){
				e.getStackTrace();
			}
		}


	}

	public void popolaStatisticsOra(){
		TDBManager dsm=null;
		try {


				//giardino=idgiardini.get(0);
			System.out.println("AgroMeteoDataBean - main - connessione aperta");

			String sqlString="select id_stazione,extract(day from a.data),extract(month from a.data),extract(year from a.data), "+
					"min(a.temp_media),max(a.temp_media),avg(a.temp_media),"
					+ "min(a.rad_media),max(a.rad_media),avg(a.rad_media),"+
					"min(a.wind_medio),max(a.wind_medio),avg(a.wind_medio),"+
					"min(a.precipitazione),max(a.precipitazione),sum(a.precipitazione),"+
					"min(a.umidita_media),max(a.umidita_media),avg(a.umidita_media),"+
					"min(a.bagnatura_fogliare),max(a.bagnatura_fogliare),avg(a.bagnatura_fogliare) "+
					"from dati a "+
					"where id_stazione=? "+
					"group by 1,2,3,4  order by 4 desc,3 desc ,2 desc";


			System.out.println("BikeListBean - query: "+sqlString);
			dsm = new TDBManager("jdbc/imetnetdb");
			dsm.setPreparedStatementRef(sqlString);
			dsm.setParameter(ParameterType.STRING,stationBean.getStationSelezionato().getId_stazione(),1);




			dsm.runPreparedQuery();
			bikeStatisticsList = new ArrayList<AgroMeteoStatistics>();

			int i=1;
			while(dsm.next()){


				this.bikeStatisticsList.add(new AgroMeteoStatistics(i++,   dsm.getString(2)+"-"+dsm.getString(3)+"-"+dsm.getString(4), "",
						dsm.getDouble(5), dsm.getDouble(6), dsm.getDouble(7),
						dsm.getDouble(8), dsm.getDouble(9), dsm.getDouble(10),
						dsm.getDouble(11), dsm.getDouble(12), dsm.getDouble(13),
						dsm.getDouble(14), dsm.getDouble(15), dsm.getDouble(16),
						dsm.getDouble(17), dsm.getDouble(18), dsm.getDouble(19),
						dsm.getDouble(20), dsm.getDouble(21), dsm.getDouble(22),
						dsm.getString(1)));

			}

			dataStatisticsDataModel= new AgroMeteoStatisticsDataModel(bikeStatisticsList);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try{
				dsm.closeConnection();
			}catch(Exception e){
				e.getStackTrace();
			}
		}


	}
	
	public List<AgroMeteoStatistics> getFilteredStatList() {
		return filteredStatList;
	}

	public void setFilteredStatList(List<AgroMeteoStatistics> filteredStatList) {
		this.filteredStatList = filteredStatList;
	}

	public List<AgroMeteoStatistics> getBikeStatisticsList() {
		return bikeStatisticsList;
	}

	public void setBikeStatisticsList(List<AgroMeteoStatistics> bikeStatisticsList) {
		this.bikeStatisticsList = bikeStatisticsList;
	}

	public AgroMeteoStatistics getBikeStatisticsSelected() {
		return bikeStatisticsSelected;
	}

	public void setBikeStatisticsSelected(AgroMeteoStatistics bikeStatisticsSelected) {
		this.bikeStatisticsSelected = bikeStatisticsSelected;
	}

	public List<AgroData> getBikeDataList() {
		return bikeDataList;
	}

	public void setBikeDataList(List<AgroData> bikeDataList) {
		this.bikeDataList = bikeDataList;
	}

	public AgroData getBikeDataSelected() {
		return bikeDataSelected;
	}
	
	public void setBikeDataSelected(AgroData bikeDataSelected) {
		this.bikeDataSelected = bikeDataSelected;
	}
	
	
}
