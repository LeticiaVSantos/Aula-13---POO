
package br.com.fatecpg.db;


public class Manufacturer {
    private String id;
    private String name;
    private String state;
    private String city;

    public Manufacturer(String id, String name, String state, String city) {
        this.id = id;
        this.name = name;
        this.state = state;
        this.city = city;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
}
