package cinematograf;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class InternetRezervationPanel extends JPanel {

  /**
   * 
   */
  private static final long serialVersionUID = 1L;

  private JLabel nume2Label;
  private JLabel prenume2Label;
  private JLabel idFilmLabel;
  private JLabel valabilityDateLabel;
  private JTextField nume2TextField;
  private JTextField prenume2TextField;
  private JTextField idFilmTextField;
  private JTextField valabilityDateTextField;
  private JButton cancelButton;
  private JButton makeRezervationButton;

  private GridBagConstraints constraints;

  public InternetRezervationPanel() {
    setLayout(new GridBagLayout());

    nume2Label = new JLabel("Nume:");
    prenume2Label = new JLabel("Prenume:");
    idFilmLabel = new JLabel("Id Film");
    valabilityDateLabel = new JLabel("Valability date:");
    nume2TextField = new JTextField();
    prenume2TextField = new JTextField();
    idFilmTextField = new JTextField();
    valabilityDateTextField = new JTextField();
    cancelButton = new JButton("Cancel");
    makeRezervationButton = new JButton("Make rezervation");

    constraints = new GridBagConstraints();

    constraints.fill = GridBagConstraints.BOTH;
    constraints.gridx = 0;
    constraints.gridy = 0;
    constraints.insets = new Insets(5, 5, 5, 5);
    constraints.anchor = GridBagConstraints.CENTER;
    constraints.weightx = 0.5;
    constraints.weighty = 0.5;
    constraints.ipadx = 100;

    add(nume2Label, constraints);

    constraints.gridx++;
    add(nume2TextField, constraints);

    constraints.gridy++;
    constraints.gridx--;
    add(prenume2Label, constraints);

    constraints.gridx++;
    add(prenume2TextField, constraints);

    constraints.gridy++;
    constraints.gridx--;
    add(idFilmLabel, constraints);

    constraints.gridx++;
    add(idFilmTextField, constraints);
    
    constraints.gridy++;
    constraints.gridx--;
    add(valabilityDateLabel, constraints);

    constraints.gridx++;
    add(valabilityDateTextField, constraints);

    constraints.gridy++;
    constraints.gridx--;
    add(cancelButton, constraints);

    constraints.gridx++;
    add(makeRezervationButton, constraints);
  }

  public void addCancelButtonActionListener(ActionListener actionListener) {
    cancelButton.addActionListener(actionListener);
  }

  public void addMakeRezervationButtonActionListener(ActionListener actionListener) {
    makeRezervationButton.addActionListener(actionListener);
  }

  public JTextField getNume2TextField() {
    return nume2TextField;
  }

  public JTextField getPrenume2TextField() {
    return prenume2TextField;
  }
  

  public JTextField getIdFilmTextField() {
    return idFilmTextField;
  }

  public JTextField getValabilityDateTextField() {
    return valabilityDateTextField;
  }
}
