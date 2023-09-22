package com.moyeo.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.moyeo.dto.Pack;

@Component
public class PackageStatusUpdaterService {
	@Autowired
	private PackageService packageService;
	
	@Scheduled(cron = "0 * * * * ?") // 1분마다 실행
    public void updateEventStatus() {
        // 현재 날짜 가져오기 (시간 정보 무시)
        LocalDate currentDate = LocalDate.now();

        // 이벤트 목록 가져오기 (예: eventService.selectEventList())
        List<Pack> packList  = packageService.getPackage();

        // 이벤트 상태 업데이트 로직 구현
        for (Pack pack: packList) {
            LocalDate packStartDate = LocalDate.parse(pack.getPackStartDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            LocalDate packEndDate = LocalDate.parse(pack.getPackEndDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));

            if (currentDate.isBefore(packStartDate) || currentDate.isAfter(packEndDate)) {
                // 이벤트 시작 날짜보다 이전이거나 종료 날짜보다 이후인 경우
                pack.setPackStatus(1); // 이벤트 상태를 종료(1)로 업데이트
            } else {
                // 이벤트가 진행 중인 경우
                pack.setPackStatus(0); // 이벤트 상태를 진행 중(0)으로 업데이트
            }

            // 업데이트된 이벤트 저장 (예: eventService.updateEvent(event))
            packageService.updatePackStatus(pack);
        }
    }

}