<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <title>Student Zone</title>
  <meta content="" name="description" />
  <meta content="" name="keywords" />

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect" />
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
    rel="stylesheet" />

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
  <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet" />
</head>

<body class="index-page">
  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid position-relative d-flex align-items-center justify-content-between container-xl">
      <a href="index.jsp" class="logo d-flex align-items-center me-auto me-xl-0">
        <h1 class="sitename">StudentZone</h1>
        <span></span>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="index.jsp" class="active">Home</a></li>
          <li><a href="about.jsp">About</a></li>
          <li><a href="<c:url value='/student/assessment'/>">Assessment</a></li>
          <li><a href="results.jsp">Results</a></li>
          <li><a href="analyze.jsp">Analyze</a></li>
          <c:choose>
            <c:when test="${not empty sessionScope.user}">
              <li><a href="<c:url value='/logout'/>">Logout</a></li>
            </c:when>
            <c:otherwise>
              <li><a href="<c:url value='/login'/>">Login</a></li>
              <li><a href="<c:url value='/register'/>">Register</a></li>
            </c:otherwise>
          </c:choose>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

      <a class="btn-getstarted" href="<c:url value='/register'/>">Register</a>
    </div>
  </header>

  <main class="main">
    <!-- Hero Section -->
    <section id="hero" class="hero section">
      <img src="assets/img/hero-bg1.jpg" alt="hero" data-aos="fade-in" />
      <div class="container" style="color:black">
        <div class="row justify-content-center">
          <div class="col-xl-6">
            <h2 data-aos="fade-up" data-aos-delay="100" style="margin-bottom: 20px; margin-left: 35%">
              Login
            </h2>
            <c:if test="${not empty errorMessage}">
              <p style="color: red">${errorMessage}</p>
            </c:if>
            <form
              action="${pageContext.request.contextPath}/loginUser"
              method="post"
              data-aos="fade-up" data-aos-delay="200"
            >
              <div class="row gy-3 overflow-hidden">
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input
                      type="email"
                      class="form-control"
                      name="email"
                      id="email"
                      placeholder="name@example.com"
                      required
                    />
                    <label for="email" class="form-label">Email</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input
                      type="password"
                      class="form-control"
                      name="password"
                      id="password"
                      value=""
                      placeholder="Password"
                      required
                    />
                    <label for="password" class="form-label">Password</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <select
                      class="form-select"
                      name="usertype"
                      id="usertype"
                      required
                    >
                      <option value="0">Student</option>
                      <option value="1">Admin</option>
                    </select>
                    <label for="usertype" class="form-label">User Type</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="d-grid">
                    <button
                      class="btn btn-dark btn-lg"
                      type="submit"
                      style="margin-bottom: 50px;"
                    >
                      Login
                    </button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <!-- /Hero Section -->
  </main>

  <!-- Footer Section -->
  <footer id="footer" class="footer position-relative">
    <div class="container footer-top">
      <div class="row gy-4">
        <div class="col-lg-5 col-md-12 footer-about">
          <a href="index.html" class="logo d-flex align-items-center">
            <span class="sitename">StudentZone</span>
          </a>
          <p>
            ExamPrep Portal is dedicated to helping students achieve their
            academic goals with high-quality resources and support.
          </p>

          <div class="social-links d-flex mt-4">
            <a href=""><i class="bi bi-twitter-x"></i></a>
            <a href=""><i class="bi bi-facebook"></i></a>
            <a href=""><i class="bi bi-instagram"></i></a>
            <a href=""><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

        <div class="col-lg-2 col-6 footer-links">
          <h4>Useful Links</h4>
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About us</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Terms of service</a></li>
            <li><a href="#">Privacy policy</a></li>
          </ul>
        </div>

        <div class="col-lg-2 col-6 footer-links">
          <h4>Our Services</h4>
          <ul>
            <li><a href="#">Web Design</a></li>
            <li><a href="#">Web Development</a></li>
            <li><a href="#">Product Management</a></li>
            <li><a href="#">Marketing</a></li>
            <li><a href="#">Graphic Design</a></li>
          </ul>
        </div>

        <div class="col-lg-3 col-md-12 footer-contact text-center text-md-start">
          <h4>Contact Us</h4>
          <p>Silicon University</p>
          <p>Bhubaneswar, Odisha</p>
          <p>751010</p>
          <p class="mt-4">
            <strong>Phone:</strong> <span>+91 1234567809</span>
          </p>
          <p><strong>Email:</strong> <span>info@example.com</span></p>
        </div>
      </div>
    </div>
  </footer>
  <!-- /Footer Section -->

  <!-- Scroll to Top -->
  <a href="#" class="scroll-top d-flex align-items-center justify-content-center">
    <i class="bi bi-arrow-up-short"></i>
  </a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>
</body>
</html>
