package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.KMLObject;
import it.lr.libs.DBManager.ParameterType;
import org.primefaces.event.map.OverlaySelectEvent;
import org.primefaces.model.map.DefaultMapModel;
import org.primefaces.model.map.LatLng;
import org.primefaces.model.map.MapModel;
import org.primefaces.model.map.Marker;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Vector;

@ManagedBean(name="mapUrbanBean")
@SessionScoped

public class MapBean implements Serializable {

        public static final int STAZ_MOBILI = 1;
        public static final int STAZ_FISSE = 2;
        public static final int STAZ_EDDY = 3;
        public static final int STAZ_RINNOVABILI=5;
        public static final int TUTTE_STAZ_FISSE = 4;
	public static final int STAZ_FOTOVOLTAIC = 6;
	private static final long serialVersionUID = 1L;

	private static final String PATH_IMG_MAP = "images/mapimg/bike_r.png";
	private static final String PATH_IMG_MAP_CAR = "images/mapimg/bike_b.png";
	private MapModel puntiModel;
	private Marker marker;
	private int tipoStazioni;
	private Date data, data2;
	
        private String clausulaWhere;
	private double centerX;
	private String centerMap;
	private double centerY;
	private int zoomFactor;
	@ManagedProperty(value="#{mobileStationBean}")
	private MobileStationBean mobileStationBeam;
	@ManagedProperty(value="#{loginBean}")
	private LoginBean loginBean;

    public int getTipoStazioni() {
        return tipoStazioni;
    }

/*	@ManagedProperty(value="#{toolbarBean}")
    private ToolbarBean toolbarBean;
    public ToolbarBean getToolbarBean() {
    return toolbarBean;
    }
    public void setToolbarBean(ToolbarBean toolbarBean) {
    this.toolbarBean = toolbarBean;
    }
     */
    public void setTipoStazioni(int tipoStazioni) {
        this.tipoStazioni = tipoStazioni;
    }

    public String getClausulaWhere() {
        return clausulaWhere;
    }

    public void setClausulaWhere(String clausulaWhere) {
        this.clausulaWhere = clausulaWhere;
    }

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

	public MobileStationBean getMobileStationBeam() {
		return mobileStationBeam;
	}

	public void setMobileStationBeam(MobileStationBean mobileStationBeam) {
		this.mobileStationBeam = mobileStationBeam;
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
	//	popolaUltimiMappa();
	//	popolaMappa();
	}
	

	
	public void popolaUltimiMappa(){
		String giorno,mese,anno,ora,minuto,sqlString2;
		
		//Controllo se sono entrato o no
		System.out.println("map updating...");
		TDBManager dsm=null;
			try {
				if(loginBean.getLogged()){
					
					puntiModel= new DefaultMapModel();
				
				dsm = new TDBManager("jdbc/urbandb");
				
				//controllo se clausulaWhere è null, in tal caso forzo a cercare stazioni fisse

				String sqlString="select a.id_mobile_station, nome, img, c.tipo " +
						"from mobile_stations a ,  station_types c, utenti_stations us " +
						"where a.id_station_type=c.id_station_type " +
						"and us.id_mobile_station = a.id_mobile_station " +
						"and us.id_utente = "+loginBean.getId_user() + " " +
                        "and c.tipo " + clausulaWhere ;  //toolbarBean.createWhereString("c.tipo");
		 
                System.out.println("Stringa sql: "+sqlString);
                               
				dsm.setPreparedStatementRef(sqlString);
			//	dsm.setParameter(ParameterType.STRING, mobileStationBeam.getMobileStationSelezionato002().getNome(), 1);
				
				dsm.runPreparedQuery();
				boolean firstime=true;
				
			    double minLat=0, maxLat=0, minLong=0, maxLong=0;
			    
				long iCount=0;
				//non mi piace ma lo faccio per chiudere subito la connessione attiva al db
				Vector<String> id_a, nome_a,img_a,tipo_a;
				
				id_a = new Vector<String>();
				nome_a=new Vector<String>();
				img_a=new Vector<String>();
				tipo_a = new Vector<String>();
				while(dsm.next()){
					id_a.add(""+dsm.getInteger(1));
					nome_a.add(dsm.getString(2));
					img_a.add(dsm.getString(3));
                                        tipo_a.add(dsm.getString(4));
				}
				
				
					switch(tipoStazioni){

						case STAZ_MOBILI:

							sqlString="select ST_AsKML(a.the_geom,4),a.tair,a.co2,a.rad,a.o3,a.data " +
									"from dati a, mobile_stations b " +
									"where a.id_mobile_station=b.id_mobile_station and  a.id_mobile_station=? and b.id_domain="+loginBean.getId_dominio() +
									" order by data desc limit 1";

							break;
						case STAZ_EDDY:
							sqlString="select ST_AsKML(b.the_geom,4),a.tair,a.co2,a.co2_flux,a.h2o,a.data " +
									"from dati_eddy a , mobile_stations b " +
									"where   a.id_mobile_station=? and a.id_mobile_station=b.id_mobile_station and b.the_geom is not null  and b.id_domain="+loginBean.getId_dominio() +
									" order by data desc limit 1";
							break;
						case STAZ_FISSE:
						case TUTTE_STAZ_FISSE:
							sqlString="select ST_AsKML(b.the_geom,4),a.tair,a.co2,a.rad,a.o3,a.data " +
									"from dati_stazioni_fisse a, mobile_stations b " +
									"where  a.id_mobile_station=? and a.id_mobile_station=b.id_mobile_station and b.the_geom is not null  and b.id_domain="+loginBean.getId_dominio() +
									" order by data desc limit 1";
							break;

						case STAZ_RINNOVABILI:  //TODO : to be change

							sqlString="select ST_AsKML(b.the_geom,4),a.tair_ext,a.hum_ext,a.energy_consuption,a.woodchips,a.data " +
									"from  dati_swe a, mobile_stations b " +
									"where  a.id_mobile_station=? and a.id_mobile_station=b.id_mobile_station and b.the_geom is not null  and b.id_domain="+loginBean.getId_dominio() +
									" order by data desc limit 1";



							break;

						case STAZ_FOTOVOLTAIC:  //TODO : to be change

							sqlString="select ST_AsKML(b.the_geom,4),upv_lst, pac,upv_soll, e_total,a.data " +
									"from  dati_fotovoltaico a, mobile_stations b " +
									"where  a.id_mobile_station=? and a.id_mobile_station=b.id_mobile_station and b.the_geom is not null  and b.id_domain="+loginBean.getId_dominio() +
									" order by data desc limit 1";
							break;
					}
					System.out.println("mapBean : "+sqlString);
                                
				dsm.setPreparedStatementRef(sqlString);
				for(int i=0; i<id_a.size();i++){
                                    System.out.println("MapBean - ora processo questo id: "+id_a.get(i));
                                        dsm.setParameter(ParameterType.INT, id_a.get(i), 1);
                                      
                                      //  if(tipoStazioni==TUTTE_STAZ_FISSE)
                                       //         dsm.setParameter(ParameterType.INT, id_a.get(i), 2);
                                    
                                      
                                        
					dsm.runPreparedQuery();
					
					if(dsm.next()){
						KMLObject questoKML = new KMLObject(dsm.getString(1));
						iCount++;
                                                System.out.println("Lat"+ questoKML.getLatitudine().get(0)+ " long: "+questoKML.getLongitudine().get(0));
                                                
						LatLng coord = new LatLng( questoKML.getLatitudine().get(0),questoKML.getLongitudine().get(0));
						
						GregorianCalendar gc =dsm.getData(6);
					 	
					 	
						 //	gc.get(Calendar.DAY_OF_MONTH)+"-"+(gc.get(Calendar.MONTH)+1)+"-"+gc.get(Calendar.YEAR)+" "+gc.get(Calendar.HOUR_OF_DAY)+":"+gc.get(Calendar.MINUTE)+ 
						 	if(gc.get(Calendar.DAY_OF_MONTH)>=10){
						 		giorno=""+gc.get(Calendar.DAY_OF_MONTH);
						 	}else{
						 		giorno="0"+gc.get(Calendar.DAY_OF_MONTH);
						 	}
						 	
						 	if((gc.get(Calendar.MONTH)+1)>=10){
						 		mese=""+(gc.get(Calendar.MONTH)+1);
						 	}else{
						 		mese="0"+(gc.get(Calendar.MONTH)+1);
						 	}
						 	anno=""+gc.get(Calendar.YEAR);
						 	if((gc.get(Calendar.HOUR_OF_DAY))>=10){
						 		ora=""+(gc.get(Calendar.HOUR_OF_DAY));
						 	}else{
						 		ora="0"+(gc.get(Calendar.HOUR_OF_DAY));
						 	}
						 
							if((gc.get(Calendar.MINUTE))>=10){
						 		minuto=""+(gc.get(Calendar.MINUTE));
						 	}else{
						 		minuto="0"+(gc.get(Calendar.MINUTE));
						 	}
                                                        
                                                      
                                                        if(tipo_a.get(i).equalsIgnoreCase(ToolbarBean.COVARIANCE_TYPE)){
                                                            puntiModel.addOverlay(new Marker(coord, ""+nome_a.get(i),
									"<p>"+giorno+"-"+mese+"-"+anno+" "+ora+":"+minuto+ "</p><p>Temp.: "+dsm.getDouble(2)+"</p><p>CO2: "+dsm.getInteger(3)+
									"</p><p>CO2_Flux: "+dsm.getDouble(4)+"</p><p>H2O: "+dsm.getInteger(5)+"</p>","images/mapimg/"+img_a.get(i)));
						        }else{
                                                            puntiModel.addOverlay(new Marker(coord, ""+nome_a.get(i),
									"<p>"+giorno+"-"+mese+"-"+anno+" "+ora+":"+minuto+ "</p><p>Temp.: "+dsm.getDouble(2)+"</p><p>CO2: "+dsm.getInteger(3)+
									"</p><p>Umidità: "+dsm.getDouble(4)+"</p><p>O3: "+dsm.getInteger(5)+"</p>","images/mapimg/"+img_a.get(i)));
						        }
					}
				}
				
				
					//this.centerX=minLong+((maxLong-minLong)/2);
					//this.centerY=minLat+((maxLat-minLat)/2);



					this.zoomFactor=(int)loginBean.getZoomfactor();
					
					this.centerMap= ""+loginBean.getCenter_y()+","+loginBean.getCenter_x();
					
                                       System.out.println("centerMap: "+this.centerMap);
                                        System.out.println("zoomFactor: "+this.zoomFactor);
					
					if(iCount==0){
						FacesContext.getCurrentInstance().addMessage(null, 
								new FacesMessage(FacesMessage.SEVERITY_INFO,"Attenzione!", "La tipologia selezionata non ha dati!")); 
					}
				
				
		
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
		
		marker=(Marker)event.getOverlay();
		addMessage(new FacesMessage(FacesMessage.SEVERITY_INFO, marker.getTitle(),marker.getData().toString()));
		
	}
	
	public void addMessage(FacesMessage message){
		FacesContext.getCurrentInstance().addMessage(null,message);
	}
	
}
