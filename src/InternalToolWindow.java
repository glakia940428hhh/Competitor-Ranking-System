import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Text;


import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DatabaseMetaData;
import org.eclipse.swt.widgets.Label;
public class InternalToolWindow {

	protected Shell shell;
	private Text schoolIdText;
	private Text degreeIdText;
	private Text yearIdText;
	private Text sourceIdText;
	private Text rankText;


	/**
	 * Open the window.
	 */
	public void open() {
		Display display = Display.getDefault();
		try{
			createContents();
			shell.open();
			shell.layout();
			while (!shell.isDisposed()) {
				if (!display.readAndDispatch()) {
					display.sleep();
				}
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
	}

	/**
	 * Create contents of the window.
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	protected void createContents() throws SQLException, ClassNotFoundException {
		shell = new Shell();
		shell.setSize(797, 380);
		shell.setText("SWT Application");
		
		Button insertBTN = new Button(shell, SWT.NONE);		
		insertBTN.setBounds(10, 92, 75, 25);
		insertBTN.setText("Insert");
		
		Button updateBTN = new Button(shell, SWT.NONE);
		
		updateBTN.setBounds(109, 92, 75, 25);
		updateBTN.setText("Update");
		
		Button deleteBTN = new Button(shell, SWT.NONE);
		
		deleteBTN.setBounds(208, 92, 75, 25);
		deleteBTN.setText("Delete");
		
		schoolIdText = new Text(shell, SWT.BORDER);
		schoolIdText.setBounds(10, 42, 63, 25);
		
		Label lblDatabaseDriverInfo = new Label(shell, SWT.NONE);
		lblDatabaseDriverInfo.setText("Database driver info");
		lblDatabaseDriverInfo.setBounds(10, 137, 635, 102);
		
		Label infoArea = new Label(shell, SWT.BORDER);
		infoArea.setBounds(10, 245, 771, 82);
		infoArea.setText("Info Area");
		
		degreeIdText = new Text(shell, SWT.BORDER);
		degreeIdText.setBounds(79, 42, 69, 24);
		
		yearIdText = new Text(shell, SWT.BORDER);
		yearIdText.setBounds(154, 42, 69, 25);
		
		Label lblNewLabel = new Label(shell, SWT.NONE);
		lblNewLabel.setBounds(10, 10, 69, 21);
		lblNewLabel.setText("schoolId");
		
		Label lblDegreeid = new Label(shell, SWT.NONE);
		lblDegreeid.setBounds(85, 10, 69, 21);
		lblDegreeid.setText("degreeId");
		
		Label lblNewLabel_1 = new Label(shell, SWT.NONE);
		lblNewLabel_1.setBounds(160, 10, 69, 21);
		lblNewLabel_1.setText("yearId");
		
		Label lblSourceid = new Label(shell, SWT.NONE);
		lblSourceid.setBounds(235, 10, 69, 21);
		lblSourceid.setText("sourceId");
		
		sourceIdText = new Text(shell, SWT.BORDER);
		sourceIdText.setBounds(229, 42, 67, 24);
		
		Label lblRank = new Label(shell, SWT.NONE);
		lblRank.setBounds(310, 10, 69, 21);
		lblRank.setText("rank");
		
		rankText = new Text(shell, SWT.BORDER);
		rankText.setBounds(302, 42, 63, 24);
		
		String dbURL = "jdbc:sqlserver://mssqllab.rhsmith.umd.edu:9758;databaseName=BUDT758_DB_Student_063;";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    String user = "BUDT758_Student_063";
	    String pass = "wonder8372";
	    System.out.println("breakpoint");
		Connection conn = DriverManager.getConnection(
				dbURL, user, pass 
				);
		if(conn == null) {
			System.out.println("null connection");
		}
		if (conn != null) {
			DatabaseMetaData dm = (DatabaseMetaData) conn.getMetaData();
			lblDatabaseDriverInfo.setText(lblDatabaseDriverInfo.getText() + "\nDriver name: " + dm.getDriverName() + "\n");
			lblDatabaseDriverInfo.setText(lblDatabaseDriverInfo.getText() + "Driver version: " + dm.getDriverVersion() + "\n");
			lblDatabaseDriverInfo.setText(lblDatabaseDriverInfo.getText() + "Product name: " + dm.getDatabaseProductName() + "\n");
			lblDatabaseDriverInfo.setText(lblDatabaseDriverInfo.getText() +"Product version: " + dm.getDatabaseProductVersion() + "\n");
		}
		
		Statement statement = conn.createStatement();
		
		insertBTN.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				String insertSql = "insert into [terp.rank] values ('" 
									+ schoolIdText.getText() + "','" 
									+ degreeIdText.getText() + "','" 
									+ yearIdText.getText() + "','" 
									+ sourceIdText.getText() + "','" 
									+ rankText.getText() + "');";
				try {
					statement.executeUpdate(insertSql);
					infoArea.setText("Info Area" + "\n" + insertSql + "\n");
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					infoArea.setText("Info Area" + "\n" + insertSql + "\n" + e1);
				}
			}
		});
		
		updateBTN.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				String updateSql = "update [terp.rank] set rankNo = '" 
									+ rankText.getText() + "' where schoolId = '" 
									+ schoolIdText.getText() + "' and degreeId = '" 
									+ degreeIdText.getText() + "' and yearId = '" 
									+ yearIdText.getText() + "' and sourceId = '" 
									+ sourceIdText.getText() + "';";
				try {
					statement.executeUpdate(updateSql);
					infoArea.setText("Info Area" + "\n" + updateSql + "\n");
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					infoArea.setText("Info Area" + "\n" + updateSql + "\n" + e1);
				}
			}
		});
		
		deleteBTN.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				String deleteSql = "delete from [terp.rank] where schoolId = '" 
						+ schoolIdText.getText() + "' and degreeId = '" 
						+ degreeIdText.getText() + "' and yearId = '" 
						+ yearIdText.getText() + "' and sourceId = '" 
						+ sourceIdText.getText() + "';";
				try {
					statement.executeUpdate(deleteSql);
					infoArea.setText("Info Area" + "\n" + deleteSql + "\n");
					
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					infoArea.setText("Info Area" + "\n" + deleteSql + "\n" + e1);
				}
			}
		});
	}
}