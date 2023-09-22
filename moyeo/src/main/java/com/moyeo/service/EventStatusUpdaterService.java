	package com.moyeo.service;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.scheduling.annotation.Scheduled;
	import org.springframework.stereotype.Component;
	
	import com.moyeo.dto.Event;
	
	import java.util.List;
	import java.time.LocalDate;
	import java.time.format.DateTimeFormatter; // 날짜 형식 변환을 위한 클래스 추가
	
	@Component
	public class EventStatusUpdaterService {
	
	    @Autowired
	    private EventService eventService;
	
	    @Scheduled(cron = "0 0 0 * * ?")//하루에 한 번 실행
	    public void updateEventStatus() {
	        // 현재 날짜 가져오기 (시간 정보 무시)
	        LocalDate currentDate = LocalDate.now();
	
	        // 이벤트 목록 가져오기 (예: eventService.selectEventList())
	        List<Event> eventList = eventService.selectEventList();
	
	        // 이벤트 상태 업데이트 로직 구현
	        for (Event event : eventList) {
	            LocalDate eventStartDate = LocalDate.parse(event.getEventStartdate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	            LocalDate eventEndDate = LocalDate.parse(event.getEventEnddate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	
	            if (currentDate.isBefore(eventStartDate) || currentDate.isAfter(eventEndDate)) {
	                // 이벤트 시작 날짜보다 이전이거나 종료 날짜보다 이후인 경우
	                event.setEventStatus(1); // 이벤트 상태를 종료(1)로 업데이트
	            } else {
	                // 이벤트가 진행 중인 경우
	                event.setEventStatus(0); // 이벤트 상태를 진행 중(0)으로 업데이트
	            }
	
	            // 업데이트된 이벤트 저장 (예: eventService.updateEvent(event))
	            eventService.updateEventStatus(event);
	        }
	    }
	
	}