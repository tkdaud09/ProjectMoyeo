package com.moyeo.mapper;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Event;

public interface EventMapper {
	int insertEvent(Event event);
    int updateEvent(Event event);
    Event selectEventInfo(int eventIdx);
    List<Event> selectEventList();
    int deleteEvent(int eventIdx);
    List<Event> searchEventByTitle(String keyword);
    
    int selectOngoingEventCount(Map<String, Object> map);   
    List<Event> selectOngoingEventList(Map<String, Object> map);
    
    int selectCloseEventCount(Map<String, Object> map); 
    List<Event> selectCloseEventList(Map<String, Object> map);
    
    List<Event> selectOngoingEventList1(Map<String, Object> map);
    int selectOngoingEventCount1(String selectKeyword);
    
    List<Event> selectCloseEventList1(Map<String, Object> map);
    int selectCloseEventCount1(String selectKeyword);
    
    int updateEventStatus(Event event);
}