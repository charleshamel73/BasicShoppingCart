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
      TV Page</TABLE>
<jsp:useBean id="item1" class="mybean.Catalog" />
<jsp:useBean id="item2" class="mybean.Catalog" />
<jsp:useBean id="item3" class="mybean.Catalog" />
<jsp:useBean id="item4" class="mybean.Catalog" />
<jsp:useBean id="item5" class="mybean.Catalog" />
<jsp:useBean id="item6" class="mybean.Catalog" />

<jsp:setProperty name="item1"  property="itemID"  value='phone1' />
<jsp:setProperty name="item2"  property="itemID"  value='phone2' />
<jsp:setProperty name="item3"  property="itemID"  value='phone3' />
<jsp:setProperty name="item4"  property="itemID"  value='phone4' />
<jsp:setProperty name="item5"  property="itemID"  value='phone5' />
<jsp:setProperty name="item6"  property="itemID"  value='phone6' />
<BR>
  <FORM ACTION="OrderPage.jsp" METHOD= "POST">
    <INPUT TYPE="HIDDEN" NAME="itemID" VALUE= <jsp:getProperty name="item1" property="itemID" />
    <H2> 
		<jsp:getProperty name="item1" property="name" /> 
		($<jsp:getProperty name="item1" property="itemCost" />) 
		<INPUT TYPE="SUBMIT" VALUE="Add to Shopping Cart">
	</H2>
  </FORM>
  <FORM ACTION="OrderPage.jsp" METHOD= "POST">
    <INPUT TYPE="HIDDEN" NAME="itemID" VALUE= <jsp:getProperty name="item2" property="itemID" />
    <H2> 
		<jsp:getProperty name="item2" property="name" /> 
		($<jsp:getProperty name="item2" property="itemCost" />) 
		<INPUT TYPE="SUBMIT" VALUE="Add to Shopping Cart">
	</H2>
  </FORM>
  <FORM ACTION="OrderPage.jsp" METHOD= "POST">
    <INPUT TYPE="HIDDEN" NAME="itemID" VALUE= <jsp:getProperty name="item3" property="itemID" />
    <H2> 
		<jsp:getProperty name="item3" property="name" /> 
		($<jsp:getProperty name="item3" property="itemCost" />) 
		<INPUT TYPE="SUBMIT" VALUE="Add to Shopping Cart">
	</H2>
  </FORM>
  <FORM ACTION="OrderPage.jsp" METHOD= "POST">
    <INPUT TYPE="HIDDEN" NAME="itemID" VALUE= <jsp:getProperty name="item4" property="itemID" />
    <H2> 
		<jsp:getProperty name="item4" property="name" /> 
		($<jsp:getProperty name="item4" property="itemCost" />) 
		<INPUT TYPE="SUBMIT" VALUE="Add to Shopping Cart">
	</H2>
  </FORM>
  <FORM ACTION="OrderPage.jsp" METHOD= "POST">
    <INPUT TYPE="HIDDEN" NAME="itemID" VALUE= <jsp:getProperty name="item5" property="itemID" />
    <H2> 
		<jsp:getProperty name="item5" property="name" /> 
		($<jsp:getProperty name="item5" property="itemCost" />) 
		<INPUT TYPE="SUBMIT" VALUE="Add to Shopping Cart">
	</H2>
  </FORM>
  <FORM ACTION="OrderPage.jsp" METHOD= "POST">
    <INPUT TYPE="HIDDEN" NAME="itemID" VALUE= <jsp:getProperty name="item6" property="itemID" />
    <H2> 
		<jsp:getProperty name="item6" property="name" /> 
		($<jsp:getProperty name="item6" property="itemCost" />) 
		<INPUT TYPE="SUBMIT" VALUE="Add to Shopping Cart">
	</H2>
  </FORM>
</TABLE>       
<FORM ACTION="OrderPage.jsp" METHOD= "POST">
	<Small> <Input Type="Submit" value="Go to Cart" /> </Small>
</Form>
</CENTER></BODY></HTML>