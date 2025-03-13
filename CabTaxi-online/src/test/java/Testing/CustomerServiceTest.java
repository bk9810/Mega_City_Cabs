package Testing;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;

import java.lang.reflect.Field;
import java.sql.Driver;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;

import com.example.dao.driverDAO;
import com.example.service.DrivService; 

@RunWith(MockitoJUnitRunner.class) 
public class CustomerServiceTest {
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
	    
	   
	   
	    

}
