package service;

import model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> finAll();

    void save(Customer customer);

    Customer finById(int id);

    void update(int id, Customer customer);

    void remove(int id);
}
