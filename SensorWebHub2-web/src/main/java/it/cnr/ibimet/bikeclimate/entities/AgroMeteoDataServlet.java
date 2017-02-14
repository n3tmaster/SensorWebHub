package it.cnr.ibimet.bikeclimate.entities;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;
import java.util.GregorianCalendar;
import java.util.Vector;

public class AgroMeteoDataServlet {
	private GregorianCalendar dataDato,newDataStart, newDataEnd;
	private String dataDatoStr;
	private String oraStr;
	private String stazione;
	private double tair;
	private double rad;
	private double vento;
	private String pioggia;
	private double umidita;
	private boolean bagnatura;
	private double latitudine;
	private double longitudine;
	private String daQui, aQui;
	private String questaStazione;
	private TDBManager tdbm;
	private Vector<AgroDataMobile> agroDataList;

	public AgroMeteoDataServlet(){
		super();
		this.daQui="-1";
		this.aQui="-1";
		this.stazione="-1";
		agroDataList = new Vector<AgroDataMobile>();

	}
	public AgroMeteoDataServlet(TDBManager tdbm){
		this();
		this.tdbm=tdbm;

	}

	public AgroMeteoDataServlet(TDBManager tdbm, String daQui, String aQui, String questaStazione){
		this(tdbm);
		this.daQui=daQui;
		this.aQui=aQui;
		this.questaStazione=questaStazione;


	}

	public String getQuestaStazione() {
		return questaStazione;
	}

	public void setQuestaStazione(String questaStazione) {
		this.questaStazione = questaStazione;
	}

	public GregorianCalendar getNewDataStart() {
		return newDataStart;
	}

	public void setNewDataStart(GregorianCalendar newDataStart) {
		this.newDataStart = newDataStart;
	}

	public GregorianCalendar getNewDataEnd() {
		return newDataEnd;
	}
	
	public void setNewDataEnd(GregorianCalendar newDataEnd) {
		this.newDataEnd = newDataEnd;
	}

	public Vector<AgroDataMobile> getAgroDataList() {
		return agroDataList;
	}

	public void setAgroDataList(Vector<AgroDataMobile> agroDataList) {
		this.agroDataList = agroDataList;
	}

	public TDBManager getTdbm() {
		return tdbm;
	}
	
	public void setTdbm(TDBManager tdbm) {
		this.tdbm = tdbm;
	}

	public GregorianCalendar getDataDato() {
		return dataDato;
	}

	public void setDataDato(GregorianCalendar dataDato) {
		this.dataDato = dataDato;
	}

	public String getDataDatoStr() {
		return dataDatoStr;
	}

	public void setDataDatoStr(String dataDatoStr) {
		this.dataDatoStr = dataDatoStr;
	}

	public String getOraStr() {
		return oraStr;
	}

	public void setOraStr(String oraStr) {
		this.oraStr = oraStr;
	}

	public String getStazione() {
		return stazione;
	}

	public void setStazione(String stazione) {
		this.stazione = stazione;
	}

	public double getTair() {
		return tair;
	}

	public void setTair(double tair) {
		this.tair = tair;
	}

	public double getRad() {
		return rad;
	}

	public void setRad(double rad) {
		this.rad = rad;
	}

	public double getVento() {
		return vento;
	}

	public void setVento(double vento) {
		this.vento = vento;
	}

	public String getPioggia() {
		return pioggia;
	}

	public void setPioggia(String pioggia) {
		this.pioggia = pioggia;
	}

	public double getUmidita() {
		return umidita;
	}

	public void setUmidita(double umidita) {
		this.umidita = umidita;
	}

	public boolean isBagnatura() {
		return bagnatura;
	}

	public void setBagnatura(boolean bagnatura) {
		this.bagnatura = bagnatura;
	}

	public double getLatitudine() {
		return latitudine;
	}

	public void setLatitudine(double latitudine) {
		this.latitudine = latitudine;
	}

	public double getLongitudine() {
		return longitudine;
	}

	public void setLongitudine(double longitudine) {
		this.longitudine = longitudine;
	}

	public void creaLista() throws SQLException{
		String queryStr="select data,temp_media,rad_media, wind_medio,"
				+ "precipitazione, umidita_media,bagnatura_fogliare,id_stazione,id_dato " 
				+ "from dati ";
		
		if(!stazione.equalsIgnoreCase("-1")){
			queryStr=queryStr+"where id_stazione=? ";
		}else{
			queryStr=queryStr+"where id_stazione<>? ";
		}
		
		if(!daQui.equalsIgnoreCase("-1")){
			queryStr=queryStr+"and data between (?,?) ";
		}
		
		queryStr=queryStr+"order by data desc";
		
		tdbm.setPreparedStatementRef(queryStr);
		
		if(!stazione.equalsIgnoreCase("-1")){
			tdbm.setParameter(ParameterType.STRING, stazione, 1);
		}else{
			tdbm.setParameter(ParameterType.STRING, "-1", 1);
		}
		
		if(!daQui.equalsIgnoreCase("-1")){
			
			GregorianCalendar gc1 = new GregorianCalendar(Integer.parseInt(daQui.substring(0, 4)), 
					Integer.parseInt(daQui.substring(4, 6)), 
					Integer.parseInt(daQui.substring(6)));
			GregorianCalendar gc2 = new GregorianCalendar(Integer.parseInt(aQui.substring(0, 4)), 
					Integer.parseInt(aQui.substring(4, 6)), 
					Integer.parseInt(aQui.substring(6)));
			
			
			
			tdbm.setParameter(ParameterType.DATE, gc1, 2);
			tdbm.setParameter(ParameterType.DATE, gc2, 3);
		}
		
		tdbm.runPreparedQuery();
		
		for(int i=0;i<30 && tdbm.next();i++){
			if(i==0){
				newDataStart=tdbm.getData(1);
			}
			
			System.out.println("Elemento numero: "+i);
			
			newDataEnd=tdbm.getData(1);
			
			AgroDataMobile adata = new AgroDataMobile(tdbm.getData(1).getTimeInMillis(), tdbm.getDouble(2), tdbm.getDouble(3), 
					tdbm.getDouble(4), tdbm.getDouble(5), tdbm.getDouble(6), tdbm.getDouble(7), 
					tdbm.getString(8), tdbm.getInteger(9));
			
			agroDataList.add(adata);
			
		}
	}
		
}
