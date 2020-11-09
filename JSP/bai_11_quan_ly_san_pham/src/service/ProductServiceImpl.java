package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static Map<Integer, Product> products;

    static{
        products = new HashMap<>();
        products.put(1, new Product("iPhone 12", "1600", "Apple", "Hang Quoc Te"));
        products.put(2, new Product("SamSung Note 10", "1000", "SamSung", "Hang Quoc Te"));
        products.put(3, new Product("Oppo New S3", "200", "Oppe", "Hang Quoc Te"));
        products.put(4, new Product("Hawuei SS1", "180", "Hawuei", "Hang Quoc Te"));
    }

    @Override
    public List<Product> finAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);

    }

    @Override
    public Product finById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);

    }

    @Override
    public void remove(int id) {
        products.remove(id);

    }
}
