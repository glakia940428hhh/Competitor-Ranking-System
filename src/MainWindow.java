import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Menu;
import org.eclipse.swt.widgets.MenuItem;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Table;
import org.eclipse.swt.widgets.TableColumn;
import org.eclipse.swt.widgets.TableItem;
import org.eclipse.swt.widgets.ToolBar;
import org.eclipse.swt.widgets.ToolItem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DatabaseMetaData;
import org.eclipse.swt.events.DisposeListener;
import org.eclipse.swt.events.DisposeEvent;
import org.eclipse.swt.widgets.Label;

public class MainWindow {

	protected Shell shlFinalProject;
	private Table table;

	/**
	 * Launch the application.
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			MainWindow window = new MainWindow();
			window.open();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Open the window.
	 */
	public void open() {
		Display display = Display.getDefault();
		try {
			createContents();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		shlFinalProject.open();
		shlFinalProject.layout();
		while (!shlFinalProject.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
	}

	/**
	 * Create contents of the window.
	 * @throws ClassNotFoundException 
	 * @throws SQLException 
	 */
	protected void createContents() throws ClassNotFoundException, SQLException {		
		shlFinalProject = new Shell();
		shlFinalProject.setSize(782, 462);
		shlFinalProject.setText("Final Project");
		
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
		
		Statement statement = conn.createStatement();
		Button btnOpenInternalTool = new Button(shlFinalProject, SWT.NONE);
		btnOpenInternalTool.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				try {
					InternalToolWindow window = new InternalToolWindow();
					window.open();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
		});
		btnOpenInternalTool.setBounds(10, 350, 145, 26);
		btnOpenInternalTool.setText("Tool for internal use");
		
		Label lblInfo = new Label(shlFinalProject, SWT.NONE);
		lblInfo.setBounds(202, 64, 554, 69);
		lblInfo.setText("Info Label");
		
		ToolBar toolBar = new ToolBar(shlFinalProject, SWT.FLAT | SWT.RIGHT);
		toolBar.setBounds(10, 10, 599, 29);
		
		ToolItem tltmDegreeName = new ToolItem(toolBar, SWT.DROP_DOWN);
		tltmDegreeName.setText("Degree Name");
		DropdownSelectionListener listenerOne = new DropdownSelectionListener(tltmDegreeName);
		listenerOne.add("MBA full-time");
		listenerOne.add("MSIS full-time");
		listenerOne.add("BA full-time");
		tltmDegreeName.addSelectionListener(listenerOne);

		
		ToolItem tltmSourceOption = new ToolItem(toolBar, SWT.DROP_DOWN);
		DropdownSelectionListener listenerTwo = new DropdownSelectionListener(tltmSourceOption);
		listenerTwo.add("USnews");
		listenerTwo.add("Times");
		listenerTwo.add("QS");
		listenerTwo.add("Eduniversal best master Ranking");
		tltmSourceOption.addSelectionListener(listenerTwo);
		tltmSourceOption.setText("Source Option");
		
		ToolItem tltmYearOption = new ToolItem(toolBar, SWT.DROP_DOWN);
		DropdownSelectionListener listenerThree = new DropdownSelectionListener(tltmYearOption);
		listenerThree.add("2014");
		listenerThree.add("2015");
		listenerThree.add("2016");
		tltmYearOption.addSelectionListener(listenerThree);
		tltmYearOption.setText("Year Option");
		
		Table table = new Table(shlFinalProject, SWT.BORDER | SWT.FULL_SELECTION);
		table.setBounds(202, 139, 554, 256);
		table.setHeaderVisible(true);
		table.setLinesVisible(true);
		
		
		
		Button btnGoodSchool = new Button(shlFinalProject, SWT.NONE);
		btnGoodSchool.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				try {
					lblInfo.setText("Info Label \n Find the schools which are listed for three consecutive years for the same degree");
					ResultSet resultSet = statement.executeQuery("Select count(rankNo) AS Nooftime, schoolName, degreeName,sourceName from [terp.rank] r, [terp.year] y,[terp.degree] d,[terp.source] s,[terp.school] l Where r.degreeId=d.degreeId and r.schoolId=l.schoolId and r.yearId=y.yearId and r.sourceId=s.sourceId group by schoolName, degreeName,sourceName Having count(rankNo)=3 order by (degreeName);");
					
					table.setRedraw(false);
					while ( table.getItems().length > 0 ) {
					    table.getItems()[table.getItems().length - 1].dispose();
					    System.out.println(1);
					}
					while (table.getColumnCount() > 0) {
					    table.getColumns()[table.getColumnCount() - 1].dispose();
					}
					table.setRedraw(true);
					
					TableColumn tblcNoofTime = new TableColumn(table, SWT.NONE);
					tblcNoofTime.setWidth(150);
					tblcNoofTime.setText("NoofTime");
					
					TableColumn tblcSchoolName = new TableColumn(table, SWT.NONE);
					tblcSchoolName.setWidth(270);
					tblcSchoolName.setText("School Name");	
					
					TableColumn tblcDegreeName = new TableColumn(table, SWT.NONE);
					tblcDegreeName.setWidth(100);
					tblcDegreeName.setText("tblc DegreeName");
					
					TableColumn tblcSourceName = new TableColumn(table, SWT.NONE);
					tblcSourceName.setWidth(300);
					tblcSourceName.setText("Source Name");

					
					while(resultSet.next()) {
						TableItem tableItem= new TableItem(table, SWT.NONE);
						tableItem.setText(new String[] {resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4)});
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		btnGoodSchool.setBounds(10, 244, 145, 26);
		btnGoodSchool.setText("Best Schools");
		
		Button btnGetRank = new Button(shlFinalProject, SWT.NONE);
		btnGetRank.setBounds(10, 59, 145, 26);
		btnGetRank.setText("Get rank");
		btnGetRank.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				try {
					lblInfo.setText("Info Label \n Find the ranking of a given source and a given degree in a given year");
					System.out.println(prepareSqlString(listenerOne, listenerTwo, listenerThree));
					ResultSet resultSet = statement.executeQuery(prepareSqlString(listenerOne, listenerTwo, listenerThree));
					
					table.setRedraw(false);
					while ( table.getItems().length > 0 ) {
					    table.getItems()[table.getItems().length - 1].dispose();
					}
					while (table.getColumnCount() > 0) {
					    table.getColumns()[table.getColumnCount() - 1].dispose();
					}
					table.setRedraw(true);
					
					TableColumn tblcRankNo = new TableColumn(table, SWT.NONE);
					tblcRankNo.setWidth(100);
					tblcRankNo.setText("Rank");				
					
					TableColumn tblcSchoolName = new TableColumn(table, SWT.NONE);
					tblcSchoolName.setWidth(300);
					tblcSchoolName.setText("School Name");
					
					while(resultSet.next()) {
						TableItem tableItem= new TableItem(table, SWT.NONE);
						tableItem.setText(new String[] {resultSet.getString(1), resultSet.getString(2)});
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			}
			
		});
		
		Button btnSchoolLocation = new Button(shlFinalProject, SWT.NONE);
		btnSchoolLocation.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				try {
					lblInfo.setText("Info Label \n find the name, state, city and zip of the listed schools");
					System.out.println(prepareSqlString(listenerOne, listenerTwo, listenerThree));
					ResultSet resultSet = statement.executeQuery("Select distinct schoolName,statename,city,zip from [terp.rank] r,[terp.school] l,[terp.location] o where r.schoolId=l.schoolId and l.locationId=o.locationId;");
					
					table.setRedraw(false);
					while ( table.getItems().length > 0 ) {
					    table.getItems()[table.getItems().length - 1].dispose();
					}
					while (table.getColumnCount() > 0) {
					    table.getColumns()[table.getColumnCount() - 1].dispose();
					}
					table.setRedraw(true);
					
					TableColumn tblcSchoolName = new TableColumn(table, SWT.NONE);
					tblcSchoolName.setWidth(270);
					tblcSchoolName.setText("School Name");				
					
					TableColumn tblcStateName = new TableColumn(table, SWT.NONE);
					tblcStateName.setWidth(100);
					tblcStateName.setText("State");
					
					TableColumn tblcCityName = new TableColumn(table, SWT.NONE);
					tblcCityName.setWidth(100);
					tblcCityName.setText("City");
					
					TableColumn tblcZipCode = new TableColumn(table, SWT.NONE);
					tblcZipCode.setWidth(100);
					tblcZipCode.setText("Zip Code");
					
					while(resultSet.next()) {
						TableItem tableItem= new TableItem(table, SWT.NONE);
						tableItem.setText(new String[] {resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4)});
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		btnSchoolLocation.setBounds(10, 154, 145, 26);
		btnSchoolLocation.setText("School Location");
		
		
	}
	
	private String prepareSqlString(DropdownSelectionListener listenerOne, DropdownSelectionListener listenerTwo, DropdownSelectionListener listenerThree) {
		String degreeid = "";
		switch (listenerOne.getText()) {
		case "MBA full-time":
			degreeid = "01";
			break;
		case "MSIS full-time":
			degreeid = "02";
			break;
		case "BA full-time":
			degreeid = "03";
			break;
		default:
			break;
		}
		
		String sourceid = "";
		switch (listenerTwo.getText()) {
		case "USnews":
			sourceid = "01";
			break;
		case "Times":
			sourceid = "02";
			break;
		case "QS":
			sourceid = "03";
			break;
		case "Eduniversal best master Ranking":
			sourceid = "04";
			break;
		default:
			break;
		}
		
		String yearid = "";
		switch (listenerThree.getText()) {
		case "2014":
			yearid = "01";
			break;
		case "2015":
			yearid = "02";
			break;
		case "2016":
			yearid = "03";
			break;
		default:
			break;
		}
		
		return "select rankNo, schoolName,degreeName,s.sourceName,y.yearName" +
			" from [terp.rank] r, [terp.year] y,[terp.degree] d,[terp.source] s,[terp.school] l " +
			"where d.degreeId=" + degreeid +
			" and s.sourceId=" + sourceid +
			" and y.yearId=" + yearid +
			" and r.degreeId=d.degreeId" +
			" and r.schoolId=l.schoolId" +
			" and r.yearId=y.yearId" +
			" and r.sourceId=s.sourceId order by rankNo;";
	}
}

class DropdownSelectionListener extends SelectionAdapter {
	  private ToolItem dropdown;

	  private Menu menu;

	  public DropdownSelectionListener(ToolItem dropdown) {
	    this.dropdown = dropdown;
	    menu = new Menu(dropdown.getParent().getShell());
	  }

	  public void add(String item) {
	    MenuItem menuItem = new MenuItem(menu, SWT.NONE);
	    menuItem.setText(item);
	    menuItem.addSelectionListener(new SelectionAdapter() {
	      public void widgetSelected(SelectionEvent event) {
	        MenuItem selected = (MenuItem) event.widget;
	        dropdown.setText(selected.getText());
	      }
	    });
	  }

	  public void widgetSelected(SelectionEvent event) {
	    if (event.detail == SWT.ARROW) {
	      ToolItem item = (ToolItem) event.widget;
	      Rectangle rect = item.getBounds();
	      Point pt = item.getParent().toDisplay(new Point(rect.x, rect.y));
	      menu.setLocation(pt.x, pt.y + rect.height);
	      menu.setVisible(true);
	    } else {
	      System.out.println(dropdown.getText() + " Pressed");
	    }
	  }
	  
	  public String getText() {
		  return dropdown.getText();
	  }
	}
