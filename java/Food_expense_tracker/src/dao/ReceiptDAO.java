package dao;

import db.DBConnection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

public class ReceiptDAO {

    public int createReceipt(LocalDate purchaseDate) {

        String query =
                "INSERT INTO receipts (purchase_date) VALUES (?)";

        try {

            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(
                            query,
                            Statement.RETURN_GENERATED_KEYS
                    );

            statement.setDate(1, Date.valueOf(purchaseDate));

            statement.executeUpdate();

            ResultSet generatedKeys =
                    statement.getGeneratedKeys();

            if (generatedKeys.next()) {

                int receiptId =
                        generatedKeys.getInt(1);

                System.out.println(
                        "Čeks pievienots! ID = "
                        + receiptId
                );

                return receiptId;

            }

        } catch (SQLException e) {

            System.out.println(
                    "Neizdevās pievienot čeku!"
            );

            e.printStackTrace();

        }

        return -1;
    }

}