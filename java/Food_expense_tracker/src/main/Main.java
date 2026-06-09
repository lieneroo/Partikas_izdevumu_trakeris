package main;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Scanner;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.PurchaseItemDAO;
import dao.ReceiptDAO;
import models.Category;
import models.Product;

public class Main {

    public static void main(String[] args) {

        System.out.println("Programma palaista!");

        Scanner scanner = new Scanner(System.in);

        ProductDAO productDAO = new ProductDAO();
        ReceiptDAO receiptDAO = new ReceiptDAO();
        PurchaseItemDAO purchaseItemDAO = new PurchaseItemDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        int receiptId = receiptDAO.createReceipt(LocalDate.now());

        String turpinat = "j";

        while (turpinat.equalsIgnoreCase("j")) {

            System.out.println("Ievadi produkta nosaukumu:");
            String search = scanner.nextLine();

            if (search.isBlank()) {
                System.out.println("Nav ievadīts produkta nosaukums!");
                continue;
            }

            ArrayList<Product> products = productDAO.searchProducts(search);

            if (products.isEmpty()) {
                System.out.println("Produkts nav atrasts!");
                System.out.println("Vai pievienot jaunu produktu? (j/n)");

                String addProduct = scanner.nextLine();

                if (addProduct.equalsIgnoreCase("j")) {
                    addNewProduct(scanner, productDAO, categoryDAO);
                }

                continue;
            }

            for (Product product : products) {
                System.out.println(product.getProducts_id() + " | "
                        + product.getBrand_name() + " - "
                        + product.getProduct_name());
            }

            System.out.println("0 | Pievienot jaunu produktu");

            int productId = 0;
            boolean found = false;
            boolean addNewProduct = false;

            while (!found && !addNewProduct) {
                System.out.println("Ievadi izvēlētā produkta ID vai 0, lai pievienotu jaunu produktu:");

                productId = scanner.nextInt();
                scanner.nextLine();

                if (productId == 0) {
                    addNewProduct = true;
                    break;
                }

                for (Product product : products) {
                    if (product.getProducts_id() == productId) {
                        found = true;
                        break;
                    }
                }

                if (!found) {
                    System.out.println("Nepareizs produkta ID! Mēģini vēlreiz.");
                }
            }

            if (addNewProduct) {
                addNewProduct(scanner, productDAO, categoryDAO);
                continue;
            }

            double quantity = readPositiveDouble(scanner,
                    "Ievadi daudzumu kilogramos/iepakojumu skaitu:");

            double price = readPositiveDouble(scanner,
                    "Ievadi cenu par vienu iepakojumu vai vienu vienību:");

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

            String weight_unit = null;

            if (weight != null) {
                System.out.println("Ievadi svara mērvienību (g, kg, l, u.c.):");
                weight_unit = scanner.nextLine();
            }

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

            purchaseItemDAO.insertPurchaseItem(
                    quantity,
                    unit,
                    price,
                    weight,
                    weight_unit,
                    totalPrice,
                    meals_count,
                    days_count,
                    productId,
                    receiptId
            );

            System.out.println("Vai pievienot vēl produktu? j/n");
            turpinat = scanner.nextLine();
        }

        double total = purchaseItemDAO.getReceiptTotal(receiptId);
        System.out.println("Čeka kopējā summa: " + total + " EUR");

        purchaseItemDAO.showReceiptItems(receiptId);

        scanner.close();
    }

    private static void addNewProduct(
            Scanner scanner,
            ProductDAO productDAO,
            CategoryDAO categoryDAO
    ) {
        ArrayList<Category> categories = categoryDAO.getAllCategories();

        for (Category category : categories) {
            System.out.println(category.getCategories_id() + " | "
                    + category.getCategory_name());
        }

        System.out.println("Ievadi zīmolu/ražotāju:");
        String brandName = scanner.nextLine();

        System.out.println("Ievadi pilnu produkta nosaukumu:");
        String productName = scanner.nextLine();

        int categoryId = 0;
        boolean categoryFound = false;

        while (!categoryFound) {
            System.out.println("Ievadi izvēlētās kategorijas ID:");

            categoryId = scanner.nextInt();
            scanner.nextLine();

            for (Category category : categories) {
                if (category.getCategories_id() == categoryId) {
                    categoryFound = true;
                    break;
                }
            }

            if (!categoryFound) {
                System.out.println("Nepareizs kategorijas ID! Mēģini vēlreiz.");
            }
        }

        productDAO.insertProduct(brandName, productName, categoryId);

        System.out.println("Produkts pievienots! Meklē to vēlreiz, lai pievienotu čekam.");
    }

    private static double readPositiveDouble(Scanner scanner, String message) {

        while (true) {
            System.out.println(message);

            if (scanner.hasNextDouble()) {
                double value = scanner.nextDouble();
                scanner.nextLine();

                if (value > 0) {
                    return value;
                }
            } else {
                scanner.nextLine();
            }

            System.out.println("Kļūda! Ievadi pozitīvu skaitli.");
        }
    }
}