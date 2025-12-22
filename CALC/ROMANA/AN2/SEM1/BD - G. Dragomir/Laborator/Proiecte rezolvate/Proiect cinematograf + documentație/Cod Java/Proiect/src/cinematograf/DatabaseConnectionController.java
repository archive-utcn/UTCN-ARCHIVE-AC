package cinematograf;

import javax.swing.JOptionPane;
import java.sql.*;

public class DatabaseConnectionController {
  private Connection connection;

  public DatabaseConnectionController() {
    loadDriver();
  }

  public void loadDriver() {
    try {
      Class.forName("java.sql.Driver");
    }
    catch (Exception exception) {
      JOptionPane.showMessageDialog(null, "Connetion driver loading failed", "Error", JOptionPane.ERROR_MESSAGE);
    }
  }

  public void connectToDatabaseAsSupplier() {
    try {
      connection = DriverManager.getConnection("jdbc:mysql://localhost/cinematograf?user=supplier&password=&noAccessToProcedureBodies=true");
    }
    catch (Exception exception) {
      JOptionPane.showMessageDialog(null, "Establising database connection failed", "Error", JOptionPane.ERROR_MESSAGE);
    }
  }

  public void connectToDatabaseAsClient() {
    try {
      connection = DriverManager.getConnection("jdbc:mysql://localhost/cinematograf?user=client&password=&noAccessToProcedureBodies=true");
    }
    catch (Exception exception) {
      JOptionPane.showMessageDialog(null, "Establising database connection failed", "Error", JOptionPane.ERROR_MESSAGE);
    }
  }

  public void deconnectFromDatabase() {
    if (connection != null) {
      try {
        connection.close();
        connection = null;
      }
      catch (SQLException e) {
        JOptionPane.showMessageDialog(null, "Closing database connection failed", "Error", JOptionPane.ERROR_MESSAGE);
      }
    }
  }

  /**
   * @return conexiune la baza de date.
   */
  public Connection getConnection() {
    return connection;
  }
}
