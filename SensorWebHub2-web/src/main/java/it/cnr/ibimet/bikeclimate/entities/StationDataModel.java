package it.cnr.ibimet.bikeclimate.entities;

import org.primefaces.model.SelectableDataModel;

import javax.faces.model.ListDataModel;
import java.util.List;

public class StationDataModel extends ListDataModel<Station> implements SelectableDataModel<Station>{

	public StationDataModel(){
		
	}
	
	public StationDataModel(List<Station> data){
		super(data);
	}
	@Override
	public Station getRowData(String rowKey) {
		List<Station> zone = (List<Station>) getWrappedData();
		
		for(Station zona : zone){
			String aaa = zona.getId_stazione();
			if(aaa.equals(rowKey))
				return zona;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(Station zona) {
		
		return zona.getId_stazione();
	}

}