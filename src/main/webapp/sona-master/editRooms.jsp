<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Room</title>
  
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .bg-image {
            background: url('path/to/your/background-image.jpg') no-repeat center center fixed; /* Set your background image */
            background-size: cover;
            height: 100vh; /* Full height */
            display: flex; /* Use flexbox for centering */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
        }
        .form-container {
            background: rgba(255, 255, 255, 0.9); /* Slightly transparent white */
            padding: 1.5rem; /* Reduced padding */
            border-radius: 0.5rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            max-width: 800px; /* Increased maximum width */
            width: 100%; /* Make it full width within the max-width */
            margin: auto; /* Center horizontally */
            height: auto; /* Set height to auto to avoid scrolling */
        }
        h2 {
            color: black; /* Change heading color to black */
        }
    </style>
</head>
<body>
   
    <div class="bg-image">
        <div class="form-container">
            <h2 class="text-center">Edit Room Details</h2>
            
            <!-- Update action URL to match your servlet -->
            <form action="editRoom" method="post" class="mt-4" onsubmit="return validateRoomForm();">
                <input type="hidden" name="id" value="${room.id}">
                
                <div class="mb-3">
                    <label for="roomName" class="form-label">Room Name:</label>
                    <select class="form-select" id="roomName" name="roomName" required>
                        <option value="">-- Select Room Name --</option>
                        <option value="Premium King Room" ${room.roomName == 'Premium King Room' ? 'selected' : ''}>Premium King Room</option>
                        <option value="Deluxe Room" ${room.roomName == 'Deluxe Room' ? 'selected' : ''}>Deluxe Room</option>
                        <option value="Double Room" ${room.roomName == 'Double Room' ? 'selected' : ''}>Double Room</option>
                        <option value="Luxury Room" ${room.roomName == 'Luxury Room' ? 'selected' : ''}>Luxury Room</option>
                        <option value="Room With View" ${room.roomName == 'Room With View' ? 'selected' : ''}>Room With View</option>
                        <option value="Small View" ${room.roomName == 'Small View' ? 'selected' : ''}>Small View</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="price" class="form-label">Price per Night ($):</label>
                    <input type="number" class="form-control" id="price" name="price" value="${room.price}" required>
                </div>

                <div class="mb-3">
                    <label for="size" class="form-label">Room Size (sq. ft):</label>
                    <input type="number" class="form-control" id="size" name="size" value="${room.size}" required>
                </div>

                <div class="mb-3">
                    <label for="capacity" class="form-label">Capacity (max persons):</label>
                    <input type="number" class="form-control" id="capacity" name="capacity" value="${room.capacity}" required>
                </div>

                <div class="mb-3">
                    <label for="bedType" class="form-label">Bed Type:</label>
                    <input type="text" class="form-control" id="bedType" name="bedType" value="${room.bedType}" required>
                </div>

                <div class="mb-3">
                    <label for="services" class="form-label">Services:</label>
                    <input type="text" class="form-control" id="services" name="services" value="${room.services}" required>
                </div>
                
                <button type="submit" class="btn btn-dark w-100">Update Room</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
