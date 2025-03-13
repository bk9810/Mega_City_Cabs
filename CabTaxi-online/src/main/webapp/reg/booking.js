function calculateFare() {
    let pickup = document.getElementById("pickup").value;
    let drop = document.getElementById("drop").value;
    let vehicleType = document.getElementById("vehicleType").value;

    let service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix(
        {
            origins: [pickup],
            destinations: [drop],
            travelMode: google.maps.TravelMode.DRIVING,
        },
        function (response, status) {
            if (status === "OK") {
                let distanceText = response.rows[0].elements[0].distance.text;
                let distanceValue = response.rows[0].elements[0].distance.value / 1000; // Convert to km

                // Fare calculation
                let fareRate = vehicleType == "4" ? 100 : vehicleType == "8" ? 200 : 400;
                let totalFare = distanceValue * fareRate;

                document.getElementById("distance").innerHTML = "Distance: " + distanceText;
                document.getElementById("fare").innerHTML = "Total Fare: LKR " + totalFare.toFixed(2);

                // Store values in hidden inputs for form submission
                document.getElementById("bookingForm").innerHTML += 
                    `<input type="hidden" name="distance" value="${distanceValue}">
                     <input type="hidden" name="fare" value="${totalFare}">`;
            }
        }
    );
}
