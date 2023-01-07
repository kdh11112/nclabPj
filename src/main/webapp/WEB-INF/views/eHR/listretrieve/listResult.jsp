<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>




        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">테스트!!</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
							마이크테스트

                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        							<!-- 검색기능 -->
						
						<form id="form1" action="/eHR/listretrieve/listResult" method="POST">
						<tr>
								
					<c:if test="${shDateStart != null}">
								<fmt:formatDate value="${shDateStart}" var="startDate" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${shDateEnd}" var="endDate" pattern="yyyy-MM-dd"/>
								</c:if>
								<td>시작일 : <input type="date" id="shDateStart" name=shDateStart value="${startDate}"></td>
								<td>종료일 : <input type="date" id="shDateEnd" name="shDateEnd" value="${endDate}"></td>
					<td><button id="btnSearch">검색</button></td>
						   </tr>
						</form>

						
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>사원코드</th>
                                        <th>이름</th>
                                        <th>입사일</th>
                                        <th>이메일</th>
                                        <th>우편번호</th>
                                        <th>주소</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <c:forEach items="${list }" var="list">
                                   	<tr class="sodd gradeX">
                                   		<td><c:out value="${list.empcd }"></c:out></td>
                                   		<td><c:out value="${list.EMPNAME }"></c:out></td>
                                   		 <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.EMPEMPLOYDAY}"/></td>
                                   		<td><c:out value="${list.EMPEMAIL }"></c:out></td>
                                   		<td><c:out value="${list.EMPPOSTCODE }"></c:out></td>
                                   		<td><c:out value="${list.EMPADRESS }"></c:out></td>
                                   	</tr>
                                   </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true,
            "language": {
                "emptyTable": "데이터가 없어요.",
                "lengthMenu": "페이지당 _MENU_ 개씩 보기",
                "info": "현재 _START_ - _END_ / _TOTAL_건",
                "infoEmpty": "데이터 없음",
                "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
                "search": "검색: ",
                "zeroRecords": "일치하는 데이터가 없어요.",
                "loadingRecords": "로딩중...",
                "processing":     "잠시만 기다려 주세요...",
                "paginate": {
                    "next": "다음",
                    "previous": "이전"
                }
            }
        });
        
   		 $("input.shDate").datepicker();
   		 
   		$.datepicker.setDefaults({
   		    dateFormat: 'yy-mm-dd',
   		    prevText: '이전 달',
   		    nextText: '다음 달',
   		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
   		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
   		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
   		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
   		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
   		    showMonthAfterYear: true,
   		    yearSuffix: '년'
   		});
   		
   		
   		

        
        
        $("#btnSearch").click(function(){
            var startDate = $('#shDateStart').val();
            var endDate = $('#shDateEnd').val();
            //-을 구분자로 연,월,일로 잘라내어 배열로 반환
            var startArray = startDate.split('-');
            var endArray = endDate.split('-');   
            //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
            var start_date = new Date(startArray[0], startArray[1], startArray[2]);
            var end_date = new Date(endArray[0], endArray[1], endArray[2]);
                 //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
            if(start_date.getTime() > end_date.getTime()) {
                alert("종료날짜보다 시작날짜가 작아야합니다.");
                return false;
            }else {
           	document.form1.action = "/listretrieve/listResult";
   			document.form1.submit();
            }
         });
        
    });
    
    
    </script>

</body>

</html>
