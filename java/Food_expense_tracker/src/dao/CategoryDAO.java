package dao;

import db.DBConnection;
import models.Category;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CategoryDAO {

    public ArrayList<Category> getAllCategories() {

        ArrayList<Category> categories = new ArrayList<>();
        String query =
                "SELECT * FROM categories";

        try {

            Connection connection = DBConnection.getConnection();

            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {

                Category category = new Category(resultSet.getInt("categories_id"),
                resultSet.getString("category_name"));
                
                categories.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
}
