package pocketQuery;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.UIManager;
import java.io.*;

public class Datei {

  private String Dateiname;
  private File Datei;

  public Datei() {
    askFilename();
  }

  public File getDatei() {
    return Datei;
  }

  public String getDateiname() {
    return Dateiname;
  }

  private void askFilename() {
    try {
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
    }
    catch (Exception e) {
      e.printStackTrace();
    }
    JFrame frame = new JFrame("OC2Col");
    JFileChooser chooser = new JFileChooser();
    int returnVal = chooser.showOpenDialog(frame);
    if (returnVal == JFileChooser.APPROVE_OPTION) {
      this.Datei = chooser.getSelectedFile();
      this.Dateiname = Datei.getAbsolutePath();
    }
  }
}
