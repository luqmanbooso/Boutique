<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.hotel.model.Review"%>

<!DOCTYPE html>
<html>
<head>
    <title>Boutique - Admin Reviews</title>
    <style>
        @import url(https://unpkg.com/@webpixels/css@1.1.5/dist/index.css);
        @import url("https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css");

        .status-approved { color: green; font-weight: bold; }
        .status-rejected { color: red; font-weight: bold; }
        .status-pending { color: gray; font-weight: bold; }
    </style>
</head>
<body>
<div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">

    <!-- Sidebar -->
    <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg">
        <div class="container-fluid">
            <a class="navbar-brand py-lg-2 mb-lg-5 px-lg-6 me-0" href="#"><img src="img/logo1.png" alt="Logo"></a>
            <div class="collapse navbar-collapse" id="sidebarCollapse">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="adminDashboard.jsp"><i class="bi bi-house"></i> Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="faqList"><i class="bi bi-chat"></i> FAQ</a></li>
                    <li class="nav-item"><a class="nav-link active" href="adminReviews"><i class="bi bi-star"></i> Reviews</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="h-screen flex-grow-1 overflow-y-lg-auto">
        <header class="bg-surface-primary border-bottom pt-6">
            <div class="container-fluid"><h1 class="h2 mb-0 ls-tight">Admin Dashboard - Reviews</h1></div>
        </header>

        <main class="py-6 bg-surface-secondary">
            <div class="container-fluid">
                <h2>Manage User Reviews</h2>
                <div class="card shadow border-0 mb-7">
                    <div class="card-header"><h5 class="mb-0">All Reviews</h5></div>
                    <div class="table-responsive">
                        <table class="table table-hover table-nowrap">
                            <thead class="thead-light">
                                <tr>
                                    <th>ID</th>
                                    <th>User</th>
                                    <th>Review</th>
                                    <th>Rating</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="review" items="${reviews}">
                                    <tr>
                                        <td><strong>ID:</strong> ${review.id}</td>
                                        <td>${review.userName}</td>
                                        <td>${review.reviewText}</td>
                                        <td>${review.rating}⭐</td>
                                        <td id="status-${review.id}" class="status-${review.status.toLowerCase()}">${review.status}</td>
                                        <td>${review.createdAt}</td>
                                        <td class="text-end">
                                            <div class="btn-group btn-group-sm" role="group">
                                                <button class="btn btn-outline-success" onclick="updateReviewStatus(${review.id}, 'approved')">Approve</button>
                                                <button class="btn btn-outline-danger" onclick="updateReviewStatus(${review.id}, 'rejected')">Reject</button>
                                                <button class="btn btn-outline-secondary" onclick="updateReviewStatus(${review.id}, 'delete')">Delete</button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script>
function updateReviewStatus(reviewId, status) {
    if (!reviewId || !status) {
        alert("Missing review ID or status");
        return;
    }

    if(status === 'delete'){
        if(!confirm("Are you sure you want to delete this review?")){
            return;
        }
    }

    const url = "${pageContext.request.contextPath}/updateReviewStatus?id=" + encodeURIComponent(reviewId) + "&status=" + encodeURIComponent(status);
    console.log("Sending request to:", url);

    fetch(url)
        .then(response => {
            if(response.ok){
                if(status === 'delete'){
                    document.querySelector(`#status-${reviewId}`).closest('tr').remove();
                } else {
                    const cell = document.querySelector(`#status-${reviewId}`);
                    cell.innerText = status;
                    cell.className = 'status-' + status.toLowerCase();
                }
            } else {
                alert("Failed to update review. HTTP: " + response.status);
            }
        })
        .catch(err => {
            console.error("Error updating review:", err);
            alert("Error updating review");
        });
}
</script>

</body>
</html>
