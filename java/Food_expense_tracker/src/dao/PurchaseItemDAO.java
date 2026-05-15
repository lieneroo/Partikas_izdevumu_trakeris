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
            double totalPrice,
            Integer mealsCount,
            Integer daysCount,
            int productId,
            int receiptId
    ) {

        String query =
                "INSERT INTO purchase_item " +
                "(quantity, unit, price, total_price, meals_count, days_count, id_products, id_receipts) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(query);

            statement.setDouble(1, quantity);
            statement.setString(2, unit);
            statement.setDouble(3, price);
            statement.setDouble(4, totalPrice);

            if (mealsCount == null) {
                statement.setNull(5, java.sql.Types.INTEGER);
            } else {
                statement.setInt(5, mealsCount);
            }

            if (daysCount == null) {
                statement.setNull(6, java.sql.Types.INTEGER);
            } else {
                statement.setInt(6, daysCount);
            }

            statement.setInt(7, productId);
            statement.setInt(8, receiptId);

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

                    System.out.println(
                            resultSet.getDate("purchase_date")
                            + " | "
                            + resultSet.getString("brand_name")
                            + " | "
                            + resultSet.getString("product_name")
                            + " | "
                            + resultSet.getDouble("quantity")
                            + " "
                            + resultSet.getString("unit")
                            + " | "
                            + resultSet.getDouble("total_price")
                            + " EUR"
                    );

                }

            } catch (SQLException e) {

                e.printStackTrace();

            }
    }

}
