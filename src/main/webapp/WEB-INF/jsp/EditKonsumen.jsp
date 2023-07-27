<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Edit Konsumen</title>

    <link rel="stylesheet"
        	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script
        	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
        	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</head>
<body>

    <div class="container">

        <h1 class="p-3"> Edit Konsumen </h1>

        <form:form action="/editSaveKonsumen" method="post" modelAttribute="konsumen">

                    <div class="row">
                    	<div class="form-group col-md-12">
                    		<div class="col-md-6">
                    			<form:hidden path="id" class="form-control input-sm" />
                    		</div>
                    	</div>
                    </div>

                    <div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="name">Nama :</label>
					<div class="col-md-6">
						<form:input type="text" path="nama" id="nama"
							class="form-control input-sm" required="required" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="name">Alamat :</label>
					<div class="col-md-6">
						<form:input type="text" path="alamat" id="alamat"
							class="form-control input-sm" required="required" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="name">Kota :</label>
					<div class="col-md-6">
						<form:input type="text" path="kota" id="kota"
							class="form-control input-sm" required="required" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="name">Provinsi :</label>
					<div class="col-md-6">
						<form:input type="text" path="provinsi" id="provinsi"
							class="form-control input-sm" required="required" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="name">Tanggal Registrasi :</label>
					<div class="col-md-6">
						<form:input type="date" path="tglRegistrasi" id="tglRegistrasi"
							class="form-control input-sm" required="required" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="name">Status :</label>
					<div class="col-md-6">
						<form:select type="text" path="status" id="status"
							class="form-control input-sm" required="required">
							<form:option value="true">Aktif</form:option>
							<form:option value="false">Non-Aktif</form:option>
						</form:select>
					</div>
				</div>
			</div>

                    <div class="row p-2">
                    	<div class="col-md-2">
                    		<button type="submit" value="Register" class="btn btn-success">Save</button>
                    	</div>
                    </div>

                </form:form>

    </div>

    <script th:inline="javascript">
                window.onload = function() {

                    var msg = "${message}";
                    console.log(msg);
                    if (msg == "Edit Failure") {
        				Command: toastr["error"]("Something went wrong with the edit.")
        			}

        			toastr.options = {
                          "closeButton": true,
                          "debug": false,
                          "newestOnTop": false,
                          "progressBar": true,
                          "positionClass": "toast-top-right",
                          "preventDuplicates": false,
                          "showDuration": "300",
                          "hideDuration": "1000",
                          "timeOut": "5000",
                          "extendedTimeOut": "1000",
                          "showEasing": "swing",
                          "hideEasing": "linear",
                          "showMethod": "fadeIn",
                          "hideMethod": "fadeOut"
                        }
        	    }
            </script>

</body>

</html>