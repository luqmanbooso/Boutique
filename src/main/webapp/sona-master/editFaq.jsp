<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.admin.model.FAQ" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit FAQ</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Edit FAQ</h2>

    <!-- Modal for Editing FAQ -->
    <div class="modal fade show" id="editFaqModal" tabindex="-1" role="dialog" aria-labelledby="editFaqModalLabel" aria-hidden="true" style="display: block;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editFaqModalLabel">Edit FAQ</h5>
                </div>
                <form name="editFaqForm" action="editFaq" method="POST" onsubmit="return validateEditFaqForm()">
                    <div class="modal-body">
                        <%
                            FAQ faq = (FAQ) request.getAttribute("faq");
                            if (faq != null) {
                        %>
                        <input type="hidden" name="id" value="<%= faq.getId() %>">
                        <div class="form-group">
                            <label for="question">Question:</label>
                            <input type="text" class="form-control" name="question" value="<%= faq.getQuestion() %>" oninput="removeErrorMessage('questionError')">
                            <!-- Error message for question -->
                            <span id="questionError" class="error-message"></span>
                        </div>
                        <div class="form-group">
                            <label for="answer">Answer:</label>
                            <textarea class="form-control" name="answer" rows="5" oninput="removeErrorMessage('answerError')"><%= faq.getAnswer() %></textarea>
                            <!-- Error message for answer -->
                            <span id="answerError" class="error-message"></span>
                        </div>
                        <%
                            } else {
                        %>
                        <p>FAQ not found. Please go back to the FAQ list.</p>
                        <%
                            }
                        %>
                    </div>
                    <div class="modal-footer">
                        <a href="faqList" class="btn btn-secondary">Cancel</a>
                        <button type="submit" class="btn btn-primary">Update FAQ</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Auto-show the modal when the page loads -->
<script>
    $(document).ready(function() {
        $('#editFaqModal').modal('show');
    });
</script>

<!-- Custom Validation Script -->
<script>
    function validateEditFaqForm() {
        var question = document.forms["editFaqForm"]["question"].value;
        var answer = document.forms["editFaqForm"]["answer"].value;
        var isValid = true;

        // Reset error messages
        document.getElementById("questionError").innerHTML = "";
        document.getElementById("answerError").innerHTML = "";

        // Validate question
        if (question.length < 10) {
            document.getElementById("questionError").innerHTML = "The question must be at least 10 characters long.";
            isValid = false;
        }

        // Validate answer
        if (answer.length < 15) {
            document.getElementById("answerError").innerHTML = "The answer must be at least 15 characters long.";
            isValid = false;
        }

        return isValid;
    }

    // Function to remove error message on input change
    function removeErrorMessage(errorId) {
        document.getElementById(errorId).innerHTML = "";
    }
</script>

</body>
</html>
