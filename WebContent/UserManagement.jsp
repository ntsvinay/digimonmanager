<%@page import="java.sql.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import=" java.io.*"%>


<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css">
<script>

	$(document).ready(
			function() {
				var date_input = $('input[name="sign_On_date"]'); //our date input has the name "date"
				var container = $('.bootstrap-iso form').length > 0 ? $(
						'.bootstrap-iso form').parent() : "body";
				date_input.datepicker({
					format : 'dd-M-yyyy',
					 endDate: '+0d',
					container : container,
					todayHighlight : true,
					autoclose : true,
				})
			})
</script>


<script>
	function futureMethod(idName, i) {
		if (confirm("You want to delete " + userData[i][0])) {
			deleteConfirm(userData[i][0]);
		} else {
			txt = "You pressed Cancel!";
		}
		function deleteConfirm(empName) {

			alert(empName + " Deleted SuccessFully")
        window.location.href="http://localhost:3030/DiGiMonUser/DeleteUser?empName="+empName;        
		}
	}
</script>
<script>

	$(document).on("click", "#scanButton", function() {

		readyForScan();
		$("#somediv").text("Place your thumb on the sensor");
		document.getElementById("somediv").style.color = "blue";
		$.get("CreateUser", function(responseText) {
			$("#somediv").text(responseText);
			if ('unsuccessful...! try again' == document

			.getElementById("somediv").textContent) {

				document.getElementById("somediv").style.color = "red";
z
			} else {
				//"enter in this");
				document.getElementById("somediv").style.color = "blue";
				$("#scanButton").text("Done");
				detailsRegistered();

			}

		});

	});
</script>
<script type="text/javascript">
	function callservlet(methodtype) {
		document.getElementById();
	}
</script>
<style>
#heading {
	border-bottom: 2px solid black;
	color: black;
}

div {
	font-size: 20px;
	font-weight: bold;
	color: black;
}

#photoButtonphotoButton {
	border: 0px;
	background-color: WHITE;
	color: black;
}
#profilediv {
	display: none;
}

input[type=text] {
	background-color: white; //
	background-color: lightblue;
}
#titleName, #rankPicker {
	background-color: white;
}

#scanButton {
	font-size: 16px;
}

#SubmitButton1, #SubmitButton2 {
	font-size: 16px;
}
#completeLine {
	margin-top: 30px;
}
	table#t01{
 	width:100%;
 	}
 	table#t01 tr:nth-child(even) {
  background-color: #eee;
}
table#t01 tr:nth-child(odd) {
 background-color: #fff;
}
table#t01 th {
  background-color: black;
  color: white;
}
</style>
</head>
<body style="background-color: white">
<%
		String retrieve_title = request.getAttribute("retrieve_title").toString();
	%>
	<audio id="readyforScan">
		<source src="AUDIO/scanaudio.ogg" type="audio/ogg">
		<source src="AUDIO/scanaudio.mp3" type="audio/mpeg">
	</audio>
	<audio id="detailsSaved">
		<source src="AUDIO/detailsregistered.ogg" type="audio/ogg">
		<source src="AUDIO/detailsregistered.mp3" type="audio/mpeg">
	</audio>
	<audio id="tryagain">
		<source src="AUDIO/tryagain.ogg" type="audio/ogg">
		<source src="AUDIO/tryagain.mp3" type="audio/mpeg">
	</audio>
	<script>
		function readyForScan() {
			var x = document.getElementById("readyforScan");
			x.play();
		}
		function detailsRegistered() {
			var x = document.getElementById("detailsSaved");
			x.play();
		}
		function tryAgain() {
			var x = document.getElementById("tryagain");
			x.play();
		}
	</script>
	
	
	<div class="container">
	
	<div class="col-sm-12" id="alertDiv"
		style="margin-top: 10px; height: 20px;"></div>
		  <div class="container-fluid" id="status2">
      <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#mainDiv" id="collbtn">ADD NEW</button>
  </div>
		
	<div id="mainDiv" class="collapse">
	
	
		<form action="SaveUserDetails" method="get" id="abc">
		
			
			
			
			   
      <div class="col-md-12" id="formrow">
       <div class="col-sm-6 form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label" style="padding: 5px;">TITLE</label>
    <div class="col-sm-8">
      <select name="title" id="titleName" class="form-control form-control-sm">
                <option>SELECT</option>
                <option>CAPT.</option>
                <option>MR.</option>
                <option>MS.</option>
              </select>
    </div>
  </div>

   <div class="col-sm-6 form-group row"  style="margin-left: 30px;">
    <a href="#" class="btn btn-info" >IMAGE</a>
   </div>
 </div>
			
			
			<div class="col-md-12" style="padding: 0;" id="formrow">
   <div class="form-group col-sm-3">
   <label for="number" > FIRST NAME :</label>
    <input type="text" class="form-control"  name="firstName" id="firstName" onkeyup="this.value = this.value.toUpperCase();"/ >
  </div>

  <div class="form-group col-sm-3">
   <label for="number" > MIDDLE NAME :</label>
    <input type="text" class="form-control"  name="secondName" id="secondName" onkeyup="this.value = this.value.toUpperCase();"/ >
  </div>

  <div class="form-group col-sm-3">
   <label for="number" >FAMILY NAME :</label>
    <input type="text" class="form-control" name="thirdName" id="thirdName" onkeyup="this.value = this.value.toUpperCase();"	/>
  </div>
</div>
			
			
			
			
			
			
			
			
		  <div class="col-md-12" id="formrow" style="padding: 0;">

      <div class="col-sm-3"><b>SIGN ON DATE</b></div>
      <div class="col-sm-3"><input class="form-control" id="datePicker" name="sign_On_date" placeholder="DD/MM/YYY" type="text"/></div>
      </div>

      <div class="col-md-12" id="formrow"  style="padding-left: 0;">

      <div class="col-sm-3 form-group" style="margin-top: 5px;"><b >THUMB IMPRESSION</b></div>
      <div class="col-sm-3"><div onmouseover="scanDisable()" style="width: 100px;">
							<button type="button" id="scanButton" class="btn btn-info"
								style="color: black; font-weight: bold;">SCAN</button>
						</div>	 </div>

      <div class="col-sm-4 " id="somediv" style="font-size:15px;"></div>
      </div>

      <div class="col-md-12" id="formrow"  style="padding-left: 0;">
         <div class="col-sm-3 form-group"><b>RANK</b></div>
      <div class="col-sm-3"><select name="rank" id="rankPicker" class="form-control">
              <option>SELECT</option>
              <option>MASTER</option>
              <option>CHIEF ENGINEER</option>
              <option>CHIEF MATE</option>
              <option>SECOND ENGINEER</option>
              <option>SECOND MATE</option>
              <option>THIRD ENGINEER</option>
              <option>THIRD MATE</option>
              <option>FOURTH ENGINEER</option>
              <option>ELECTRICAL OFFICER</option>
              <option>BOSUN</option>
              <option>PUMP MAN</option>
              <option>ABLE SEAMAN</option>
              <option>ORDINARY SEAMAN</option>
              <option>CHEIF COOK</option>
              <option>MESSMAN</option>
              <option>FITTER</option>
              <option>OILER</option>
              <option>WIPER</option>
              <option>OTHER</option>
            </select>
            </div>
         
			
						<div class="col-sm-2" onmouseover="Disable()" onmouseleave="Enable()"
							style="width: 150px;">
								<button type="button" id="SubmitButton1" class="btn btn-info"
									style="color: black; font-weight: bold;"
									onclick="reportDivData()">VIEW</button>
							</div>
							<div class="col-sm-2" onmouseover="Disable()" onmouseleave="Enable()">
								<button type="submit" id="SubmitButton2" class="btn btn-info"
									style="color: black; font-weight: bold; margin-right: 20px">SUBMIT</button>
							</div>
						</div>
				
			
		</form>
	</div>
	<div class="col-sm-12" id="alertDiv" id="completeLine"></div>
	<div id="reportDiv"></div>
	</div>
	<div class="container-fluid" style="margin-top: 20px;"
		id="mainContainer">
		<div class="col-sm-12"
			style="border-bottom: 2px solid black; font-size: 17px;">
			<div class="col-sm-1">
				<b>SR NO.</b>
			</div>
			<div class="col-sm-2">
				<b>NAME</b>
			</div>
			<div class="col-sm-2">
				<b>RANK</b>
			</div>
			<div class="col-sm-2">
				<b>DATE OF JOINING</b>
			</div>
			<div class="col-sm-5"></div>
		</div>
	</div>
</body>
<script>
	function scanDisable() {
		var title = document.getElementById("somediv").textContent;
		if (title == 'Succesful') {
			document.getElementById("scanButton").disabled = true;
		}

	}
</script>
<script>
	function showProfilePicture() {
		document.getElementById("photoButtonphotoButtoninfo").disabled = true;
		var y = document.getElementById("profilediv");
		y.style.display = "block";
		var x = document.getElementById("prfilebutton");
		x.style.display = "none";
	}
	function Disable() {
		var alertCount = 0;
		var cal = $("#datePicker").datepicker({
			dateFormat : 'dd,MM,yyyy'
		}).val();
		
		var title = document.getElementById("titleName").value;		
		var firstName = document.getElementById("firstName").value;		
		var thirdName = document.getElementById("thirdName").value;
		var rank = document.getElementById("rankPicker").value;
		var x = document.getElementById("scanButton").textContent;
		if(x=='SCAN'){
			alertCount++;
		}
		if (rank == 'SELECT') {
			alertCount++;
		}
		if (firstName =='') {			
			alertCount++;
		}
		if (thirdName =='') {
			alertCount++;
		}
		if (title == 'SELECT') {
			alertCount++;
		}
		if (cal == '') {
			alertCount++;
		}
		if (alertCount>0){
			document.getElementById("SubmitButton1").disabled = true;
			document.getElementById("SubmitButton2").disabled = true;
		}
				
	}
	function Enable() {
		document.getElementById("SubmitButton1").disabled = false;
		document.getElementById("SubmitButton2").disabled = false;
	}
	function reportDivData() {
		var scanError = '';
		var titleError = '';
		var firstNameError = '';
		var thirdNameError = '';
		var dateError = '';
		var rankError = '';
		var alertCount = 0;
		var scanThumbError = '';
		scanError = document.getElementById("somediv").textContent;
		var m = document.getElementById("reportDiv");
		m.style.display = "block";
		var title = document.getElementById("titleName").value;
		if (title == 'SELECT') {
			alertCount++;
			if (alertCount == 1) {
				titleError = " Title";
			} else {
				titleError = " , Title";
			}
		}
		var firstName = document.getElementById("firstName").value;
		if (firstName == '') {
			alertCount++;
			if (alertCount == 1) {
				firstNameError = " First Name";
			} else {
				firstNameError = " , First Name";
			}
		}
		if (scanError == '' || scanError == 'unsuccessful...! try again') {
			//alertCount++;
			scanThumbError = ' ,Press Your Thumb';
		}
		var secondName = document.getElementById("secondName").value;
		var thirdName = document.getElementById("thirdName").value;
		if (thirdName == '') {
			//alertCount++;
			if (alertCount == 1) {
				thirdNameError = " Family Name";
			} else {
				thirdNameError = " , Family Name";
			}
		}
		var date = $("#datePicker").datepicker({
			dateFormat : 'dd,MM,yyyy'
		}).val();
		if (date == '') {
			alertCount++;
			if (alertCount == 1) {
				dateError = " Date";
			} else {
				dateError = " , Date";
			}
		}
		var rank = document.getElementById("rankPicker").value;
		if (rank == 'SELECT') {
			alertCount++;
			if (alertCount == 1) {
				rankError = " Rank";
			} else {
				rankError = " , Rank";
			}
		}

		if (alertCount > 0) {
			var alertData = 'Please Enter ' + titleError + firstNameError
					+ thirdNameError + dateError + rankError + scanThumbError;
			jQuery('#alertDiv').html('');
			document.getElementById("alertDiv").innerHTML += '<center style="color:red; font-size:18px;">'
					+ alertData + '</center>';
		} else {

			var reportHtml = '<div class="col-sm-12 " style="margin-top:50px">'
					+ '<div class="col-sm-2"></div>'
					+ '<div class="col-sm-8" style="background-color:#92C3DF; margin-top:20px">'
					+ '<div class="col-sm-4 ">'
					+ '<center style="margin-top:20px;"><img src="images/logo.png"; height="100px"/></center>'
					+ '</div>'
					+ '<div class="col-sm-8">'
					+ '<div class="col-sm-12 "style="margin-top:20px"><div class="col-sm-12">'
					+ title
					+ ' '
					+ firstName.toUpperCase()
					+ ' '
					+ secondName.toUpperCase()
					+ ' '
					+ thirdName.toUpperCase()
					+ '</div></div>'

					+ '<div class="col-sm-12">'
					+ '<div class="col-sm-6">SIGN ON DATE </div><div class="col-sm-6">: '
					+ date
					+ '</div></div>'

					+ '<div class="col-sm-12"><div class="col-sm-6">THUMB IMPRESSION </div><div class="col-sm-6">: SUCCESS</div></div>'

					+ '<div class="col-sm-12"><div class="col-sm-6">RANK </div><div class="col-sm-6">: '
					+ rank
					+ '</div></div>'
					+ '<div class="col-sm-12">'
					+ '<ul class="pager"><li><a href="javascript:goBackAction()">GO BACK</a></li>'
					+ '</div></div><div class="col-sm-2"></div></div></div></div>';
			document.getElementById("reportDiv").innerHTML = reportHtml;
			var p = document.getElementById("mainDiv");
			p.style.display = "none";
			var q = document.getElementById("alertDiv");
			q.style.display = "none";

		}

	}
</script>
<script>
	function goBackAction() {
		var p = document.getElementById("mainDiv");
		p.style.display = "block";
		var q = document.getElementById("reportDiv");
		q.style.display = "none";
	}
	function submitData() {
		location.reload();
	}
</script>
<script>
	var editRight = 1;
	var totalEmployee = 25;
	var userData = [
<%=retrieve_title%>
	, ];
	for (var i = 0; i < totalEmployee; i++) {
		var empID = "signofButton" + i;
		if (editRight > 0) {
			var employeeDataManagement = '<div class="col-sm-12" style="margin-top:10px;">'
					+ '<div class="col-sm-1"><center>'
					+ (i + 1)
					+ '</center></div>'
					+ '<div class="col-sm-2" style="padding-top:15px;">'
					+ userData[i][0]
					+ '</div>'
					+ '<div class="col-sm-2" style="padding-top:15px;">'
					+ userData[i][1]
					+ '</div>'
					+ '<div class="col-sm-2" style="padding-top:15px;">'
					+ userData[i][2]
					+ '</div>'
					+ '<div class="col-sm-1"><img src="images/'+userData[i][3]+'" height="50px" width="70px"/></div>'
					+ '<div class="col-sm-2" style="padding-top:15px;">'
					+ '<a href="#"><button id="'
					+ empID
					+ '" onclick=futureMethod("'
					+ empID
					+ '","'
					+ i
					+ '");> DELETE</button</a>'
					+ '</div><div class="col-sm-1"></div></div>';
			document.getElementById("mainContainer").innerHTML += employeeDataManagement;
		} else {
			var employeeDataManagement = '<div class="col-sm-12" style="margin-top:10px;">'
					+ '<div class="col-sm-1"><center>'
					+ (i + 1)
					+ '</center></div>'
					+ '<div class="col-sm-2" style="padding-top:15px;">'
					+ userData[i][0]
					+ '</div>'
					+ '<div class="col-sm-2" style="padding-top:15px;">'
					+ userData[i][1]
					+ '</div>'
					+ '<div class="col-sm-2" style="padding-top:15px;">'
					+ userData[i][2]
					+ '</div>'
					+ '<div class="col-sm-1"><img src="images/'+userData[i][3]+'" height="50px" width="70px"/></div>'
					+ '<div class="col-sm-2"></div></div>';
			document.getElementById("mainContainer").innerHTML += employeeDataManagement;
		}

	}
</script>
</html>