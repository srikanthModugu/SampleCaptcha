
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<%@ page isELIgnored="false"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<h1>Sample Captcha</h1>
	<div id="div1"></div>

	<div>${captcha}</div>

	<input type="text" id="captchaValue" placeholder="Enter CAPTCHA">
	<button id="button" type="button">Submit</button>
</body>

<script type="text/javascript">
    $(document).ready(function(){
    	
    	  $("button").click(function(){
    		    	var captcha = {};
    		    	var captchaaa = $("#captchaValue").val();
    		    	console.log("the evalue"+captchaaa);
    		    	captcha["value"] = captchaaa;
    		    	$.ajax({
    		    		type : "POST",
    		    		url : "validate",
    		    		headers : {
    		    			'Content-type' : 'application/json; charset=utf-8',
    		    			'Accept' : "*/*"
    		    		},
    		    		data : JSON.stringify(captcha),
    		    		dataType : 'json',
    		    		async : true,
    		    		success : function(data) {
    		    		},
    		    		error : function(e) {
    		    		}
    		    	});

    		    }    	
    	  });

    </script>
</html>