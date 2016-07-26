package com.trycatch.owner.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.trycatch.owner.domain.CommunityDTO;
import com.trycatch.owner.domain.MemberDTO;
import com.trycatch.owner.service.CommunityService;



@Controller
public class CommunityController {

	@Inject
	private CommunityService service;
	/**
	 * @author ¹Ú¿Ï¼®
	 * 
	 * @category 
	 * @param 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value="/community_list",method=RequestMethod.GET)
	public String CommunityList(Model model,HttpServletRequest req){
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member_dto");
		model.addAttribute("community_list",service.getCommunityList());
		model.addAttribute("mycommunity_list",service.myCommunityList(mdto.getMember_name()));
		return "/community/Community_Owner";
	}
	
	@RequestMapping(value="/community_insert",method=RequestMethod.GET)
	public String CommunityInsert(){
		return "/community/Community_Insert";
	}
	
	@RequestMapping(value="/community_insert",method=RequestMethod.POST)
	public String CommunityInsertPOST(HttpServletRequest req) throws UnsupportedEncodingException{

		System.out.println(req.getParameter("community_title"));
		CommunityDTO dto = new CommunityDTO();
		dto.setCommunity_content(req.getParameter("community_content"));
		dto.setCommunity_title(req.getParameter("community_title"));
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member_dto");
		dto.setCommunity_writer(mdto.getMember_name());
		service.insertCommunity(dto);
		return "redirect:/community_list";
	}
	
	@RequestMapping(value="/community_read",method=RequestMethod.GET)
	public String CommunityRead(int community_no,Model model,HttpServletRequest req){
		model.addAttribute("community_list",service.getCommunityList());
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member_dto");
		model.addAttribute("mycommunity_list",service.myCommunityList(mdto.getMember_name()));
		model.addAttribute(service.readCommunity(community_no));
		return "/community/Community_Read";
	}
	
	@RequestMapping("/community_del")
	public String CommunityDel(int community_no){
		System.out.println(community_no);
		service.deleteCommunity(community_no);
		return "redirect:/community_list";
	}
	
	@RequestMapping("/community_reply")
	public String CommunityReply(int community_no){
		
		return "";
	}
	
	@RequestMapping("/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         String sFileInfo = "";
	         String filename = request.getHeader("file-name");
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         filename_ext = filename_ext.toLowerCase();
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         String filePath = dftFilePath +"resources" + File.separator + "photo_upload" + File.separator;
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;

	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();

	         sFileInfo += "&bNewLine=true";
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/owner/resources/photo_upload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	   
	}
	
}
