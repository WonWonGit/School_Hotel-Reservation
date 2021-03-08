<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Team 1</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<style>
.cycle-pager { 
    text-align: center; width: 100%; z-index: 500; position: absolute; top: 10px; overflow: hidden;
}
.cycle-pager span { 
    font-family: arial; font-size: 50px; width: 16px; height: 16px; 
    display: inline-block; color: #ddd; cursor: pointer; 
}
.cycle-pager span.cycle-pager-active { color: #D69746;}
.cycle-pager > * { cursor: pointer;}

.main_img{
width:100%;
}
</style>
</head>
<body>
<div class="cycle-slideshow" 
    data-cycle-fx=scrollHorz
    data-cycle-timeout=3000
    data-cycle-pager-event="mouseover"
    >
    <!-- empty element for pager links -->
    <img src="../img/main_img/slide1.jpg" class="main_img">
    <img src="../img/main_img/slide2.jpg" class="main_img">
    <img src="../img/main_img/slide3.jpg" class="main_img">
    <img src="../img/main_img/slide4.jpg" class="main_img">
    <div class="cycle-pager"></div>
</div>
</body>

