package it.cnr.ibimet.bikeclimate.entities;

import org.primefaces.model.SelectableDataModel;

import javax.faces.model.ListDataModel;
import java.util.List;

public class BikeStatisticsDataModel extends ListDataModel<BikeStatistics> implements SelectableDataModel<BikeStatistics>{

	public BikeStatisticsDataModel(){
		
	}
	
	public BikeStatisticsDataModel(List<BikeStatistics> data){
		super(data);
	}
	@Override
	public BikeStatistics getRowData(String rowKey) {
		List<BikeStatistics> zone = (List<BikeStatistics>) getWrappedData();
		
		for(BikeStatistics zona : zone){
			String aaa = ""+zona.getIddata();
			if(aaa.equals(rowKey))
				return zona;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(BikeStatistics zona) {
		
		return zona.getIddata();
	}

}