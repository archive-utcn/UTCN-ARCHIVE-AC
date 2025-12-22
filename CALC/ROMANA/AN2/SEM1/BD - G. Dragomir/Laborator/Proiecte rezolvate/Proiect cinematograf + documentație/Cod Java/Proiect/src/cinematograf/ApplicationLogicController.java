package cinematograf;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;

public class ApplicationLogicController {
  private DatabaseConnectionController databaseConnectionController;
  private DatabaseLogicController databaseLogicController;
  private GraphicController graphicController;
  private boolean connectedAsSupplier;
  public ApplicationLogicController() {
    // connect to database
    databaseConnectionController = new DatabaseConnectionController();

    // show GUI
    graphicController = new GraphicController();
    displayMainFrame();
    displayDatabaseConnectionPanel();
  }

  private void displayMainFrame() {
    SwingUtilities.invokeLater(new Runnable() {

      @Override
      public void run() {
        graphicController.showMainframe();
      }
    });
  }

  private void displayDatabaseConnectionPanel() {
    SwingUtilities.invokeLater(new Runnable() {

      @Override
      public void run() {
        graphicController.showDatabaseConnectionPanel();
        addDatabaseConnectionPanelConnectAsClientButtonActionListener();
        addDatabaseConnectionConnectAsSupplierActionListener();
      }
    });
  }

  private void displayLogInPanel() {
    SwingUtilities.invokeLater(new Runnable() {

      @Override
      public void run() {
        graphicController.showLogInPanel();
        addLogInPanelCancelButtonActionListener();
        addLogInPanelLogInButtonActionListener();
      }
    });
  }

  private void displayMainApplicationPanel() {
   
    String[] columnNames = { "Media ID", "Title", "Launch Date", "End Date"};
    ResultSet resultSet = databaseLogicController.showMediaInfo();
    String[][] data = parseMediaResultSet(resultSet, 35, 4);

    SwingUtilities.invokeLater(new Runnable() {

      @Override
      public void run() {
        graphicController.showMainApplicationPanel(data, columnNames);
        addMainApplicationPanelMakeInternetRezervationButtonActionListener();
        addMainApplicationPanelShowMoviesInformationButtonActionListener();
        addMainApplicationPanelShowInternetRezervationsActionListener();
        addMainApplicationPanelShowClientsInformationButtonActionListener();
        addMainApplicationPanelCancelInternetRezervationActionListener();
        addMainApplicationPanelInsertClientButtonActionListener();
        addMainApplicationPanelInsertMovieButtonActionListener();
      }
    });
  }



  private void displayInternetRezervationPanel() {
    SwingUtilities.invokeLater(new Runnable() {

      @Override
      public void run() {
        graphicController.showInternetRezervationPanel();
        addInternetRezervationPanelCancelButtonActionListener();
        addInternetRezervationPanelMakeRezervationButtonActionListener();
      }
    });
  }

  private void displayMoviesInformationPanel() {
    String[] columnNames = { "Movie ID", "Tile", "Start Time" };
    ResultSet resultSet = databaseLogicController.showMoviesInformation();
    String[][] data = parseMovieResultSet(resultSet, 0, 3);
    SwingUtilities.invokeLater(new Runnable() {

      @Override
      public void run() {
        graphicController.showMoviesInformationPanel(data, columnNames);
      }
    });
  }



  private void displayInternetRezervationsInfoPanel() {
    String[] columnNames = { "Rezervation ID", "Client ID", "Movie ID", "Reservation Date", "Valability Date"};
    ResultSet resultSet = databaseLogicController.showInternetRezervationsInfo();
    String[][] data = parseInternetRezervationInformationResultSet(resultSet, 0, 5);
    SwingUtilities.invokeLater(new Runnable() {

      @Override
      public void run() {
        graphicController.showInternetRezervationsInfoPanel(data, columnNames);
      }
    });
  }

  private void displayClientsInformationPanel() {
    String[] columnNames = { "Client ID", "Name", "Surname" };
    ResultSet resultSet = databaseLogicController.showClientsInfo();
    String[][] data = parseClientInformationResultSet(resultSet, 0, 3);
    SwingUtilities.invokeLater(new Runnable() {

      @Override
      public void run() {
        graphicController.showClientInformationPanel(data, columnNames);
      }
    });
  }




  private void displayCancelInternetRezervationPanel() {
    SwingUtilities.invokeLater(new Runnable() {

      @Override
      public void run() {
        graphicController.showCancelRezervationPanel();
        addCancelInternetRezervationCancelButtonActionListener();
      }
    });
  }

  private void displayNewClientPanel() {
    SwingUtilities.invokeLater(new Runnable() {

      @Override
      public void run() {
        graphicController.showNewClientPanel();
        addNewClientPanelCancelButtonActionListener();
        addNewClientPanelCreateAccountButtonActionListener();
      }
    });
  }

  private void displayInsertMoviePanel() {
    SwingUtilities.invokeLater(new Runnable() {

      @Override
      public void run() {
        graphicController.showInsertMoviePanel();
        addInsertMoviePanelCancelButtonActionListener();
        addInsertMoviePanelInsertMovieButtonActionListener();
      }
    });
  }




  private void addDatabaseConnectionPanelConnectAsClientButtonActionListener() {
    graphicController.getDatabaseConnectionPanel().addConnectAsClientButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        databaseConnectionController.connectToDatabaseAsClient();
        try {
          databaseLogicController = new DatabaseLogicController(databaseConnectionController.getConnection());
        }
        catch (SQLException exception) {
          JOptionPane.showMessageDialog(null, "Database Logic Controller initialization failed", null,
              JOptionPane.ERROR_MESSAGE);
        }
        connectedAsSupplier = false;
        displayLogInPanel();
      }
    });
  }

  private void addDatabaseConnectionConnectAsSupplierActionListener() {
    graphicController.getDatabaseConnectionPanel().addConnectAsSupplierButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        databaseConnectionController.connectToDatabaseAsSupplier();
        try {
          databaseLogicController = new DatabaseLogicController(databaseConnectionController.getConnection());
        }
        catch (SQLException exception) {
          JOptionPane.showMessageDialog(null, "Database Logic Controller initialization failed", null,
              JOptionPane.ERROR_MESSAGE);
        }
        connectedAsSupplier = true;
        displayLogInPanel();
      }
    });
  }

  private void addLogInPanelCancelButtonActionListener() {
    graphicController.getLogInPanel().addCancelButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        displayDatabaseConnectionPanel();
      }
    });
  }

  private void addLogInPanelLogInButtonActionListener() {
    graphicController.getLogInPanel().addLogInButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
         graphicController.getLogInPanel().getEmailTextField().getText();
        String email = graphicController.getLogInPanel().getEmailTextField().getText();

        if (connectedAsSupplier) {
          if (databaseLogicController.verifyLogInConditionsAsSupplier(email)) {
            displayMainApplicationPanel();
          }
          else {
            JOptionPane.showMessageDialog(null, "Datele administratorului sunt gresite", null,
                JOptionPane.PLAIN_MESSAGE);
          }
        }
        else {
          if (databaseLogicController.verifyLogInConditionsAsClient(email)) {
            displayMainApplicationPanel();
          }
        
          else {
            JOptionPane.showMessageDialog(null, "Datele clientului sunt gresite", null, JOptionPane.PLAIN_MESSAGE);
          }
        }
      }
    });
  }


 

  private void addMainApplicationPanelMakeInternetRezervationButtonActionListener() {
    graphicController.getMainApplicationPanel().addMakeInternetRezervationButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        if (connectedAsSupplier) {
          JOptionPane.showMessageDialog(null, "You are connected as supplier!", null, JOptionPane.PLAIN_MESSAGE);
        }
        else {
          displayInternetRezervationPanel();
        }
      }
    });
  }

  private void addMainApplicationPanelShowMoviesInformationButtonActionListener() {
    graphicController.getMainApplicationPanel().addShowMoviesInformationButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        displayMoviesInformationPanel();
      }
    });
  }



  private void addMainApplicationPanelShowInternetRezervationsActionListener() {
    graphicController.getMainApplicationPanel().addShowInternetRezervationsActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        displayInternetRezervationsInfoPanel();
      }
    });
  }


  private void addMainApplicationPanelShowClientsInformationButtonActionListener() {
    graphicController.getMainApplicationPanel().addShowClientsInformationButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        displayClientsInformationPanel();
      }
    });
  }




  private void addMainApplicationPanelCancelInternetRezervationActionListener() {
    graphicController.getMainApplicationPanel().addCancelInternetRezervationButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        if (connectedAsSupplier) {
          JOptionPane.showMessageDialog(null, "You are connected as supplier!", null, JOptionPane.ERROR_MESSAGE);
        }
        else {
          displayCancelInternetRezervationPanel();
        }
      }
    });
  }

  private void addMainApplicationPanelInsertClientButtonActionListener() {
    graphicController.getMainApplicationPanel().addInsertClientButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        displayNewClientPanel();
      }
    });
  }

  private void addMainApplicationPanelInsertMovieButtonActionListener() {
    graphicController.getMainApplicationPanel().addInsertMovieButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        if (connectedAsSupplier) {
          displayInsertMoviePanel();
        }
        else {
          JOptionPane.showMessageDialog(null, "You are not connected as supplier!", null, JOptionPane.ERROR_MESSAGE);
        }
      }
    });
  }

 




  private void addInternetRezervationPanelCancelButtonActionListener() {
    graphicController.getInternetRezervationPanel().addCancelButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        displayMainApplicationPanel();
      }
    });
  }

  private void addInternetRezervationPanelMakeRezervationButtonActionListener() {
    graphicController.getInternetRezervationPanel().addMakeRezervationButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        String nume1 =  (graphicController.getInternetRezervationPanel().getNume2TextField().getText());
        String prenume1 = (graphicController.getInternetRezervationPanel().getPrenume2TextField().getText());
        Integer id_film1 = Integer.parseInt(graphicController.getInternetRezervationPanel().getIdFilmTextField().getText());
        String valabilityDate = graphicController.getInternetRezervationPanel().getValabilityDateTextField().getText();
     
          if (databaseLogicController.insertNewInternetRezervation(nume1, prenume1, id_film1 ,valabilityDate)) {
            displayMainApplicationPanel();
          }
          else {
            JOptionPane.showMessageDialog(null, "Verify the input data", null, JOptionPane.ERROR_MESSAGE);
          }
        
      }
    });
  }

 
  

  private void addCancelInternetRezervationCancelButtonActionListener() {
    graphicController.getCancelInternetRezervationPanel().addCancelButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        displayMainApplicationPanel();
      }
    });
  }

 

  private void addNewClientPanelCancelButtonActionListener() {
    graphicController.getNewClientPanel().addCancelButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        displayMainApplicationPanel();
      }
    });
  }

  private void addNewClientPanelCreateAccountButtonActionListener() {
    graphicController.getNewClientPanel().addCreateAccountButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        String name = graphicController.getNewClientPanel().getNameTextField().getText();
        String surname = graphicController.getNewClientPanel().getSurnameTextField().getText();
        Integer id_filme =Integer.parseInt(graphicController.getNewClientPanel().getIdFilmTextField().getText());
        databaseLogicController.insertNewClient(name, surname, id_filme);
          displayMainApplicationPanel();
        
      }
    });
  }

  private void addInsertMoviePanelCancelButtonActionListener() {
    graphicController.getInsertMoviePanel().addCancelButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        displayMainApplicationPanel();
      }
    });
  }

  private void addInsertMoviePanelInsertMovieButtonActionListener() {
    graphicController.getInsertMoviePanel().addInsertMovieButtonActionListener(new ActionListener() {

      @Override
      public void actionPerformed(ActionEvent e) {
        String title = graphicController.getInsertMoviePanel().getTitleTextField().getText();
        String start_time = graphicController.getInsertMoviePanel().getStartTimeTextField().getText();
        String end_time = graphicController.getInsertMoviePanel().getEndTimeTextField().getText();
        
        if (databaseLogicController.insertNewMovie(title, start_time,end_time)) {
          displayMainApplicationPanel();
        }
        else {
          JOptionPane.showMessageDialog(null, "Date are equals ", null, JOptionPane.ERROR_MESSAGE);
        }
      }
    });
  }

 

  private String[][] parseMediaResultSet(ResultSet resultSet, Integer rowCount, Integer columnCount) {
    String[][] result = new String[rowCount][columnCount];
    int i = 0;
    try {
      while (resultSet.next()) {
        int j = 0;

        if (i > rowCount) {
          result = copyMatrix(result, rowCount, columnCount);
          rowCount++;
        }

        Integer temp = resultSet.getInt(1);
        result[i][j] = temp.toString();
        j++;

        result[i][j] = resultSet.getString(2);
        j++;

        result[i][j] = resultSet.getString(3);
        j++;

        result[i][j] = resultSet.getString(4);
        j++;

        i++;
        }
      
    }
    catch (SQLException e) {
      e.printStackTrace();
      JOptionPane.showMessageDialog(null, "The parsing of the result set failed", null, JOptionPane.ERROR_MESSAGE);
    }

    return result;
  }

  private String[][] parseInternetRezervationInformationResultSet(ResultSet resultSet, int rowCount, int columnCount) {
    String[][] result = new String[rowCount][columnCount];
    int i = 0;
    try {
      while (resultSet.next()) {
        int j = 0;

        if (i >= rowCount) {
          result = copyMatrix(result, rowCount, columnCount);
          rowCount++;
        }

        Integer temp = resultSet.getInt(1);
        result[i][j] = temp.toString();
        j++;

        result[i][j] = resultSet.getString(2);
        j++;

        result[i][j] = resultSet.getString(3);
        j++;

        result[i][j] = resultSet.getString(4);
        j++;

        result[i][j] = resultSet.getString(5);
        j++;


        i++;
      }
    }
    catch (SQLException e) {
      e.printStackTrace();
      JOptionPane.showMessageDialog(null, "The parsing of the result set failed", null, JOptionPane.ERROR_MESSAGE);
    }

    return result;
  }

  private String[][] parseClientInformationResultSet(ResultSet resultSet, int rowCount, int columnCount) {
    String[][] result = new String[rowCount][columnCount];
    int i = 0;
    try {
      while (resultSet.next()) {
        int j = 0;

        if (i >= rowCount) {
          result = copyMatrix(result, rowCount, columnCount);
          rowCount++;
        }

        Integer temp = resultSet.getInt(1);
        result[i][j] = temp.toString();
        j++;

        result[i][j] = resultSet.getString(2);
        j++;

        result[i][j] = resultSet.getString(3);
        j++;

        i++;
      }
    }
    catch (SQLException e) {
      e.printStackTrace();
      JOptionPane.showMessageDialog(null, "The parsing of the result set failed", null, JOptionPane.ERROR_MESSAGE);
    }

    return result;
  }

  private String[][] parseMovieResultSet(ResultSet resultSet, int rowCount, int columnCount) {
    String[][] result = new String[rowCount][columnCount];
    int i = 0;
    try {
      while (resultSet.next()) {
        int j = 0;

        if (i >= rowCount) {
          result = copyMatrix(result, rowCount, columnCount);
          rowCount++;
        }

        Integer temp = resultSet.getInt(1);
        result[i][j] = temp.toString();
        j++;

        result[i][j] = resultSet.getString(2);
        j++;

        result[i][j] = resultSet.getString(3);
        j++;

        i++;
      }
    }
    catch (SQLException e) {
      e.printStackTrace();
      JOptionPane.showMessageDialog(null, "The parsing of the result set failed", null, JOptionPane.ERROR_MESSAGE);
    }

    return result;
  }

  private String[][] copyMatrix(String[][] data, Integer rowCount, Integer columnCount) {
    String[][] result = new String[rowCount + 1][columnCount];

    for (int i = 0; i < rowCount; i++) {
      for (int j = 0; j < columnCount; j++) {
        result[i][j] = data[i][j];
      }
    }

    return result;
  }

 
}