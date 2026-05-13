package dao;

import db.DBConnection;
import models.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;

public class ProductDAO {

    public ArrayList<Product> searchProducts(String search) {

        ArrayList<Product> products = new ArrayList<>();

        try {

            Connection connection = DBConnection.getConnection();

            Statement statement = connection.createStatement();

            String query = "SELECT * FROM products " + "WHERE product_name LIKE '%" 
            + search + "%'";

            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {

                int id = resultSet.getInt("products_id");

                String brand = resultSet.getString("brand_name");

                String productName =
                        resultSet.getString("product_name");

                int categoryId =
                        resultSet.getInt("id_categories");

                Product product =
                        new Product(id, brand,
                                productName, categoryId);

                products.add(product);

            }

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return products;

    }

}
