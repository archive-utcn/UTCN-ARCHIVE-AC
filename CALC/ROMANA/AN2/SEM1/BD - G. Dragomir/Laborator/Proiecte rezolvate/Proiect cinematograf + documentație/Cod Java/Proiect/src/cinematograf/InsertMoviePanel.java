package cinematograf;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionListener;

import javax.swing.*;

public class InsertMoviePanel extends JPanel {

  /**
   * 
   */
  private static final long serialVersionUID = 1L;

  private JLabel startTimeLabel;
  private JLabel titleLabel;
  private JLabel endTimeLabel;
  private JTextField startTimeTextField;
  private JTextField titleTextField;
  private JTextField endTimeTextField;
  private JButton cancelButton;
  private JButton insertMovieButton;

  private GridBagConstraints constraints;

  public InsertMoviePanel() {
    setLayout(new GridBagLayout());
    titleLabel = new JLabel("Title:");
    startTimeLabel = new JLabel("Start Time"); 
    endTimeLabel = new JLabel("End Time");
    titleTextField = new JTextField();
    startTimeTextField = new JTextField();
    endTimeTextField = new JTextField();
    cancelButton = new JButton("Cancel");
    insertMovieButton = new JButton("Insert Movie");
    
    constraints = new GridBagConstraints();

    constraints.fill = GridBagConstraints.BOTH;
    constraints.gridx = 0;
    constraints.gridy = 0;
    constraints.insets = new Insets(5, 5, 5, 5);
    constraints.anchor = GridBagConstraints.CENTER;
    constraints.weightx = 0.5;
    constraints.weighty = 0.5;
    constraints.ipadx = 100;

    add(titleLabel, constraints);

    constraints.gridx++;
    add(titleTextField, constraints);

    constraints.gridy++;
    constraints.gridx--;
    add(startTimeLabel, constraints);

    constraints.gridx++;
    add(startTimeTextField, constraints);

    constraints.gridy++;
    constraints.gridx--;
    add(endTimeLabel, constraints);

    constraints.gridx++;
    add(endTimeTextField, constraints);

    constraints.gridy++;
    constraints.gridx--;
    add(cancelButton, constraints);

    constraints.gridx++;
    add(insertMovieButton, constraints);
  }

  public void addCancelButtonActionListener(ActionListener actionListener) {
    cancelButton.addActionListener(actionListener);
  }

  public void addInsertMovieButtonActionListener(ActionListener actionListener) {
    insertMovieButton.addActionListener(actionListener);
  }


  public JTextField getTitleTextField() {
    return titleTextField;
  }
  public JTextField getStartTimeTextField() {
	    return startTimeTextField;
	  }

  public JTextField getEndTimeTextField() {
    return endTimeTextField;
  }
}
