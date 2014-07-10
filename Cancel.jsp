<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- 
Example of using jsp:setProperty with an explicit value
supplied to the "value" attribute. See SaleEntry2.jsp
and SaleEntry3.jsp for alternatives. 

Taken from Core Servlets and JavaServer Pages 2nd Edition
from Prentice Hall and Sun Microsystems Press,
http://www.coreservlets.com/.
(C) 2003 Marty Hall; may be freely used or adapted.
-->

<HTML>
<HEAD>
<TITLE>Using jsp:setProperty</TITLE>
<LINK REL=STYLESHEET
      HREF="JSP-Styles.css"
      TYPE="text/css">
</HEAD>
<BODY>
<CENTER>
<TABLE BORDER=5>
  <TR><TH CLASS="TITLE">
      Cancel Confirmation Page</TABLE>
<jsp:useBean id="database" class="mybean.Database" scope="session"/>
<BR>
<%
	String confNum = request.getParameter("confNum");
	int success = database.removeOrder(confNum);
	if(success==0){
%>
<H1><I>Error with Cancellation. Check your spelling and try again  </I><H1>
<%
	}else if(success==1){
%>
<H1><I>You successfully cancelled your order  </I><H1>
<%
	}
%>
</CENTER></BODY></HTML>