<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="co.huby.prj.alarm.service.AlarmVo" %>
<%@ page import="java.util.*"%>

<%
	String id = (String)session.getAttribute("personalVo");
%>

<%
	
	AlarmVo vo = new AlarmVo();
	ArrayList<AlarmVo> list = new ArrayList<AlarmVo>();
	String view = null;
	list = .personalarm();
%>

<% for 