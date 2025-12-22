package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 * Metode:
 * 1. Incarcarea driver'ului de conectare la baza de date. --> public void loadDriver() <--
 * 2. Pt. conectarea la baza de date. --> public Connection connect() <--
 * 3. Pt. inchiderea bazei de date. --> public void disconnect() <--
 */
public class DBConnect 
{
	/**
	 * Variabila pt. conexiunea la baza de date.
	 */
	private Connection conexiune = null;
	
	/**
	 * Metoda pt. incarcarea Driver'ului de conectare la baza de date.
	 */
	public void loadDriver()
	{
		try 
		{
			/**
			 * Instructiune pt. incarcare driver.
			 */
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		}
		catch (Exception ex) 
		{
			/**
			 * Mesaj de eroare.
			 */
			JOptionPane.showMessageDialog(null, "Cannot load conection driver to your database!...",
										  "Error", JOptionPane.ERROR_MESSAGE);
		}
	}
	
	/**
	 * Metoda pt. conectarea la baza de date.
	 */
	public void connect()
	{
		try 
		{
			/**
			 * Crearea conexiuni la baza de date.
			 */
			conexiune = DriverManager.getConnection("jdbc:mysql://localhost/computer_shop?user=root&password=");
                       
	    }
	    catch(SQLException sqlex) 
	    {
	    	/**
			 * Mesaj de eroare.
			 */
	    	JOptionPane.showMessageDialog(null, "Cannot connect to your database...",
	    								  "Error", JOptionPane.ERROR_MESSAGE);
	    	System.exit(0);
	    }
	}
	
	/**
	 * Metoda pt. inchiderea conextiuni la baza de date.
	 */
	public void disconnect()
	{
		/**
		 * Daca e null => nu avem conexiune => nu avem ce inchide.
		 */
        if (conexiune != null) 		
        { 
           try 
           {
        	   /**
        	    * Instructiune inchidere conexiune la baza de date.
        	    */
        	   conexiune.close();   
        	   conexiune = null;	
           }
           catch(SQLException e) 
           {
        	   /**
   			 	* Mesaj de eroare.
   			 	*/
        	   JOptionPane.showMessageDialog(null, "Cannot close conection to your database!...",
						  "Error", JOptionPane.ERROR_MESSAGE);
           }    
        }
	}
	
	/**
	 * @return conexiune la baza de date.
	 */
	public Connection getConexiune()
	{
		return conexiune;
	}
}
