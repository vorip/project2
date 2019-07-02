<%@page import="bean.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="bean.NoticeDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	String info= request.getParameter("info");
	String[] infoArr = info.split(",");
	if(infoArr.length>11){
		int nonum = Integer.parseInt(infoArr[12]);
		dto.setNonum(nonum);
	}else{
		int nonum = Integer.parseInt(infoArr[10]);
		dto.setNonum(nonum);
	}
	infoArr[6] = dto.getComment();
	infoArr[7] = dto.getCommentName();
	infoArr[8] = dto.getCommentTime();
	String infoS = "";
	for(int i=0;i<infoArr.length;i++){
		if(i!=infoArr.length-1){
			infoS += infoArr[i]+",";
		}else{
			infoS += infoArr[i];
		}
	}
	NoticeDAO dao = new NoticeDAO();
	out.write(infoS);
	dao.addComment(dto);
%>
