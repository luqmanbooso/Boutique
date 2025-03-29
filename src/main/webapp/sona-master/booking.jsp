<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right,#575151,#ebc419);
            margin-left: 10px;
        }
        .reservation-container {
            max-width: 900px;
            margin: 10px auto; /* Further reduced margin */
            display: flex;
            flex-wrap: wrap;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            height: auto;
        }
        .reservation-container .col-md-6 {
            display: flex;
            flex-direction: column;
        }
        .reservation-container img {
            width: 100%;
            object-fit: cover;
            height: 100%;
            border-top-left-radius: 8px;
            border-bottom-left-radius: 8px;
        }
        .form-section {
            padding: 20px; /* Reduced padding */
            background-color: white;
            flex-grow: 1;
            border-radius:0 8px 8px 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .form-section h3 {
            margin-bottom: 20px; /* Reduced margin for the heading */
            font-size: 1.5rem;
        }
        .form-section label {
            font-weight: bold; /* Bold the labels */
        }
        .form-section .form-control, .form-section .form-select {
            margin-bottom: 15px; /* Reduced margin */
            width: 90%; /* Less wide inputs */
        }
        .form-section .btn-primary {
            width: 90%; /* Less wide button */
            background-color: black; /* Changed the button color to black */
            border: none;
            border-radius: 10px; /* Added border-radius */
        }
        .form-section .btn-primary:hover {
            background-color: #218838; /* Keep the current hover color */
        }
    </style>
</head>
<body>

    <div class="reservation-container">
        <!-- Image Section -->
        <div class="col-md-6 p-0">
            <img src="img/gallery/gallery-2.jpg" alt="Booking Header" class="img-fluid"> <!-- Replace with your header image URL -->
        </div>

        <!-- Form Section -->
        <div class="col-md-6 form-section">
            <h3 class="text-center">Make Your Reservation</h3>

            <!-- Booking Form -->
            <form action="insertbooking" method="post">
                <div class="mb-3">
                    <label for="checkin" class="form-label">Check-In Date</label>
                    <input type="date" class="form-control" name="checkin" id="checkin" required>
                </div>

                <div class="mb-3">
                    <label for="checkout" class="form-label">Check-Out Date</label>
                    <input type="date" class="form-control" name="checkout" id="checkout" required>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label for="adults" class="form-label">No Of Members</label>
                        <select class="form-select" name="nomem" id="adults" required>
                            <option selected disabled>1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
							<option value="5">5</option>
                        </select>
                    </div>
                    
                </div>

                <div class="mb-3">
                            <label for="room" class="form-label">Room Type</label>
                            <select class="form-select" id="room" name="rtype" required>
                                <option selected disabled>Choose a room type</option>
                                <option value="single">Single Room</option>
                                <option value="double">Double Room</option>
                                <option value="suite">Suite</option>
                            </select>
                        </div>

                <button type="submit" class="btn btn-primary">Book Now</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
