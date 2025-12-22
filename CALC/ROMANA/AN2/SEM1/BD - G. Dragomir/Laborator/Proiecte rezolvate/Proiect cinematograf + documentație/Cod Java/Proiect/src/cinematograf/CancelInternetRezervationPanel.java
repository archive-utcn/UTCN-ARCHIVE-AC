package cinematograf;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class CancelInternetRezervationPanel extends JPanel {

  /**
   * 
   */
  private static final long serialVersionUID = 1L;

  private JLabel clientIDLabel;
  private JLabel rezervationIDLabel;
  private JTextField clientIDTextField;
  private JTextField rezervationIDTextField;
  private JButton cancelButton;
  private JButton cancelRezervationButton;

  private GridBagConstraints constraints;

  public CancelInternetRezervationPanel() {
    setLayout(new GridBagLayout());

    clientIDLabel = new JLabel("Client ID :");
    rezervationIDLabel = new JLabel("Rezervation ID:");
    clientIDTextField = new JTextField();
    rezervationIDTextField = new JTextField();
    cancelButton = new JButton("Cancel");
    cancelRezervationButton = new JButton("Cancel Rezervation");

    constraints = new GridBagConstraints();

    constraints.fill = GridBagConstraints.BOTH;
    constraints.gridx = 0;
    constraints.gridy = 0;
    constraints.insets = new Insets(5, 5, 5, 5);
    constraints.anchor = GridBagConstraints.CENTER;
    constraints.weightx = 0.5;
    constraints.weighty = 0.5;
    constraints.ipadx = 100;

    add(clientIDLabel, constraints);

    constraints.gridx++;
    add(clientIDTextField, constraints);

    constraints.gridy++;
    constraints.gridx--;
    add(rezervationIDLabel, constraints);

    constraints.gridx++;
    add(rezervationIDTextField, constraints);

    constraints.gridy++;
    constraints.gridx--;
    add(cancelButton, constraints);

    constraints.gridx++;
    add(cancelRezervationButton, constraints);
  }

  public void addCancelButtonActionListener(ActionListener actionListener) {
    cancelButton.addActionListener(actionListener);
  }

  public void addCancelRezervationButtonActionListener(ActionListener actionListener) {
    cancelRezervationButton.addActionListener(actionListener);
  }

  public JTextField getClientIDTextField() {
    return clientIDTextField;
  }

  public JTextField getRezervationIDTextField() {
    return rezervationIDTextField;
  }
}
