package org.planngo.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.planngo.domain.UsrVO;
import org.planngo.dto.LoginDTO;
import org.planngo.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Inject
	private UserService userService;

	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {

	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(UsrVO usrVO, LoginDTO dto, HttpSession session, Model model) throws Exception {

		UsrVO vo = userService.login(dto);
		
		System.out.println("vo확인 : " + vo);
	
		 if (vo == null) {
			 
			 model.addAttribute("aaa", "loginFail"); 
			 
			 return "/user/loginform";
		 	 }
		
		model.addAttribute("UsrVO", vo);

		if (dto.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			userService.keepLogin(vo.getUSRID(), session.getId(), sessionLimit);
		}
		return "/notice/noticeboard";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {
			UsrVO vo = (UsrVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				userService.keepLogin(vo.getUSRID(), session.getId(), new Date());
			}
		}
		return "user/logout";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void registGET() {

		logger.info("regist get ...........");
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String registPOST(UsrVO UsrVO) throws Exception {

		logger.info("regist post ...........");
		logger.info(UsrVO.toString());

		int result = userService.idChk(UsrVO.getUSRID());
		try {
			if (result == 1) { // 이미 아이디 있으면 count가 1
				logger.info("중복");
				return "/user/join"; // 회원가입으로 ㄱ
			} else if (result == 0) { // 아이디 없으면 0
				logger.info("중복아님");
				userService.usrRegister(UsrVO); // 아이디 등록해줌
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/user/loginform"; // 로그인 페이지로 바꾸기

	}

	// 아이디 중복 체크
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	@ResponseBody
	public int idChk(UsrVO UsrVO) throws Exception {
		int result = userService.idChk(UsrVO.getUSRID());
		logger.info("아이디 컨트롤러 테스트 : " + result);
		return result;
	}

	// 회원 탈퇴 get
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void memberDelete() {
		logger.info("delete......get..........");
	}

	// 회원 탈퇴 post
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String memberDelete(UsrVO UsrVO, HttpSession session, RedirectAttributes rttr) throws Exception {

		UsrVO member = (UsrVO) session.getAttribute("login");
		String id = member.getUSRID();
		logger.info("유저아이디 : " + id);
		logger.info("UsrVO...." + UsrVO);
		logger.info("member...." + member);
		// 세션에있는 비밀번호
		String sessionPass = member.getUSRPASSWORD();
		logger.info("sessionPass...." + sessionPass);
		// vo로 들어오는 비밀번호
		String voPass = UsrVO.getUSRPASSWORD();
		logger.info("voPass...." + voPass);

		if (!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/user/delete";
		}

		userService.memberDelete(UsrVO);
		session.invalidate();
		return "redirect:/";
	}

	// 비밀번호 변경
	@RequestMapping(value = "/changePwd", method = RequestMethod.GET)
	public String changePwd() throws Exception {
		logger.info("change... get...");

		return "user/changePwd";
	}

	@RequestMapping(value = "/changePwd", method = RequestMethod.POST)
	public String registerUpdate(UsrVO usrVO, HttpSession session) throws Exception {

		logger.info("change.....post.........");
		UsrVO usr = (UsrVO) session.getAttribute("login");
		String id = usr.getUSRPASSWORD();
		logger.info("유저의 현재 비번.................." + id);
		logger.info("@@@@@@@@@@@@UsrVO" + usrVO.toString());
		userService.memberUpdate(usrVO);

		return "user/successChangePwd";
	}

	@RequestMapping(value = "/sendEmail", method = RequestMethod.GET)
	public void sendEmailGET(UsrVO usrVO, String div) throws Exception {
		
	}

	/* 비밀번호 찾기 */
	@RequestMapping(value = "/searchPwd", method = RequestMethod.GET)
	public void findPwGET() throws Exception {
	}

	@RequestMapping(value = "/searchPwd", method = RequestMethod.POST)
	public String findPwPOST(@ModelAttribute UsrVO usrVO,  HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		//PrintWriter out = response.getWriter();

		int ic = userService.idChk(usrVO.getUSRID());
		
		logger.info("입력된 아이디가 db에 있는지......." + ic);

		if (ic == 1) {
				UsrVO ec = userService.readUser(usrVO.getUSRID());
				
				logger.info("디비에 있는 아이디 정보 ......" + ec);
				logger.info("디비에 있는 이메일........." + ec.getUSREMAIL());

			
				if (usrVO.getUSREMAIL().equals(ec.getUSREMAIL())) { // 맞는 이메일인지

					// 임시 비밀번호 생성
					String pw = "";
					for (int i = 0; i < 12; i++) {
						pw += (char) ((Math.random() * 26) + 97);
					}
					System.out.println("pw=" + pw);

					usrVO.setUSRPASSWORD(pw);

					// 비밀번호 변경
					userService.memberUpdate(usrVO);

					// 비밀번호 변경 메일 발송
					userService.sendEmail(usrVO, "findpw");

					rttr.addFlashAttribute("msg", "SUCCESS");

				} else if (!usrVO.getUSREMAIL().equals(ec.getUSREMAIL())) { // 이메일이 다르면
					rttr.addFlashAttribute("message", "false");
				}
			}else {
				rttr.addFlashAttribute("idChk", "idcheck");
			}
		
		return "redirect:/user/searchPwd";
	}

	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypageGET(UsrVO usrVO, Model mode, HttpSession session) throws Exception {
		
		UsrVO usrinfo = (UsrVO) session.getAttribute("login");
		logger.info("유저 정보 " + usrinfo);
		
	}

}
