package Testing;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.example.dao.BookingDAO;
import com.example.model.Booking;
import com.example.service.BookingService;
import com.example.service.DistanceService;

public class BookingServiceTest {
	
	 @Mock
	    private BookingDAO mockBookingDAO; // Mock DAO

	    @Mock
	    private DistanceService mockDistanceService; // Mock DistanceService

	    @InjectMocks
	    private BookingService bookingService; // Injects mocks into this service

	    @Before
	    public void setUp() {
	        MockitoAnnotations.openMocks(this); // Initialize mocks
	    }

	    // Test Cases

	    @Test(expected = SQLException.class)
	    public void testCreateBooking_DaoThrowsException() throws SQLException {
	        // Simulate DAO failure
	        when(mockDistanceService.getDistance(anyInt(), anyInt())).thenReturn(10.0);
	        when(mockBookingDAO.createBooking(any(Booking.class))).thenThrow(new SQLException());

	        // Act (expect exception)
	        bookingService.createBooking(1, 2, 3);
	    }
}
