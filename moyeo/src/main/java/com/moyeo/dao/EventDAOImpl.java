package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Event;
import com.moyeo.mapper.EventMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class EventDAOImpl implements EventDAO {

    private final SqlSessionTemplate sqlSession;

    @Override
    public int insertEvent(Event event) {
        return sqlSession.insert("com.moyeo.mapper.EventMapper.insertEvent", event);
    }

    @Override
    public int updateEvent(Event event) {
        return sqlSession.update("com.moyeo.mapper.EventMapper.updateEvent", event);
    }

    @Override
    public Event selectEventInfo(int eventIdx) {
        return sqlSession.selectOne("com.moyeo.mapper.EventMapper.selectEventInfo", eventIdx);
    }

    @Override
    public List<Event> selectEventList() {
        return sqlSession.selectList("com.moyeo.mapper.EventMapper.selectEventList");
    }

    @Override
    public int deleteEvent(int eventIdx) {
        return sqlSession.delete("com.moyeo.mapper.EventMapper.deleteEvent", eventIdx);
    }

    @Override
    public List<Event> searchEventByTitle(String keyword) {
        return sqlSession.selectList("com.moyeo.mapper.EventMapper.searchEventByTitle", keyword);
    }	
  //전체 게시글 조회(페이징) + 검색
    @Override
    public int selectOngoingEventCount(Map<String, Object> map) {
 	      return sqlSession.getMapper(EventMapper.class).selectOngoingEventCount(map);
    }

    //페이징된 게시글 리스트 조회 + 검색
    @Override
    public List<Event> selectOngoingEventList(Map<String, Object> map) {
 	   return sqlSession.getMapper(EventMapper.class).selectOngoingEventList(map);
    }
    
    @Override
    public int selectCloseEventCount(Map<String, Object> map) {
 	      return sqlSession.getMapper(EventMapper.class).selectCloseEventCount(map);
    }
   
    @Override
    public List<Event> selectCloseEventList(Map<String, Object> map) {
  	   return sqlSession.getMapper(EventMapper.class).selectCloseEventList(map);
     }
    
    @Override
	public List<Event> selectOngoingEventList1(Map<String, Object> map) {
    	return sqlSession.getMapper(EventMapper.class).selectOngoingEventList1(map);
	}
	
	@Override
	public int selectOngoingEventCount1(String selectKeyword) {
		return sqlSession.getMapper(EventMapper.class).selectOngoingEventCount1(selectKeyword);
	}
	
	@Override
	public List<Event> selectCloseEventList1(Map<String, Object> map) {
    	return sqlSession.getMapper(EventMapper.class).selectCloseEventList1(map);
	}
	
	@Override
	public int selectCloseEventCount1(String selectKeyword) {
		return sqlSession.getMapper(EventMapper.class).selectCloseEventCount1(selectKeyword);
	}

    @Override
    public int updateEventStatus(Event event) {
        return sqlSession.update("com.moyeo.mapper.EventMapper.updateEventStatus", event);
    }

	@Override
	public List<Event> selectEventList1(Map<String, Object> map) {
		return sqlSession.getMapper(EventMapper.class).selectEventList1(map);
	}

	@Override
	public int selectEventCount1(String selectKeyword) {
		return sqlSession.getMapper(EventMapper.class).selectEventCount1(selectKeyword);
	}
}