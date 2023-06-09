<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link href="/frontendProject/css/kiosk.css" rel="stylesheet">
	
</head>
<body>

	<%@include file="../header.jsp" %>
	<!-- 범위지정 ctrl+shift+f -->
	<div class="kioskwrap">
		텍스트
		<div>  <!-- 헤더 : 광고이미지/카테고리출력 표시되는 구역 -->
			<!-- 광고이미지 -->
			<img class="himg" src="../img/himg1.png" >
			
			<!-- 카테고리 -->
			<ul class="categorymenu">
				<li class="categoryselect">신제품(NEW)</li>
				<li>프리미엄</li>
				<li>와퍼&주니어</li>
				<li>치킨&슈프림버거</li>
				<li>올데이킹&킹모닝</li>
			</ul>
			
		</div> <!-- 헤더 end -->
		
		
		<div class="kioskcontent"> <!-- 본문 :제품출력/카트출력 구역 -->
		
			<div class="productbox"> <!-- 제품구역 -->
				<div class="product">  <!-- 제품 1개 -->
					<img src="../img/헬로디아블로와퍼.png"/>
					<div class="pinfo">
						<div class="pname">헬로 디아블로 와퍼</div> <!-- 제품명  -->
						<div class="pprice">15,000원</div> <!--제품갸격  -->
					</div>
				</div> <!-- 제품 1개 end -->
							
			</div> <!-- 제품구역 end -->
			
			<div class="cartbox"> <!-- 카드구역 -->
			
				<div class="cartcontent"> <!-- 제품개수/총가격 구역 -->
				
					<div class="carttop"> <!-- 제품개수/총가격 출력 구역 -->
						<div>카트<span class="ccount">0</span></div>
						<div>총 주문금액 <span class="ctotal">0</span></div>
					</div>
					
					<div class="cartbottom"> <!-- 제품 정보 출력 구역 -->
					
					</div>  <!-- 제품 정보 출력 구역 end -->
				
				</div> <!-- 제품개수/총가격 구역 end -->
				
				<div class="cartbtn"> <!-- 버튼 구역 -->
					<button onclick="cartCancel()" class="cancelbtn">취소하기</button>
					<button onclick="productOrder()" class="orderbtn">주문하기</button>
				</div> <!-- 버튼 구역 end -->
			
			</div> <!-- 카드구역end -->
		</div> <!-- 본문 end -->
		
	</div>
	
	
	
	
	<%@include file="../footer.jsp" %>
	
	<script src="/frontendProject/js/kiosk.js" type="text/javascript"></script>


</body>
</html>