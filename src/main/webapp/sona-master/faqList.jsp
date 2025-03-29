<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.admin.model.FAQ" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boutique</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
      
    <style>
        @import url(https://unpkg.com/@webpixels/css@1.1.5/dist/index.css);
        /* Bootstrap Icons */
        @import url("https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css");

        body {
            background-color: #f8f9fa;
        }
        .faq-item {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .faq-item:hover {
            transform: scale(1.002);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #f0f0f0;
        }
        .faq-item h3 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }
        .faq-item p {
            margin: 10px 0 0;
            font-size: 16px;
            color: #555;
        }
        .faq-timestamps {
            font-size: 14px;
            color: #888;
            margin-bottom: 10px;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            padding-left: 15px;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
        #faqListContainer {
            padding-left: 15px;
            padding-right: 15px;  
        }
        
    </style>
</head>
<body>
<!-- Dashboard -->
<div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
    <!-- Vertical Navbar -->
    <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg" id="navbarVertical">
        <div class="container-fluid">
            <!-- Toggler -->
            <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Brand -->
            <a class="navbar-brand py-lg-2 mb-lg-5 px-lg-6 me-0" href="#">
               <img src="img/logo1.png" alt="">            </a>
            <!-- User menu (mobile) -->
            <div class="navbar-user d-lg-none">
                <!-- Dropdown -->
                <div class="dropdown">
                    <!-- Toggle -->
                    <a href="#" id="sidebarAvatar" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <div class="avatar-parent-child">
                            <img alt="Image Placeholder" src="https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar- rounded-circle">
                            <span class="avatar-child avatar-badge bg-success"></span>
                        </div>
                    </a>
                    <!-- Menu -->
                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="sidebarAvatar">
                        <a href="#" class="dropdown-item">Profile</a>
                        <a href="#" class="dropdown-item">Settings</a>
                        <a href="#" class="dropdown-item">Billing</a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">Logout</a>
                    </div>
                </div>
            </div>
            <!-- Collapse -->
            <div class="collapse navbar-collapse" id="sidebarCollapse">
                <!-- Navigation -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="adminDashboard.jsp">
                            <i class="bi bi-house"></i> Dashboard
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="faqList">
                            <i class="bi bi-chat"></i> FAQ
                        </a>
                    </li>

                </ul>
                <!-- Divider -->
                <hr class="navbar-divider my-5 opacity-20">
                <!-- Navigation -->
                
                <div class="mt-auto"></div>
                <!-- User (md) -->
                <ul class="navbar-nav">
                    
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">
                            <i class="bi bi-box-arrow-left"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Main content -->
    <div class="h-screen flex-grow-1 overflow-y-lg-auto">
        <!-- Header -->
        <header class="bg-surface-primary border-bottom pt-6">
            <div class="container-fluid">
                <div class="mb-npx">
                    <div class="row align-items-center">
                        <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                            <p class="h2 mb-0 ls-tight" style="align:center;">Frequently Asked Questions</p>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main -->
        <br><br>
        <div id="faqListContainer">
        <%
            List<FAQ> faqList = (List<FAQ>) request.getAttribute("faqList");
            if (faqList != null && !faqList.isEmpty()) {
                int index = 1; // Initialize counter for numbering
                for (FAQ faq : faqList) {
        %>
            <div class="faq-item">
                <h3><%= index++ %>. <%= faq.getQuestion() %></h3> <!-- Display question with numbering -->
                <p><span style="font-weight:500;">Answer:</span> <%= faq.getAnswer() %></p>
                <div class="faq-timestamps">
                    <small>Created At: <%= faq.getCreatedAt() %></small><br>
                    <small>Updated At: <%= faq.getUpdatedAt() %></small>
                </div>
                <div class="actions">
                    <a href="editFaq?id=<%= faq.getId() %>" class="btn btn-primary">Edit</a>
                    <a href="deleteFaq?id=<%= faq.getId() %>" onclick="return confirm('Are you sure you want to delete this FAQ?')" class="btn btn-danger">Delete</a>
                </div>
            </div>
        <%
                }
            } else {
        %>
            <p>No FAQs available.</p>
        <%
            }
        %>
        </div>

        <!-- Button Container -->
        <div class="button-container">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#faqModal">Add FAQ</button>

            <!-- Modal -->
            <div class="modal fade" id="faqModal" tabindex="-1" role="dialog" aria-labelledby="faqModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="faqModalLabel">Add New FAQ</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form name="faqForm" action="addFaq" method="POST" onsubmit="return validateFaqForm()">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="question">Question:</label>
                                    <input type="text" class="form-control" name="question" oninput="removeErrorMessage('questionError')">
                                    <!-- Error message for question -->
                                    <span id="questionError" class="error-message"></span>
                                </div>
                                <div class="form-group">
                                    <label for="answer">Answer:</label>
                                    <textarea class="form-control" name="answer" rows="5" oninput="removeErrorMessage('answerError')"></textarea>
                                    <!-- Error message for answer -->
                                    <span id="answerError" class="error-message"></span>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" value="Add FAQ">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <br>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Custom Validation Script -->
<script>
    function validateFaqForm() {
        var question = document.forms["faqForm"]["question"].value;
        var answer = document.forms["faqForm"]["answer"].value;
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
