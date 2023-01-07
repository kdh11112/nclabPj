package org.nc.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.nc.mapper.TimeMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) /* 테스트를 위한 어노테이션 */
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") /* 클래스패스도 사용 가능하다   주의!!!! 오타!!!!! */
@Log4j /* Log4j를 사용하기 위한 어노테이션 */	
public class TimeMapperTests {

	@Autowired
	private TimeMapper timeMapper;
	
	@Test
	public void testGetTime() {
		log.info("testGetTime...................");
		log.info(timeMapper.getTime());
	}
}
