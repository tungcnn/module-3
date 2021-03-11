package model.service;

import model.entities.Person;

import java.sql.SQLException;
import java.util.List;

public interface PersonService {
    List<Person> findAll();
    void save(Person person);

    Person findById(String id);

    boolean update(String id, Person person);

    boolean remove(String id);
}
