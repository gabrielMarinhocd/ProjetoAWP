package modelo;

public class Config {

//Configuração SMTP
    private final String host = "smtp.gmail.com";
    private final String port = "587";
    private final String auth = "true";
    private final String email = "email@gmail.com";
    private final String username = "email@gmail.com";
    private final String password = "senha";

    public String getHost() {
        return host;
    }

    public String getPort() {
        return port;
    }

    public String getAuth() {
        return auth;
    }

    public String getEmail() {
        return email;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}
