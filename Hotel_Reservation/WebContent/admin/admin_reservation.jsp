<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>
<%@ page import="java.util.ArrayList" %>   
<%@ page import="java.sql.Timestamp" %>   
<%@ page import="java.text.SimpleDateFormat" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>

<style>
	nav{
		margin:20px;
	}
	.pagination{
		justify-content: center;
	}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="../main/header2.jsp"/>
<div class="main" style="background-color:#fff;">
<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" href="admin_reservation.jsp">예약현황</a>
    <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" href="admin_reservation2.jsp">결제대기</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="admin_reservation3.jsp">결제완료</a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">예약취소</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="admin_resCancleMoney.jsp">현금결제</a>
      <a class="dropdown-item" href="admin_resCancleCard.jsp">카드결제</a>
      <a class="dropdown-item" href="admin_resCancleOk.jsp">취소완료건</a>
    </div>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#">MENU</a>
  </li>
</ul>
  </div>
</nav>
	<%
	ReservationDBBean rdb = ReservationDBBean.getinstance();
	ReservationBean rb = new ReservationBean();
	Tool tool = Tool.getinstance();
	String payment=null;
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	
	String tempPage = request.getParameter("page");
	int cPage;
	int totalPages;
	int pageLength=5;
	int totalRows = tool.getPage();
	
	if(tempPage==null||tempPage.length()==0){
		cPage=1;
	}try{
		cPage=Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage=1;
	}
	int currentBlock = cPage%pageLength==0?cPage/pageLength:(cPage/pageLength)+1;
	int startPage = (currentBlock-1)*pageLength+1;
	int endPage = startPage+pageLength-1;
	
	totalPages = totalRows%5==0?totalRows/5:(totalRows/5)+1;
	if(totalPages==0){
		totalPages=1;
	}if(endPage>totalPages){
		endPage=totalPages;
	}
	int start = (cPage -1)*5;
	
	rdb.deleteOneDay(); // 24이내 미 입금건
	ArrayList<ReservationBean> rbean= rdb.selectList(start);
	
%>	
	<div class="container-fluid">
		<div class="right">
			<p class="text-center" style="color:#767676;">
				예약번호 클릭 시 상세 조회가 가능합니다
			</p>
			<table class="table table-sm">
			<thead class="thead-dark">
			<tr align="center">
				<th scope="col">#</th>
				<th scope="col">예약번호</th>
				<th scope="col">방번호</th>
      			<th scope="col">체크인</th>
      			<th scope="col">체크아웃</th>
      			<th scope="col">예약날짜</th>
      			<th scope="col">예약자</th>
      			<th scope="col">결제방식</th>
      			<th scope="col">결제현황</th>
			</tr>
			</thead>
<%		
			for(int i=0;i<rbean.size();i++){
				rb.setRn(1, i);
				//page 1(1-5까지 출력)
				if(cPage>1){ //페이지 1이상일 경우 6부터 일씩 증가하도록 해줌
					rb.setRn((cPage-1)*5+1, i);
				}
				
%>
			<tbody>	
				<tr align="center"> 
					<th scope="row"><%= rb.getRn() %></th>
					<td>
					<a href="admin_resInfo.jsp?rsno=<%= rbean.get(i).getRsno() %>">
						<%= rbean.get(i).getRsno() %>
					</a>
					</td>
					<td><%= rbean.get(i).getRno() %></td>
					<td><%= rbean.get(i).getCheck_in() %></td>
					<td><%= rbean.get(i).getCheck_out() %></td>
					<td><%= format.format(rbean.get(i).getRes_date()) %></td>
					<td><%= rbean.get(i).getRname() %></td>
					<td><%= rbean.get(i).getPay_ment() %></td>
					<td><%= rbean.get(i).getPaid() %></td>
				</tr>	
<%		
			}
%>			
			</tbody>
			</table>
			</div>
			
			<div class="text-center">
<%			
			if(startPage==1){
%>				
				<ul class="pagination" style="margin:20px;padding:0">
					<li class="page-item disabled">
					<a class="page-link" href="#" aria-label="Previous">
       				<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span>	
     			 	</a>
     			 	</li>
<% 						
					}else{
%>
					<li class="page-item">
					<a class="page-link" href="admin_reservation.jsp?page=<%=startPage-1 %>" aria-label="Previous">
       				<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span>	
     			 	</a>
     			 	</li>
		
<% 						
					}
%>
<% 
					for(int i=startPage;i<=endPage;i++){
%>
					<li class="page-item ">
					<a class="page-link" href="admin_reservation.jsp?page=<%=i %>">
					<%= i %></a></li>
<% 	
					}
%>					
<%
					if(totalPages==endPage){
%>
						<li class="page-item disabled">
						<a class="page-link" href="#" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
        				<span class="sr-only">Next</span>
      					</a>
						</li>
<% 		
						}else{
%>
						<li class="page-item">
						<a class="page-link" href="admin_reservation.jsp?page=<%= endPage+1 %>" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
        				<span class="sr-only">Next</span>
      					</a>
      					</li>
      				</ul>	
<% 		
						}
%>
			
			</div>
			</div>
		</div>	
<!-- <div class="footer"><jsp:include page="../main/footer.jsp"/></div>	 -->		
</body>
</html>