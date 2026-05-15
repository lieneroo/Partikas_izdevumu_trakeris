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
 
    public void insertProduct(String brandName, String productName, int categoryId) {

        String query = "INSERT INTO products (brand_name, product_name, id_categories) " +
                       "VALUES ('" + brandName + "', '" + productName + "', " + categoryId + ")";

        try {
            Connection connection = DBConnection.getConnection();
            Statement statement = connection.createStatement();

            statement.executeUpdate(query);

            System.out.println("Produkts pievienots!");

        } catch (SQLException e) {
            System.out.println("Neizdevās pievienot produktu!");
            e.printStackTrace();
        }
	} 
}
