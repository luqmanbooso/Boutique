
// Function to show the modal
function showAddReview() {
	document.getElementById("addReviewModal").style.display = "flex";
}

// Function to hide the modal
function hideAddReview() {
	document.getElementById("addReviewModal").style.display = "none";
}

// Get the button that opens the modal
var openModalBtn = document.getElementById("openModalBtn");

// When the user clicks on the button, open the modal
openModalBtn.onclick = function() {
	showAddReview();
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	var modal = document.getElementById("addReviewModal");
	if (event.target == modal) {
		hideAddReview();
	}
}

// Function to show the edit review modal and pre-fill it with current review data
function showEditReviewModal(reviewId, reviewText, rating) {
	console.log("Modal function called with ID:", reviewId); // Debugging line
	document.getElementById('editReviewId').value = reviewId;
	document.getElementById('editReviewText').value = reviewText;
	document.getElementById('editReviewRating').value = rating;
	document.getElementById('editReviewModal').style.display = 'block'; // Show the modal
}

function hideEditReview() {
	// Hide the modal
	document.getElementById('editReviewModal').style.display = 'none';
}

// Close modal when clicking outside of it
window.onclick = function(event) {
	var modal = document.getElementById('editReviewModal');
	if (event.target == modal) {
		hideEditReview();
	}
}



// --------------------------------       validation for add review form ----------------------------------------//

function validateReviewForm() {
	var reviewText = document.getElementById("reviewText").value.trim();
	var rating = document.getElementById("rating").value;
	var isValid = true;

	// Reset error messages
	document.getElementById("reviewTextError").innerHTML = "";
	document.getElementById("ratingError").innerHTML = "";

	// Validate review text
	if (reviewText === "") {
		document.getElementById("reviewTextError").innerHTML = "Please fill out this field.";
		isValid = false;
		hideErrorAfterDelay("reviewTextError");
	}

	// Validate rating
	if (rating === "") { // Check if "None" is selected
		document.getElementById("ratingError").innerHTML = "Please select a rating.";
		isValid = false;
		hideErrorAfterDelay("ratingError");
		event.preventDefault();
	}

	return isValid; // Prevent form submission if isValid is false
}
// Function to hide error message after a delay
function hideErrorAfterDelay(errorId) {
	setTimeout(function() {
		document.getElementById(errorId).innerHTML = "";
	}, 1000); // Change 1000 to desired time in milliseconds (3 seconds here)
}


