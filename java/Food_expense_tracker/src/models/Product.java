package models;

public class Product {
	 private int products_id;
	    private String brand_name;
	    private String product_name;
	    private int id_categories;

	    public Product(int products_id, String brand_name,
	                   String product_name, int id_categories) {

	        this.products_id = products_id;
	        this.brand_name = brand_name;
	        this.product_name = product_name;
	        this.id_categories = id_categories;
	    }

	    public int getProducts_id() {
	        return products_id;
	    }

	    public String getBrand_name() {
	        return brand_name;
	    }

	    public String getProduct_name() {
	        return product_name;
	    }

	    public int getId_categories() {
	        return id_categories;
	    }
}
