package models;

public class Category {

    private int categories_id;
    private String category_name;

    public Category(int categories_id, String category_name) {

        this.categories_id = categories_id;
        this.category_name = category_name;
    }

    public int getCategories_id() {
        return categories_id;
    }

    public String getCategory_name() {
        return category_name;
    }
}
