<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reservation.*" %>  
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.DecimalFormat" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Root -->
<!-- 예약 취소 완료 시 예약 파트에서 예약 부분 삭제 후 
	 관리자가 확인해야 하므로 취소 내역 테이블을 하나 더 만들거나 
	 컬럼하나 더 생성해야할것 같아요 ! 
	 내일 상의하고 해야할것 같아서 아직 만들지는 않았습니다 :)  --> 
<% 
	request.setCharacterEncoding("utf-8");
	ReservationDBBean rdb = ReservationDBBean.getinstance();
	ReservationBean rb = new ReservationBean();
	PayDBBean pdb = PayDBBean.getinstance();
	PayBean paybean = new PayBean();
	ResultSet rs = null;
	String pay_name=null;
	int rsno = Integer.parseInt(request.getParameter("rsno"));
	int refund_price = Integer.parseInt(request.getParameter("refund_price"));

	if(session.getAttribute("userid")==null){	
		
		rb = rdb.reservationpay(rsno);
		
		String rname = request.getParameter("rname");
		String rphone = request.getParameter("rphone");
		int result = rdb.NoneMembercancle(rname, rphone, rsno);
		
		
		if(result==1){
			pay_name=rb.getPay_name();
			paybean.setRsno(rsno);
			paybean.setRefund_price(refund_price);
			paybean.setPay_name(rb.getPay_ment());
			paybean.setRname(rname);
			paybean.setRphone(rphone);
			pdb.payCancle(paybean);
		
%>
		<script>
			var con = confirm("예약 취소 하시겠습니까?")
			if(con==true){
				alert("예약취소! 환불까지는 시간이 소요될 수 있습니다.");
				location.href='../main/index.jsp';
			}
		</script>
<% 
		}else if(result==0){
%>
		<script>			
			alert("예약자 번호가 틀립니다!");
			history.back();
		</script>
<%			
		}else if(result==-1){
			rdb.reservationpay(rsno);
%>
		<script>			
			alert("다시 시도 부탁드립니다");
			history.back();
		</script>
<%				
		}
	}else{
			rb = rdb.reservationpay(rsno);
			paybean.setRsno(rsno);
			paybean.setRefund_price(refund_price);
			paybean.setPay_name(pay_name);
			paybean.setRname(rb.getRname());
			paybean.setRphone(rb.getRphone());
			pdb.payCancle(paybean);
%>
		<script>
			var con = confirm("예약 취소 하시겠습니까?")
			if(con==true){
				alert("예약취소! 환불까지는 시간이 소요될 수 있습니다.");
				location.href='../main/index.jsp';
			}
		</script>
<% 		
	}	
%>		

</body>
</html>