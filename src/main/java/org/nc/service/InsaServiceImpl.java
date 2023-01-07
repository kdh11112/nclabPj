package org.nc.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nc.domain.InsaVO;
import org.nc.mapper.InsaMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
@ToString
public class InsaServiceImpl implements InsaService{

	private final InsaMapper mapper;
	
	@Override
	public List<InsaVO> ListResult() {
		log.info("ListResult!!!!Service");
		return mapper.ListResult();
	}



//	@Override
//	public List<InsaVO> ListSearch(HashMap<String, String> paraMap) {
//		// TODO Auto-generated method stub
//		return mapper.ListSearch(paraMap);
//	}



	@Override
	public List<InsaVO> ListSearch(Date shDateEnd, Date shDateStart) {
		Map<String, Object> map = new HashMap<>();
		map.put("shDateStart", shDateStart);
		map.put("shDateEnd", shDateEnd);
		log.info("shDateStart"+shDateStart);
		return mapper.ListSearch(map);
		
	}
	
}
