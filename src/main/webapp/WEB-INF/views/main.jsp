<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
 <%@include file="/WEB-INF/include/menus02.jsp" %>
<meta charset="UTF-8">
<title>BUSAN VISIT</title>
<style>
#appi{
	position : absolute;
	bottom    : 10%;
	right  : 13%;
}
 #aform{
 		  position: absolute;
		  left: 10%;
		  right: 10%;
          text-align: center;
        }
.form1 h1{ margin-top: -20px;}
table, th, td { border: 0px;} 
.popsight {
	border : 0px;
	border-collapse: seperate;
	text-align: center;
		}
.form2 h1 {
	margin-top : 50px;
	margin-bottom : 20px;
}
.api{line-height : 20px;}
.api.th{vertical-align: bottom;}
td {table-layout: fixed;}
thead{padding : 70px;}
.div1{text-align:left;}

</style>
<script src ="http://code.jquery.com/jquery-3.6.1.min.js"></script>

</head>
<body>

 <form id="aform">
	<div class ="form1">
	  <h1 align="left">부산 인기 여행지 TOP6</h1>
 		 <table class ="popsight">
			<tr>
				<c:forEach var="sight" items="${ sightList }">
					<td>
						<a href="/Info?s_code=${sight.s_code}">
						<!--  <a href="/Board/List?menu_id=${ board.menu_id }" class="btn btn-primary">목록으로</a>-->
							<img src ="fileupload/sight/${sight.s_name}.jpg" alt="${sight.s_name}" width="350" height="300">
						</a>
						<br>
						<a href="/Info?s_code=${sight.s_code}">${ sight.s_name }</a>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="sight2" items="${ sightList2 }">
					<td>
						<a href="/Info?s_code=${sight2.s_code}">
						<!--  <a href="/Board/List?menu_id=${ board.menu_id }" class="btn btn-primary">목록으로</a>-->
							<img src ="fileupload/sight/${sight2.s_name}.jpg" alt="${sight2.s_name}" width="350" height="300">
						</a>
						<br>
						<a href="/Info?s_code=${sight2.s_code}">${ sight2.s_name }</a>
					</td>
				</c:forEach>
			</tr>
		</table> 
	  <hr>
	</div>

  <div class = "form2">	 
	<table class ="api">
	  <colgroup>
	    <col style="width:40%">
	    <col style="width:40%">
	  </colgroup>
		<thead>
	    	<tr >
				<th><h1>지도</h1></th>
				<th><h1>부산 날씨 예보</h1></th>
		    </tr>
		</thead>
		<tr>
			<td align="center"><a href="/Maps"><img src = "fileupload/all/api.jpg" width="450" height="350"></a></td>
			<td><div id =appi  class="div1"></div></td> 
		
		</tr>
	</table>
  </div>
 </form>
    
</body>
<script>

window.onload=function(){
$.ajax({
	url : '/service',
	data : {keyword : $('#keyword').val()},
	success : function(json){
		var html = '';
		json.response.body.items.item.forEach(function(data,i){	
			console.log(data);	
			var time =String(data.announceTime).substring(8,12); //발표시각에서 시간만 뽑기
			var date= " "; //날짜넣을변수
			var today = new Date(); //오늘날짜 Thu Nov 17 2022 15:20:21 GMT+0900 (KST)
				var month = today.getMonth()+1; //type number, 11 
					var month1 =[1,3,5,7,8,10,12]; //월 (1,3,5,7,8,10,12 =>31일 / 
					var month2 = [4,6,9,11];//월 (1,3,5,7,8,10,12 =>31일 / 4,6,9,11 ->30일 / 2월 윤년29일  평년 28일
				//leapYear=(year%4==0 and year%100!=0) or year%400==0
				var day = today.getDate(); //일
				var lastDay=0;//마지막 날 변수 0으로 초기화
			//lastDay 설정
			if(month1.includes(month) == true){
				lastDay = 31;
			}else if(month2.includes(month)== true){
				lastDay = 30;
			}else{
				var year=today.getFullYear();
				console.log(year);
				if(year = (year%4==0 && year%100!=0) || year%400==0){
					lastDay=29;
				}else {
					lastDay=28;} 
			}
		
			var date1="", date2="", date3=""; //오늘 내일 모레
			date1 =month+"월" + day +"일"	;
			date2 = month+"월" +(day+1) +"일";
			date3 = month +"월" +(day+2 )+"일";
			date4 = month +"월" + (day+3)+"일";
			
			var raintype=""; //강수형태
			if(time=="0500"){
				if(data.numEf==0) {date=date1+"오전";}
				else if(data.numEf==1) {date=date1+"오늘오후";}
				else if(data.numEf==2) {date=date2+"내일오전";}
				else if(data.numEf==3) {date=date2+"내일오후";}
				else if(data.numEf==4) {date=date3+"모레오전";}
				else if(data.numEf==5) {date=date3+"모레오후";}
				else if(data.numEf==6) {date=date4+"글피오전";}
				else {date=date4+"글피오후";}
			}else{
				if(data.numEf==0) {date=date1+"오후";}
				else if(data.numEf==1) {date=date2+"오전";}
				else if(data.numEf==2) {date=date2+"오후";}
				else if(data.numEf==3) {date=date3+"오전";}
				else if(data.numEf==4) {date=date3+"오후";}
				else if(data.numEf==5) {date=date4+"오전";}
				else {date=date4+"오후";}
			}
 				
  		 	if(data.rnYn == 0){
  		 		raintype = "";
 			} else if(data.rnYn == 1){
 				raintype = "비";
 			} else if(data.rnYn == 2){
 				raintype = "비/눈";
 			} else if (dadta.rnYn == 3){
 				raintype = "눈";
 			} else{raintype = "소나기";}
	
			html +='<p>'+date+'&nbsp;&nbsp;&nbsp;'+data.ta+'℃&nbsp;&nbsp;&nbsp;'+data.wf+'&nbsp;&nbsp;&nbsp;'+raintype+'</p>'; //강수형태 data.rnYn == 0 이면 html 추가x /data.rnYn >1 html추가

		})
		
		$('.div1').html(html);
	},
	error : function(xhr){
		console.log(xhr);
		alert(xhr.status + ':????' + xhr.textStatus)
	}
})
}

</script>

</html>