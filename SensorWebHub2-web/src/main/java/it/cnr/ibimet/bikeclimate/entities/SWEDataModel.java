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


public class SWEDataModel extends ListDataModel<SWE> implements SelectableDataModel<SWE>{

	public SWEDataModel(){
		
	}
	
	public SWEDataModel(List<SWE> data){
		super(data);
                System.out.println("sono in swedatamodel");
	}
	@Override
	public SWE getRowData(String rowKey) {
		List<SWE> zone = (List<SWE>) getWrappedData();
		
		for(SWE zona : zone){
			String aaa = ""+zona.getId_swe();
			if(aaa.equals(rowKey))
				return zona;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(SWE zona) {
            return zona.getId_swe();
        }
	
}
	