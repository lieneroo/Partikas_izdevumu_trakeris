package main;

import java.util.ArrayList;

import dao.ProductDAO;
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
    }
}