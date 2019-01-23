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

	$(document).on("click", "#scanButton", function() {

		readyForScan();
		$("#somediv").text("Place your thumb on the sensor");
		document.getElementById("somediv").style.color = "blue";
		$.get("CreateUser", function(responseText) {
			$("#somediv").text(responseText);
			if ('unsuccessful...! try again' == document

			.getElementById("somediv").textContent) {

				document.getElementById("somediv").style.color = "red";

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
</style>
</head>
<body style="background-color: white">
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
	<div class="col-sm-12" id="alertDiv"
		style="margin-top: 10px; height: 20px;"></div>
	<div id="mainDiv">
		<form action="SaveUserDetails" method="get" id="abc">
			<div class="col-sm-12" style="margin-top: 20px;">
				<div class="col-sm-2" style="height: 60px;"></div>
				<div class="col-sm-8 ">
					<div class="col-sm-4">
						TITLE
						<div class="col-sm-9" style="float: right">
							<select name="title" id="titleName">
								<option>SELECT</option>
								<option>CAPT.</option>
								<option>MR.</option>
								<option>MS.</option>
							</select>
						</div>
					</div>
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<div class="col-sm-12" id="profilediv">
							<img src="images/logo.png" ; height="50px" ; width="80px">
						</div>
						
						<div class="col-sm-12" id="prfilebutton">
								<button type="button"  id="photoButtonphotoButtoninfo" class="btn btn-info"
								style="color: black; font-weight: bold;" onclick="showProfilePicture()">PHOTO</button>								
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="col-sm-12" style="margin-top: 30px;">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div class="col-sm-4 ">FIRST NAME</div>
					<div class="col-sm-4 ">MIDDLE NAME</div>
					<div class="col-sm-4 ">FAMILY NAME</div>
					<div class="col-sm-4 ">
						<input type="text" name="firstName" id="firstName" onkeyup="this.value = this.value.toUpperCase();"/>
					</div>
					<div class="col-sm-4">
						<input type="text" name="secondName" id="secondName" onkeyup="this.value = this.value.toUpperCase();"/>
					</div>
					<div class="col-sm-4">
						<input type="text" name="thirdName" id="thirdName" onkeyup="this.value = this.value.toUpperCase();"	/>
					</div>
					<!-- <input type="submit" value="submit"> -->
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="col-sm-12" id="completeLine">
				<div class="col-sm-2"></div>
				<div class="col-sm-8 ">
					<div class="col-sm-4 ">SIGN ON DATE</div>
					<div class="col-sm-4 "></div>
					<div class="col-sm-4 "></div>
					<div class="col-sm-4">
						<input class="form-control" id="datePicker" name="sign_On_date"
							placeholder="DD/MM/YYY" type="text" />
					</div>
					<div class="col-sm-4"></div>
					<div class="col-sm-4 "></div>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="col-sm-12" id="completeLine">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div class="col-sm-4 ">THUMB IMPRESSION</div>
					<div class="col-sm-4 "></div>
					<div class="col-sm-4 "></div>
					<div class="col-sm-4">
						<div onmouseover="scanDisable()" style="width: 100px;">
							<button type="button" id="scanButton" class="btn btn-info"
								style="color: black; font-weight: bold;">SCAN</button>
						</div>						
					</div>
					<div class="col-sm-4"></div>
					<div class="col-sm-4 " id="somediv" style="font-size:15px;"></div>
				</div>
				<div class="col-sm-2"></div>
			</div>			
			<div class="col-sm-12" id="completeLine">
				<div class="col-sm-2"></div>
				<div class="col-sm-8 ">
					<div class="col-sm-4 ">RANK</div>
					<div class="col-sm-4 ">
						<select name="rank" id="rankPicker">
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
					<div class="col-sm-4">
						<div onmouseover="Disable()" onmouseleave="Enable()"
							style="width: 150px;">
							<div class="col-sm-6">
								<button type="button" id="SubmitButton1" class="btn btn-info"
									style="color: black; font-weight: bold;"
									onclick="reportDivData()">VIEW</button>
							</div>
							<div class="col-sm-6">
								<button type="submit" id="SubmitButton2" class="btn btn-info"
									style="color: black; font-weight: bold; margin-right: 20px">SUBMIT</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</form>
	</div>
	<div class="col-sm-12" id="alertDiv" id="completeLine"></div>
	<div id="reportDiv"></div>
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
		if (alertCount > 0) {
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
</html>