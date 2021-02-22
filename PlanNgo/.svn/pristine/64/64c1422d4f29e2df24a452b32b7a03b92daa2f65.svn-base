package org.planngo.controller;

import javax.inject.Inject;

import org.planngo.domain.PackageSearchCriteria;
import org.planngo.domain.PackageVO;
import org.planngo.domain.PageMaker;
import org.planngo.service.PackageBoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/pboard/*")
public class PackageController {

	private static final Logger logger = LoggerFactory.getLogger(PackageController.class);

	@Inject
	private PackageBoardService pboardservice;

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listpage(@ModelAttribute("cri") PackageSearchCriteria cri, Model model) {
		PackageVO p = new PackageVO();

		logger.info(cri.toString());
		/*
		 * List <PackageVO> packageVO = pboardservice.listSearchCriteria(cri);
		 * Map<String, String> file = new HashMap<String,String >();
		 * 
		 * 
		 * System.out.println("파일타입 : " + packageVO.get(0));
		 */

		/*
		 * for (int i =0; i<packageVO.size();i++) { jackson jsonArray =
		 * packageVO.get(i).getFiles();
		 * 
		 * }
		 */
		// Cri, agencyType, sp, sd,ed �� ���� �´� ������ ������ ������
		model.addAttribute("list", pboardservice.listSearchCriteria(cri));

		PageMaker pageMaker = PageMaker.builder().cri(cri).build();
		pageMaker.setTotalCount(pboardservice.listSearchCount(cri));

		model.addAttribute("PageMaker", pageMaker);

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGet() {
		logger.info("게시물 등록...");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(PackageVO packageVO, RedirectAttributes rttr) throws Exception {

		logger.info("regist post ...........");
		logger.info(packageVO.toString());

		pboardservice.regist(packageVO);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/pboard/listAll";
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read (@RequestParam("pno") int pno , @ModelAttribute("cri") PackageSearchCriteria cri, Model model){
		
		
		model.addAttribute("PackageVO",pboardservice.read(pno));
		
	}

	@RequestMapping(value = "/deletePackage", method= RequestMethod.POST)
	public String deletePackage(@RequestParam("pno") int pno, RedirectAttributes rttr) throws Exception {
		
		pboardservice.deletePackage(pno);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/pboard/listAll";
	}
	


}
