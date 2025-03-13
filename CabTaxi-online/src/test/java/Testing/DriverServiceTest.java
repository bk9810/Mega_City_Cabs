package Testing;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;

import java.lang.reflect.Field;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.example.dao.driverDAO;
import com.example.model.Driver;
import com.example.service.DrivService;

public class DriverServiceTest {
	
	 @Mock
	    private driverDAO mockDao; // Mock DAO

	    private DrivService drivService;

	    @Before
	    public void setUp() throws Exception {
	        MockitoAnnotations.initMocks(this);
	        
	        // Reset singleton instance
	        Field instance = DrivService.class.getDeclaredField("instance");
	        instance.setAccessible(true);
	        instance.set(null, null);

	        // Initialize service and inject mock DAO
	        drivService = DrivService.getInstance();
	        Field daoField = DrivService.class.getDeclaredField("driverdao");
	        daoField.setAccessible(true);
	        daoField.set(drivService, mockDao);
	    }

	    // Test Cases

	    @Test
	    public void testRegisterDriver_Success() {
	        // Initialize the Driver with valid data
	        Driver driver = new Driver();
	        driver.setName("John Doe");
	        driver.setEmail("john@example.com");
	        driver.setPhone("1234567890");
	        driver.setPassword("password");
	        driver.setAddress("123 Main St");
	        driver.setDob("1990-01-01");
	        driver.setNic("NIC123");

	        int[] generatedId = new int[1];

	        // Mock DAO to return success
	        when(mockDao.addDriver(eq(driver), any(int[].class))).thenAnswer(invocation -> {
	            int[] ids = invocation.getArgument(1);
	            ids[0] = 123; // Simulate generated ID
	            return true;
	        });

	        boolean result = drivService.registerDriver(driver, generatedId);
	        assertTrue(result);
	        assertEquals(123, generatedId[0]);
	    
	    }
}
