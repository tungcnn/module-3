package model.service;

import model.entities.Person;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PersonServiceImpl implements model.service.PersonService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/person";
    private String jdbcUsername = "root";
    private String jdbcPassword = "21011998";

    private static final String INSERT_PERSONS_SQL = "INSERT INTO person VALUES " + " (?,?,?,?,?);";

    private static final String SELECT_PERSON_BY_ID = "SELECT * from person WHERE id =?";
    private static final String SELECT_ALL_PERSONS = "SELECT * from PERSON";
    private static final String DELETE_PERSONS_SQL = "DELETE FROM person WHERE id = ?;";
    private static final String UPDATE_PERSONS_SQL = "UPDATE person SET _name = ?, username = ?, email = ?, address = ? WHERE id = ?;";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Person> findAll() {
        List<Person> persons = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PERSONS);) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("_name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String address = rs.getString("address");
                persons.add(new Person(id, name, username, email, address));
            }
        } catch (SQLException e) {

        }
        return persons;
    }

    @Override
    public void save(Person person) {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PERSONS_SQL)) {
            preparedStatement.setString(1, person.getId());
            preparedStatement.setString(2, person.getName());
            preparedStatement.setString(3, person.getUsername());
            preparedStatement.setString(4, person.getEmail());
            preparedStatement.setString(5, person.getAddress());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
//            printSQLException(e);
        }
    }

    @Override
    public Person findById(String id) {
        Person person = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PERSON_BY_ID)) {
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("_name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String address = rs.getString("address");
                person = new Person(id, name, username, email, address);
            }
        } catch (SQLException e) {
//            printSQLException(e);
        }
        return person;
    }

    @Override
    public boolean update(String id, Person person) {
        boolean updated = false;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_PERSONS_SQL)) {
            statement.setString(1, person.getName());
            statement.setString(2, person.getUsername());
            statement.setString(3, person.getEmail());
            statement.setString(4, person.getAddress());
            statement.setString(5, id);
            updated = statement.executeUpdate() > 0;
        } catch (SQLException e) {

        }
        return updated;
    }

    @Override
    public boolean remove(String id) {
        boolean deleted = false;
        try (Connection connection = getConnection();PreparedStatement statement = connection.prepareStatement(DELETE_PERSONS_SQL)) {
            statement.setString(1, id);
            deleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {

        }
        return deleted;
    }
}
