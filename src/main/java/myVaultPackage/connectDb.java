package myVaultPackage;

import java.sql.*;

public class connectDb {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Error here in class not found");
			System.out.println(e.getMessage());
		}
		try {
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system", "username", "password");
			return connection;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static long generateAccountNumber() throws ClassNotFoundException, SQLException {
		try {
			Connection connection = getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("SELECT account_number FROM account_info ORDER BY account_number DESC LIMIT 1");
			if (resultSet.next()) {
				long last_account_number = resultSet.getLong("account_number");
				return last_account_number + 1;
			}else {
				return 0;
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
