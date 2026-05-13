package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String URL =
            "jdbc:mysql://localhost:3307/food_expense_tracker";

    private static final String USER = "root";

    private static final String PASSWORD = "Parole1";

    public static Connection getConnection() throws SQLException {

        return DriverManager.getConnection(URL, USER, PASSWORD);

    }
}
