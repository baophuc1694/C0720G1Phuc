package customer;

public class Customer {
    private String name;
    private String birthday;
    private String address;
    private String images;

    public Customer(){
    }
    public Customer(String name, String birthday, String address, String images){
        this.name = name;
        this.birthday= birthday;
        this.address = address;
        this.images = images;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
}
