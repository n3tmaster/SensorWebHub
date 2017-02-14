/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.SWE;
import it.cnr.ibimet.bikeclimate.entities.SWEDataModel;
import it.lr.libs.DBManager;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lerocchi
 */
@ManagedBean(name="sweStationBean")
@SessionScoped
public class SWEBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private SWE sweSelezionato1,sweSelezionato2,sweSelezionato3;
	private SWEDataModel sweListModel; 
	private List<SWE> swelist; 
	
	private String clausulaWhere ;

        @ManagedProperty(value="#{loginBean}")
	private LoginBean loginBean;
	
	public LoginBean getLoginBean() {
		return loginBean;
	}

	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}        
                
        public String getClausulaWhere() {
            return clausulaWhere;
        }

        public void setClausulaWhere(String clausulaWhere) {
            this.clausulaWhere = clausulaWhere;
        }

    public SWE getSweSelezionato2() {
        return sweSelezionato2;
    }

    public void setSweSelezionato2(SWE sweSelezionato2) {
        this.sweSelezionato2 = sweSelezionato2;
    }

    public SWE getSweSelezionato3() {
        return sweSelezionato3;
    }

    public void setSweSelezionato3(SWE sweSelezionato3) {
        this.sweSelezionato3 = sweSelezionato3;
    }

        
        
    public SWE getSweSelezionato1() {
        return sweSelezionato1;
    }

    public void setSweSelezionato1(SWE sweSelezionato1) {
        this.sweSelezionato1 = sweSelezionato1;
    }

    public SWEDataModel getSweListModel() {
        return sweListModel;
    }

    public void setSweListModel(SWEDataModel sweListModel) {
        this.sweListModel = sweListModel;
    }

    public List<SWE> getSwelist() {
        return swelist;
    }

    public void setSwelist(List<SWE> swelist) {
        this.swelist = swelist;
    }
        
	


	
	public void popola(){
		TDBManager dsm=null;
		try {
                    dsm = new TDBManager("jdbc/urbandb");

                            //giardino=idgiardini.get(0);
                    System.out.println("SWE Station bean - main - connessione aperta");


                    
                    String sqlString="select id_mobile_station, nome,img, descrizione " +
                            "from mobile_stations a, station_types b where a.id_station_type=b.id_station_type and id_domain=? and b.tipo "+clausulaWhere+" order by 2";

                    System.out.println("SQL: "+sqlString);
                    
                    dsm.setPreparedStatementRef(sqlString);
                    dsm.setParameter(DBManager.ParameterType.INT, ""+loginBean.getId_dominio(), 1);
                    dsm.runPreparedQuery();
                    swelist = new ArrayList<SWE>();

                    while(dsm.next()){
                        
                        this.swelist.add(new SWE( dsm.getString(2),dsm.getInteger(1), dsm.getString(4),dsm.getString(3)));
                    }

                    System.out.println("sweStationBean ciclo finito: ");
                    
                    this.sweListModel= new SWEDataModel(this.swelist);
                    
                     System.out.println("sweStationBean dopo datamodel: ");
                    this.sweSelezionato1 = this.swelist.get(0);
                    this.sweSelezionato2 = this.swelist.get(0);
                    this.sweSelezionato3 = this.swelist.get(0);
                    System.out.println("sweStationBean sto per uscire ");
                   
		} catch (Exception e) {
			
			e.printStackTrace();
                        System.out.println("sweStationBean error: "+e.getMessage());
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
		System.out.println("TotemStation - init");
		sweSelezionato1=new SWE("", 0);
		sweSelezionato2=new SWE("", 0);
		sweSelezionato3=new SWE("", 0);
		clausulaWhere="is null";
	//	popola();
	}
	

}
