<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="abc123blahblahauthenticitytoken" name="csrf-token">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Da Vinci Institute Bokaro</title>
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
     <script src="${pageContext.request.contextPath}/jquery/jquery-1.10.2.js"></script>
  <script src="${pageContext.request.contextPath}/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/jquery/jquery-1.11.3.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
</head> 
<c:set var="count" value="1" scope="page" />
<jsp:include page ="../jsp/header.jsp"/>
<style>
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 24px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ef4d3b;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 16px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #6cc63f;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
#tableHeading th{
text-align: center;
}
</style>
<body>
<div>
	<%-- <h4><a href="${pageContext.request.contextPath}/registration">Condidate Registration</a></h4>
	</div>	
	<div style="padding-left:200px;margin-top:-28px;">
	<h4><a href="${pageContext.request.contextPath}/registration">Student List</a></h4> --%>
	<ul class="nav nav-pills" style="margin-top:60px">
      <li role="presentation"><a href="${pageContext.request.contextPath}/admin/registration">CANDIDATE REGISTRATION</a></li>
      <li role="presentation"><a href="${pageContext.request.contextPath}/admin/candidateList">CANDIDATE LIST</a></li>
      <li role="presentation"><a href="${pageContext.request.contextPath}/admin/questionPage">TEST PAPER</a></li>
      <li role="presentation"><a href="${pageContext.request.contextPath}/admin/questionForm">QUESTION FORM</a></li>
      <li role="presentation"><a href="${pageContext.request.contextPath}/admin/questionPaper">QUESTION PAPER</a></li>
      <li role="presentation"><a href="#" id="resultList">CANDIDATE RESULT</a></li>
      <li style="padding-top:5px;padding-right:50px;" class="button red big pull-right">
		<!-- <span id="cd_h">00</span>:
	    <span id="cd_m">00</span>:
	    <span id="cd_s">00</span> -->
	  </li>
    </ul>
</div>
	<div style="display:none;">
	    <!-- <input type="button" value="Start" id="cd_start" /> --> 
	    <input type="text" value="15" id="cd_seconds"/>
	</div>
	<hr>
	<div id = "asd">
	<c:choose>
		<c:when test="${mode == 'MODE_REGISTRATION'}">
			<c:choose>
				<c:when test="${msg == 'MODE_ERROR'}">
					<div class="container">
						 <div class="alert alert-danger">
						    <strong><c:out value="${message}"></c:out></strong>
						  </div>
					</div>
		  		</c:when>
				  <c:when test="${msg == 'MODE_SUCCESS'}">
				  <div class="container">
					 <div class="alert alert-success">
					    <strong><c:out value="${message}"></c:out></strong>
					  </div>
					  </div>
				  </c:when>
		  </c:choose>
			<div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title" id="myModalLabel">Registration Form</h4>
			      </div>
			      <div class="modal-body">
			        <form class="form-horizontal" method ="post" action="${pageContext.request.contextPath}/admin/candidateRegistration">
						<!-- Text input-->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="email">Username:</label>  
						  <div class="col-md-6">
						  <input id="username" name="username" type="text" placeholder="Enter your username" class="form-control input-md" >
						    
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="name">Name:</label>  
						  <div class="col-md-6">
						  <input id="name" name="fullname" type="text" placeholder="Enter your name" class="form-control input-md" >
						    
						  </div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="email">Email:</label>  
						  <div class="col-md-6">
						  <input id="email" name="email" type="text" placeholder="Enter your email id" class="form-control input-md" >
						    
						  </div>
						</div>
						
						<!-- Password input-->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="password">Password:</label>
						  <div class="col-md-6">
						    <input id="password" name="password" type="password" placeholder="Enter your password" class="form-control input-md validate[required]" >
						    
						  </div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="contact">Confirm Password:</label>  
						  <div class="col-md-6">
						  <input name="confirmPassword" type="password" placeholder="Enter your confirm password." class="form-control input-md validate[required,equals[password]]" >
						    
						  </div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="contactNumber">Contact Number:</label>  
						  <div class="col-md-6">
						  <input id="contactNumber" name="contactNumber" type="text" placeholder="Enter your Contact Number" class="form-control input-md">
						    
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="education">Gender:</label>  
						  <div class="col-md-6">
						  Male&nbsp;<input id="male" name="gender" type="radio" value="m">&nbsp;&nbsp;&nbsp;
						    Female&nbsp;<input id="female" name="gender" type="radio" value="f">
						  </div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="dist">Institute:</label>  
						  <div class="col-md-6">
						  <input id="collage" name="institute" type="text" placeholder="Enter your Institute Name" class="form-control input-md" >
						    
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" for="email">Heighest Qualification:</label>  
						  <div class="col-md-6">
						   <select id="qual" name="qualification" class="form-control" onchange="myFunction()">
						      <option value="none" selected>----------------Select----------------</option>
						      <option value="BE">BE</option>
						      <option value="B.Tech">B.Tech</option>
						      <option value="BCA">BCA</option>
						      <option value="MCA">MCA</option>
						      <option value="MBA">MBA</option>
						      <option value="M.Tech">M.Tech</option>
						    </select>
						  </div>
						</div>
						
						<!-- Select Basic -->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="state">State:</label>
						  <div class="col-md-6">
						    <select id="state" name="state" class="form-control" onchange="myFunction()">
						      <option value="none" selected>----------------Select----------------</option>
						      <option value="UtterPradesh">Utter Pradesh</option>
						      <option value="Bihar">Bihar</option>
						      <option value="MadhayPradesh">Madhya Pradesh</option>
						      <option value="Rajhasthan">Rajasthan</option>
						      <option value="Bangol">Bangol</option>
						      <option value="Jharkhand">Jharkhanad</option>
						      <option value="Chhatisgarh">Chhatisgarh</option>
						      <option value="Odisa">Odisa</option>
						      <option value="Karnataka">Karnataka</option>
						      <option value="Tamilnadu">Tamilnadu</option>
						      <option value="Delhi">Jharkhanad</option>
						      <option value="Maharastra">Maharastra</option>
						    </select>
						  </div>
						</div>
						
						<!-- Select Basic -->
						<div class="form-group">
						  <label class="col-md-4 control-label" for="city">City:</label>
						  <div class="col-md-6">
						    <select id="city" name="city" class="form-control">
						      <option value="none" selected>----------------Select----------------</option>
						      <option value="Jaunpur">Jaunpur</option>
						      <option value="Lucknow">Lucknow</option>
						      <option value="Allahabad">Allahabad</option>
						      <option value="Amethi">Amethi</option>
						      <option value="Azamgarh">Azamgarh</option>
						      <option value="Patna">Patna</option>
						      <option value="Varanasi">Varanasi</option>
						      <option value="Chandauli">Chandauli</option>
						      <option value="Gorakhpur">Gorakhpur</option>
						      <option value="Kanpur">Kanpur</option>
						      <option value="Hardoi">Hardoi</option>
						      <option value="Rachi">Rachi</option>
						      <option value="Bokaro">Bokaro</option>
						      <option value="Champaran">Champaran</option>
						      <option value="Jhabua">Jhabua</option>
						      <option value="Raipur">Raipur</option>
						      <option value="Hyderabad">Hyderabad</option>
						      <option value="Mumbai">Mumbai</option>
						      <option value="Chennai">Chennai</option>
						      <option value="Indor">Indor</option>
						      <option value="Bangalore">Bangalore</option>
						    </select>
						  </div>
						</div>
						<div class="modal-footer">
							 <input type="submit" class="btn btn-primary" value="Register"/>
							 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</div>
						<p id="demo"></p>
			      </form>
			    </div>
			  </div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_QUESTIONFORM'}">
			<form action="${pageContext.request.contextPath}/submitForm" modelAttribute="questionForm" method="post">
	            <div class="slide active-slide first">
				    <div class="content">
				        <div class="bix-div-container" style="padding-left:40px;">
					            	<table class="bix-tbl-container" width="100%" border="0">
							            <tbody>
								            <tr>
								                <td class="bix-td-qno" rowspan="2" valign="top" align="left">1.&nbsp;</td>
								                <td class="bix-td-qtxt" valign="top"><p>A person crosses a 600 m long street in 5 minutes. What is his speed in km per hour?</p></td>
								            </tr>
								            <tr>
								                <td class="bix-td-miscell" valign="top"><table class="bix-tbl-options" id="tblOption_434" cellspacing="0" cellpadding="0" width="100%" border="0">
								                <tbody>
								                <tr>
								                 <td class="bix-td-option" id="tdOptionNo_A_434" width="1%">
								                 <input class="result-option cls_264" id="optionAns_A_264" type="checkbox"/></td>
								                 <td class="bix-td-option" id="tdOptionDt_A_434" width="99%">&nbsp;&nbsp;3.6</td></tr><tr><td class="bix-td-option" id="tdOptionNo_B_434" width="1%">
								                 <input class="result-option cls_264" id="optionAns_A_264" type="checkbox"/></td>
								                 <td class="bix-td-option" id="tdOptionDt_B_434" width="99%">&nbsp;&nbsp;7.2</td></tr><tr><td class="bix-td-option" id="tdOptionNo_C_434" width="1%">
								                 <input class="result-option cls_264" id="optionAns_A_264" type="checkbox"/></td>
								                 <td class="bix-td-option" id="tdOptionDt_C_434" width="99%">&nbsp;&nbsp;8.4</td></tr><tr><td class="bix-td-option" id="tdOptionNo_D_434" width="1%">
								                 <input class="result-option cls_264" id="optionAns_A_264" type="checkbox"/></td>
								                 <td class="bix-td-option" id="tdOptionDt_D_434" width="99%">&nbsp;&nbsp;10</td></tr></tbody></table><input class="jq-hdnakq" id="hdnAnswer_434" value="B" type="hidden">
								                </td>
								            </tr>
							            </tbody>
						            </table>
						            <div  style="padding-left:40px; padding-top:10px;">
						            <input type="submit" class="btn btn-primary" value="NEXT"/>
						            </div>
					            </div>
				    </div>
				</div>
				<div class="slide">
				    <div class="content">
				       <div class="bix-div-container" style="padding-left:40px;">
			            	<table class="bix-tbl-container" width="100%" border="0">
					            <tbody>
						            <tr>
						                <td class="bix-td-qno" rowspan="2" valign="top" align="left">2.&nbsp;</td>
						                <td class="bix-td-qtxt" valign="top"><p>A person crosses a 600 m long street in 5 minutes. What is his speed in km per hour?</p></td>
						            </tr>
						            <tr>
						                <td class="bix-td-miscell" valign="top"><table class="bix-tbl-options" id="tblOption_434" cellspacing="0" cellpadding="0" width="100%" border="0">
						                <tbody>
						                <tr>
						                 <td class="bix-td-option" id="tdOptionNo_A_434" width="1%">
						                 <input class="result-option cls_264" id="optionAns_A_264" type="checkbox"/></td>
						                 <td class="bix-td-option" id="tdOptionDt_A_434" width="99%">&nbsp;&nbsp;3.6</td></tr><tr><td class="bix-td-option" id="tdOptionNo_B_434" width="1%">
						                 <input class="result-option cls_264" id="optionAns_A_264" type="checkbox"/></td>
						                 <td class="bix-td-option" id="tdOptionDt_B_434" width="99%">&nbsp;&nbsp;7.2</td></tr><tr><td class="bix-td-option" id="tdOptionNo_C_434" width="1%">
						                 <input class="result-option cls_264" id="optionAns_A_264" type="checkbox"/></td>
						                 <td class="bix-td-option" id="tdOptionDt_C_434" width="99%">&nbsp;&nbsp;8.4</td></tr><tr><td class="bix-td-option" id="tdOptionNo_D_434" width="1%">
						                 <input class="result-option cls_264" id="optionAns_A_264" type="checkbox"/></td>
						                 <td class="bix-td-option" id="tdOptionDt_D_434" width="99%">&nbsp;&nbsp;10</td></tr></tbody></table><input class="jq-hdnakq" id="hdnAnswer_434" value="B" type="hidden">
						                </td>
						            </tr>
					            </tbody>
				            </table>
				            <div  style="padding-left:40px; padding-top:10px;">
				            	<input type="submit" class="btn btn-primary" value="NEXT"/>
				            </div>
			            </div>
				    </div>
				</div>
				<div class="slide last">
				    <div class="content">
				       <div class="bix-div-container" style="padding-left:40px;">
					            	<table class="bix-tbl-container" width="100%" border="0">
							            <tbody>
								            <tr>
								                <td class="bix-td-qno" rowspan="2" valign="top" align="left">3.&nbsp;</td>
								                <td class="bix-td-qtxt" valign="top"><p>A person crosses a 600 m long street in 5 minutes. What is his speed in km per hour?</p></td>
								            </tr>
								            <tr>
								                <td class="bix-td-miscell" valign="top"><table class="bix-tbl-options" id="tblOption_434" cellspacing="0" cellpadding="0" width="100%" border="0">
								                <tbody>
								                <tr>
								                 <td class="bix-td-option" id="tdOptionNo_A_434" width="1%">
								                 <input class="result-option cls_264" id="optionAns_A_264" type="checkbox"/></td>
								                 <td class="bix-td-option" id="tdOptionDt_A_434" width="99%">&nbsp;&nbsp;3.6</td></tr><tr><td class="bix-td-option" id="tdOptionNo_B_434" width="1%">
								                 <input class="result-option cls_264" id="optionAns_A_264" type="checkbox"/></td>
								                 <td class="bix-td-option" id="tdOptionDt_B_434" width="99%">&nbsp;&nbsp;7.2</td></tr><tr><td class="bix-td-option" id="tdOptionNo_C_434" width="1%">
								                 <input class="result-option cls_264" id="optionAns_A_264" type="checkbox"/></td>
								                 <td class="bix-td-option" id="tdOptionDt_C_434" width="99%">&nbsp;&nbsp;8.4</td></tr><tr><td class="bix-td-option" id="tdOptionNo_D_434" width="1%">
								                 <input class="result-option cls_264" id="optionAns_A_264" type="checkbox"/></td>
								                 <td class="bix-td-option" id="tdOptionDt_D_434" width="99%">&nbsp;&nbsp;10</td></tr></tbody></table><input class="jq-hdnakq" id="hdnAnswer_434" value="B" type="hidden">
								                </td>
								            </tr>
							            </tbody>
						            </table>
						            <div  style="padding-left:40px; padding-top:10px;">
						            <input type="submit" class="btn btn-primary" value="NEXT"/>
						            </div>
					            </div>
				    </div>
				</div>
				<div class="slider-nav">
				    <div class="prev">prev</div>
				    <div class="next">next</div>
				</div>
            </form>
		</c:when>
		<c:when test="${mode == 'MODE_CADIDATELIST'}">
		<div class="container text-center" id="tasksDiv">
			<div class="table-responsive">
					<table class="table table-striped table-bordered text-left table-hover">
						<thead>
							<tr class="info" id="tableHeading">
								<th>S.No</th>
								<th>Name</th>
								<th>Contact Number</th>
								<th>Heighest Qualification</th>
								<th>Institute</th>
								<th>Enable/Disable</th>
								<th>Update</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody align="center">
							<c:forEach var="candidate" items="${candidateList}" varStatus="i">
								<tr>
								<%-- <input type="hidden" name="${candidate.id}" id = "candidateId${candidate.id}" />
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
									<td><c:out value="${count}" /></td>
									<c:set var="count" value="${count+1}" scope="page" />
									<td><a href ="#" id="name" style="text-decoration: none;">${candidate.fullname}</a></td>
									<td>${candidate.contactNumber}</td>
									<td>${candidate.qualification}</td>
									<td>${candidate.institute}</td>
									<td>
									<c:choose>
											<c:when test="${candidate.isEnabled == true}">
												<label class="switch">
												  <input type="checkbox" checked="checked" id="check" name="${candidate.id}" onClick="divFunction(this.name)" />
												  <div class="slider"> </div>
												</label>
									  		</c:when>
											  <c:otherwise>
												  <label class="switch">
													  <input type="checkbox" id="check" name="${candidate.id}" onClick="divFunction(this.name)" />
													  <div class="slider"> </div>
												  </label>
											  </c:otherwise>
									  </c:choose>
									</td>
									<td><a href="${pageContext.request.contextPath}/admin/updateCandidate?id=${candidate.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="${pageContext.request.contextPath}/admin/deleteCandidate?id=${candidate.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
	</c:choose>
	</div>
	<div id="abc">  
			
	</div>	
</body>
<script type="text/javascript">
 function divFunction(candidateId){
	 var candidateId = candidateId;
        if ($("#check").is(":checked")) {
          $.ajax({
              url: '${pageContext.request.contextPath}/admin/permission?id='+candidateId,
              type: 'GET',
              date: "id="+candidateId,
              headers: {"Authorization": localStorage.getItem('token')},
              success: function (data){
              	 $("#check").attr("checked","checked");
               }
          });
        }else{
        	 $.ajax({
                 url: '${pageContext.request.contextPath}/admin/permission?id='+candidateId,
                 type: 'GET',
                 date: "id="+candidateId,
                 headers: {"Authorization": localStorage.getItem('token')},
                 success: function (data){
                	 $("#check").removeAttr("checked","checked");
                  }
             });
        }
    }

</script>
<script type="text/javascript">
$(document).ready(function() { 
	/* $("#pkg").hide();
    $("#name").click(function(){
        $("#pkg").toggle();
    }); */
	 $("#cd_start").click(); 
	 $("#resultList").click(function(){
		 $.ajax({
             url: '${pageContext.request.contextPath}/admin/testResult',
             type: 'GET',
             success: function (data){
            	 $("#asd").attr("style","display:none;"); 
            	 $("#abc").html(data);
              }
         });
	    });
	});
</script>

<!-- <script type="text/javascript">
$(document).ready(function() { 
	function checkNavigation() {

	    if ($('.active-slide').hasClass('first')) {
	        $('.prev').hide();
	        $('.next').show();
	    } else if ($('.active-slide').hasClass('last')) {
	        $('.next').hide();
	        $('.prev').show();
	    } else {
	        $('.prev').show();
	        $('.next').show();
	    }

	}

	var main = function () {
	    checkNavigation();
	    
	    $('.next').click(function () {
	        
	        var currentSlide = $('.active-slide');
	        var nextSlide = currentSlide.next('.slide');

	        //if nextslide is last slide, go back to the first
	        if (nextSlide.length === 0) {
	            nextSlide = $('.slide').first();
	        }

	        currentSlide.fadeOut(500).removeClass('active-slide');
	        nextSlide.fadeIn(1100).addClass('active-slide');

	        checkNavigation();
	    });

	    //prev slide function
	    $('.prev').click(function () {
	        var currentSlide = $('.active-slide');
	        var prevSlide = currentSlide.prev('.slide');

	        if (prevSlide.length === 0) {
	            prevSlide = $('.slide').last();
	        }

	        currentSlide.fadeOut(600).removeClass('active-slide');
	        prevSlide.fadeIn(600).addClass('active-slide');
	         checkNavigation();
	    });
	   

	};

	$(document).ready(main);
});
</script> -->

</html>