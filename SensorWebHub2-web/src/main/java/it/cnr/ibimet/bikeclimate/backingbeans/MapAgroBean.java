package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.KMLObject;
import org.primefaces.event.map.OverlaySelectEvent;
import org.primefaces.model.map.DefaultMapModel;
import org.primefaces.model.map.LatLng;
import org.primefaces.model.map.MapModel;
import org.primefaces.model.map.Marker;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.Date;


@ManagedBean(name="mapAgroBean")
@SessionScoped

public class MapAgroBean implements Serializable {

        private static final String CENTER_MAP="43.3551793,11.0290384";
        private static final int ZOOM_BASE = 6;
        
    
	private static final long serialVersionUID = 1L;
	
	
	private MapModel puntiModel;
	private Marker marker;
	
	private Date data, data2;
	private double centerX;
	private String centerMap;
	private double centerY;
	private int zoomFactor;
	@ManagedProperty(value="#{stationBean}")
	private StationBean stationBeam;
	@ManagedProperty(value="#{loginBean}")
	private LoginBean loginBean;

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Date getData2() {
		return data2;
	}

	public void setData2(Date data2) {
		this.data2 = data2;
	}

	public Marker getMarker() {
		return marker;
	}

	public void setMarker(Marker marker) {
		this.marker = marker;
	}

	public MapModel getPuntiModel() {
		return puntiModel;
	}

	public void setPuntiModel(MapModel puntiModel) {
		this.puntiModel = puntiModel;
	}

	public String getCenterMap() {
		return centerMap;
	}

	public void setCenterMap(String centerMap) {
		this.centerMap = centerMap;
	}

	public double getCenterX() {
		return centerX;
	}

	public void setCenterX(double centerX) {
		this.centerX = centerX;
	}

	public double getCenterY() {
		return centerY;
	}

	public void setCenterY(double centerY) {
		this.centerY = centerY;
	}
	
	public int getZoomFactor() {
		return zoomFactor;
	}
	
	public void setZoomFactor(int zoomFactor) {
		this.zoomFactor = zoomFactor;
	}

	public StationBean getStationBeam() {
		return stationBeam;
	}

	public void setStationBeam(StationBean stationBeam) {
		this.stationBeam = stationBeam;
	}

	public LoginBean getLoginBean() {
		return loginBean;
	}
	
	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}

	@PostConstruct
	public void init(){
		this.data = new Date();
		this.data2 = new Date();
		
		popolaMappa();
	}
	
	
	
	public void popolaMappa(){
		//Controllo se sono entrato o no
			
		TDBManager dsm=null;
			try {
				if(loginBean.getLogged()){
					
					puntiModel= new DefaultMapModel();
				
				dsm = new TDBManager("jdbc/imetnetdb");
				
				
                                String sqlString="select ST_AsKML(s.the_geom,4), a.nome_azienda, e.nome_ente "
                                        + "from stazioni s, aziende a, enti e "
                                        + "where s.id_azienda=a.id_azienda "
                                        + "and   s.id_ente=e.id_ente";
		
				dsm.setPreparedStatementRef(sqlString);
				dsm.runPreparedQuery();
			//	boolean firstime=true;
				
			//    double minLat=0, maxLat=0, minLong=0, maxLong=0;
				while(dsm.next()){
					KMLObject questoKML = new KMLObject(dsm.getString(1));
					
					LatLng coord = new LatLng( questoKML.getLatitudine().get(0),questoKML.getLongitudine().get(0));
					
			
				
					puntiModel.addOverlay(new Marker(coord,dsm.getString(2)+" - "+dsm.getString(3) ));
				
				   
					
				}
				
				
                                this.zoomFactor=ZOOM_BASE;
				
                                this.centerMap= CENTER_MAP;
					
					
					
				
		
			}else{
				System.out.println("Utente non loggato");
				
				
			}
		
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				dsm.closeConnection();
			} catch (SQLException e) {
		
				e.printStackTrace();
			}
		}
	    
	   
	//	viewTracks();
		
	}
	


	public void onMarkerSelect(OverlaySelectEvent event){
		System.out.println("ecco");
		marker=(Marker)event.getOverlay();
	}
	
	
	
}
