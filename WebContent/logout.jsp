<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<%@page import="uts.wsd.*" %>
<?xml-stylesheet type="text/xsl" href="xsl/logout.xsl"?>
<%session.invalidate();%>
<jsp:forward page="/index.jsp"/>
<message></message>