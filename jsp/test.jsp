<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Base64.Decoder"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.*"%>
<%@page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String uploadPath=request.getRealPath("/");

	String path = uploadPath + "bbb" + File.separator + "savaDatb";

	File dir = new File(path);
	if(!dir.exists())
		dir.mkdirs();

	MultipartRequest req = null;
	try{
        req = new MultipartRequest(request, path,100* 1024*1024,"utf-8",new DefaultFileRenamePolicy());		
		
	}catch(Exception e ){
		e.printStackTrace();
	}
	String result = req.getParameter("user");
%>
{"result":"<%=result%>"}


