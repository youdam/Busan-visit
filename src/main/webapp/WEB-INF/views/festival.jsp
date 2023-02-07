<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
 <%@include file="/WEB-INF/include/menus02.jsp" %>
<meta charset="UTF-8">
<title>VISITBUSAN 페스티벌</title>
<style>
.box {
 text-align:center;
}
.box img {
 border-radius: 5%;
}
.box p {
 margin-bottom:8px;
}
.tableAtt {
 border-collapse: seperate;
 border-spacing: 30px 40px;
 border-top-left-radius: 15px; 
 border-top-right-radius: 15px;
 border-bottom-left-radius: 15px; 
 border-bottom-right-radius: 15px;
}
.titatle{
text-align:center;
}
</style>
</head>
<body>
<div class = titatle>
<h2>축제 전체 보기</h2>
</div>
  <table class="tableAtt">
  <tr class="tableAtt">
<c:forEach var="festivalTable" items="${ festivalTable }" varStatus="status">
<c:if test="${status.index%4==0}">
</tr><tr class="tableAtt">
</c:if>
      <td class="tableAtt">
      <div class="box">
            <p><a href="">${festivalTable.f_name}</a></p>
            <a href="/InfoFes?f_code=${festivalTable.f_code}"><img src ="fileupload/festival/${festivalTable.f_name}.jpg" alt="${festival.f_name}" width="350" height="300"></a>
      </div>
      </td>
      </c:forEach>
   </tr>
</table>
</body>
</html>