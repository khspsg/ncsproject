<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('resources/file/missionimpossible.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>미션 임파서블:폴아웃</h3>
              <p>대한민국이 가장 사랑하는 액션 블록버스터</p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('resources/file/incredible.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>인크레더블</h3>
              <p>This is a description for the second slide.</p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('resources/file/inlang.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>인랑</h3>
              <p>늑대로 불린 인간병기</p>
            </div>
          </div>
          <div class="carousel-item" style="background-image: url('resources/file/antman.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>앤트맨과 아스프</h3>
              <p></p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>

    <!-- Page Content -->
    <div class="container">

      <h1 class="my-4">박스오피스</h1>

      <!-- Marketing Icons Section -->
      <div class="row" style="text-align:center">
        <div class="mb-4">
          <div class="card h-100">
            <img src="resources/file/missionimpossible.jpg" width="271px" height="400px">
            <div class="card-footer" style="text-align:center">
              <a href="#" class="btn btn-info">상세정보</a>
              <a href="#" class="btn btn-info">예매하기</a>
            </div>
          </div>
        </div>
        &nbsp&nbsp&nbsp
        <div class="mb-4">
          <div class="card h-100">
            <img src="resources/file/incredible.jpg" width="271px" height="400px">
            <div class="card-footer" style="text-align:center">
              <a href="#" class="btn btn-info">상세정보</a>
              <a href="#" class="btn btn-info">예매하기</a>
            </div>
          </div>
        </div>
        &nbsp&nbsp&nbsp
        <div class="mb-4">
          <div class="card h-100">
            <img src="resources/file/inlang.jpg" width="271px" height="400px">
            <div class="card-footer" style="text-align:center">
              <a href="#" class="btn btn-info">상세정보</a>
              <a href="#" class="btn btn-info">예매하기</a>
            </div>
          </div>
        </div>
        &nbsp&nbsp&nbsp
        <div class="mb-4">
          <div class="card h-100">
            <img src="resources/file/antman.jpg" width="271px" height="400px">
            <div class="card-footer" style="text-align:center">
              <a href="#" class="btn btn-info">상세정보</a>
              <a href="#" class="btn btn-info">예매하기</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Portfolio Section -->
      <h2>이벤트</h2>

      <div class="row">
        <div class="col-lg-3 col-sm-6 portfolio-item">
            <a href="#"><img class="card-img-top" src="resources/file/festivalevent.jpg" alt=""></a>
        </div>
        <div class="col-lg-3 col-sm-6 portfolio-item">
            <a href="#"><img class="card-img-top" src="resources/file/stampevent.jpg" alt=""></a>
        </div>
        <div class="col-lg-3 col-sm-6 portfolio-item">
            <a href="#"><img class="card-img-top" src="resources/file/projectevent.jpg" alt=""></a>
        </div>
        <div class="col-lg-3 col-sm-6 portfolio-item">
            <a href="#"><img class="card-img-top" src="resources/file/breakevent.jpg" alt=""></a>
        </div>
      </div>
      <!-- /.row -->

      <!-- Features Section -->
      <div class="row" style="background-color: #dad2b4">
      	공지사항
      </div>
      <div class="row" style="margin-top:30px">
      	<img class="card-img-top" src="resources/file/megarodon.jpg" alt="">
      </div>
      <!-- /.row -->

      <hr>

      <!-- Call to Action Section -->
      <div class="row mb-4">
      	회사소개 채용정보 제휴문의 광고문의 출점문의 이용약관 사이트맵
      </div>

    </div>
    <!-- /.container -->
</body>
</html>
