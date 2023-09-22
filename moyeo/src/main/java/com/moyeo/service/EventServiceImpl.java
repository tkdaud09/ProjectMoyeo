package com.moyeo.service;

import com.moyeo.dao.EventDAO;
import com.moyeo.dto.Event;
import com.moyeo.util.Pager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class EventServiceImpl implements EventService {
    private final EventDAO eventDAO;

    @Override
    public void insertEvent(Event event) {
        eventDAO.insertEvent(event);
    }

    @Override
    public void updateEvent(Event event) {
        eventDAO.updateEvent(event);
    }

    @Override
    public Event selectEventInfo(int eventIdx) {
        return eventDAO.selectEventInfo(eventIdx);
    }

    @Override
    public List<Event> selectEventList() {
        return eventDAO.selectEventList();
    }

    @Override
    public void deleteEvent(int eventIdx) {
        eventDAO.deleteEvent(eventIdx);
    }

    @Override
    public List<Event> searchEventByTitle(String keyword) {
        return eventDAO.searchEventByTitle(keyword);
    }

    @Override
	public Map<String, Object> selectOngoingEventList(Map<String, Object> map) {
		int pageNum=1;

		if(map.get("pageNum") != null && !map.get("pageNum").equals("")) {
			pageNum=Integer.parseInt((String)map.get("pageNum"));
		}

		int pageSize=6;
		int totalBoard=eventDAO.selectOngoingEventCount(map);
		int blockSize=5;

		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		map.put("startRow", pager.getStartRow());
		map.put("endRow", pager.getEndRow());

		List<Event> ongoingEventList=eventDAO.selectOngoingEventList(map);

		Map<String, Object> result0=new HashMap<String, Object>();
		result0.put("pager", pager);
		result0.put("ongoingEventList", ongoingEventList);

		return result0;
	}
    
    @Override
	public Map<String, Object> selectCloseEventList(Map<String, Object> map) {
		int pageNum=1;

		if(map.get("pageNum") != null && !map.get("pageNum").equals("")) {
			pageNum=Integer.parseInt((String)map.get("pageNum"));
		}

		int pageSize=10;
		int totalBoard=eventDAO.selectCloseEventCount(map);
		int blockSize=5;

		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		map.put("startRow", pager.getStartRow());
		map.put("endRow", pager.getEndRow());

		List<Event> closeEventList=eventDAO.selectCloseEventList(map);

		Map<String, Object> result1=new HashMap<String, Object>();
		result1.put("pager", pager);
		result1.put("closeEventList", closeEventList);

		return result1;
	}
    
    @Override
	public Map<String, Object> getOngoingEventList(int pageNum, int pageSize, String selectKeyword) {
		int totalBoard = eventDAO.selectOngoingEventCount1(selectKeyword);
		int blockSize = 10;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("selectKeyword", selectKeyword);
		
		List<Event> ongoingEventList = eventDAO.selectOngoingEventList1(pageMap);
		
		Map<String, Object> eventMap0 = new HashMap<String, Object>();
		eventMap0.put("ongoingEventList", ongoingEventList);
		eventMap0.put("pager", pager);
		
		return eventMap0;
	}
    
    @Override
	public Map<String, Object> getCloseEventList(int pageNum, int pageSize, String selectKeyword) {
		int totalBoard = eventDAO.selectCloseEventCount1(selectKeyword);
		int blockSize = 10;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("selectKeyword", selectKeyword);
		
		List<Event> closeEventList = eventDAO.selectCloseEventList1(pageMap);
		
		Map<String, Object> eventMap1 = new HashMap<String, Object>();
		eventMap1.put("closeEventList", closeEventList);
		eventMap1.put("pager", pager);
		
		return eventMap1;
	}


    

    @Override
    public void updateEventStatus(Event event) {
        eventDAO.updateEventStatus(event);
    }
}