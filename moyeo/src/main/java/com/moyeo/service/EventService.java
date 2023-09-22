package com.moyeo.service;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Event;

public interface EventService {
    void insertEvent(Event event);
    void updateEvent(Event event);
    Event selectEventInfo(int eventIdx);
    List<Event> selectEventList();
    void deleteEvent(int eventIdx);
    List<Event> searchEventByTitle(String keyword);
    
    Map<String, Object> selectOngoingEventList(Map<String, Object> map);
    Map<String, Object> selectCloseEventList(Map<String, Object> map);
    
    Map<String, Object> getOngoingEventList(int pageNum, int pageSize, String selectKeyword);
    Map<String, Object> getCloseEventList(int pageNum, int pageSize, String selectKeyword);
    void updateEventStatus(Event event);
}
