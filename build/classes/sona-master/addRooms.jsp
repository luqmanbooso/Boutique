<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a Room</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Custom styles */
        body {
            font-weight: bold; /* Set all text to bold */
        }
        h2 {
            color: black; /* Change heading color to black */
        }
        .form-label {
            color: black; /* Change label color to black */
        }
        .btn-custom {
            background-color: black; /* Change button color to black */
            color: white; /* Change button text color to white for contrast */
        }
        .card {
            padding: 2rem; /* Reduce padding for the card */
        }
        .form-group {
            margin-bottom: 1rem; /* Adjust margin for form groups */
        }
    </style>
</head>
<body>
    
    <div class="container-fluid bg-light min-vh-100 d-flex justify-content-center align-items-center">
        <div class="card shadow-lg p-3 w-50"> <!-- Reduced padding to 3 -->
            <h2 class="text-center mb-3">Add a New Room</h2> <!-- Reduced margin-bottom -->
            <form action="addRoom" method="post" onsubmit="return validateRoomForm();">
                <div class="mb-3">
                    <label for="roomName" class="form-label">Room Name:</label>
                    <select class="form-select" id="roomName" name="roomName" required>
                        <option value="">-- Select Room Name --</option>
                        <option value="Premium King Room">Premium King Room</option>
                        <option value="Deluxe Room">Deluxe Room</option>
                        <option value="Double Room">Double Room</option>
                        <option value="Luxury Room">Luxury Room</option>
                        <option value="Room With View">Room With View</option>
                        <option value="Small View">Small View</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Price per Night ($):</label>
                    <input type="number" class="form-control" id="price" name="price" required>
                </div>
                <div class="mb-3">
                    <label for="size" class="form-label">Room Size (sq. ft):</label>
                    <input type="number" class="form-control" id="size" name="size" required>
                </div>
                <div class="mb-3">
                    <label for="capacity" class="form-label">Capacity (max persons):</label>
                    <input type="number" class="form-control" id="capacity" name="capacity" required>
                </div>
                <div class="mb-3">
                    <label for="bedType" class="form-label">Bed Type:</label>
                    <input type="text" class="form-control" id="bedType" name="bedType" required>
                </div>
                <div class="mb-3">
                    <label for="services" class="form-label">Services:</label>
                    <input type="text" class="form-control" id="services" name="services" required>
                </div>
                
                <button type="submit" class="btn btn-custom w-100">Add Room</button> <!-- Added custom button class -->
            </form>
        </div>
    </div>

    <!-- Bootstrap JS with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
