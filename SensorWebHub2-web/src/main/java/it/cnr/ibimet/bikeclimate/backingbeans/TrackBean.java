package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.TrackElement;
import it.cnr.ibimet.bikeclimate.entities.TrackElementDataModel;
import it.lr.libs.DBManager.ParameterType;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


@ManagedBean(name="trackBean")
@SessionScoped
public class TrackBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private List<TrackElement> tracklist;
	private TrackElement trackSelezionato,trackSelezionato002;
	private TrackElementDataModel trackListModel;
	@ManagedProperty(value="#{mobileStationBean}")
	private MobileStationBean mobileStationBean;

	public List<TrackElement> getTracklist() {
		return tracklist;
	}

	public void setTracklist(List<TrackElement> tracklist) {
		this.tracklist = tracklist;
	}

	public TrackElement getTrackSelezionato() {
		return trackSelezionato;
	}

	public void setTrackSelezionato(TrackElement trackSelezionato) {
		this.trackSelezionato = trackSelezionato;
	}

	public TrackElementDataModel getTrackListModel() {
		return trackListModel;
	}

	public void setTrackListModel(TrackElementDataModel trackListModel) {
		this.trackListModel = trackListModel;
	}

	public TrackElement getTrackSelezionato002() {
		return trackSelezionato002;
	}
	
	public void setTrackSelezionato002(TrackElement trackSelezionato002) {
		this.trackSelezionato002 = trackSelezionato002;
	}
	
	public MobileStationBean getMobileStationBean() {
		return mobileStationBean;
	}
	public void setMobileStationBean(MobileStationBean mobileStationBean) {
		this.mobileStationBean = mobileStationBean;
	}
	@PostConstruct
	public void init(){
		System.out.println("BikeData - init");
	
		//TODO:
		//  Da re-implementare
		//	if(mobileStationBean.getMobileStationSelezionato()==null)
		//	return;
		//popola();
	}
	
	public void popola002(){
		TDBManager dsm=null;
		try {
			dsm = new TDBManager("jdbc/urbandb");
			
				//giardino=idgiardini.get(0);
			System.out.println("MobilestationBean - main - connessione aperta");
			
			
			String sqlString="select trackname, id_track, data_start, data_end,id_utente " +
					" from tracks " +
					" where id_mobile_station=? order by 1";
			

			dsm.setPreparedStatementRef(sqlString);
			dsm.setParameter(ParameterType.INT, 
					""+mobileStationBean.getMobileStationSelezionato002().getId_mobile_station(), 1);
			dsm.runPreparedQuery();
			
			tracklist = new ArrayList<TrackElement>();
			
			while(dsm.next()){
				this.tracklist.add(new TrackElement(dsm.getInteger(2),mobileStationBean.getMobileStationSelezionato002().getId_mobile_station(),
						dsm.getInteger(5),dsm.getString(1),dsm.getData(3),dsm.getData(4)));
				
			}

			trackListModel=new TrackElementDataModel(this.tracklist);
			
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
	public void popola(){
		TDBManager dsm=null;
		try {
			dsm = new TDBManager("jdbc/urbandb");
			
				//giardino=idgiardini.get(0);
			System.out.println("MobilestationBean - main - connessione aperta");
			
			
			String sqlString="select trackname, id_track, data_start, data_end,id_utente " +
					" from tracks " +
					" where id_mobile_station=? order by 1";
			

			dsm.setPreparedStatementRef(sqlString);
			//TODO: da reimplementare
			//
			//dsm.setParameter(ParameterType.INT, 
			//		""+mobileStationBean.getMobileStationSelezionato().getId_mobile_station(), 1);
			//dsm.runPreparedQuery();
			//
			//tracklist = new ArrayList<TrackElement>();
			//
			//while(dsm.next()){
			//	this.tracklist.add(new TrackElement(dsm.getInteger(2),mobileStationBean.getMobileStationSelezionato().getId_mobile_station(),
			//			dsm.getInteger(5),dsm.getString(1),dsm.getData(3),dsm.getData(4)));
			//	
			//}

			trackListModel=new TrackElementDataModel(this.tracklist);
			
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
	
	
	
}
