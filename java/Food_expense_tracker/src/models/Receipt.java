package models;

import java.sql.Timestamp;

public class Receipt {

    private int receipts_id;
    private Timestamp purchase_date;

    public Receipt(int receipts_id, Timestamp purchase_date) {

        this.receipts_id = receipts_id;
        this.purchase_date = purchase_date;
    }

    public int getReceipts_id() {
        return receipts_id;
    }

    public Timestamp getPurchase_date() {
        return purchase_date;
    }
}