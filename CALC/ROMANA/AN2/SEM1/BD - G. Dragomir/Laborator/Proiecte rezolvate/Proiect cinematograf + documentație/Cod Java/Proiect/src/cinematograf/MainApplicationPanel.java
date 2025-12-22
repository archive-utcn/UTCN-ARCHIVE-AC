package cinematograf;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionListener;
import javax.swing.*;

public class MainApplicationPanel extends JPanel {

  /**
   * 
   */
  private static final long serialVersionUID = 1L;

  private JTable mediaTable;
  private JButton makeInternetRezevationButton;
  private JButton showMoviesInformationButton;
  private JButton showInternetRezervationsButton;
  private JButton showClientsInformationButton;
  private JButton cancelRezervationButton;
  private JButton insertNewClientButton;
  private JButton insertMovieButton;
  private GridBagConstraints constraints;

  @SuppressWarnings("unused")
  private String[][] data;
  @SuppressWarnings("unused")
  private String[] columnNames;

  public MainApplicationPanel(String[][] data, String[] columnNames) {
    this.data = data;
    this.columnNames = columnNames;

    setLayout(new GridBagLayout());

    makeInternetRezevationButton = new JButton("Adauga rezervare");
    showMoviesInformationButton = new JButton("Lista filme");
    showInternetRezervationsButton = new JButton("Lista rezervari");
    showClientsInformationButton = new JButton("Lista clienti");
    cancelRezervationButton = new JButton("Anulare rezervare");
    insertNewClientButton = new JButton("Adauga client");
    insertMovieButton = new JButton("Adauga film");

    constraints = new GridBagConstraints();

    constraints.fill = GridBagConstraints.CENTER;
    constraints.gridx = 0;
    constraints.gridy = 0;
    constraints.insets = new Insets(5, 5, 5, 5);
    constraints.anchor = GridBagConstraints.CENTER;
    constraints.weightx = 0.5;
    constraints.weighty = 0.5;


    constraints.gridy++;
    add(makeInternetRezevationButton, constraints);

    constraints.gridy++;
    add(showMoviesInformationButton, constraints);

  


    constraints.gridy++;
    add(showInternetRezervationsButton, constraints);



    constraints.gridy++;
    add(showClientsInformationButton, constraints);



    constraints.gridy++;
    add(cancelRezervationButton, constraints);

    constraints.gridy++;
    add(insertNewClientButton, constraints);

    constraints.gridy++;
    add(insertMovieButton, constraints);

  


    mediaTable = new JTable(data, columnNames);
    constraints.gridy = 1;
    constraints.gridx--;
    constraints.gridheight = 13;
    add(new JScrollPane(mediaTable, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
        JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED), constraints);
  }


 
  public void addMakeInternetRezervationButtonActionListener(ActionListener actionListener) {
    makeInternetRezevationButton.addActionListener(actionListener);
  }

  public void addShowMoviesInformationButtonActionListener(ActionListener actionListener) {
    showMoviesInformationButton.addActionListener(actionListener);
  }


  public void addShowInternetRezervationsActionListener(ActionListener actionListener) {
    showInternetRezervationsButton.addActionListener(actionListener);
  }


  public void addShowClientsInformationButtonActionListener(ActionListener actionListener) {
    showClientsInformationButton.addActionListener(actionListener);
  }


  public void addCancelInternetRezervationButtonActionListener(ActionListener actionListener) {
    cancelRezervationButton.addActionListener(actionListener);
  }

  public void addInsertClientButtonActionListener(ActionListener actionListener) {
    insertNewClientButton.addActionListener(actionListener);
  }

  public void addInsertMovieButtonActionListener(ActionListener actionListener) {
    insertMovieButton.addActionListener(actionListener);
  }

  public JTable getMediaTable() {
    return mediaTable;
  }

  public void setMediaTable(JTable mediaTable) {
    this.mediaTable = mediaTable;
  }


}