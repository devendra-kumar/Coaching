<!DOCTYPE html> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show All Question</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/practice1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/practice2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/practice3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/practice.css">
<script src="/jquery/jquery-1.5.2.js"></script> 
</head>
<body>
<div id="top-header" class="tb-main-header js-banner-height-offset" style="margin-top: 0px;">
    <div class="row">
        <div id="js-header-main" class="col-xs-12 tb-main-header-inner">
            <a href="${pageContext.request.contextPath}/admin/registration" class="logo">
                <c:out value="${pageContext.request.remoteUser}"></c:out>
            </a>
           	<div class="pull-right">
                <ul class="header-nav list-unstyled mar-b0">
                 	<li>
                 	<div style="padding-top:5px;">
	                    <form action="${pageContext.request.contextPath}/logout" method="post">
							<input type="submit" class="button red big pull-right" value="Sign Out" id="signout" /> 
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
						</div>
                   </li>
                 </ul>
                <div class="dropdown mobile-view-nav">
                    <div class="dd-backdrop"></div>
                    <ul class="dropdown-menu dropdown-menu-right js-banner-height-offset" id="js-header-options-sidebar" aria-labelledby="mobileViewHeaderNav" style="margin-top: 0px;">
                        <li><a href="#">Sign Up</a></li>
                      </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="content-wrapper js-tb-container">
    <div class="practice-container">
        <div class="clearfix practice-container-inner">
     		<div class="container-fluid practice-attempt-view">
     		<c:forEach var="question" items="${questionList}">
       		 <div  class="row">
		         <div class="col-xs-12 mar-v24 ng-scope">
		                <div class="panel panel-default question-content">
		                    <div class="panel-body">
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <p class="mar-v4 font-weight-semibold d-inline-block question-details ">
		                                    ${question.id} of <c:out value="${noOfSize}"></c:out> &nbsp;|&nbsp; <span class="text-capitalize ">Computer Application</span>
		                                </p>
		                            </div>
		                            <div class="col-xs-12 mar-t24">
		                                <div class="overflow-x-auto " ><p>${question.question}</p>
										</div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <c:choose>
		                <c:when test="${question.correctAnswer != question.answer1}">
			                <div class="panel panel-default question-options ">
	                   			 <div class="panel-body" >
	                            	<span class="p-label p-size-2 font-weight-semibold"><input type="radio" name="answer1"></span>
	                       				<div class="option-content "><p>${question.answer1}</p>
										</div>
	                   			 </div>
	               			 </div>
               			 </c:when>
               			 <c:otherwise>
               			 	 <div class="panel panel-default question-options ">
	                   			 <div class="panel-body" >
	                            	<span class="p-label p-size-2 font-weight-semibold"><input type="radio" name="answer1"></span>
	                       				 <div class="option-content "><p><font color="#07c130">${question.answer1}</font></p>
											</div>
	                   			 </div>
	               			 </div>
               			 </c:otherwise>
               			 </c:choose>
               			  <c:choose>
			                <c:when test="${question.correctAnswer != question.answer2}">
				                <div class="panel panel-default question-options" >
				                    <div class="panel-body">
				                            <span class="p-label p-size-2 font-weight-semibold"><input type="radio" name="answer2"></span>
				                        <div class="option-content " ><p>${question.answer2}</p>
										</div>
				                    </div>
			               		 </div>
	               			 </c:when>
	               			 <c:otherwise>
	               			 	 <div class="panel panel-default question-options" >
				                    <div class="panel-body">
				                            <span class="p-label p-size-2 font-weight-semibold"><input type="radio" name="answer2"></span>
				                        <div class="option-content " ><p><font color="#07c130">${question.answer2}</font></p>
										</div>
				                    </div>
				                </div>
	               			 </c:otherwise>
               			 </c:choose>
               			 <c:choose>
			                <c:when test="${question.correctAnswer != question.answer3}">
			                <div class="panel panel-default question-options " >
			                    <div class="panel-body" >
			                            <span class="p-label p-size-2 font-weight-semibold"><input type="radio" name="answer3"></span>
			                        <div class="option-content " ><p>${question.answer3}</p>
									</div>
			                    </div>
			                </div>
	               			 </c:when>
	               			 <c:otherwise>
	               			 	  <div class="panel panel-default question-options " >
			                    <div class="panel-body" >
			                            <span class="p-label p-size-2 font-weight-semibold"><input type="radio" name="answer3"></span>
			                        <div class="option-content " ><p><font color="#07c130"><b>${question.answer3}</b></font></p>
									</div>
			                    </div>
			                </div>
	               			 </c:otherwise>
               			 </c:choose>
               			 <c:choose>
			                <c:when test="${question.correctAnswer != question.answer4}">
				                <div class="panel panel-default question-options " >
				                    <div class="panel-body" >
				                            <span class="p-label p-size-2 font-weight-semibold"><input type="radio" name="answer4"></span>
				                        <div class="option-content " ><p>${question.answer4}</p>
										</div>
				                    </div>
				                </div>
	               			 </c:when>
	               			 <c:otherwise>
	               			 	  <div class="panel panel-default question-options " >
		                    		<div class="panel-body" >
			                            <span class="p-label p-size-2 font-weight-semibold"><input type="radio" name="answer4"></span>
				                        <div class="option-content " ><p><font color="#07c130">${question.answer4}</font></p>
									</div>
			                    </div>
		                </div>
	               			 </c:otherwise>
               			 </c:choose>
		            </div><!-- end ngIf: !hideQueUI && !isShowLoadingTemplate -->
        	</div>
        	</c:forEach>
    </div>
</div>
</div>
</div>
</body>
</html>