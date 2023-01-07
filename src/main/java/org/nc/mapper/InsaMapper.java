package org.nc.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nc.domain.InsaVO;

public interface InsaMapper {
	
	public List<InsaVO> ListResult();
	
	public List<InsaVO> ListSearch(Map<String, Object> map);

	public List<InsaVO> ListSearch(Date shDateEnd, Date shDateStart);
	

		
}
