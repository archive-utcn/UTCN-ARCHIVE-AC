package cinematograf;

import java.sql.*;

import javax.swing.JOptionPane;

public class DatabaseLogicController {
  private Connection connection;
  private Statement statement;
  private ResultSet resultSet;
  private CallableStatement callableStatement;

  public DatabaseLogicController(Connection connection) throws SQLException {
    this.connection = connection;
  }

  public boolean verifyLogInConditionsAsSupplier(String username) {
    if ((username.equals("administrator"))) {
      return true;
    }
    return false;
  }

  public boolean verifyLogInConditionsAsClient(String login_name) {
    
    try {
      statement = connection.createStatement();
      statement.execute(login_name);
      resultSet = statement.getResultSet();
      if (resultSet.next() == false) {
        return false;
      }
    }
    catch (SQLException e) {
     
    }
    return true;
  }

  public String insertNewClient(String name, String surname,int id_film) {
    String result = new String();
    try {
      callableStatement = connection.prepareCall("{call adaugare_client(?,?,?)}");
      callableStatement.setString(1, name);
      callableStatement.setString(2, surname);
      callableStatement.setInt(3, id_film);
      callableStatement.execute();
      resultSet = callableStatement.getResultSet();
      if (callableStatement.getMoreResults()) {
        resultSet = callableStatement.getResultSet();
        resultSet.next();
        result = resultSet.getString(1);
      }
    }
    catch (SQLException e) {
      JOptionPane.showMessageDialog(null, e.getMessage(), null, JOptionPane.ERROR_MESSAGE);
    }
    return result;
  }


 

  public boolean insertNewInternetRezervation(String nume1, String prenume1,Integer id_film1, String valabilityDate) {
    try {
      callableStatement = connection.prepareCall("{call rezervare(?,?,?,?)}");
      callableStatement.setString(1, nume1);
      callableStatement.setString(2, prenume1);
      callableStatement.setInt(3, id_film1);
      callableStatement.setString(4, valabilityDate);
      callableStatement.execute();

     
      resultSet = callableStatement.getResultSet();
      while (callableStatement.getMoreResults(Statement.KEEP_CURRENT_RESULT)) {
      
        resultSet = callableStatement.getResultSet();
      }
      return true;
    }
    catch (SQLException e) {
      JOptionPane.showMessageDialog(null, e.getMessage(), null, JOptionPane.ERROR_MESSAGE);
    }
    return false;
  }

  public boolean insertNewMovie(String title, String start_time,String end_time) {
    try {
      callableStatement = connection.prepareCall("{call ADAUGARE_FILME(?,?,?)}");
      callableStatement.setString(1, title);
      callableStatement.setString(2, start_time);
      callableStatement.setString(3, end_time);
      callableStatement.execute();

   
      resultSet = callableStatement.getResultSet();
      while (callableStatement.getMoreResults(Statement.KEEP_CURRENT_RESULT)) {
   
        resultSet = callableStatement.getResultSet();
        
      }
      return true;
    }
    catch (SQLException e) {
      JOptionPane.showMessageDialog(null, e.getMessage(), null, JOptionPane.ERROR_MESSAGE);
    }
    return false;
  }

 
  public ResultSet showMoviesInformation() {
    String query = "select * from film";
    try {
      statement = connection.createStatement();
      resultSet = statement.executeQuery(query);
    }
    catch (SQLException e) {
      e.printStackTrace();
      JOptionPane.showMessageDialog(null, "Show movies information query failed!", null, JOptionPane.ERROR_MESSAGE);
    }
    return resultSet;
  }


  public ResultSet showInternetRezervationsInfo() {
    String query = "select * from rezervari;";
    try {
      statement = connection.createStatement();
      resultSet = statement.executeQuery(query);
    }
    catch (SQLException e) {
      e.printStackTrace();
      JOptionPane.showMessageDialog(null, "Show internet rezervations information query failed!", null,
          JOptionPane.ERROR_MESSAGE);
    }
    return resultSet;
  }

  public ResultSet showClientsInfo() {
    String query = "select * from client;";
    try {
      statement = connection.createStatement();
      resultSet = statement.executeQuery(query);
    }
    catch (SQLException e) {
      e.printStackTrace();
      JOptionPane.showMessageDialog(null, "Show clients information query failed!", null, JOptionPane.ERROR_MESSAGE);
    }
    return resultSet;
  }

  public ResultSet showMediaInfo() {
    String query = "select * from film;";
    try {
      statement = connection.createStatement();
      resultSet = statement.executeQuery(query);
    }
    catch (SQLException e) {
      e.printStackTrace();
      JOptionPane.showMessageDialog(null, "Show media information query failed!", null, JOptionPane.ERROR_MESSAGE);
    }
    return resultSet;
  }

}
