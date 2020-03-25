var mysql = require("mysql");
var inquirer = "inquirer";
var Table = require("console.table");

var connection = mysql.createConnection({
  host: "localhost",

  port: 3306,
  user: "root",
  password: "root",
  database: "bamazon_db"
});

//If successful:Connects with server and loads products info

connection.connect(function(err) {
  if (err) {
    console.error("error connecting: " + error.stack);
  }
  loadProducts();
});

//function to load products from database and prints results to console
function loadProducts() {
  connection.query("SELECT * FROM products", function(err, res) {
    if (err) throw err;

    //draws table in terminal
    console.table(res);
    promptCustomerForItem(res);
  });
}
//Ask customer what item they are looking for
function promptCustomerForItem(inventory) {
  inquirer
    .prompt([
      {
        type: "input",
        name: "choice",
        message:
          "What is the ID of the item you would like to purchase?[Quit with Q]",
        validate: function(val) {
          return !isNaN(val) || val.toLowerCase() === "q";
        }
      }
    ])
    //
    .then(function(val) {
      //check user wants to quit
      checkIfShouldExit(val.choice);
      var choiceId = parseInt(val.choice);
      var product = checkInventory(choiceId, inventory);
      //if product exists prompt customer for quantity
      if (product) {
        promptCustomerForQuantity(product);
      } else {
        //otherwise let them item is not in the inventory
        console.log("\nThat item is not in the inventory");
        loadProducts();
      }
    });
}
//Ask how much does the user want
function promptCustomerForQuantity(product) {
  inquirer
    .prompt([
      {
        type: "input",
        name: "quantity",
        message: "How many would you like? [Quit with Q]",
        validate: function(val) {
          return !isNaN(val) || val.toLowerCase() === "q";
        }
      }
    ])
    //
    .then(function(val) {
      // if user wants to quit
      checkIfShouldExit(val.quantity);
      var quanitity = parseInt(val.quantity);
      //check if the have enough of the product chosen if not let the buyer know and reload
      if (quanitity > product.stock_quantity) {
        console.log("\nInsufficient quantity!");
        loadProducts();
      } else {
        makePurchase(product, quantity);
      }
    });
}
//Purchase the desired amount of item
function makePurchase(product, quantity) {
  connection.query(
    "UPDATE products SET stock_quantity - ?, product_sales = product_sales + WHERE item_id = ?",
    [quantity, product.price * quantity, product.item_id],
    function(err, res) {
      //let buyer know the purchase was succedssful, reload
      console.log(
        "\nSuccessfully purchased " + " " + product.product_name + "'s!"
      );
      loadProducts();
    }
  );
}
//Check to see if product is part of the inventory
function checkInventory(choiceId, inventory) {
  for (var i = 0; i < inventory.length; i++) {
    if (inventory[i].item_id === choiceId) {
      //if a match is found then this returns product
      return inventory[i];
    }
  }
  //if not then returns null
  return null;
}
//check to see if user wants to exit
function checkIfShouldExit(choice) {
  if (choice.toLowerCase() === "q") {
    console.log("See Ya Later!");
    process.exit(0);
  }
}
