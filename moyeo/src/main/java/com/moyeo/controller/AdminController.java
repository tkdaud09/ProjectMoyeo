package com.moyeo.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Nullable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moyeo.dto.Diy;
import com.moyeo.dto.DiyLove;
import com.moyeo.dto.Event;
import com.moyeo.dto.Notice;
import com.moyeo.dto.Pack;
import com.moyeo.dto.Qa;
import com.moyeo.dto.QaReply;
import com.moyeo.exception.UserinfoNotFoundException;
import com.moyeo.security.CustomUserDetails;
import com.moyeo.service.DiyLoveService;
import com.moyeo.service.DiyService;
import com.moyeo.service.EventService;
import com.moyeo.service.NoticeService;
import com.moyeo.service.PackageHeartService;
import com.moyeo.service.PackageService;
import com.moyeo.service.QaReplyService;
import com.moyeo.service.QaService;
import com.moyeo.service.UserinfoService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	private final WebApplicationContext context;
	private final UserinfoService userinfoservice;
	private final PackageService packageService;
	private final PackageHeartService packageHeartService;
	private final DiyService diyService;
	private final NoticeService noticeService;
	private final QaService qaService;
	private final QaReplyService qaReplyService;
	private final EventService eventService;
	private final DiyLoveService diyLoveService;
	
	@GetMapping(value = "/main")
	public String adminpage(Authentication authentication, Model model) {
	    CustomUserDetails userinfo = (CustomUserDetails) authentication.getPrincipal();
	    model.addAttribute("userinfo", userinfo);
	    // 사용자의 권한을 로그에 기록
	    Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
	    authorities.forEach(authority -> 
	        logger.info("관리자페이지 Accessed by {}, Authority: {}", userinfo.getUsername(), authority.getAuthority())
	    );
	    
	    return "admin/adminmain";
	}
	
	//회원 디테일 페이지
	@RequestMapping(value = "/userinfo-detail", method = RequestMethod.GET)
	public String getUserinfoDetail(@RequestParam String id, Model model) throws UserinfoNotFoundException {
		model.addAttribute("userinfo", userinfoservice.getUserinfo(id));
		return "admin/detail/userinfo-detail";
	}

	/*
   //패키지 디테일 페이지
   @RequestMapping(value = "/package-detail", method = RequestMethod.GET)
   public String adminPackageMainGET(@RequestParam(defaultValue = "1") int pageNum,
		   							 @RequestParam(required = false) String keyword, 
		   							 Model model) {
	   Map<String, Object> map=packageService.getPackageListUser(pageNum, keyword);
	   model.addAttribute("pager", map.get("pager")); 
	   model.addAttribute("packList", map.get("packList"));
	   return "admin/detail/package-detail";
   }
	 */

	/*
   // 패키지 상세 페이지 이동 - 패키지 상세 정보 select
   @RequestMapping(value = "/package-detail/{packIdx}", method = RequestMethod.GET) // Spring에서 사용자가 전송한 식별자 값을 변수로 인식하기 위해 템플릿
   // 변수{packIdx}작성
   public String adminPackageDetailGET(@PathVariable("packIdx") int packIdx, 
		   							   Model model,
		   							   HttpSession session) {

	   String userinfoId = (String) session.getAttribute("userinfoId");

	   model.addAttribute("pack", packageService.getPackageInfo(packIdx));

	   //추가한거
	   model.addAttribute("packHeartList", packageHeartService.getPackHeartIdxByPackIdx(packIdx));

	   //로그인 유저가 찜 했는지 확인
	   PackHeart packHeart = packageHeartService.getPackIdxWithId(packIdx, userinfoId);
	   boolean isHeartAdded = packHeart != null;
	   // 최신 리뷰 3개
	   List<Review> latestReviews = reviewService.getLatestReviews(3);
	   model.addAttribute("latestReviews", latestReviews);
	   model.addAttribute("isHeartAdded", isHeartAdded);
	   return "admin/mo_package_animal";
   }


	/* 패키지 */
	// 패키지 등록 페이지 이동
	@RequestMapping(value = "/packageForm", method = RequestMethod.GET)
	public String addPackageGET() {
		
		return "admin/mo_package_form";
	}

	// 패키지 등록
	@RequestMapping(value = "/addPackage", method = RequestMethod.POST)
	public String addPackagePOST(@ModelAttribute Pack pack,
			@RequestParam("packPreviewImgFile") MultipartFile packPreviewImgFile,
			@RequestParam("packSlideImg1File") MultipartFile packSlideImg1File,
			@RequestParam("packSlideImg2File") MultipartFile packSlideImg2File,
			@RequestParam("packSlideImg3File") MultipartFile packSlideImg3File,
			@RequestParam("packContentImg1File") MultipartFile packContentImg1File,
			@RequestParam("packContentImg2File") MultipartFile packContentImg2File,
			@RequestParam("packContentImg3File") MultipartFile packContentImg3File,
			@RequestParam("packCalendarImgFile") MultipartFile packCalendarImgFile,
			Model model) throws IllegalStateException, IOException {

		if(packPreviewImgFile.isEmpty() || packSlideImg1File.isEmpty() || packSlideImg2File.isEmpty() 
				|| packSlideImg3File.isEmpty() || packContentImg1File.isEmpty() || packContentImg2File.isEmpty()
				|| packContentImg2File.isEmpty() || packContentImg3File.isEmpty() || packCalendarImgFile.isEmpty()) {
			//이미지 파일이 업로드되지 않은 경우 처리
			model.addAttribute("message","파일이 업로드되지 않았습니다.");
			return "redirect:/";
		}

		//전달파일을 저장하기 위한 서버 디렉토리의 시스템 경로 반환
		String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");

		//서버 디렉토리에 업로드 처리되며 저장된 파일의 이름을 반환하여 Command 객체의 필드값 변경
		String uploadPreview = UUID.randomUUID().toString()+"-"+packPreviewImgFile.getOriginalFilename();
		pack.setPackPreviewImg(uploadPreview);

		String uploadSlide1 = UUID.randomUUID().toString()+"-"+packSlideImg1File.getOriginalFilename();
		pack.setPackSlideImg1(uploadSlide1);

		String uploadSlide2 = UUID.randomUUID().toString()+"-"+packSlideImg2File.getOriginalFilename();
		pack.setPackSlideImg2(uploadSlide2);

		String uploadSlide3 = UUID.randomUUID().toString()+"-"+packSlideImg3File.getOriginalFilename();
		pack.setPackSlideImg3(uploadSlide3);

		String uploadContent1 = UUID.randomUUID().toString()+"-"+packContentImg1File.getOriginalFilename();
		pack.setPackContentImg1(uploadContent1);

		String uploadContent2 = UUID.randomUUID().toString()+"-"+packContentImg2File.getOriginalFilename();
		pack.setPackContentImg2(uploadContent2);

		String uploadContent3 = UUID.randomUUID().toString()+"-"+packContentImg3File.getOriginalFilename();
		pack.setPackContentImg3(uploadContent3);

		String uploadCalendar = UUID.randomUUID().toString()+"-"+packCalendarImgFile.getOriginalFilename();
		pack.setPackCalendarImg(uploadCalendar); 

		//파일 업로드 처리 - 복붙해서 넣어주는게 아니라 서버에 넣어줌
		packPreviewImgFile.transferTo(new File(uploadDirectory,uploadPreview));
		packSlideImg1File.transferTo(new File(uploadDirectory,uploadSlide1));
		packSlideImg2File.transferTo(new File(uploadDirectory,uploadSlide2));
		packSlideImg3File.transferTo(new File(uploadDirectory,uploadSlide3));
		packContentImg1File.transferTo(new File(uploadDirectory,uploadContent1));
		packContentImg2File.transferTo(new File(uploadDirectory,uploadContent2));
		packContentImg3File.transferTo(new File(uploadDirectory,uploadContent3));
		packCalendarImgFile.transferTo(new File(uploadDirectory,uploadCalendar));

		//테이블에 행 삽입
		packageService.addPackage(pack);

		return "redirect:/package/";
	}

	/* 패키지 수정 */
	@GetMapping(value = "/packageModify/{packIdx}")
	public String packageModifyGET(@PathVariable("packIdx") int packIdx, Authentication authentication, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		model.addAttribute("userDetails", userDetails);
		Pack pack = packageService.getPackageInfo(packIdx);
		model.addAttribute("pack", pack);

		return "admin/package_modify";
	}

	@PostMapping(value ="/packageModify/{packIdx}")
	public String packageModifyPOST(@PathVariable("packIdx") int packIdx,
			@ModelAttribute Pack pack,
			@RequestParam("packPreviewImgFile") MultipartFile packPreviewImgFile,
			@RequestParam("packSlideImg1File") MultipartFile packSlideImg1File,
			@RequestParam("packSlideImg2File") MultipartFile packSlideImg2File,
			@RequestParam("packSlideImg3File") MultipartFile packSlideImg3File,
			@RequestParam("packContentImg1File") MultipartFile packContentImg1File,
			@RequestParam("packContentImg2File") MultipartFile packContentImg2File,
			@RequestParam("packContentImg3File") MultipartFile packContentImg3File,
			@RequestParam("packCalendarImgFile") MultipartFile packCalendarImgFile,
			Model model) throws IllegalStateException, IOException {

		String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");

		//기존 이미지 경로 가져오기
		Pack originalPack = packageService.getPackageInfo(packIdx);
		String originalPreviewImg = originalPack.getPackPreviewImg();
		String originalSlideImg1 = originalPack.getPackSlideImg1();
		String originalSlideImg2 = originalPack.getPackSlideImg2();
		String originalSlideImg3 = originalPack.getPackSlideImg3();
		String originalContentImg1 = originalPack.getPackContentImg1();
		String originalContentImg2 = originalPack.getPackContentImg2();
		String originalContentImg3 = originalPack.getPackContentImg3();
		String originalCalendarImg = originalPack.getPackCalendarImg();

		if(!packPreviewImgFile.isEmpty()) {
			pack.setPackPreviewImg(UUID.randomUUID().toString() + "-" + packPreviewImgFile.getOriginalFilename());
			packPreviewImgFile.transferTo(new File(uploadDirectory, pack.getPackPreviewImg()));
		} else {
			pack.setPackPreviewImg(originalPreviewImg);//기존 경로 유지
		}

		if(!packSlideImg1File.isEmpty()) {
			pack.setPackSlideImg1(UUID.randomUUID().toString() + "-" + packSlideImg1File.getOriginalFilename());
			packSlideImg1File.transferTo(new File(uploadDirectory, pack.getPackSlideImg1()));
		} else {
			pack.setPackSlideImg1(originalSlideImg1);
		}

		if(!packSlideImg2File.isEmpty()) {
			pack.setPackSlideImg2(UUID.randomUUID().toString() + "-" + packSlideImg2File.getOriginalFilename());
			packSlideImg2File.transferTo(new File(uploadDirectory, pack.getPackSlideImg2()));
		} else {
			pack.setPackSlideImg2(originalSlideImg2);
		}

		if(!packSlideImg3File.isEmpty()) {
			pack.setPackSlideImg3(UUID.randomUUID().toString() + "-" + packSlideImg3File.getOriginalFilename());
			packSlideImg3File.transferTo(new File(uploadDirectory, pack.getPackSlideImg3()));
		} else {
			pack.setPackSlideImg3(originalSlideImg3);
		}

		if(!packContentImg1File.isEmpty()) {
			pack.setPackContentImg1(UUID.randomUUID().toString() + "-" + packContentImg1File.getOriginalFilename());
			packContentImg1File.transferTo(new File(uploadDirectory, pack.getPackContentImg1()));
		} else {
			pack.setPackContentImg1(originalContentImg1);
		}

		if(!packContentImg2File.isEmpty()) {
			pack.setPackContentImg2(UUID.randomUUID().toString() + "-" + packContentImg2File.getOriginalFilename());
			packContentImg2File.transferTo(new File(uploadDirectory, pack.getPackContentImg2()));
		} else {
			pack.setPackContentImg2(originalContentImg2);
		}

		if(!packContentImg3File.isEmpty()) {
			pack.setPackContentImg3(UUID.randomUUID().toString() + "-" + packContentImg3File.getOriginalFilename());
			packContentImg3File.transferTo(new File(uploadDirectory, pack.getPackContentImg3()));
		} else {
			pack.setPackContentImg3(originalContentImg3);
		}

		if(!packCalendarImgFile.isEmpty()) {
			pack.setPackCalendarImg(UUID.randomUUID().toString() + "-" + packCalendarImgFile.getOriginalFilename());
			packCalendarImgFile.transferTo(new File(uploadDirectory, pack.getPackCalendarImg()));
		} else {
			pack.setPackCalendarImg(originalCalendarImg);
		}

		//업데이트
		packageService.modifyPackage(pack);

		return "redirect:/package/detail/{packIdx}";
	}

	/* 패키지 삭제 */
	@RequestMapping(value = "/deletel/{packIdx}", method = RequestMethod.GET)
	public String remove(@PathVariable int packIdx) {
		packageService.deletePackage(packIdx);
		packageHeartService.removeAllByPackIdx(packIdx);
		return "admin/mo_package";
	}

	/* 패키지 상태 변경 */
	@RequestMapping(value = "/state/{packIdx}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changePackageStatus(@PathVariable("packIdx") int packIdx, @RequestParam("state") int state) {
		Map<String, Object> response = new HashMap<>(); // 응답을 위한 맵 객체 생성

		try {
			// 서버에서 현재 패키지 상태를 가져옴
			int currentStatus = packageService.getPackageStatus(packIdx); // 패키지 상태 조회
			System.out.println("currentStatus = " + currentStatus); // 현재 패키지 상태를 출력

			// 현재 상태와 요청된 상태가 다를 경우에만 업데이트 수행
			if (currentStatus != state) { // 현재 상태와 요청된 상태 비교
				System.out.println("state = " + state); // 요청된 새로운 패키지 상태를 출력

				Pack pack = new Pack();
				pack.setPackIdx(packIdx); // 패키지 인덱스 설정
				pack.setPackStatus(state); // 패키지 상태 설정
				packageService.modifyPackageStatus(pack); // 패키지 상태 업데이트 서비스 호출
			}

			response.put("success", true); // 성공 여부를 응답 맵에 추가
			response.put("message", "성공"); // 성공 메시지를 응답 맵에 추가
		} catch (Exception e) { // 예외 처리
			response.put("success", false); // 실패 여부를 응답 맵에 추가
			response.put("message", "실패"); // 실패 메시지를 응답 맵에 추가
		}

		return response; // 응답 맵 반환
	}

	// diy 자세히보기
		@GetMapping("/diy_detail/{diyIdx}")
		public String diyDetail(@PathVariable("diyIdx") Integer diyIdx, Model model
				, Authentication authentication) {
			
			CustomUserDetails userinfo = null;
			// 비로그인시 
			if (authentication == null) {
				Diy diy = diyService.getselectDiy(diyIdx);
				model.addAttribute("diyDetail", diy);
			} else {
				// CustomUserDetails userinfo = (CustomUserDetails) authentication.getPrincipal();
				userinfo = (CustomUserDetails) authentication.getPrincipal();
				
				DiyLove diyLove = new DiyLove();
				diyLove.setDiyIdx(diyIdx);
				diyLove.setUserinfoId(userinfo.getId());
				System.out.println("세션으로 전달받은 로그인 유저 정보 : " + userinfo);
			
			
			if(diyIdx == null) {
				return "redirect:/error"; 
			}
			
			Diy diy = diyService.getselectDiy(diyIdx);
			if (diy == null) {
				return "redirect:/error"; 
			}
			
			// 로그인한 유저인 경우 isLoggedin 변수를 true로 설정
			boolean isLoggedin = userinfo != null;
			
			// 로그인 한 유저가 좋아요 눌렀는지 확인
			DiyLove diyLoveStatus = diyLoveService.getDiyLoveStatusByIdByDiyIdx(diyIdx, userinfo != null ? userinfo.getId() : null);
			boolean isLoveAdded = diyLoveStatus != null;
			
			
			model.addAttribute("diyDetail", diy);
			model.addAttribute("diyLoveStatus", diyLoveStatus);
			System.out.println("diyLoveStatus : " + diyLoveStatus);
			model.addAttribute("isLoveAdded", isLoveAdded);
			model.addAttribute("isLoggedin", isLoggedin);
			model.addAttribute("userinfo", userinfo);
				
			}
			
			return "diy/diy_detail";
		}

	//공지사항 등록 - GET (기존에 "/create" 대신 "/write"로 바꿈)
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String noticeWriteForm(Authentication authentication, Model model) {
		CustomUserDetails userinfo = (CustomUserDetails) authentication.getPrincipal();
		model.addAttribute("userinfo", userinfo);
		return "admin/write";
	}

	//공지사항 등록 - POST
	@RequestMapping(value="/addNotice", method = RequestMethod.POST)
	public String addNoticePost(@ModelAttribute Notice notice, 
			@RequestParam("noticeImgFile") MultipartFile noticeImgFile,
			Model model) throws IllegalStateException, IOException, UserinfoNotFoundException {
		
		/*
       if(noticeImgFile.isEmpty()) {
          //이미지 파일이 업로드되지 않은 경우 처리
          model.addAttribute("message","파일이 업로드되지 않았습니다.");
          return "redirect:/notice/";
       }
		 */

		//전달파일을 저장하기 위한 서버 디렉토리의 시스템 경로 반환
		String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");

		//서버 디렉토리에 업로드 처리되며 저장된 파일의 이름을 반환하여 Command 객체의 필드값 변경
		String uploadNotice = UUID.randomUUID().toString()+"-"+noticeImgFile.getOriginalFilename();
		notice.setNoticeImg(uploadNotice);

		//파일 업로드 처리 - 복붙해서 넣어주는게 아니라 서버에 넣어줌
		noticeImgFile.transferTo(new File(uploadDirectory,uploadNotice));

		noticeService.insertNotice(notice);

		return "redirect:/notice/";
	}

	//공지사항 수정 - GET 방식
	@RequestMapping(value="/modify/{noticeIdx}", method = RequestMethod.GET)
	public String updateNoticeGET(@PathVariable("noticeIdx") int noticeIdx, Model model) {
		model.addAttribute("notice", noticeService.selectNoticeInfo(noticeIdx));

		return "admin/modify";
	}

	//공지사항 수정 - POST 방식
	//수정될 내용의 데이터를 가져오기 위해 Notice 클래스를 파라미터로 부여, 수정기능 실행 후 리다이렉트 방식으로 리스트 페이지 이동시 데이터 전송하가 위해 RedirectAttributes객체를 피라미터로 부여
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String updateNoticePOST(@ModelAttribute Notice notice, 
			@RequestParam("noticeImgFile") MultipartFile noticeImgFile,
			Model model, RedirectAttributes rttr) throws IllegalStateException, IOException {

		// 이미지 파일이 업로드되었는지 확인
		if (!noticeImgFile.isEmpty()) {
			// 파일이 업로드된 경우
			String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");
			String uploadNotice = UUID.randomUUID().toString() + "-" + noticeImgFile.getOriginalFilename();
			notice.setNoticeImg(uploadNotice);
			noticeImgFile.transferTo(new File(uploadDirectory, uploadNotice));
		} else {
			// 파일이 업로드되지 않은 경우, 기존 이미지 경로를 유지
			notice.setNoticeImg(noticeService.selectNoticeInfo(notice.getNoticeIdx()).getNoticeImg());
		}

		noticeService.updateNotice(notice);

		return "redirect:/notice/"; // 공지사항 상세 페이지로 리다이렉트 이동
	}

	// 공지사항 삭제 
	@RequestMapping(value = "/delete/{noticeIdx}", method = RequestMethod.GET)
	public String deleteNotice(@PathVariable int noticeIdx) {
		noticeService.deleteNotice(noticeIdx);
		return "redirect:/notice/";
	}

	// 1:1 문의 상세 페이지로 이동
	@GetMapping(value = "/qaDetail/{qaIdx}")
	public String qaDetailGET(@PathVariable("qaIdx") int qaIdx, Model model) {
		Qa qa = qaService.getQaInfo(qaIdx);
		model.addAttribute("qa", qa);

		List<QaReply> reply=null;
		reply=qaReplyService.getQaReplyList(qaIdx);
		model.addAttribute("reply", reply);

		return "admin/qa_view";
	}


	// 이벤트 리스트
	@GetMapping("/eventlist")
	public String eventList(Model model) {
		List<Event> eventList = eventService.selectEventList();
		model.addAttribute("eventList", eventList);
		return "admin/eventlist";
	}

	// 이벤트 등록 페이지로 이동
	@RequestMapping(value = "/eventForm", method = RequestMethod.GET)
	public String addEventForm(Authentication authentication, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		model.addAttribute("userDetails", userDetails);
		return "admin/eventregist";
	}

	// 이벤트 등록 처리
	@RequestMapping(value = "/addEvent", method = RequestMethod.POST)
	public String addEvent(@ModelAttribute Event event,
	        @RequestParam("eventPreviewImgFile") MultipartFile eventPreviewImgFile,
	        @RequestParam("eventContentImgFile") MultipartFile eventContentImgFile,
	        @RequestParam("eventContentImgFile2") MultipartFile eventContentImgFile2,
	        @RequestParam("eventContentImgFile3") MultipartFile eventContentImgFile3,
	        Model model) throws IllegalStateException, IOException {

	    if (eventPreviewImgFile.isEmpty() || eventContentImgFile.isEmpty()) {
	        // 이미지 파일이 업로드되지 않은 경우 처리
	        model.addAttribute("message", "파일이 업로드되지 않았습니다.");
	        return "redirect:/event/";
	    }

	    // 전달된 파일을 저장하기 위한 서버 디렉토리의 시스템 경로 반환
	    String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");

	    // 서버 디렉토리에 업로드 처리되며 저장된 파일의 이름을 반환하여 Command 객체의 필드값 변경
	    String uploadPreview = UUID.randomUUID().toString() + "-" + eventPreviewImgFile.getOriginalFilename();
	    event.setEventPreviewimg(uploadPreview);

	    String uploadContent = UUID.randomUUID().toString() + "-" + eventContentImgFile.getOriginalFilename();
	    event.setEventContentimg(uploadContent);
	    
	    String uploadContent2 = UUID.randomUUID().toString() + "-" + eventContentImgFile2.getOriginalFilename();
	    event.setEventContentimg2(uploadContent2);
	    
	    String uploadContent3 = UUID.randomUUID().toString() + "-" + eventContentImgFile3.getOriginalFilename();
	    event.setEventContentimg3(uploadContent3);
	    
	    

	    // 파일 업로드 처리
	    eventPreviewImgFile.transferTo(new File(uploadDirectory, uploadPreview));
	    eventContentImgFile.transferTo(new File(uploadDirectory, uploadContent));
	    eventContentImgFile2.transferTo(new File(uploadDirectory, uploadContent2));
	    eventContentImgFile3.transferTo(new File(uploadDirectory, uploadContent3));



	    // 이벤트 등록
	    eventService.insertEvent(event);

	    return "redirect:/event/";
	}
	
	// 이벤트 수정 페이지로 이동
	@RequestMapping(value = "/edit/{eventIdx}", method = RequestMethod.GET)
	public String editEventForm(@PathVariable int eventIdx, Authentication authentication, Model model) {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		model.addAttribute("userDetails", userDetails);
		Event event = eventService.selectEventInfo(eventIdx);
		model.addAttribute("event", event);
		return "admin/eventedit";
	}
	
	// 이벤트 수정 처리
	@RequestMapping(value = "/edit/{eventIdx}", method = RequestMethod.POST)
	public String editEvent(@PathVariable int eventIdx, @ModelAttribute Event event,
			@RequestParam("eventPreviewImgFile") MultipartFile eventPreviewImgFile,
			@RequestParam("eventContentImgFile") MultipartFile eventContentImgFile,
			@RequestParam("eventContentImgFile2") MultipartFile eventContentImgFile2,
			@RequestParam("eventContentImgFile3") MultipartFile eventContentImgFile3)throws IllegalStateException, IOException {

		if (!eventPreviewImgFile.isEmpty()) {
			// 새로운 미리보기 이미지 파일이 업로드된 경우 처리
			String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");
			String uploadPreview = UUID.randomUUID().toString() + "-" + eventPreviewImgFile.getOriginalFilename();
			event.setEventPreviewimg(uploadPreview);
			eventPreviewImgFile.transferTo(new File(uploadDirectory, uploadPreview));
		}

		if (!eventContentImgFile.isEmpty()) {
			// 새로운 이벤트 설명 이미지 파일이 업로드된 경우 처리
			String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");
			String uploadContent = UUID.randomUUID().toString() + "-" + eventContentImgFile.getOriginalFilename();
			event.setEventContentimg(uploadContent);
			eventContentImgFile.transferTo(new File(uploadDirectory, uploadContent));
		}
		
		if (!eventContentImgFile2.isEmpty()) {
			// 새로운 이벤트 설명 이미지 파일이 업로드된 경우 처리
			String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");
			String uploadContent2 = UUID.randomUUID().toString() + "-" + eventContentImgFile2.getOriginalFilename();
			event.setEventContentimg2(uploadContent2);
			eventContentImgFile2.transferTo(new File(uploadDirectory, uploadContent2));
		}
		
		if (!eventContentImgFile3.isEmpty()) {
			// 새로운 이벤트 설명 이미지 파일이 업로드된 경우 처리
			String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");
			String uploadContent3 = UUID.randomUUID().toString() + "-" + eventContentImgFile3.getOriginalFilename();
			event.setEventContentimg3(uploadContent3);
			eventContentImgFile3.transferTo(new File(uploadDirectory, uploadContent3));
		}

		event.setEventIdx(eventIdx);
		eventService.updateEvent(event);

		return "redirect:/event/";
	}
}