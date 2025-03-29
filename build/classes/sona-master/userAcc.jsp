<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.customer.model.Customer" %>
<%@ page import="com.customer.dao.CustomerDAO" %>
    <%@ page import="java.util.List"%>
<%@ page import="com.hotel.dao.*"%>
<%@ page import="com.hotel.model.*"%>
<%@ include file="headeruserAcc.jsp" %>

    <%
    if (session.getAttribute("userID") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further execution
    }
    Integer userID = (Integer) request.getSession().getAttribute("userID");
    
	 Customer cus = CustomerDAO.getCustomer(userID);
	 request.setAttribute("uid", cus.getId());
	 request.setAttribute("uemail", cus.getEmail());
	 request.setAttribute("uname", cus.getName());
	 request.setAttribute("upass", cus.getPassword());
    %>
<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <h2>User Profile</h2>
                    <div class="bt-option">
                        <a href="./home.jsp">Home</a>
                        <span>user-profile</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->
<div class="container profile-container">

    <!-- User Information Section -->
    <div class="account-info">
        <h2>Account Information</h2>
        <div class="row mb-3">
            <div class="col-sm-4">
                <label for="name" class="form-label">Name:</label>
            </div>
            <div class="col-sm-8">
                <span id="name">${uname}</span>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <label for="email" class="form-label">Email:</label>
            </div>
            <div class="col-sm-8">
                <span id="email">${uemail}</span>
            </div>
             <!-- Action Buttons -->
             <div class="review-actions text-end">
                <button class="btn edit-btn" id="openEditModal"><i class="fas fa-edit"></i> Edit</button>
                <a  href="deleteUser?udid=${uid}" class="btn delete-btn" onclick="return confirm('Are you sure you want to delete Your Account?');"><i class="fas fa-trash-alt"></i> Delete</a>
                
                </div>

      </div>
    </div>
  </div>
  
  <script>
  document.getElementById('openEditModal').addEventListener('click', function() {
	   
	    // Show the edit modal
	    var editModal = new bootstrap.Modal(document.getElementById('editBookingModal'));
	    editModal.show();
		});



		
</script>
  <!-- Edit Booking Modal -->

  <div class="modal fade" id="editBookingModal" tabindex="-1" aria-labelledby="editBookingModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editBookingModalLabel">Edit User Profile</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <!-- Form for editing booking details -->
          <form id="editBookingForm" action="editUser?uid=${uid}" method="post">
    <div class="mb-3">
        <label for="editCustomerName" class="form-label">Full Name</label>
        <input type="text" class="form-control" id="editCustomerName" name="uname" value="${uname}" required>
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="uemail" value="${uemail}" required>
    </div>
    <div class="mb-3">
        <label for="pass" class="form-label">New Password</label>
        <input type="password" class="form-control" id="newPassword" name="newPassword" required>
        <div class="invalid-feedback">Password is required.</div>
    </div>
    <div class="mb-3">
        <label for="repass" class="form-label">Re-Enter Password</label>
        <input type="password" class="form-control" id="reenterPassword" name="reenterPassword" required>
        <div class="invalid-feedback">Passwords do not match.</div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn edit-btn" onclick="window.location.href='userAcc.jsp';" style="background-color:black;color:#fff;">Close</button>
        <button type="submit" class="btn edit-btn">Save Changes</button>
    </div>
</form>

<script>
    document.getElementById('editBookingForm').addEventListener('submit', function(event) {
        var newPassword = document.getElementById('newPassword').value;
        var reenterPassword = document.getElementById('reenterPassword').value;

        document.getElementById('newPassword').classList.remove('is-invalid');
        document.getElementById('reenterPassword').classList.remove('is-invalid');

        if (newPassword !== reenterPassword) {
            event.preventDefault();
            document.getElementById('reenterPassword').classList.add('is-invalid');
            document.getElementById('newPassword').classList.add('is-invalid');
        }

        if (newPassword.length !== 8) {
            event.preventDefault();
            document.getElementById('newPassword').classList.add('is-invalid');
            alert('Password must be at least 8 characters long.');
        }
    });
</script>


        </div>
      </div>
    </div>
  </div>


 	<!-------------------------- Review Section Begin-------------------------------------->
<div class="section-header">
			<h2>My Reviews</h2>
		</div>

	<%
// 	HTTPSESSION HTTPSESSION = REQUEST.GETSESSION();
// 	INTEGER USERID = (INTEGER) SESSION.GETATTRIBUTE("USERID");

	if (userID != null) {
		// Fetch user reviews using the DAO
		ReviewDAO reviewDAO = new ReviewDAO();
		List<Review> userReviews = reviewDAO.getUserReviews(userID);

		if (userReviews != null && !userReviews.isEmpty()) {
			for (Review review : userReviews) {
	%>

	<!-- User Reviews Section -->
	<div class="reviews-section">

		

		<!-- Example Review -->
		<div class="review-item">
			<div class="review-header d-flex justify-content-between">
				<div>
					<p>
						<strong>Rating:</strong> <span class="rating-stars"
							style="color: gold;"> <%=review.getStars()%>
						</span>
					</p>
					<p>
						<strong>Review Date:</strong>
						<%=review.getCreatedAt()%>
						<!-- Use your review date field -->
					</p>
				</div>
			</div>
			<div class="review-body">
				<p><%=review.getReviewText()%></p>
				<!-- Use your review text field -->
			</div>

			<!-- Action Buttons for Edit/Delete (if needed) -->
			<div class="review-actions text-end">

				<!-- Edit Review Button -->
				<button type="button" class="btn edit-btn"
					onclick="showEditReviewModal('<%=review.getId()%>', '<%=review.getReviewText()%>', '<%=review.getRating()%>')">
					<i class="fas fa-edit"></i> Edit
				</button>


				<form action="deleteReview" method="post" style="display: inline;">
					<input type="hidden" name="reviewId" value="<%=review.getId()%>">
					<button class="btn delete-btn"
						onclick="return confirm('Are you sure you want to delete this review?');">
						<i class="fas fa-trash-alt"></i> Delete
					</button>
				</form>
			</div>
		</div>
		<%
		}
		} else {
		%>
		
		<p>You have not submitted any reviews yet.</p>
		<button onclick="window.location.href='index.jsp'"
			class="btn view-btn" style="float: right; margin-right: 20px;">
			<i class="fas fa-eye"></i> Add Review
		</button>
	<br><br>
		<%
		}
		}
		%>
	</div>

<!-- Edit Review Modal -->
<div id="editReviewModal" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h2>Edit Review</h2>
                <span class="close" onclick="hideEditReview()">&times;</span>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <form id="editReviewForm" action="UpdateReviewServlet" method="post">
                    <input type="hidden" name="reviewId" id="editReviewId">

                    <div class="mb-3">
                        <label for="reviewText" class="form-label">Edit your review</label>
                        <textarea class="form-control" name="reviewText" id="editReviewText" rows="4" required
                            placeholder="Edit your review..."></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="rating" class="form-label">Rating:</label>
                        <select class="form-select" name="rating" id="editReviewRating" required>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </form>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn delete-btn" onclick="hideEditReview()">Cancel</button>
                <button type="submit" class="btn view-btn" form="editReviewForm">Update Review</button>
            </div>
        </div>
    </div>
</div>



<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/reviewModal.js"></script>
<%@ include file="footer.jsp" %>
    

 