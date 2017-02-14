package it.cnr.ibimet.bikeclimate.entities;

import org.primefaces.model.SelectableDataModel;

import javax.faces.model.ListDataModel;
import java.util.List;

public class MobileStationDataModel extends ListDataModel<MobileStation> implements SelectableDataModel<MobileStation>{

	public MobileStationDataModel(){
		
	}
	
	public MobileStationDataModel(List<MobileStation> data){
		super(data);
	}
	@Override
	public MobileStation getRowData(String rowKey) {
		List<MobileStation> zone = (List<MobileStation>) getWrappedData();
		
		for(MobileStation zona : zone){
			String aaa = ""+zona.getId_mobile_station();
			if(aaa.equals(rowKey))
				return zona;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(MobileStation zona) {
		
		return zona.getId_mobile_station();
	}

}