package model;

public class Customer {
    private int id;
    private String name;
    private String email;
    private String address;
    static int id_total=0;

    public Customer( String name, String email, String address) {
        id_total++;
        this.id = id_total;
        this.name = name;
        this.email = email;
        this.address = address;
    }
    public Customer(){
        id_total++;
        this.id = id_total;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
