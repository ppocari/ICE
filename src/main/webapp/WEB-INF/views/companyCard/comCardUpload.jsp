<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../inc/top.jsp" />

<style>
.table td {
	width: 90px;
}

.table .registerTable {
	width: 90px;
	border: 1px solid white;
}

.register_text {
	width: 110px;
}

.search input {
	width: 150px;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="http://malsup.github.com/jquery.form.js"></script>
<script type="text/javascript">
function checkFileType(filePath) {
    var fileFormat = filePath.split(".");

    if (fileFormat.indexOf("xls") > -1 || fileFormat.indexOf("xlsx") > -1) {
      return true;
      } else {
      return false;
    }
  }

  function check() {

    var file = $("#excelFile").val();

    if (file == "" || file == null) {
    alert("파일을 선택해주세요.");

    return false;
    } else if (!checkFileType(file)) {
    alert("엑셀 파일만 업로드 가능합니다.");

    return false;
    }

    if (confirm("업로드 하시겠습니까?")) {

      var options = {

        success : function(data) {
            console.log(data);
          alert("모든 데이터가 업로드 되었습니다.");

        },
        type : "POST"
        };
      
      $("#excelUploadForm").ajaxSubmit(options);
      
    }
  }

</script>
<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">파일 업로드</h1>

		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 ">
			<div class="card shadow mb-4" style="height: 500px">
				<!-- Card Header - Dropdown -->
				<form id="excelUploadForm" name="excelUploadForm"
					enctype="multipart/form-data" method="post"
					action="<c:url value ='/companyCard/excelUploadAjax.do'/> ">
					<div class="contents">
						<div>첨부파일은 한개만 등록 가능합니다.</div>

						<dl class="vm_name">
							<dt class="down w90">첨부 파일</dt>
							<dd>
								<input id="excelFile" type="file" name="excelFile" />
							</dd>
						</dl>
					</div>

					<div class="bottom">
						<button type="button" id="addExcelImpoartBtn" class="btn"
							onclick="check()">
							<span>추가</span>
						</button>
					</div>
				</form>


			</div>
		</div>
	</div>
</div>






<!-- /.container-fluid -->
<div></div>
<div></div>

<!-- End of Main Content -->

<jsp:include page="../inc/bottom.jsp" />

