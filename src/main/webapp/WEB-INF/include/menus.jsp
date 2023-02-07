<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">

 <!--  메뉴목록  -->
  <table id="menu">
  <tr> 
  <c:forEach var="menu"  items="${ menuList }" >
   <td>
     <a href="/Board/List?menu_id=${ menu.menu_id }">
      ${ menu.menu_name }
     </a> 
   </td>
  </c:forEach>
   <td>
    <a href="/Board/List"> 
    <!-- <a href="/Board/List?menu_id="> --> 
      전체 보기
    </a> 
  </td>
  </tr>
  </table>