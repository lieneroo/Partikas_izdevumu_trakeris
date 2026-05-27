package dao;

import db.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PurchaseItemDAO {

	public void insertPurchaseItem(
	        double quantity,
	        String unit,
	        double price,
	        Double weight,
	        String weight_unit,
	        double totalPrice,
	        Integer mealsCount,
	        Integer daysCount,
	        int productId,
	        int receiptId) 
	{
	    String query =
	            "INSERT INTO purchase_item " +
	            "(quantity, unit, price, weight, weight_unit, total_price, meals_count, days_count, id_products, id_receipts) " +
	            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	    try {
	        Connection connection = DBConnection.getConnection();
	        PreparedStatement statement = connection.prepareStatement(query);

	        statement.setDouble(1, quantity);
	        statement.setString(2, unit);
	        statement.setDouble(3, price);

	        if (weight == null) {
	            statement.setNull(4, java.sql.Types.DECIMAL);
	        } else {
	            statement.setDouble(4, weight);
	        }

	        if (weight_unit == null || weight_unit.isBlank()) {
	            statement.setNull(5, java.sql.Types.VARCHAR);
	        } else {
	            statement.setString(5, weight_unit);
	        }

	        statement.setDouble(6, totalPrice);

	        if (mealsCount == null) {
	            statement.setNull(7, java.sql.Types.INTEGER);
	        } else {
	            statement.setInt(7, mealsCount);
	        }

	        if (daysCount == null) {
	            statement.setNull(8, java.sql.Types.INTEGER);
	        } else {
	            statement.setInt(8, daysCount);
	        }

	        statement.setInt(9, productId);
	        statement.setInt(10, receiptId);

	        statement.executeUpdate();

	        System.out.println("Pirkums pievienots!");

	    } catch (SQLException e) {
	        System.out.println("Neizdevās pievienot pirkumu!");
	        e.printStackTrace();
	    }
	}
        public void showReceiptItems(int receiptId) {

            String query =
                    "SELECT r.purchase_date, " +
                    "p.brand_name, " +
                    "p.product_name, " +
                    "pi.quantity, " +
                    "pi.unit, " +
                    "pi.price, " +
                    "pi.weight, " +
                    "pi.weight_unit, " +
                    "pi.meals_count, " +
                    "pi.days_count, " +
                    "pi.total_price " +
                    "FROM purchase_item pi " +
                    "JOIN products p " +
                    "ON pi.id_products = p.products_id " +
                    "JOIN receipts r " +
                    "ON pi.id_receipts = r.receipts_id " +
                    "WHERE r.receipts_id = " + receiptId;

            try {

                Connection connection =
                        DBConnection.getConnection();

                Statement statement =
                        connection.createStatement();

                ResultSet resultSet =
                        statement.executeQuery(query);

                
                while (resultSet.next()) {

                    Double weight =
                            resultSet.getObject("weight", Double.class);

                    Integer meals =
                            resultSet.getObject("meals_count", Integer.class);

                    Integer days =
                            resultSet.getObject("days_count", Integer.class);

                    String output =
                            resultSet.getDate("purchase_date")
                            + " | "
                            + resultSet.getString("brand_name")
                            + " | "
                            + resultSet.getString("product_name")
                            + " | "
                            + resultSet.getDouble("quantity")
                            + " "
                            + resultSet.getString("unit");

                    if (weight != null) {

                        output +=
                                " | iepakojuma svars: "
                                + weight
                                + " "
                                + resultSet.getString("weight_unit");
                    }

                    if (meals != null) {

                        output +=
                                " | ēdienreizes: "
                                + meals;
                    }

                    if (days != null) {

                        output +=
                                " | dienas: "
                                + days;
                    }

                    output +=
                            " | "
                            + resultSet.getDouble("total_price")
                            + " EUR";

                    System.out.println(output);
                }

            } catch (SQLException e) {

                e.printStackTrace();

            }
    }
        public double getReceiptTotal(int receiptId) {

            String query =
                    "SELECT SUM(total_price) AS receipt_total " +
                    "FROM purchase_item " +
                    "WHERE id_receipts = ?";

            try {

                Connection connection = DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(query);

                statement.setInt(1, receiptId);

                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    return resultSet.getDouble("receipt_total");
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

            return 0;
        }
        
}
