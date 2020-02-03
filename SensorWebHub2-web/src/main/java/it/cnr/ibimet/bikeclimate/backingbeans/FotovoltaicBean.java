/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.cnr.ibimet.bikeclimate.entities.Fotovoltaic;
import it.cnr.ibimet.bikeclimate.entities.FotovoltaicDataModel;
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
@ManagedBean(name="fotoBean")
@SessionScoped
public class FotovoltaicBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Fotovoltaic fotoSelezionato1,fotoSelezionato2,fotoSelezionato3;
	private FotovoltaicDataModel fotoListModel; 
	private List<Fotovoltaic> fotolist; 
	
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

    public Fotovoltaic getFotoSelezionato1() {
        return fotoSelezionato1;
    }

    public void setFotoSelezionato1(Fotovoltaic fotoSelezionato1) {
        this.fotoSelezionato1 = fotoSelezionato1;
    }

    public Fotovoltaic getFotoSelezionato2() {
        return fotoSelezionato2;
    }

    public void setFotoSelezionato2(Fotovoltaic fotoSelezionato2) {
        this.fotoSelezionato2 = fotoSelezionato2;
    }

    public Fotovoltaic getFotoSelezionato3() {
        return fotoSelezionato3;
    }

    public void setFotoSelezionato3(Fotovoltaic fotoSelezionato3) {
        this.fotoSelezionato3 = fotoSelezionato3;
    }

    public FotovoltaicDataModel getFotoListModel() {
        return fotoListModel;
    }

    public void setFotoListModel(FotovoltaicDataModel fotoListModel) {
        this.fotoListModel = fotoListModel;
    }

    public List<Fotovoltaic> getFotolist() {
        return fotolist;
    }

    public void setFotolist(List<Fotovoltaic> fotolist) {
        this.fotolist = fotolist;
    }

    

	
	public void popola(){
		TDBManager dsm=null;
		try {
                    dsm = new TDBManager("jdbc/urbandb");

                            //giardino=idgiardini.get(0);
                    System.out.println("SWE Station bean - main - connessione aperta");


                    
                    String sqlString="select a.id_mobile_station, nome,img, descrizione " +
                            "from mobile_stations a, station_types b , utenti_stations us " +
                            "where us.id_utente=? and a.id_mobile_station= us.id_mobile_station and a.id_station_type=b.id_station_type and id_domain=? and b.tipo "+clausulaWhere+" order by 2";

                    System.out.println("SQL: "+sqlString);
                    
                    dsm.setPreparedStatementRef(sqlString);
                    dsm.setParameter(DBManager.ParameterType.INT, ""+loginBean.getId_user(), 1);
                    dsm.setParameter(DBManager.ParameterType.INT, ""+loginBean.getId_dominio(), 2);
                    dsm.runPreparedQuery();
                    fotolist = new ArrayList<Fotovoltaic>();

                    while(dsm.next()){
                        this.fotolist.add(new Fotovoltaic( dsm.getString(2),dsm.getInteger(1), dsm.getString(4),dsm.getString(3)));
                    }

                    this.fotoListModel= new FotovoltaicDataModel(this.fotolist);
                    this.fotoSelezionato1 = this.fotolist.get(0);
                    this.fotoSelezionato2 = this.fotolist.get(0);
                    this.fotoSelezionato3 = this.fotolist.get(0);
                   
                   
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
		System.out.println("Fotovoltaic Stations - init");
		fotoSelezionato1=new Fotovoltaic("", 0);
		fotoSelezionato2=new Fotovoltaic("", 0);
		fotoSelezionato3=new Fotovoltaic("", 0);
        clausulaWhere="is null";
	//	popola();
	}
	

}
