<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewPage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<style type="text/css">
	body{
		width: 100vw;
		height: 100vh;
	}
	.container-fluid{
		height: 100vh;
	}
</style>
</head>
<body>
    <div class="container-fluid">
      <div class="row">
        <div class="col-12" style="text-align: center;"><h1>프로젝트 평가</h1></div>
      </div>
      <div class="row align-items-center"><h1>프로젝트평가점수 들어갈공간</h1></div>
      <div class="row">
      	<div class="col-12" style="text-align: center;"><h1>팀원별 평가</h1></div>
      </div>
      <div class="row align-items-start">
      	<form action="./reviewRatingProcess.do" method="post" id="review">
        	<c:forEach items="${reviewMember}" var="reviewMember">
	        	<c:if test="${sessionUser.member_no ne reviewMember.relationShipVo.member_no }">
	        		<div class="col-2">
						${reviewMember.memberName.member_name }
			        </div>
			        <div class="col-2">
				        <select name="rating_score" required>
				          <option selected>평점</option>
				          <option value="5">5</option>
				          <option value="4">4</option>
				          <option value="3">3</option>
				          <option value="2">2</option>
				          <option value="1">1</option>
				        </select>
			        </div>
			        <div class="col-4">
				        <textarea
				          name="one_line_review"
				          cols="50"
				          rows="1"
				          placeholder="한줄평"
				        ></textarea>
			        </div>
			        <input type="hidden" name="room_no" value="${reviewMember.relationShipVo.room_no }" />
			        <input type="hidden" name="sender_no" value="${sessionUser.member_no }"/>
			        <input type="hidden" name="receiver_no" value="${reviewMember.relationShipVo.member_no }"  />
	        	</c:if>
        	</c:forEach>
        	</form>
        	<div class="col-2">
	        	<button class="" form="review">완료</button>
	        </div>
		
      </div>
    </div>
  </body>
</html>