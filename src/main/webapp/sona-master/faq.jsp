<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add FAQ</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Frequently Asked Questions</h2>
    <!-- Button to open the modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#faqModal">
        Add FAQ
    </button>

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
                <form action="addFaq" method="POST">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="question">Question:</label>
                            <input type="text" class="form-control" name="question" required>
                        </div>
                        <div class="form-group">
                            <label for="answer">Answer:</label>
                            <textarea class="form-control" name="answer" rows="5" required></textarea>
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

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
