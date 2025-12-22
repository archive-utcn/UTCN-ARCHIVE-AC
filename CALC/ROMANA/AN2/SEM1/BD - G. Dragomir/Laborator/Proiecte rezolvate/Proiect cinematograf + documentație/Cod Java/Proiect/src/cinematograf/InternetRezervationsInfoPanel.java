package cinematograf;

import java.awt.FlowLayout;

import javax.swing.*;

public class InternetRezervationsInfoPanel extends JDialog {

  /**
   * 
   */
  private static final long serialVersionUID = 1L;

  private JTable internetRezervationsTable;
  @SuppressWarnings("unused")
  private String[][] data;
  @SuppressWarnings("unused")
  private String[] columnNames;

  public InternetRezervationsInfoPanel(String[][] data, String[] columnNames) {
    this.data = data;
    this.columnNames = columnNames;

    internetRezervationsTable = new JTable(data, columnNames);
    add(new JScrollPane(internetRezervationsTable, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
        JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED));

    setLayout(new FlowLayout());
    setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
    setLocationRelativeTo(null);
    pack();
    setVisible(true);
  }
}
