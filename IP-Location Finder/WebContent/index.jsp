<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Date"%>
<%@page import="Modal.Get_Location_From_IP"%>
<%@page import="Modal.Location_Use_Bean"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Find Geo-Location from IP Address</title>
	</head>

	<body>
		<%
			String ip = request.getHeader("x-forwarded-for");      
		    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
		    	ip = request.getHeader("Proxy-Client-IP");      
		   	}      
		   	if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
		    	ip = request.getHeader("WL-Proxy-Client-IP");      
			}      
		   	if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
	    		ip = request.getRemoteAddr();      
			} 
			  
			Get_Location_From_IP obj_Get_Location_From_IP=new Get_Location_From_IP();  
			   
			Location_Use_Bean obj_Location_Use_Bean=obj_Get_Location_From_IP.get_ip_Details(ip);
		%>

		Location details of User<br>

		1--IP Address--<%=ip %><br>
		2--Country Code--<%=obj_Location_Use_Bean.getCountry_code() %><br>
		3--Country--<%=obj_Location_Use_Bean.getCountry() %><br>
		4--State--<%=obj_Location_Use_Bean.getState() %><br>
		5--City--<%=obj_Location_Use_Bean.getCity() %><br>
		6--ZIP--<%=obj_Location_Use_Bean.getZip() %><br>
		7--Lat--<%=obj_Location_Use_Bean.getLat() %><br>
		8--Lon--<%=obj_Location_Use_Bean.getLon() %><br>
		9--Offset--<%=obj_Location_Use_Bean.getUtc_offset() %><br>
	</body>
</html>