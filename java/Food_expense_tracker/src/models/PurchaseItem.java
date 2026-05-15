package models;

public class PurchaseItem {

    private int purchase_item_id;
    private double quantity;
    private String unit;
    private double price;
    private double total_price;
    private Integer meals_count;
    private Integer days_count;
    private int id_products;
    private int id_receipts;

    public PurchaseItem(int purchase_item_id, double quantity, String unit,
                        double price, double total_price,
                        Integer meals_count, Integer days_count,
                        int id_products, int id_receipts) {

        this.purchase_item_id = purchase_item_id;
        this.quantity = quantity;
        this.unit = unit;
        this.price = price;
        this.total_price = total_price;
        this.meals_count = meals_count;
        this.days_count = days_count;
        this.id_products = id_products;
        this.id_receipts = id_receipts;
    }

    public int getPurchase_item_id() {
        return purchase_item_id;
    }

    public double getQuantity() {
        return quantity;
    }

    public String getUnit() {
        return unit;
    }

    public double getPrice() {
        return price;
    }

    public double getTotal_price() {
        return total_price;
    }

    public Integer getMeals_count() {
        return meals_count;
    }

    public Integer getDays_count() {
        return days_count;
    }

    public int getId_products() {
        return id_products;
    }

    public int getId_receipts() {
        return id_receipts;
    }
}