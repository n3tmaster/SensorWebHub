package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.Station;
import it.cnr.ibimet.bikeclimate.entities.StationDataModel;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


@ManagedBean(name="stationBean")
@SessionScoped
public class StationBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private List<Station> stationlist;
	private Station stationSelezionato;
	private Station stationSelezionato2;
	private StationDataModel stationListModel;
	@ManagedProperty(value="#{loginBean}")
	private LoginBean loginBean;

	public List<Station> getStationlist() {
		return stationlist;
	}

	public void setStationlist(List<Station> stationlist) {
		this.stationlist = stationlist;
	}

	public Station getStationSelezionato2() {
		return stationSelezionato2;
	}
	
	public void setStationSelezionato2(Station stationSelezionato2) {
		this.stationSelezionato2 = stationSelezionato2;
	}
	
	public LoginBean getLoginBean() {
		return loginBean;
	}



	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}



	public void setMobilestationlist(List<Station> stationlist) {
		this.stationlist = stationlist;
	}



	public Station getStationSelezionato() {
		return stationSelezionato;
	}



	public void setStationSelezionato(Station stationSelezionato) {
		this.stationSelezionato = stationSelezionato;
	}



	public StationDataModel getStationListModel() {
		return stationListModel;
	}



	public void setStationListModel(StationDataModel stationListModel) {
		this.stationListModel = stationListModel;
	}



	public void popola(){
		TDBManager dsm=null;
		try {
			dsm = new TDBManager("jdbc/imetnetdb");
			
				//giardino=idgiardini.get(0);
			System.out.println("StationBean - main - connessione aperta");
		
			
			
			String sqlString="select id_stazione, s.id_ente, s.id_azienda, gsm, " +
					"e.nome_ente, a.nome_azienda "+
					"from stazioni s, aziende a, enti e " +
					"where a.id_azienda=s.id_azienda and "+
					"e.id_ente   =s.id_ente ";
			
			dsm.setPreparedStatementRef(sqlString);
			
			dsm.runPreparedQuery();
			stationlist = new ArrayList<Station>();
			
			while(dsm.next()){
				if(!loginBean.isLevel5()){
					this.stationlist.add(new Station(dsm.getString(1), dsm.getInteger(2),
						dsm.getInteger(3),dsm.getPStmt().getResultSet().getLong(4),dsm.getString(5),dsm.getString(6)));
				}else{
					this.stationlist.add(new Station( dsm.getString(1), dsm.getInteger(2),
							dsm.getInteger(3),0,dsm.getString(5),dsm.getString(1)));
				
				}
			}

			if(stationlist.size()>0){
				this.stationListModel= new StationDataModel(this.stationlist);


				this.stationSelezionato = this.stationlist.get(0);
				this.stationSelezionato2=this.stationlist.get(0);
			}else{
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Attenzione", "Nessun dato presente"));

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
	
	
	
	@PostConstruct
	public void init(){
		System.out.println("Station - init");
		stationSelezionato=new Station("", 0, 0 ,0, "" , "");
	    stationSelezionato2=new Station("",0,0,0,"","");
		popola();
	}
	
	
}
