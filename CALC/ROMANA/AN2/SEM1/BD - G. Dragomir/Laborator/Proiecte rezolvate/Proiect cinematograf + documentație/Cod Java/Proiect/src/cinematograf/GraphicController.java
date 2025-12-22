package cinematograf;

import java.awt.GridBagLayout;

import javax.swing.JFrame;

public class GraphicController {
  private MainFrame mainFrame;
  private DatabaseConnectionPanel databaseConnectionPanel;
  private LogInPanel logInPanel;
  private MainApplicationPanel mainApplicationPanel;
  private InternetRezervationPanel internetRezervationPanel;
  private MoviesInformationPanel moviesInformationPanel;
  private InternetRezervationsInfoPanel internetRezervationsInfoPanel;
  private ClientsInformationPanel clientsInformationPanel;
  private CancelInternetRezervationPanel cancelInternetRezervationPanel;
  private NewClientPanel newClientPanel;
  private InsertMoviePanel insertMoviePanel;

  public GraphicController() {
  }

  public void showMainframe() {
    mainFrame = new MainFrame();
    mainFrame.setTitle("Cinematograf");
    mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    mainFrame.setSize(600, 600);
    mainFrame.setLayout(new GridBagLayout());
    mainFrame.setLocationRelativeTo(null);
    mainFrame.setVisible(true);
  }

  public void showDatabaseConnectionPanel() {
    mainFrame.getContentPane().removeAll();
    mainFrame.revalidate();
    databaseConnectionPanel = new DatabaseConnectionPanel();
    mainFrame.add(databaseConnectionPanel);
    mainFrame.pack();
  }

  public void showLogInPanel() {
    mainFrame.getContentPane().removeAll();
    mainFrame.revalidate();
    logInPanel = new LogInPanel();
    mainFrame.add(logInPanel);
    mainFrame.pack();
  }

  public void showMainApplicationPanel(String[][] data, String[] columnNames) {
    mainFrame.getContentPane().removeAll();
    mainFrame.revalidate();
    mainApplicationPanel = new MainApplicationPanel(data, columnNames);
    mainFrame.add(mainApplicationPanel);
    mainFrame.pack();
  }

  
  public void showInternetRezervationPanel() {
    mainFrame.getContentPane().removeAll();
    mainFrame.revalidate();
    internetRezervationPanel = new InternetRezervationPanel();
    mainFrame.add(internetRezervationPanel);
    mainFrame.pack();
  }

  public void showMoviesInformationPanel(String[][] data, String[] columnNames) {
    moviesInformationPanel = new MoviesInformationPanel(data, columnNames);
  }

  

  public void showInternetRezervationsInfoPanel(String[][] data, String[] columnNames) {
    internetRezervationsInfoPanel = new InternetRezervationsInfoPanel(data, columnNames);
  }

  

  public void showClientInformationPanel(String[][] data, String[] columnNames) {
    clientsInformationPanel = new ClientsInformationPanel(data, columnNames);
  }

  

  public void showCancelRezervationPanel() {
    mainFrame.getContentPane().removeAll();
    mainFrame.revalidate();
    cancelInternetRezervationPanel = new CancelInternetRezervationPanel();
    mainFrame.add(cancelInternetRezervationPanel);
    mainFrame.pack();
  }

  public void showNewClientPanel() {
    mainFrame.getContentPane().removeAll();
    mainFrame.revalidate();
    newClientPanel = new NewClientPanel();
    mainFrame.add(newClientPanel);
    mainFrame.pack();
  }

  public void showInsertMoviePanel() {
    mainFrame.getContentPane().removeAll();
    mainFrame.revalidate();
    insertMoviePanel = new InsertMoviePanel();
    mainFrame.add(insertMoviePanel);
    mainFrame.pack();
  }

 

  public MainFrame getMainFrame() {
    return mainFrame;
  }

  public DatabaseConnectionPanel getDatabaseConnectionPanel() {
    return databaseConnectionPanel;
  }

  public LogInPanel getLogInPanel() {
    return logInPanel;
  }

  public MainApplicationPanel getMainApplicationPanel() {
    return mainApplicationPanel;
  }

  public InternetRezervationPanel getInternetRezervationPanel() {
    return internetRezervationPanel;
  }

  public MoviesInformationPanel getMoviesInformationPanel() {
    return moviesInformationPanel;
  }



  public InternetRezervationsInfoPanel getInternetRezervationsInfoPanel() {
    return internetRezervationsInfoPanel;
  }

  public ClientsInformationPanel getClientsInformationPanel() {
    return clientsInformationPanel;
  }


  public CancelInternetRezervationPanel getCancelInternetRezervationPanel() {
    return cancelInternetRezervationPanel;
  }

  public NewClientPanel getNewClientPanel() {
    return newClientPanel;
  }

  public InsertMoviePanel getInsertMoviePanel() {
    return insertMoviePanel;
  }
}

 

