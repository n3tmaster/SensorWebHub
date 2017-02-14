/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.entities;

import org.primefaces.model.SelectableDataModel;

import javax.faces.model.ListDataModel;
import java.util.List;
/**
 *
 * @author lerocchi
 */


public class FotovoltaicDataModel extends ListDataModel<Fotovoltaic> implements SelectableDataModel<Fotovoltaic>{

	public FotovoltaicDataModel(){
		
	}
	
	public FotovoltaicDataModel(List<Fotovoltaic> data){
		super(data);
	}
	@Override
	public Fotovoltaic getRowData(String rowKey) {
		List<Fotovoltaic> zone = (List<Fotovoltaic>) getWrappedData();
		
		for(Fotovoltaic zona : zone){
			String aaa = ""+zona.getId_fotovoltaic();
			if(aaa.equals(rowKey))
				return zona;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(Fotovoltaic zona) {
            return zona.getId_fotovoltaic();
        }
	
}
	