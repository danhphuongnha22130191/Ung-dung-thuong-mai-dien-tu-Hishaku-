<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="baseLayout">
	<link rel="stylesheet" type="text/css"
		href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<link rel="stylesheet" type="text/css"
		href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
	<tiles:putAttribute name="titlePage" value="Home Page" />
	<tiles:putListAttribute name="pageCss">
		<tiles:addAttribute value="home" />
	</tiles:putListAttribute>
	<tiles:putListAttribute name="pageJs">
		<tiles:addAttribute value="home" />
	</tiles:putListAttribute>
	<tiles:putAttribute name="body">
		<div class="container my-5">
			<!-- content lễ hội -->
			<c:forEach var="topic" items="${topics}">
				<div class="mb-5 topic">
					<h2 class="h2 text-center fs-1">${topic.title}</h2>
					<p class="text-center">${topic.description}</p>
					<!-- thể loại sản phẩm -->
					<ul
						class="list-unstyled d-flex gap-3 justify-content-center align-items-center">
						<c:forEach var="category" items="${topic.categories}"
							varStatus="status">
							<c:if test="${status.index!=0 }">
								<li>|</li>
							</c:if>
							<li
								class="tabled-products ${status.index==0?'fw-bold':''} cursor-pointer"
								data-id="${category.id}">${category.name}</li>
						</c:forEach>
					</ul>
					<c:forEach var="entry" items="${topic.mappingProduct.entrySet()}">
						<div class="carousel-tabled-products" data-id="${entry.key.id}">
							<div class="wrapper-topic-product w-100">
								<c:if test="${empty entry.value }">
									<p class="text-center h3 fst-italic fw-light"
										style="color: #d29d43;">No products available in this
										category</p>
								</c:if>
								<!-- Carousel Content -->
								<c:if test="${not empty entry.value }">
									<div class="topic-product-list slider tabled-product-detail">
										<c:forEach var="product" items="${entry.value}">
											<div class="border-0 card link mx-4"
												data-href="home/product/descript?id=${product.productId}">
												<img
													src="${pageContext.request.contextPath}${product.galleries[0].link} }"
													alt="${product.productName}" class="card-img-top">
												<div class="card-body">
													<h5 class="card-title">${product.productName}</h5>
													<p class="fw-bold card-text">${product.productPrice}</p>
												</div>
											</div>
										</c:forEach>
									</div>
								</c:if>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:forEach>

			<!-- content món quà -->
			<div class="mb-5">
				<h2 class="h2 text-center mb-4 fs-1">Món quà từ phép màu</h2>
				<p class="text-center mb-4">Nội dung cần chỉnh sửa</p>
				<div class="d-flex flex-row gap-3">
					<div class="card border-0">
						<img
							src="https://www.esteelauder.com.vn/media/export/cms/special-offers/glo_hol001_110224_hp_3up_holiday_bestsellers_skincare_1366x1366.avif"
							alt="Dưỡng Da" class="card-img-top img-fluid">
						<div class="card-body">
							<h5 class="card-title">Dưỡng Da</h5>
							<a href="" class="text-uppercase  fw-bold">Mua ngay</a>
						</div>
					</div>
					<div class="card border-0">
						<img
							src="https://www.esteelauder.com.vn/media/export/cms/special-offers/glo_hol001_110224_hp_3up_holiday_bestsellers_makeup_1366x1366.avif"
							alt="Nước hoa" class="card-img-top img-fluid">
						<div class="card-body">
							<h5 class="card-title">Nước hoa</h5>
							<a href="" class="text-uppercase fw-bold">Mua ngay</a>
						</div>
					</div>
					<div class="card border-0">
						<img
							src="https://www.esteelauder.com.vn/media/export/cms/special-offers/glo_hol001_110224_hp_3up_holiday_bestsellers_fragrance_1366x1366.avif"
							alt="Trang Điểm" class="card-img-top img-fluid">
						<div class="card-body">
							<h5 class="card-title">Trang Điểm</h5>
							<a href="" class="text-uppercase fw-bold">Mua ngay</a>
						</div>
					</div>
				</div>
			</div>
			<!-- content chu trình -->
			<div class="mb-5">
				<h2 class="h2 text-center mb-4 fs-1">Hoàn thiện chu trình dưỡng
					da hàng ngày</h2>
				<p class="text-center mb-0">Làn da đẹp bắt đầu ngay hôm nay.</p>
				<p class="text-center mb-4">Hãy khám phá những sản phẩm cần
					thiết để bổ sung những dưỡng chất cũng như tối ưu hóa chu trình để
					mang lại một làn da khỏe mạnh.</p>
				<div class="container my-5">
					<div class="row justify-content-center gap-4">
						<div
							class="col-12 col-md-2 d-flex flex-column align-items-center mb-4 position-relative">
							<img
								src="https://www.esteelauder.com.vn/media/boutiques/skincare-regimen/SkincareRegimenModule_PC1.jpg"
								class="img-fluid w-100   mb-2" alt="Sữa rửa mặt">
							<div class="position-absolute top-50 text-center">
								<h5 class="fs-4">Sữa rửa mặt</h5>
								<p class="small">Làm sạch da bằng sữa rửa mặt dịu nhẹ, đã
									tác dụng.</p>
								<p class="small">Massage khắp mặt bằng chuyển động tròn. Rửa
									sạch lại với nước.</p>
							</div>
						</div>
						<div
							class="col-12 col-md-2 d-flex flex-column align-items-center mb-4 position-relative">
							<img
								src="https://www.esteelauder.com.vn/media/boutiques/skincare-regimen/SkincareRegimenModule_PC2.jpg"
								class="img-fluid w-100  mb-2" alt="Nước dưỡng">
							<div class="position-absolute top-50 text-center">
								<h5 class="fs-4 ">Nước dưỡng</h5>
								<p class="small">Bước đầu giúp làn da được làm dịu và cấp ẩm
									đầy đủ.</p>
								<p class="small">Đổ nước dưỡng vào lòng bàn tay. Xoa đều hai
									bàn tay với nhau. Sau đó vỗ nhẹ lên má, cằm và trán. Hoặc, có
									thể sử dụng miếng bông thay thế.</p>
							</div>
						</div>
						<div
							class="col-12 col-md-2 d-flex flex-column align-items-center mb-4 position-relative">
							<img
								src="https://www.esteelauder.com.vn/media/boutiques/skincare-regimen/SkincareRegimenModule_PC3.jpg"
								class="img-fluid w-100  mb-2" alt="Tinh chất phục hồi">
							<div class="position-absolute top-50 text-center ">
								<h5 class="fs-4">Tinh chất phục hồi</h5>
								<p class="small">Điều trị chống lão hóa chuyên sâu.</p>
								<p class="small">Massage lên mặt theo hình trái tim, bắt đầu
									từ giữa mặt & xuống cằm.</p>
							</div>
						</div>
						<div
							class="col-12 col-md-2 d-flex flex-column align-items-center mb-4 position-relative">
							<img
								src="https://www.esteelauder.com.vn/media/boutiques/skincare-regimen/SkincareRegimenModule_PC4.jpg"
								class="img-fluid w-100  mb-2" alt="Kem dưỡng ẩm">
							<div class="position-absolute top-50 text-center">
								<h5 class="fs-4">Kem dưỡng ẩm</h5>
								<p class="small">Được thiết kế chuyên biệt với từng nhu cầu
									của làn da</p>
								<p class="small">Thoa kem trên đầu ngón tay giúp làm nóng
									nhẹ kem. Sau đó nhẹ nhàng thoa lên mặt từ trung tâm ra ngoài.
									Ấn cả hai tay lên má, trán và cằm.</p>
							</div>
						</div>
						<div
							class="col-12 col-md-2 d-flex flex-column align-items-center mb-4 position-relative">
							<img
								src="https://www.esteelauder.com.vn/media/boutiques/skincare-regimen/SkincareRegimenModule_PC5.jpg"
								class="w-100 mb-2 img-fluid" alt="Chăm sóc mắt">
							<div class="position-absolute top-50 text-center">
								<h5 class="fs-4">Chăm sóc mắt</h5>
								<p class="small">Điều trị nhắm mục tiêu. Dưỡng ẩm phong phú,
									hiệu quả cao và nhẹ nhàng.</p>
								<p class="small">Dùng ngón áp út chấm 3 chấm. 1 ở góc ngoài,
									1 ở giữa dưới mắt & 1 ở góc trong mắt. Vỗ nhẹ để thẩm thấu vào
									da.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- content lão hóa -->
			<div class="mb-5">
				<h2 class="h2 text-center mb-4 fs-1">Chống lại các dấu hiệu lão
					hóa</h2>
				<p class="text-center mb-4">Nội dung cần chỉnh sửa</p>
				<div class="d-flex flex-row gap-3">
					<div class="card border-0">
						<video
							src="https://www.esteelauder.com.vn/media/export/cms/homepage/SP22_Supreme_Power_Demo_2.mp4"
							preload="none" autoplay muted loop>
						</video>
					</div>
					<div class="card border-0">
						<video
							src="https://www.esteelauder.com.vn/media/export/cms/homepage/SP22_ME_Power_Demo-CORE_Barrier_Strength_Challenge_Square_SUPER.mp4"
							preload="none" autoplay muted loop>
						</video>
					</div>
					<div class="card border-0">
						<video
							src="https://www.esteelauder.com.vn/media/export/cms/homepage/FL20_ANR_X5_Power_Demo_Anti_Oxidant_22s_1080x1080_Supers_Global.mp4"
							preload="none" autoplay muted loop>
						</video>
					</div>
				</div>
			</div>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
			type="text/javascript"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>

