package model;

public class Product {
    private int id;
    private String name;
    private String price;
    private String produce;
    private String description;
    static int id_total = 0;

    public Product(){
        id_total++;
        this.id =id_total;
    }

    public Product( String name, String price, String produce, String description) {
        id_total++;
        this.id = id_total;
        this.name = name;
        this.price = price;
        this.produce = produce;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getProduce() {
        return produce;
    }

    public void setProduce(String produce) {
        this.produce = produce;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
