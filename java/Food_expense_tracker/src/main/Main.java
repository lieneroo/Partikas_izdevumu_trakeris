package main;

import java.time.LocalDate;
import java.util.ArrayList;

import dao.ProductDAO;
import dao.PurchaseItemDAO;
import dao.ReceiptDAO;
import models.Product;

public class Main {

    public static void main(String[] args) {

        System.out.println("Programma palaista!");
        
        ProductDAO productDAO = new ProductDAO();

        ArrayList<Product> products = productDAO.searchProducts("cāļa");

        for (Product product : products) {
            System.out.println(product.getBrand_name() + " - " +
                product.getProduct_name());
        }
        ReceiptDAO receiptDAO = new ReceiptDAO();
        int receiptId = receiptDAO.createReceipt(LocalDate.now());
       
        PurchaseItemDAO purchaseItemDAO = new PurchaseItemDAO();
        purchaseItemDAO.insertPurchaseItem(2, "gab", 2.79, 5.58, null, null, 1, receiptId);
        purchaseItemDAO.showReceiptItems(1);
    
    }
}