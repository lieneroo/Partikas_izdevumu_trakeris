package main;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Scanner;

import dao.ProductDAO;
import dao.PurchaseItemDAO;
import dao.ReceiptDAO;
import models.Product;

public class Main {

	public static void main(String[] args) {

	    System.out.println("Programma palaista!");

	    Scanner scanner = new Scanner(System.in);

	    ProductDAO productDAO = new ProductDAO();
	    ReceiptDAO receiptDAO = new ReceiptDAO();
	    PurchaseItemDAO purchaseItemDAO = new PurchaseItemDAO();

	    int receiptId = receiptDAO.createReceipt(LocalDate.now());

	    String turpinat = "j";
	    
	    while (turpinat.equalsIgnoreCase("j")) {
	    	
	    System.out.println("Ievadi produkta nosaukumu:");
	    String search = scanner.nextLine();

	    ArrayList<Product> products = productDAO.searchProducts(search);

	    for (Product product : products) {
	        System.out.println(product.getProducts_id() + " | " +
	            product.getBrand_name() + " - " + product.getProduct_name());
	    }

	    System.out.println("Ievadi izvēlētā produkta ID:");
	    int productId = scanner.nextInt();

	    System.out.println("Ievadi daudzumu kilogramos/iepakojumu skaitu:");
	    double quantity = scanner.nextDouble();

	    System.out.println("Ievadi cenu par vienu iepakojumu vai vienu vienību:");
	    double price = scanner.nextDouble();

	    scanner.nextLine();

	    System.out.println("Ievadi mērvienību (gab., kg, l, u.c.):");
	    String unit = scanner.nextLine();

	    System.out.println("Ievadi preces svaru, ja prece ir iepakojumā:");
	    String weightInput = scanner.nextLine();
	    Double weight = null;
	    
	    if (!weightInput.isBlank()) {
	        weight = Double.parseDouble(weightInput);
	    
	        if (weight <= 0) {
	            weight = null;
	        }
	    }
	    
	    System.out.println("Ievadi mērvienību (g, kg, l, u.c.):");
	    String weight_unit = scanner.nextLine();
	   
	    double totalPrice = quantity * price;

	    System.out.println("Ievadi, cik ēdienreizēm pietiks:");
	    String mealsInput = scanner.nextLine();
	    Integer meals_count = null;
	    if (!mealsInput.isBlank()) {
	        meals_count = Integer.parseInt(mealsInput);
	    }
	    
	    System.out.println("Ievadi, cik dienām pietiks:");
	    String daysInput = scanner.nextLine();
	    Integer days_count = null;
	    if (!daysInput.isBlank()) {
	        days_count = Integer.parseInt(daysInput);
	    }
	    
	    purchaseItemDAO.insertPurchaseItem(quantity, unit, price, weight, 
	    		weight_unit, totalPrice, meals_count, days_count, productId, receiptId);

	    System.out.println("Vai pievienot vēl produktu? j/n");
	    turpinat = scanner.nextLine();
	    }
	    
	    double total = purchaseItemDAO.getReceiptTotal(receiptId);
	    System.out.println("Čeka kopējā summa: " + total + " EUR");
	    purchaseItemDAO.showReceiptItems(receiptId);
	    
	    
	    scanner.close();
	}
}