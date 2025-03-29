
// Confirm delete action
function confirmDelete() {
    return confirm('Are you sure you want to delete this room?');
}
// form validation
function validateRoomForm() {
    const roomName = document.getElementById("roomName").value;
    const price = document.getElementById("price").value;
    const size = document.getElementById("size").value;
    const capacity = document.getElementById("capacity").value;

    if (!roomName || roomName.trim() === "") {
        alert("Room Name is required.");
        return false;
    }
    if (price <= 0) {
        alert("Price must be greater than 0.");
        return false;
    }
    if (size <= 0) {
        alert("Size must be a positive value.");
        return false;
    }
    if (capacity <= 0) {
        alert("Capacity must be at least 1.");
        return false;
    }

    return true; // Valid form, allow submission
}
