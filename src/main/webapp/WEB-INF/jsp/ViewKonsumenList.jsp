<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<head>
<meta charset="ISO-8859-1">
<title>Lihat Daftar Konsumen</title>

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

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.5/js/dataTables.bootstrap4.min.js"></script>

<script>
	$(document).ready(function() {
		$('#list-konsumen').DataTable();
	});
</script>

<style>
a {
	color: white;
}

a:hover {
	color: white;
	text-decoration: none;
}
</style>

</head>
<body>

	<div class="container">

		<h1 class="p-3">Daftar Konsumen</h1>

		<form:form>


			<table id="list-konsumen" class="table table-bordered">
				<thead>
					<tr>
						<th>Nama</th>
						<th>Alamat</th>
						<th>Kota</th>
						<th>Provinsi</th>
						<th>Tanggal Registrasi</th>
						<th>Status</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="konsumen" items="${konsumenList}">

						<tr>
							<td>${konsumen.nama}</td>
							<td>${konsumen.alamat}</td>
							<td>${konsumen.kota}</td>
							<td>${konsumen.provinsi}</td>
							<td><fmt:formatDate value="${konsumen.tglRegistrasi}"
									pattern="dd/MM/yyyy" /></td>
							<td><c:out
									value="${konsumen.status eq 'true' ? 'Aktif' : 'Non-Aktif'}" /></td>
							<td><button type="button" class="btn btn-success">
									<a href="/editKonsumen/${konsumen.id}">Edit</a>
								</button></td>
							<td><button type="button" class="btn btn-danger">
									<a href="/deleteKonsumen/${konsumen.id}">Delete</a>
								</button></td>
						</tr>

					</c:forEach>
				<tbody>
			</table>

		</form:form>

		<button type="button" class="btn btn-primary">
			<a href="/addKonsumen">Add New Konsumen</a>
		</button>

	</div>

	<script th:inline="javascript">
		window.onload = function() {

			var msg = "${message}";
			console.log(msg);
			if (msg == "Save Success") {
				Command: toastr["success"]("Berhasil Menambahkan Konsumen")
			} else if (msg == "Delete Success") {
				Command: toastr["success"]("Konsumen Berhasil di Hapus")
			} else if (msg == "Delete Failure") {
				Command: toastr["error"]
						("Gagal Menghapus Konsumen")
			} else if (msg == "Edit Success") {
				Command: toastr["success"]("Konsumen Berhasil di Update")
			}

			toastr.options = {
				"closeButton" : true,
				"debug" : false,
				"newestOnTop" : false,
				"progressBar" : true,
				"positionClass" : "toast-top-right",
				"preventDuplicates" : false,
				"showDuration" : "300",
				"hideDuration" : "1000",
				"timeOut" : "5000",
				"extendedTimeOut" : "1000",
				"showEasing" : "swing",
				"hideEasing" : "linear",
				"showMethod" : "fadeIn",
				"hideMethod" : "fadeOut"
			}
		}
	</script>

	<script
		src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
	<script>
		$('#tglRegistrasi').datepicker({
			format : 'yyyy/mm/dd'
		});
	</script>

</body>

</html>