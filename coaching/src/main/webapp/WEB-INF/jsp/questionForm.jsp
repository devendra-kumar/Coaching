<!DOCTYPE html> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>Enter the question</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/practice1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/practice2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/practice3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/practice.css">
<link rel="icon" href="${pageContext.request.contextPath}/images/logo.png" type="image/gif">
<script src="${pageContext.request.contextPath}/jquery/jquery-1.10.2.js"></script>
  <script src="${pageContext.request.contextPath}/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/jquery/jquery-1.11.3.min.js"></script>
</head>
<body>
<div id="top-header" class="tb-main-header js-banner-height-offset" style="margin-top: 0px;background: #333;">
	<div class="form-group pull-left" style="margin-bottom:10px;">
		<span class="navbar-brand" style="text-decoration: none;"><h3><font color="#40aaf3"><c:out value="${pageContext.request.remoteUser}"></c:out></font></h3></span>
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
<form action="${pageContext.request.contextPath}/admin/createQuestion" method="post" id ="idForm" enctype="multipart/form-data">
<div style="margin-left:500px;">
<div class="form-group" style="margin-top: 60px;">
	  <div class="col-md-2">
		  <select id="inlineFormCustomSelect" class="form-control" name="language">
		    <option value="e">English</option>
		    <option value="h">Hindi</option>
		  </select>
		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	  </div>
	</div>
	<div class="form-group">
		  <div class="col-md-2">
		    <select id="inlineFormCustomSelect" class="form-control" name="type">
			    <option value="t">Text</option>
			    <option value="i">Image</option>
			  </select>
	  		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		  </div>
	</div>
</div>
<div style="margin-top: 0px;" class="content-wrapper js-tb-container">
    <div class="practice-container">
        <div class="clearfix practice-container-inner">
     		<div class="container-fluid practice-attempt-view">
       		 	<div  class="row">
		                <div class="panel panel-default question-content">
		                    <div class="panel-body">
		                        <div class="row">
		                           <div class="form-group">
									  <label for="comment">Question:</label>
									  <textarea class="form-control" rows="5" id="question" name="question"></textarea>
									</div>
									<input type="file" id="1" name="files" onchange="getval(this);" accept=".jpg,.jpeg,.png">
									<div id="fileSize1" style="display:none;"></div>
		                        </div>
		                    </div>
		                </div>
		                <div class="panel panel-default question-options ">
                   			 <div class="panel-body" >
                            	<div class="form-group">
								  <label for="usr">Answer1:</label>
								  <input type="text" class="form-control" id="answer1" name="answer1">
								</div>
								<input type="file" id="2" name="files" onchange="getval(this);" accept=".jpg,.jpeg,.png">
								<div id="fileSize2" style="display:none;"></div>
                   			 </div>
               			 </div>
		                <div class="panel panel-default question-options" >
		                    <div class="panel-body">
		                            <div class="form-group">
									  <label for="usr">Answer2:</label>
									  <input type="text" class="form-control" id="answer2" name="answer2">
									</div>
									<input type="file" id="3" name="files" onchange="getval(this);" accept=".jpg,.jpeg,.png">
									<div id="fileSize3" style="display:none;"></div>
		                    </div>
		                </div>
		                <div class="panel panel-default question-options " >
		                    <div class="panel-body" >
		                            <div class="form-group">
									  <label for="usr">Answer3:</label>
									  <input type="text" class="form-control" id="answer3" name="answer3">
									</div>
									<input type="file" id="4" name="files" onchange="getval(this);" accept=".jpg,.jpeg,.png">
									<div id="fileSize4" style="display:none;"></div>
		                    </div>
		                </div>
		                <div class="panel panel-default question-options " >
		                    <div class="panel-body" >
		                            <div class="form-group">
									  <label for="usr">Answer4:</label>
									  <input type="text" class="form-control" id="answer4" name="answer4">
									</div>
									<input type="file" id="5" name="files" onchange="getval(this);" accept=".jpg,.jpeg,.png">
									<div id="fileSize5" style="display:none;"></div>
		                    </div>
		                </div>
		                <div class="panel panel-default question-options " >
		                    <div class="panel-body">
		                           <div class="form-group">
									  <label for="usr">Correct Answer:</label>
									  <input type="text" class="form-control" id="correctAnswer"  name="correctAnswer">
									</div>
									<input type="file" id="6" name="files" onchange="getval(this);" accept=".jpg,.jpeg,.png">
									<div id="fileSize6" style="display:none;"></div>
		                    </div>
		                </div>
		                <button type="submit" class="btn btn-primary" id="submit">Next</button>
		                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		            </div>
	        	</div>
		    </div>
		</div>
	</div>
 </form>
</body>
<script type="text/javascript">
function getval(item){
	var id =item.id;
	var uploadedFile = document.getElementById(id);
    var fileSize = uploadedFile.files[0].size;
    fileSize = fileSize/1024; //size in kb
    $( "#fileSize"+id).empty();
    if(fileSize > 50){
    	$("#fileSize"+id).attr("style","color: red;"); 
    	$("#fileSize"+id).append("File size should be less than 50KB");
    }
}
/* $("#idForm").submit(function(event) {
	 $.ajax({
         type: "POST",
         url: "${pageContext.request.contextPath}/admin/questionSubmit",
         data: $("#idForm").serialize(), // serializes the form's elements.
         success: function(data){
             alert(data); 
         }
       });
  e.preventDefault();
}); */
</script>
</html>