<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="baseLayout">
	<tiles:putAttribute name="titlePage" value="Details Product Page" />
	<tiles:putListAttribute name="pageCss">
		<tiles:addAttribute value="btn" />
		<tiles:addAttribute value="product_description" />
	</tiles:putListAttribute>
	<tiles:putListAttribute name="pageJs">
		<tiles:addAttribute value="descript" />
	</tiles:putListAttribute>
	<tiles:putAttribute name="body">
		<c:if test="${not empty product }">
			<div class="container my-5">
				<div class="row">
					<!-- Phần hiển thị ảnh sản phẩm, chiếm 2 cột -->
					<div
						class="col-2 d-flex justify-content-start align-items-center flex-column px-2 gap-3">
						<c:forEach var="gallery" items="${product.galleries}">
							<img src="${pageContext.request.contextPath}${gallery.link}"
								class="img-60px "
								data-large-image="${pageContext.request.contextPath}${gallery.link}">
						</c:forEach>
					</div>
					<!-- Phần chi tiết sản phẩm, chiếm phần còn lại -->
					<div class="col">
						<div class="row">
							<!-- Chi tiết thành phần sản phẩm -->
							<div class="col">
								<div
									class="container d-flex justify-content-center align-items-center mb-4">
									<div
										class="image-container d-flex justify-content-center align-items-center"
										style="width: 526px; height: 526px;">
										<img id="mainImage" src="" class="img-60px"
											alt="Product Detail" class="img-fluid">
									</div>
								</div>
								<!-- Phần thành phần sản phẩm -->
								<div class="border-bottom">
									<div class="d-flex justify-content-between align-items-center">
										<h2 class="fw-bold">Thành phần</h2>
										<!-- Sử dụng fw-bold để làm đậm tiêu đề -->
										<div class="tang-kich-thuoc-plus">
											<i class="bi bi-plus" id="toggleIcon"></i>
										</div>
									</div>
									<!-- Thông tin chi tiết thành phần sản phẩm, mặc định ẩn -->
									<div id="ingredientsContent" class="d-none">
										<p class="text-muted">${product.description}</p>
										<p class="text-muted">Xin lưu ý rằng danh sách thành phần
											có thể thay đổi hoặc thay đổi theo thời gian. Vui lòng tham
											khảo danh sách thành phần trên gói sản phẩm bạn nhận được để
											biết danh sách thành phần cập nhật nhất.</p>
									</div>
								</div>
							</div>
							<!-- Phần thông tin và mua sản phẩm -->
							<div class="col">
								<div class="text-center mt-5">
									<!-- Tên sản phẩm (sử dụng h1 cho tiêu đề chính) -->
									<h3>${product.name}</h3>
									<h4 class="text-center fw-bold prices">${product.price}</h4>
									<div
										class="d-flex justify-content-center align-items-center gap-3 mb-3">
										<button class="btn btn-dark ms-3 link" data-href="${pageContext.request.contextPath}/customer/cart?id=${product.id}">Thêm vào giỏ hàng</button>
									</div>
								</div>
								<!-- Thông tin giao hàng miễn phí -->
								<div class="text-center">
									<p class="mb-0 text-muted">Giao hàng tiêu chuẩn miễn phí và
										trả lại</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${empty product}">
			<p class="text-muted">Product not found.</p>
		</c:if>
	</tiles:putAttribute>
</tiles:insertDefinition>