// OP1: insertMany() — insert all documents
db.products.insertMany([
  {
    product_id: 101,
    name: "Smartphone",
    category: "Electronics",
    price: 25000,
    brand: "Samsung",
    warranty_years: 2,
    specs: { ram: "8GB", storage: "128GB", battery: "5000mAh" }
  },
  {
    product_id: 102,
    name: "T-Shirt",
    category: "Clothing",
    price: 800,
    brand: "Nike",
    size: ["S", "M", "L", "XL"],
    material: "Cotton",
    color: "Black"
  },
  {
    product_id: 103,
    name: "Milk",
    category: "Groceries",
    price: 50,
    brand: "Amul",
    expiry_date: new Date("2024-12-01"),
    nutrition: { fat: "3%", protein: "3.2g" },
    is_perishable: true
  }
]);


// OP2: find Electronics with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: add discount_percent to a product
db.products.updateOne(
  { product_id: 101 },
  { $set: { discount_percent: 10 } }
);

// OP5: create index on category field
db.products.createIndex({ category: 1 });
