package it.cnr.ibimet.bikeclimate.backingbeans;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;


@ManagedBean(name="uiBean")
@SessionScoped
public class UIManager implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private boolean doAgroMeteo, doMeteo, doUrban, doIndor;
	
	
	@PostConstruct
	public void init(){
		this.doAgroMeteo=false;
		this.doIndor=false;
		this.doMeteo=false;
		this.doUrban=false;
		
	}
	
	public void doAgroMeteo(){
		System.out.println("cicicici");
		this.doAgroMeteo=true;
		this.doIndor=false;
		this.doMeteo=false;
		this.doUrban=false;
	}
	
	
}
