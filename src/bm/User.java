package bm;

public class User {
    private String userName;
    private int role;

    public User(String userName, int role) {
        this.userName = userName;
        this.role = role;
    }

    public String getUserName() {
        return userName;
    }

    public int getRole() {
        return role;
    }
}
