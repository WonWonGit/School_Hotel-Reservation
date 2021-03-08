<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
		.navbar{
			background-color:#585858;
			width:100%;
			position:relative;
			margin:0;
			padding:0;
			padding-top:20px;
		}
		.navbtn{
			color: #fff;
		}
		.text-right{
			width:100%;
		}
		.btn{
			margin-top:10px;
		}
		.navbtn:hover{
			color:#808080;
		}
	</style>
</head>
 <body>  
<nav class="navbar justify-content-center">
<div>
	<a href="../main/index.jsp" class="btn btn-default btn-rounded mb-4 navbtn">HOME</a>
	<a href="../admin/admin_room.jsp" class="btn btn-default btn-rounded mb-4 navbtn">룸 관리</a>
  	<a href="../admin/admin_reservation.jsp" class="btn btn-default btn-rounded mb-4 navbtn">예약 관리</a>
  	<a href="../admin/bord_list.jsp" class="btn btn-default btn-rounded mb-4 navbtn">커뮤니티 관리</a>
</div>
</nav>