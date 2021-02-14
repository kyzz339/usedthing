<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
var searchForm=$("#searchForm");

$("#searchForm button").on("click",function(e){
	  
	  if(!searchForm.find("option:selected").val()){
		  alert("검색종류를 선택하시오");
		  return false;
	  }
	  if(!searchForm.find("input[name='keyword']").val()){
		  alert("키워드를 입력하시오");
		  return false;    		
	  }
	  searchForm.find("input[name='pageNum']").val("1");
	  e.preventDefault();
	   
	  searchForm.submit();
});
});
</script>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

   <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
        <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>


    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/product/product">Usedthing</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
            <!--메일박스  -->
                <li class="dropdown">               
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">                    
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>                  
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
              	<!--종박스  -->
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!--회원정보  -->
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>                        
                        <c:if test="${member ne null}">
                        <a href="/member/modify"><i class="fa fa-user fa-fw"></i> User Profile</a>                      
                        
                        </c:if>
                        <c:if test="${member eq null}">
                        <a href="/member/login"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </c:if>
                        </li>
                        <c:if test="${member ne null }">
                        <li class="divider"></li>
                        <li><a href="/member/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                        </c:if>                        
                        <c:if test="${member eq null}">                 
                        <li class="divider"></li>
                        <li><a href="/member/login"><i class="fa fa-sign-out fa-fw"></i> Login</a>
                        </li>
                        </c:if>
                        
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                        <!--Search 박스  -->
                            <div class="input-group custom-search-form">
                            	<form id='searchForm' action="/product/product" method='get'> 
                            	                           		
                            		<select name='type'>
                            			<option value="">--</option>
                            			<option value="T">제목</option>
                            			<option value="C">내용</option>
                            			<option value="O">상품코드</option>
                            			<option value="TC">제목+내용</option>
                            			<option value="TCO">제목+내용+상품코드</option>
                            		 </select>
                            		 <div class="input-group custom-search-form">                            		
                                	<input type="text" class="form-control" name='keyword' placeholder="Search...">                                	
                                	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
                                	<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
                                		<span class="input-group-btn">
                                			<button class="btn btn-default" type="button">
                                    		<i class="fa fa-search"></i>
                                			</button>
                            			</span>
                            	</div>
                            	</form>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <!--왼쪽메뉴 맨처음  -->
                        <li>
                            <a href="/product/product"><i class="fa-desktop"></i> 상품</a>
                        </li>
                        <c:if test="${member ne null}"> 
                        <li>
                            <a href="/product/myproduct"><i class="fa-desktop"></i> 내 상품</a>
                        </li>
                        <!--쪽지  -->
                        <li>
                            <a href="#"><i class="fa-envelope-o"></i> 쪽지<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/message/messagelist">받은 쪽지함</a>
                                </li>
                                <li>
                                    <a href="/message/sendlist">보낸 쪽지함</a>
                                </li>
                            </ul>                          
                        </li>  
                        <!-- 쪽지 -->                                       
                        <c:if test="${member.report eq 'admin' || member.report eq 'masteradmin'}">                        
                        <li>
                            <a href="/member/memberadmin"><i class="fa-desktop"></i> 회원 관리</a>
                        </li>
                        </c:if>                          
                        </c:if>                                                             
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">