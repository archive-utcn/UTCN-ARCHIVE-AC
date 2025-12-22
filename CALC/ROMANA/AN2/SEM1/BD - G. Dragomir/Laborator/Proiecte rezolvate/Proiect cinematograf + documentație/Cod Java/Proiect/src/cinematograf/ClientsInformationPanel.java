package cinematograf;

import java.awt.FlowLayout;

import javax.swing.*;

public class ClientsInformationPanel extends JDialog {

  /**
   * 
   */
  private static final long serialVersionUID = 1L;

  private JTable clientsInformationTable;
  @SuppressWarnings("unused")
  private String[][] data;
  @SuppressWarnings("unused")
  private String[] columnNames;

  public ClientsInformationPanel(String[][] data, String[] columnNames) {
    this.data = data;
    this.columnNames = columnNames;

    clientsInformationTable = new JTable(data, columnNames);
    add(new JScrollPane(clientsInformationTable, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
        JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED));

    setLayout(new FlowLayout());
    setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
    setLocationRelativeTo(null);
    pack();
    setVisible(true);
  }
}
