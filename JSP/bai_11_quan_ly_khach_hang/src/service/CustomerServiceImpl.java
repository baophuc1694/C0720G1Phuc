package service;

import model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    private static Map<Integer, Customer> customers;

    static {
        customers = new HashMap<>();
        customers.put(1, new Customer( "Khanh", "Khanh@gmail.com", "Quang Tri"));
        customers.put(2, new Customer( "Chau", "Chau@gmail.com", "Quang Nam"));
        customers.put(3, new Customer( "Din", "Din@gmail.com", "Quang Ngai"));
        customers.put(4, new Customer( "Mai", "Mai@gmail.com", "Da Nang"));
        customers.put(5, new Customer( "Hoat", "Hoat@gmail.com", "Quang Binh"));
        customers.put(6, new Customer( "Quan", "Quan@gmail.com", "Sai Gon"));
    }

    @Override
    public List<Customer> finAll() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customer customer) {
        customers.put(customer.getId(), customer);

    }

    @Override
    public Customer finById(int id) {
        return customers.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customers.put(id, customer);

    }

    @Override
    public void remove(int id) {
        customers.remove(id);

    }
}
