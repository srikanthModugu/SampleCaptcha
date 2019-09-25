
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<%@ page isELIgnored="false"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body {
	width: 100%;
	font-family: 'Open Sans', sans-serif;
	font-weight: 200;
	background-color: #dbdedbeb;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 30%;
	height: 52%;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 10%;
	text-align: center;
	background-color: #fff;
}

.textBox {
	width: 60%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.submit {
	width: 110px;
	height: 44px;
	display: block;
	margin: 40px auto 10px auto;
	background-color: #FF9900;
	color: white;
	border-radius: 30px;
	font-family: sans-serif;
	font-weight: bold;
	font-size: 18px;
	cursor: pointer;
}

.submit:hover, .submit:focus {
	background: #FF9900;
	color: #fff;
	outline: 0;
}

.captcha {
	letter-spacing: 12px;
	font-size: 35px;
	text-decoration: line-through;
	border-style: none;
	width: 60%;
	padding: 12px 20px;
	margin: 8px 0px 8px 24px;
	box-sizing: border-box;
}
.btn {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 12px 16px;
  font-size: 16px;
  cursor: pointer;
}

/* Darker background on mouse-over */
.btn:hover {
  background-color: RoyalBlue;
}
</style>
</head>
<body>
	<div class="card">
		<h1 style="">Sample Captcha</h1>
<div id="procMsg" style="font-size: 15px; font-weight: 600;"></div>
		<input type="text" id="captcha" value="${captcha}" class="captcha"
			readonly>
<button id="refreshBtn" class="btn"><i class="fa fa-refresh"></i></button>
		<input type="text" id="captchaValue" class="textBox"
			placeholder="Enter CAPTCHA">
		<div>
			<button id="submitBtn" type="submit" class="submit">Submit</button>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {

		$("#submitBtn").click(function() {
			var captchaObj = {};
			var captchaaa = $("#captchaValue").val();
			captchaObj["value"] = captchaaa;
			$.ajax({
				type : "POST",
				url : "validate",
				headers : {
					'Content-type' : 'application/json; charset=utf-8',
					'Accept' : "*/*"
				},
				data : JSON.stringify(captchaObj),
				dataType : 'json',
				success : function(data) {
					if (data["success"]) {
						$("#procMsg").empty();
						 $('<div id="123" style="color:green ; text-align: center;" >Success Its Matched!</div>').appendTo("#procMsg");
					} else {
						$("#procMsg").empty();
						$('<div id="123" style="color:red ; text-align: center;" >PLEASE TRY AGAIN!</div>').appendTo("#procMsg");
						setTimeout(function() {
							document.location.reload(true);
						}, 4000);

					}
				},
				error : function(e) {
				}
			});

		});
		$("#refreshBtn").click(function() {
		document.location.reload(true);
		});
	});
</script>
</html>