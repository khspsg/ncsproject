<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style>
   #mystyle{
      background-color: #f00;
      font-size: 50px;
   }
</style>
</head>
<body>
	<div class="row">
    	<div class="col-md-3"></div>
        <div class= "input-group mb-3 col-md-6 ">
        	<div class="input-group-prepend">
        		<span class="input-group-text" style="width: 110px"><i class="fas fa-battery-half" style="font-size: 20px"> name</i></span>
        	</div>
        	<input type="text" class= "form-control" placeholder="username" aria-label="Username" aria-describedby="basic-addon1">
      	</div>
		<div class="col-md-3"></div>
	</div>
	<div class="row">
    	<div class="col-md-3"></div>
        <div class= "input-group mb-3 col-md-6 ">
        	<div class="input-group-prepend">
        		<span class="input-group-text" style="width: 110px"><i class="fas fa-battery-half" style="font-size: 20px"> id</i></span>
        	</div>
        	<input type="text" class= "form-control" placeholder="username" aria-label="Username" aria-describedby="basic-addon1">
      	</div>
		<div class="col-md-3"></div>
	</div>
	<i class="fab fa-yelp"></i>
	<i class="fas fa-subway"></i>
	<i class="fas fa-car"></i>
	<div class="row">
       	<div class="col-md-2"></div>
       	<div class="col-md-3" style="background-color: #ff00ff; text-align: center">A1</div>
       	<div class="col-md-5" style="background-color: #000f0f; text-align: center">A2</div>
       	<div class="col-md-2"></div>
	</div>
	<div class="row" style="margin-top: 30px">
       	<div class="col-md-4"></div>
    	<div class="col-md-4">
           	<button type="button" class="btn btn-primary">Primary</button>
        	<button type="button" class="btn btn-danger">Danger</button>
        	<button type="button" class="btn btn-secondary">Secondary</button>
	    </div>
		<div class="col-md-4"></div>
	</div>
	<div class="row" style="margin-top: 30px">
        	<div class="col-md-4"></div>
            <div class="col-md-4">
            	<button type="button" class="btn btn-outline-primary">Primary</button>
            	<button type="button" class="btn btn-outline-danger">Danger</button>
            	<button type="button" class="btn btn-outline-secondary">Secondary</button>
            </div>
			<div class="col-md-4"></div>
	</div>
</body>
</html>