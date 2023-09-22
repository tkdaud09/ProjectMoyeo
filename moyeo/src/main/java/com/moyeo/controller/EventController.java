package com.moyeo.controller;

import com.moyeo.dto.Event;
import com.moyeo.service.EventService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/event")
@RequiredArgsConstructor
public class EventController {

    private final EventService eventService;

    // 진행 중인 이벤트 페이지로 이동
    @RequestMapping(value="/")
	public String ongoingEventList(@RequestParam Map<String, Object> map, Model model) {
		model.addAttribute("result0",eventService.selectOngoingEventList(map));
		model.addAttribute("search0",map);

		return "event/ongoingevent";  
	}
 // 종료된 이벤트 페이지로 이동
    @RequestMapping(value="/close")
	public String closeEventList(@RequestParam Map<String, Object> map, Model model) {
		model.addAttribute("result1",eventService.selectCloseEventList(map));
		model.addAttribute("search1",map);

		return "event/closeevent";  
	}

    // 이벤트 상세 페이지로 이동
    @RequestMapping(value = "detail/{eventIdx}", method = RequestMethod.GET)
    public String eventDetail(@PathVariable int eventIdx, Model model) {
        Event event = eventService.selectEventInfo(eventIdx);
        model.addAttribute("event", event);
        return "event/eventdetail";
    }


    // 이벤트 검색 결과 
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchEvent(@RequestParam String keyword, Model model) {
        List<Event> events = eventService.searchEventByTitle(keyword);
        model.addAttribute("events", events);
        return "event/eventmain";
    }
   
}
   