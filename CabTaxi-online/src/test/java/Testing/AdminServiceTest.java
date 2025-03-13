package Testing;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.example.dao.AdminDAO;
import com.example.model.Admin;
import com.example.service.AdminService;

public class AdminServiceTest {
	
	 @Mock
	    private AdminDAO mockAdminDAO; // Mock DAO

	    @InjectMocks
	    private AdminService adminService; // Injects mock DAO into service

	    @Before
	    public void setUp() {
	        MockitoAnnotations.openMocks(this); // Initialize mocks
	    }

	    // Test Cases


	    @Test
	    public void testAuthenticateAdmin_DatabaseError() {
	        // Arrange
	        String username = "admin";
	        when(mockAdminDAO.getAdminByUsername(username)).thenThrow(new RuntimeException("Database error"));

	        // Act
	        boolean result = adminService.authenticateAdmin(username, "anyPassword");

	        // Assert
	        assertFalse(result);
	        verify(mockAdminDAO).getAdminByUsername(username);
	    }

}
