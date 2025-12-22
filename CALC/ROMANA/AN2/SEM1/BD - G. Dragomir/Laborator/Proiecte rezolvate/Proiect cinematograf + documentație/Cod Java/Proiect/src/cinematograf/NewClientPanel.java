package cinematograf;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionListener;

import javax.swing.*;

public class NewClientPanel extends JPanel {

  /**
   * 
   */
  private static final long serialVersionUID = 1L;

  private JTextField nameTextField;
  private JTextField surnameTextField;
  private JTextField idFilmTextField;
  private JLabel nameLabel;
  private JLabel surnameLabel;
  private JLabel idFilmLabel;

  private JButton cancelButton;
  private JButton createAccountButton;
  private GridBagConstraints constraints;

  public NewClientPanel() {
    nameTextField = new JTextField();
    surnameTextField = new JTextField();
    idFilmTextField = new JTextField();
    

    nameLabel = new JLabel("Name: ");
    surnameLabel = new JLabel("Surname: ");
    idFilmLabel = new JLabel("ID Film: ");

    createAccountButton = new JButton("Create Account");
    cancelButton = new JButton("Cancel");
    
    setLayout(new GridBagLayout());
    
    constraints = new GridBagConstraints();

    constraints.fill = GridBagConstraints.BOTH;
    constraints.gridx = 0;
    constraints.gridy = 0;
    constraints.insets = new Insets(5, 5, 5, 5);
    constraints.anchor = GridBagConstraints.CENTER;
    constraints.weightx = 0.5;
    constraints.weighty = 0.5;
    constraints.ipadx = 100;
    
    add(nameLabel, constraints);

    constraints.gridx++;
    add(nameTextField, constraints);
    
    constraints.gridx--;
    constraints.gridy++;
    add(surnameLabel, constraints);

    constraints.gridx++;
    add(surnameTextField, constraints);

    constraints.gridy++;
    constraints.gridx--;
    add(idFilmLabel, constraints);

    constraints.gridx++;
    add(idFilmTextField, constraints);

    constraints.gridy++;
    constraints.gridx--;
    add(cancelButton, constraints);

    constraints.gridx++;
    add(createAccountButton, constraints);
  }
  
  public void addCancelButtonActionListener(ActionListener actionListener) {
    cancelButton.addActionListener(actionListener);
  }
  
  public void addCreateAccountButtonActionListener(ActionListener actionListener) {
    createAccountButton.addActionListener(actionListener);
  }

  public JTextField getNameTextField() {
    return nameTextField;
  }

  public JTextField getSurnameTextField() {
    return surnameTextField;
  }


  public JTextField getIdFilmTextField() {
    return idFilmTextField;
  }
  
  public JButton getCancelButton() {
    return cancelButton;
  }

  public JButton getCreateAccountButton() {
    return createAccountButton;
  }

  public void setNameTextField(JTextField nameTextField) {
    this.nameTextField = nameTextField;
  }

  public void setSurnameTextField(JTextField surnameTextField) {
    this.surnameTextField = surnameTextField;
  }

  public void setIdFilmTextField(JTextField idFilmTextField) {
    this.idFilmTextField = idFilmTextField;
  }



  public void setCancelButton(JButton cancelButton) {
    this.cancelButton = cancelButton;
  }

  public void setCreateAccountButton(JButton createAccountButton) {
    this.createAccountButton = createAccountButton;
  }
}
