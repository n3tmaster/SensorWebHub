package it.cnr.ibimet.bikeclimate.entities;

import org.primefaces.model.SelectableDataModel;

import javax.faces.model.ListDataModel;
import java.util.List;

public class SensorDataModel extends ListDataModel<Sensor> implements SelectableDataModel<Sensor>{

	public SensorDataModel(){
		
	}
	
	public SensorDataModel(List<Sensor> data){
		super(data);
	}
        
	@Override
	public Sensor getRowData(String rowKey) {
		List<Sensor> zone = (List<Sensor>) getWrappedData();
		
		for(Sensor zona : zone){
			String aaa = ""+zona.getId();
			if(aaa.equals(rowKey))
				return zona;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(Sensor zona) {
		
		return zona.getId();
	}

}