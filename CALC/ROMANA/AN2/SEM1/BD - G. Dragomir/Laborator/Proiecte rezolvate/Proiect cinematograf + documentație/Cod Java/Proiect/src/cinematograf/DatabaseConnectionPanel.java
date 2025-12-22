package cinematograf;

import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionListener;

import javax.swing.*;

public class DatabaseConnectionPanel extends JPanel {
  /**
   * 
   */
  private static final long serialVersionUID = 1L;
  private JLabel welcomeLabel;
  private JButton connectAsClient;
  private JButton connectAsSupplier;
  private GridBagConstraints constraints;

  public DatabaseConnectionPanel() {
    setLayout(new GridBagLayout());

    welcomeLabel = new JLabel("Cinematograf");
    connectAsClient = new JButton("Conectare client");
    connectAsSupplier = new JButton("Conectare administrator");
    constraints = new GridBagConstraints();

    constraints.fill = GridBagConstraints.BOTH;
    constraints.gridx = 0;
    constraints.gridy = 0;
    constraints.insets = new Insets(20, 110, 20, 5);
    constraints.anchor = GridBagConstraints.CENTER;
    constraints.weightx = 0.5;
    constraints.weighty = 0.5;
    connectAsClient.setPreferredSize(new Dimension(200, 50));
    connectAsSupplier.setPreferredSize(new Dimension(200, 50));
    
    constraints.gridwidth = 2;
    add(welcomeLabel, constraints);
    
    constraints.insets = new Insets(5, 5, 5, 5);
    constraints.gridwidth = 1;
    constraints.gridy++;
    add(connectAsClient, constraints);

    constraints.gridx++;
    add(connectAsSupplier, constraints);
  }

  public void addConnectAsClientButtonActionListener(ActionListener actionListener) {
    connectAsClient.addActionListener(actionListener);
  }

  public void addConnectAsSupplierButtonActionListener(ActionListener actionListener) {
    connectAsSupplier.addActionListener(actionListener);
  }
}
