import static spark.Spark.*;

public class SimpleApp {
    public static void main(String[] args) {
        // Define a route for the homepage
        get("/", (req, res) -> "Hello, World!");

        // Define a route for a specific path
        get("/greet/:name", (req, res) -> {
            String name = req.params(":name");
            return "Hello, " + name + "!";
        });
    }
}

