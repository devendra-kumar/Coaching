<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html><head>
<meta charset="UTF-8">
<title>DVI Online Test</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="Freeonline test">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/testPaper/style.css">
<script src="${pageContext.request.contextPath}/testPaper/jquery-1.8.1.min.js" type="text/javascript"></script>
   <script src="${pageContext.request.contextPath}/testPaper/script.js" type="text/javascript"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/testPaper/nav-rs.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/testPaper/responsive.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/practice1.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/practice2.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/practice3.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/practice.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/instruction.css">
	<link rel="icon" href="${pageContext.request.contextPath}/images/logo.png" type="image/gif">
<style type="text/css">
.cop1 {
  width: 250px;
  height: auto;
  margin-left: 220px;
  float: left;

}
/* Social - footer
========================== */

ul.social-networks {
  overflow: hidden;
  margin: 0px 0 0 0px;
  padding: 0 0 0 0px;
  float:right;

}
ul.social-networks li {
  float: left;
  margin: 20px 1px 0;
  list-style: none;
  border: none;
}

.icon-twitter a, .icon-facebook a, .icon-pinterest a, .icon-linkedin a, .icon-flickr a, .icon-dribbble a {
  float: left;
  background: url(http://www.freeonlinetest.in/images/social-sprite.png) no-repeat left bottom;
  text-indent: 8000px;
  width: 40px;
  height: 30px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
.icon-twitter a:hover, .icon-facebook a:hover, .icon-pinterest a:hover, .icon-linkedin a:hover, .icon-flickr a:hover, .icon-dribbble a:hover {
  background: url(images/social-sprite.png) no-repeat left top;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.icon-facebook, .icon-facebook a {
  background-position: -120px top;
}
.icon-facebook a:hover {
  background-position: -120px bottom;
}
.icon-twitter, .icon-twitter a {
  background-position: -80px top;
}
.icon-twitter a:hover {
  background-position: -80px bottom;
}
.icon-dribbble, .icon-dribbble a {
  background-position: -40px top;
}
.icon-dribbble a:hover {
  background-position: -40px bottom;
}
.icon-linkedin, .icon-linkedin a {
  background-position: 0px top;
}
.icon-linkedin a:hover {
  background-position: 0px bottom;
}
.mrq{
width:100%;
float:left;
color:#f30;font-size:small;
}
.wd60{
width:78% !important; float:left;margin:7px 0 0 0 !important;
}

</style>
 <script type="text/javascript">
    $(function () {
      $(document).bind('contextmenu',function(e){
        e.preventDefault();
       
      });
    });
  </script>
</head>
<body>
<div id="top-header" class="tb-main-header js-banner-height-offset" style="margin-top: 0px;background: #333;">
	<div class="form-group pull-left" style="margin-top:-10px;">
		<a href="${pageContext.request.contextPath}/admin/registration" class="navbar-brand"><h3><c:out value="${pageContext.request.remoteUser}"></c:out></h3></a>
		<!-- <a href="/admin/registration"><img alt="" src="/images/logo.png" height="42" width="42"></a> -->
	</div>
	<div class="">
		<div style="padding-top:8px;">
		<form action="${pageContext.request.contextPath}/logout" method="post">
			<input type="submit" class="btn btn-primary pull-right" value="Sign Out" id=signout /> 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		</div>
	</div>
</div>
<div id="wrp">
  <div class="inr">
    <div class="inr">
      <div id="headar" style="padding-top: 60px;">
        <div class="logo"><a href="#"><img src="${pageContext.request.contextPath}/images/logo2.png" alt="image" width="120" height="60"></a></div>
   <div class="wd60">
</div>
    </div>
  </div>
  </div>
  </div>
    <script type="text/javascript">
    var paperNo="jh";
    var qTimerNo =1;
    var questionTimer;
      function loading_show(){
      $('#loading').html("<img src='http://www.freeonlinetest.in/images/loading.gif'/>").fadeIn('fast');
        }
        function loading_hide()
    {
            $('#loading').fadeOut('fast');
        }          
  
  $('#container .pagination li.q_pagin').live({click : function(){
    
            var page = parseInt($(this).attr('qno'));
      //alert(page);
            var qq = parseInt($('.question_dv:visible').attr('qno'));
      sam(qq,page); 
            
        }});           
      
</script>
    <script type="text/javascript">
$('[id^="next"]').live({
  click:function(){
    var qno =parseInt($(this).attr('qno'));
    $('#question_inc').html(qno+1);
    sam(qno,qno+1);
    }
  });
  $('[id^="prev"]').live({
  click:function(){
    
    var qno =parseInt($(this).attr('qno'));
    
    $('#question_inc').html(qno-1);
    $('#container .pagination li.q_pagin').eq(qno-1).addClass('q_skipped');
    sam(qno,qno-1);
    }
  });
  $('[id^="answec"]').live({
  click:function(){
    
    var qno =parseInt($(this).attr('qno'));
    $('#question_inc').html(qno);
    sam(qno,false);
    }
  });
  questionTimer = setInterval(function(){
    var tme = parseInt($('#time'+qTimerNo).val())+1;
    $('#time'+qTimerNo).val(tme)
    },998)
  function sam(qno,qnext)
  {
    var aid = 0;
    if($("input:radio[name=answec"+qno+"]:checked").length>0)
    aid = $("input:radio[name=answec"+qno+"]:checked").val();
    var qid = $('#quesoid'+qno).val();
    var caid = $('#cansid'+qno).val();
    var tme = $('#time'+qno).val();
    var llen = $('.question_dv').length;
    
    //alert(aid);
    if(aid!=0)
    {
     $('#container .pagination li.q_pagin').eq(qno-1).addClass('q_attempt');
    }
    
    
  
    if(qnext!==false)
    {
      $('.total i').html(qnext);
    qTimerNo = qnext;

    if(qnext>qno)
    {
      sam(qno,false);
        $('#container .pagination li.q_pagin').eq(qno-1).addClass('q_skipped');
        
        $('#question_inc').html(qno+1);

    }
    if(qnext<qno)
    {
        sam(qno,false);
        $('#container .pagination li.q_pagin').eq(qno-1).addClass('q_skipped');
        //alert(k);
        $('#question_inc').html(qno-1);
      
    }
  
  //alert('ss');
    $('.question_dv').eq(qno-1).fadeOut(100,function(){
      $('#question_inc').html(qnext);
      $('.question_dv').eq(qnext-1).fadeIn()
    }); 
  }
  }
</script>
    <style type="text/css">
.common_data, .img-s,/* .pagination */{
  float: left;
  width: 100%;
}
.q_dv  {
  width: 100%;
  float: left;
}
.ans_dv{
  width: 72%;
  float: left;
}
.q_pagin {
  background-color: #000000;
}
.q_skipped {
  background-color: #FF0000;
}
.q_attempt {
  background-color: #006600;
}
.wd60{
width:100%;
float: left;

}
</style>

<form name="myForm" id="myForm" target="" action="${pageContext.request.contextPath}/user/testResult" method="post">
  <input type="hidden" value="" name="answersjson" id="answersjson">
      <div id="wrp">
      	<div class="inr">
    		<div class="inr"> 
          		<div id="headar">
           			<div class="mn_hd">
        				<div class="q-lft-u" style="width:100%;background: #f5f8fa">
              				<div>Questions <span id="question_inc" style="color:#F00; font-weight:600;">1</span> of <c:out value="${totalQuestion }"></c:out></div>
                         </div>
				    </div>
		        </div>
        	</div>
  		</div>
        <div class="inr">
  	      <div class="inr-content" style="border:solid 1px #ccc;">
    		  <div class="admin">
      			<div id="question">
      				<div class="q-lft">
      					<div class="q-lft-n">
            				<div id="container">
							      <input type="hidden" id="paperNo" name="paperNo" value="2">
							      <input type="hidden" id="subCatName" name="subCatName" value="3">
							      <input type="hidden" id="catName" name="catName" value="2">
							      <input type="hidden" id="qesId" name="catName" value="">
							      <input type="hidden" id="selectedans" name="selectedans" value="">
							      <input type="hidden" id="fullData" name="fullData" value="">
							      <input type="hidden" name="question_name" value="">
      								<div style="float:left; width:100%; margin-bottom:50px">
    									<input type="hidden" name="total_question" value="${totalQuestion}"> 
    									<input type="hidden" name="question_ids[]" value="1562">
 										<input type="hidden" name="correct_anss[1562]" value="4">
 <c:forEach var="question" items="${questionList}" varStatus="status">
    <div class="question_dv" qid="${question.id}" qno="${status.count}" style="display:none; "id="qno${status.count}">
         <div class="common_data">
			<p><span style="color: #ff0000;"><strong>Simplefication :</strong></span></p>
				<p>&nbsp;</p>
					</div>
   				<div class="q_dv">
				 <table>
					<tbody>
						<tr>
					        <td align="left" valign="top"><p>${status.count}).</p></td>
					        <td align="left" valign="top" class="questionData">
							<p><strong>${question.question}</strong></p>
							</td>
						</tr>
				</table>
			</div>
				<div class="ans_dv">
			<c:choose>
				<c:when test="${question.correctAnswer ne question.answer1}">
					 <table class="options" width="100%" border="0" cellspacing="0" cellpadding="0">
			              <tbody><tr>
			            <td width="4%" valign="top"><input type="radio" name="answec${status.count}" qno="${status.count}" id="answec${status.count}_1" value="1"></td>
			            <td width="96%" valign="top"><p style="width:100%; margin:0px; padding:0px 0px 20px 0px; font:normal 13px Ebrima, Arial, Helvetica, sans-serif;">
			            <span style="color:#00F; font-size:14px;  font-family:Embrima;">A) </span>
					      <span class="answerData">${question.answer1}</span>
					      </p></td>
			          </tr>
			            </tbody></table>
				</c:when>
				<c:otherwise>
				<input type="hidden" class="curr_ans" value="1">
					 <table class="options" width="100%" border="0" cellspacing="0" cellpadding="0">
			              <tbody><tr>
			            <td width="4%" valign="top"><input type="radio" name="answec${status.count}" qno="${status.count}" id="answec${status.count}_1" value="1"></td>
			            <td width="96%" valign="top"><p style="width:100%; margin:0px; padding:0px 0px 20px 0px; font:normal 13px Ebrima, Arial, Helvetica, sans-serif;">
			            <span style="color:#00F; font-size:14px;  font-family:Embrima;">A) </span>
					      <span class="answerData correctData">${question.answer1}</span>
					      </p></td>
			          </tr>
			            </tbody></table>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${question.correctAnswer ne question.answer2}">
        			<table class="options" width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tbody><tr>
            		<td width="4%" valign="top"><input type="radio" name="answec${status.count}" qno="${status.count}" id="answec${status.count}_2" value="2"></td>
            		<td width="96%" valign="top"><p style="width:100%; margin:0px; padding:0px 0px 20px 0px; font:normal 13px Ebrima, Arial, Helvetica, sans-serif;">
            		<span style="color:#00F; font-size:14px;  font-family:Embrima;">B) </span>
      				<span class="answerData">${question.answer2}</span>
      			</p></td>
          </tr>
            </tbody></table>
				</c:when>
				<c:otherwise>
					   <input type="hidden" class="curr_ans" value="2">
        			<table class="options" width="100%" border="0" cellspacing="0" cellpadding="0">
              		<tbody><tr>
            		<td width="4%" valign="top"><input type="radio" name="answec${status.count}" qno="${status.count}" id="answec${status.count}_2" value="2"></td>
            		<td width="96%" valign="top"><p style="width:100%; margin:0px; padding:0px 0px 20px 0px; font:normal 13px Ebrima, Arial, Helvetica, sans-serif;">
            		<span style="color:#00F; font-size:14px;  font-family:Embrima;">B) </span>
      				<span class="answerData correctData">${question.answer2}</span>
      				</p></td>
          			</tr>
            		</tbody></table>
				</c:otherwise>
			</c:choose>
        	<c:choose>
				<c:when test="${question.correctAnswer ne question.answer3}">
        			<table class="options" width="100%" border="0" cellspacing="0" cellpadding="0">
		              <tbody><tr>
		            <td width="4%" valign="top"><input type="radio" name="answec${status.count}" qno="${status.count}" id="answec${status.count}_3" value="3"></td>
		            <td width="96%" valign="top"><p style="width:100%; margin:0px; padding:0px 0px 20px 0px; font:normal 13px Ebrima, Arial, Helvetica, sans-serif;">
		            <span style="color:#00F; font-size:14px;  font-family:Embrima;">C) </span>
		      		<span class="answerData">${question.answer3}</span>
		      		</p></td>
		          </tr>
		            </tbody></table>
				</c:when>
				<c:otherwise>
					 <input type="hidden" class="curr_ans" value="3">
        			<table class="options" width="100%" border="0" cellspacing="0" cellpadding="0">
		              <tbody><tr>
		            <td width="4%" valign="top"><input type="radio" name="answec${status.count}" qno="${status.count}" id="answec${status.count}_3" value="3"></td>
		            <td width="96%" valign="top"><p style="width:100%; margin:0px; padding:0px 0px 20px 0px; font:normal 13px Ebrima, Arial, Helvetica, sans-serif;">
		            <span style="color:#00F; font-size:14px;  font-family:Embrima;">C) </span>
				      <span class="answerData correctData">${question.answer3}</span>
				      </p></td>
		          </tr>
		            </tbody></table>
				</c:otherwise>
			</c:choose>
           <c:choose>
				<c:when test="${question.correctAnswer ne question.answer4}">
		       	 <table class="options" width="100%" border="0" cellspacing="0" cellpadding="0">
		              <tbody><tr>
		            <td width="4%" valign="top"><input type="radio" name="answec${status.count}" qno="${status.count}" id="answec${status.count}_4" value="4"></td>
		            <td width="96%" valign="top"><p style="width:100%; margin:0px; padding:0px 0px 20px 0px; font:normal 13px Ebrima, Arial, Helvetica, sans-serif;">
		            <span style="color:#00F; font-size:14px;  font-family:Embrima;">D) </span>
				      <span class="answerData">${question.answer4}</span>
				      </p></td>
		          </tr>
		            </tbody></table>
				</c:when>
				<c:otherwise>
					<input type="hidden" class="curr_ans" value="4">
	        		<table class="options" width="100%" border="0" cellspacing="0" cellpadding="0">
		              <tbody><tr>
		            <td width="4%" valign="top"><input type="radio" name="answec${status.count}" qno="${status.count}" id="answec${status.count}_4" value="4"></td>
		            <td width="96%" valign="top"><p style="width:100%; margin:0px; padding:0px 0px 20px 0px; font:normal 13px Ebrima, Arial, Helvetica, sans-serif;">
		            <span style="color:#00F; font-size:14px;  font-family:Embrima;">D) </span>
			      <span class="answerData correctData">${question.answer4}</span>
			      </p></td>
		          </tr>
		            </tbody></table>
				</c:otherwise>
			</c:choose>
           <!--  <input type="hidden" class="curr_ans" value="4"> -->
                <div class="pagination" style="width:100%;">
              <ul>
              <c:choose>
             	  <c:when test="${status.count eq 1}">
	              	<li qno="${status.count}" class="active">
	                	<input type="button" qno="${status.count}" name="Next" id="next${status.count}" value="Next">
	                </li>
	              </c:when>
	              <c:when test="${status.count eq totalQuestion}">
	              	<li qno="${status.count}" class="inactive">
	                  <input type="button" qno="${status.count}" name="Prev${status.count}" id="prev" value="Prev">
	                </li>
	              </c:when>
	              <c:otherwise>
	              	<li qno="${status.count}" class="inactive">
	                  <input type="button" qno="${status.count}" name="Prev${status.count}" id="prev" value="Prev">
	                </li>
	              	<li qno="${status.count}" class="active">
	                	<input type="button" qno="${status.count}" name="Next" id="next${status.count}" value="Next">
	                </li>
	              </c:otherwise>
               </c:choose>
                <li class="active">
					<input type="button" style="" id="endtest" class="endtest" name="endtest" value="End Test">
				</li>
          </ul>
        </div>
      </div>
          <input type="hidden" id="quesoid${status.count}" value="1562">
          <input type="hidden" id="cansid${status.count}" value="4">
          <input type="hidden" id="time${status.count}" class="timeTaken" name="time" value="">
        </div>
     <input type="hidden" name="question_ids[]" value="${question.id}">
 <input type="hidden" name="correct_anss[${question.id}]" value="3">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 </c:forEach>
        <div class="none" style="float:right; width:250px; height:auto;  margin:-40px 0 0 0; *margin:-240px 0 0 0 !important; _margin:-240px 0 0 0 !important; ">
      <table border="0" width="105%" style="margin-top:40px; border:solid 1px #C8C8C8;">
    <tbody><tr>
          <td width="21%" align="center" valign="middle"><img src="${pageContext.request.contextPath}/testPaper/clock.png" height="32px" width="32px" alt="image" title="" align="middle"></td>
          <td width="87%" align="center" valign="middle"><span>Time left :</span> <span id="countdown" class="timer"></span> 
  <script type="text/javascript">
    var seconds =${totalTime};
    function secondPassed() 
    {
      seconds--;
      var hours = parseInt(seconds/3600);
      if (hours < 10) {
        hours = "0" + parseInt(hours);  
      }

      var remainingminutes = parseInt(seconds%3600);
       
      var minutes = parseInt(remainingminutes/60);
      if (minutes < 10) {
        minutes = "0" + parseInt(minutes);  
      }
      //seconds = parseInt(seconds);
      var remainingSeconds = parseInt(seconds % 60); 
      //alert(remainingSeconds);

      if (remainingSeconds < 10) {
        remainingSeconds = "0" + parseInt(remainingSeconds);  
      }
    //   if (typeof(Storage) !== "undefined") {
    //   localStorage.setItem("seconds", seconds);
    // }
      //document.getElementById('r_sec1').value=seconds;
      document.getElementById('countdown').innerHTML = hours + " : " + minutes + "  : " + remainingSeconds+ " ";
    if (parseInt(seconds) === 0) 
    {
       alert("Time is over");
         clearInterval(countdownTimer);
       document.getElementById('countdown').innerHTML = "Time is Over";
       collectAnswers();
      } 
    }
    var countdownTimer = window.setInterval(function(){ 
    secondPassed();
    }, 999);
  </script></td>
        </tr>
  </tbody></table>
<div id="pag_num" style="margin:0px;width: 262px;">
      <div class="pagination">
	      <ul>
	      <c:forEach var="question" items="${questionList}" varStatus="status">
		      <div id="q-rht"><li qno="${status.count}" style="color:#fff; list-style:none;" class="active q_pagin">${status.count}</li></div>
	     </c:forEach>
	      </ul>
      </div>
       <h1><hr></h1>
      <div class="clr"></div>
      <hr>
      <h2>
	   <div style="width:15px; height:15px; background:#060; float:left; margin-right:10px;"></div>
	   Attempted</h2>
	     <h3>
	   <div style="width:15px; height:15px; background:#000; float:left; margin-right:10px;"></div>
	   Not Visited</h3>
	     <h4>
	   <div style="width:15px; height:15px; background:#f00; float:left; margin-right:10px;"></div>
	   Not attempted or skipped</h4>
	</div>
  									</div>
      							</div>
            				</div>
      					</div>
      				</div>
			      </div>
      			</div>
      		</div>
      	</div>
      </div>
      <input type="hidden" id="totalCount" name ="totalCount">
      <input type="hidden" id="answeredCount" name ="answeredCount">
      <input type="hidden" id="unAnsweredCount" name ="unAnsweredCount">
      <input type="hidden" id="totalMarks" name ="totalMarks">
      <input type="hidden" id="correctAnswerCount" name ="correctAnswerCount">
    </form>
   	<div id="abc" style=" display:none;">  
			
	</div>
<script>
  $(".endtest").show();
  $(".endtest").click(function(){ 
    var qq = parseInt($('.question_dv:visible').attr('qno'));
    var x= confirm("Are you sure want to submit the test?"); 
    if(x==true)
    {     
      sam(qq,false); 
      collectAnswers();   
    }
  });	
  
  function collectAnswers(){
	  var totalCount = 0;
	  var answeredCount = 0;
	  var unAnsweredCount = 0;
	  var totalMarks = 0;
	  var correctAnswerCount = 0;
	  var questions = [];
	  
	  var result = "";
	  $(".question_dv").each(function(){
	    var questionObject = {};
	    var question = $(this).find(".questionData").html();
	    var correctAnswer = $(this).find(".curr_ans").val();
	    var yourAnswer = $(this).find('input[type=radio]:checked').val();
	    $(this).find('input[type=radio]:checked').parent().next().find("p span.answerData").addClass("yourAnswer");
	    var correctAnswerData = $(this).find("span.correctData").html();
	    var yourAnswerData = $(this).find(".yourAnswer").html();
	    var timeTaken = $(this).find(".timeTaken").val();
	    // framing rest of the value required.
	    totalCount++;
	    if(typeof yourAnswer === "undefined"){      
	      unAnsweredCount++;
	      yourAnswerData ="";
	    }
	    if(yourAnswer == correctAnswer){
	      correctAnswerCount++;
	      questionResult = 0;
	      totalMarks++;
	    }else{
	      if(yourAnswerData != ""){
	        totalMarks = totalMarks - 0.25; 
	      }
	      questionResult = 1;     
	    }
	    questionObject["question"] = escape(question);
	    questionObject["correctAnswer"] = escape(correctAnswer);
	    questionObject["yourAnswer"] = escape(yourAnswer);
	    questionObject["timeTaken"] = timeTaken;
	    questionObject["correctAnswerData"] = escape(correctAnswerData);
	    questionObject["yourAnswerData"] = escape(yourAnswerData);
	    questionObject["questionResult"] = escape(questionResult);
	    questions.push(questionObject);
	    
	    var currectAns = $(this).find(".curr_ans").val();
	    var selectedAns = $(this).find('input[type=radio]:checked').val();
	    var questionId = $(this).attr("qid");
	    
	    //result += "curct: " +  currectAns + " selected: " + selectedAns +" question id: "+ questionId + "; ";
	  });
	  answeredCount = totalCount - unAnsweredCount;
	  var finalObject = {};
	  finalObject["totalCount"] = totalCount;
	  finalObject["answeredCount"] = answeredCount;
	  finalObject["unAnsweredCount"] = unAnsweredCount;
	  finalObject["correctAnswerCount"] = correctAnswerCount;
	  finalObject["totalMarks"] = totalMarks;
	  finalObject["questions"] = questions;
	  console.log(JSON.stringify(finalObject));
	  $.cookie("basket-data", JSON.stringify(finalObject));
	  $("#fullData").val(JSON.stringify(finalObject));
	  //console.log(JSON.stringify(finalObject));
	   $("#totalCount").attr("value",+totalCount);
	   $("#answeredCount").attr("value",+answeredCount);
	   $("#unAnsweredCount").attr("value",+unAnsweredCount);
	   $("#totalMarks").attr("value",+totalMarks);
	   $("#correctAnswerCount").attr("value",+correctAnswerCount);
   	   document.forms["myForm"].submit();
/* var req={totalCount:'totalCount',answeredCount:'answeredCount'};
	  $.ajax({
          url: '${pageContext.request.contextPath}/user/testResult?totalCount='+totalCount+'&answeredCount='+answeredCount+'&unAnsweredCount='+unAnsweredCount+'&correctAnswerCount='+correctAnswerCount+'&totalMarks='+totalMarks+'&questions='+questions,
          type: 'GET',
          date: req,
          success: function (data){
        	  $("#myForm").remove();
        	  $("#abc").attr("style","display:block;"); 
        	  $("#abc").html(data); 
        	   $("#signout").click();  
           }
      });return false; */
	}
</script>
<script type="text/javascript">
  var auto ="";
    window.onload=function()
  {
        auto = window.setTimeout(function(){ autoRefresh(); }, 1000);

    }
   function submitform()
    {
          alert('Your Test is Over');
      var qq = parseInt($('.question_dv:visible').attr('qno'));
      sam(qq,false); 
      collectAnswers(); 
          //document.forms["myForm"].submit();
        }
        function autoRefresh()
    {
      auto = window.setTimeout(function(){ submitform(); autoRefresh(); }, 1800000);
           clearTimeout(auto);
           
        }
  function funct()
  {
     var qq = parseInt($('.question_dv:visible').attr('qno'));
      sam(qq,false); 
      collectAnswers(); 
          document.forms["myForm"].submit();
  }
</script>
<script>
document.onkeydown = function(e) {
      // keycode for F5 function
      if (e.keyCode === 116) {
        return false;
      }
      // keycode for backspace
      if (e.keyCode === 8) {
        // try to cancel the backspace
        return false;
      }
     if (e.keyCode === 82) {
    // removes the ctrl+r (page refresh)
        return false;
      }
    };
  

jQuery.cookie = function(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options = $.extend({}, options); // clone object since it's unexpected behavior if the expired property were changed
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        // NOTE Needed to parenthesize options.path and options.domain
        // in the following expressions, otherwise they evaluate to undefined
        // in the packed version for some reason...
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};
  
  </script>
<script type="text/javascript">
$(document).ready(function(){
	$("#circle_main").hide();
  $("#qno1").attr("style","");
})
</script>
</body>
</html>