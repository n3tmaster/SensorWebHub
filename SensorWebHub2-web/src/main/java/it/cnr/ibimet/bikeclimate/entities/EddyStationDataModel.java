package it.cnr.ibimet.bikeclimate.entities;

import org.primefaces.model.SelectableDataModel;

import javax.faces.model.ListDataModel;
import java.util.List;

public class EddyStationDataModel extends ListDataModel<Eddy> implements SelectableDataModel<Eddy>{

	public EddyStationDataModel(){
		
	}
	
	public EddyStationDataModel(List<Eddy> data){
		super(data);
	}
	@Override
	public Eddy getRowData(String rowKey) {
		List<Eddy> zone = (List<Eddy>) getWrappedData();
		
		for(Eddy zona : zone){
			String aaa = ""+zona.getId_bike_sensor();
			if(aaa.equals(rowKey))
				return zona;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(Eddy zona) {
		
		return zona.getId_bike_sensor();
	}

}