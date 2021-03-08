<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<!-- 우선 스타일 적용 되는데로 했는데 같이 보면서 고치도록할게요 ㅠㅠ -->
</style>
</head>
<body>
<jsp:include page="../main/pre.jsp"/>
<!-- ROOT -->
<%
	String id = null;
	int rsno = 0;
	String remail=null;
	String kind=null;
	ReservationDBBean rdb = ReservationDBBean.getinstance();
	ArrayList<ReservationBean> rbean= null; 
	if(session.getAttribute("userid")!=null){
		id = (String)session.getAttribute("userid");
			rbean = rdb.search(rsno, id, remail);
	
		%>
		<div class="search">	
		<div class="container-fluid">
			<table class="table table-striped">
			<thead class="thead-dark">
			<tr align="center">
				<th scope="col">#</th>
				<th scope="col">예약번호</th>
      			<th scope="col">객실</th>
      			<th scope="col">체크인</th>
      			<th scope="col">체크아웃</th>
      			<th scope="col">예약자</th>
			</tr>
			</thead>
		<%			
			for(int i=0;i<rbean.size();i++){
%>
			<tbody>	
				<tr align="center"> 
					<th scope="row"><%= i+1 %></th>
					<td><a href="reservationInfo.jsp?rsno=<%= rbean.get(i).getRsno()%>">
					<%= rbean.get(i).getRsno() %></a></td>
					<td><%= rbean.get(i).getRoomname() %></td>
					<td><%= rbean.get(i).getCheck_in() %></td>
					<td><%= rbean.get(i).getCheck_out() %></td>
					<td><%= rbean.get(i).getRname() %></td>
				</tr>
			</tbody>	
<% 					
			}
%>
			</table>
			</div>
		</div>
<% 		
	}else{
%>			
			<div class="search">
			<form method='GET' action='./searchReservation.jsp'>
			<div class="form-row form justify-content-center">
			<div class="form-group col-sm-1.5 form">
      		<select name="kind" id="kind" class="form-control" onchange=select_onchange(this)>
        		<option value="1" selected>아이디</option>
				<option value="2">예약번호</option>
				<option value="3">이메일</option>
      		</select>
   		 	</div>
    		<div class="form-group col-sm-3 form">
    			<input name="kind" type="hidden" id="kind">
    			<input name="id" placeholder="아이디 입력" type="text" id="id" style="display:inline-block" class="form-control">
				<input name="rsno" placeholder="예약번호 입력" type="text" id="rsno" style="display:none" class="form-control">
				<input name="remail" placeholder="이메일 입력" type="email" id="email" style="display:none" class="form-control">
			</div>
    		<div class="form-group col-sm-2 form">
    			<input type="submit" value="검색하기"  class="btn btn-outline-secondary" style="margin-top:0;">
    		</div>
   		 	</div>
   		 	</form>	
<%
		 	
			
%>	
		<div class="container-fluid">
			<p class="text-center" style="color:#767676;">
				예약번호 클릭 시 상세 조회가 가능합니다
			</p>
			<table class="table table-sm table-striped" id="refund">
			<thead class="thead-dark">
			<tr align="center">
				<th scope="col">#</th>
				<th scope="col">예약번호</th>
      			<th scope="col">객실</th>
      			<th scope="col">체크인</th>
      			<th scope="col">체크아웃</th>
      			<th scope="col">예약자</th>
			</tr>
			</thead>
<%				
		kind = rdb.checkNull(request.getParameter("kind"));
		if(kind != null){
			int ikind = Integer.parseInt(kind);
		switch(ikind){
		case 1:
			id=rdb.checkNull(request.getParameter("id"));
			rbean = rdb.search(rsno, id, remail);
		break;
		case 2:
			String no=request.getParameter("rsno");
			rsno=Integer.parseInt(no);
			rbean = rdb.search(rsno, id, remail);
		break;
		default:
			remail=rdb.checkNull(request.getParameter("remail"));
			rbean = rdb.search(rsno, id, remail);
		break;	
		}
		if(rbean.size()==0){
%>
		<script>
			alert("검색결과 없음");
		</script>
<% 			
		}
				for(int i=0;i<rbean.size();i++){
					rsno=rbean.get(i).getRsno();
%>					
				<tbody>		
					<tr align="center">
						<th scope="row"><%= i+1 %></th>
						<td><a href="reservationInfo.jsp?rsno=<%= rsno %>">
							<%= rsno %></a></td>
						<td><%= rbean.get(i).getRoomname() %></td>
						<td><%= rbean.get(i).getCheck_in() %></td>
						<td><%= rbean.get(i).getCheck_out() %></td>
						<td><%= rbean.get(i).getRname() %></td>
					</tr>
				</tbody>	
<% 				
		}
			}
%>
			</table>
			</div>
			</div>
<% 
	}
%>						
<jsp:include page="../main/after.jsp"/>
</body>
<script>
function select_onchange(obj) {
	  switch (obj.value) {
	    case "1" :
	      id.style.display = "inline-block";
	      rsno.style.display = "none";
	      email.style.display = "none";
	      break;
	    case "2" :
	      id.style.display = "none";
	      rsno.style.display = "inline-block";
	      email.style.display = "none";
	      break;
	    default  :
	      id.style.display = "none";
	      rsno.style.display = "none";
	      email.style.display = "inline-block";
	      break;
	  }
	  document.getElementById('#kind').value = obj.value;
	}

</script>
</html>