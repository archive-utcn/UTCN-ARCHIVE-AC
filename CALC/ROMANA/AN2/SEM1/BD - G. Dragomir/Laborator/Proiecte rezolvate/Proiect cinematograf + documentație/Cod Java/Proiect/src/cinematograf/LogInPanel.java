package cinematograf;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionListener;

import javax.swing.*;

public class LogInPanel extends JPanel {
  /**
   * 
   */
  private static final long serialVersionUID = 1L;
  private JLabel nume3;

  private JTextField nume3TextField;

  private JButton logInButton;
  private JButton cancelButton;
  private GridBagConstraints constraints;

  public LogInPanel() {
    nume3 = new JLabel("Nume ");
  
    nume3TextField = new JTextField();
    constraints = new GridBagConstraints();
    logInButton = new JButton("Log In");
    cancelButton = new JButton("Cancel");

    setLayout(new GridBagLayout());

    // constraints for the email JLabel
    constraints.fill = GridBagConstraints.BOTH;
    constraints.gridx = 0;
    constraints.gridy = 0;
    constraints.insets = new Insets(5, 5, 5, 5);
    constraints.anchor = GridBagConstraints.CENTER;
    constraints.weightx = 0.5;
    constraints.weighty = 0.5;
    add(nume3, constraints);

    // constraints for the email text field
    constraints.gridx++;
    constraints.ipadx = 100;
    add(nume3TextField, constraints);


    // constraints for the log in button
    constraints.gridx--;
    constraints.gridy++;
    add(cancelButton, constraints);

    // constraints for the new account button
    constraints.gridx++;
    add(logInButton, constraints);
  }

  public void addLogInButtonActionListener(ActionListener actionListener) {
    logInButton.addActionListener(actionListener);
  }

  public void addCancelButtonActionListener(ActionListener actionListener) {
    cancelButton.addActionListener(actionListener);
  }

  public JTextField getEmailTextField() {
    return nume3TextField;
  }

}
