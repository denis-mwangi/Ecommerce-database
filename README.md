# 🎯 Objective
This challenge will help you master the art of database design 🧠💾  
Your group will design an Entity-Relationship Diagram (ERD) and collaboratively build an e-commerce database from scratch.

---

## 🛠️ Instructions

1. **Create an ERD** ✍️  
   - Clearly define all entities (tables) and their attributes.  
   - Understand and document the relationships between tables.  
   - Identify primary keys, foreign keys, and other constraints.  
   - Use tools like Lucidchart, draw.io, dbdiagram.io, or MySQL Workbench 🛠️
   [ER diagram](ecommerce.sql.png)

2. **Plan the Data Flow** 🔄  
   - Map out how data flows between entities.  
   - As a team, discuss how the database will be structured and implemented.  
   - Think like architects! 🏗️

3. **Group Collaboration** 🤝  
   - Work together on analysis, design, and implementation.  
   - Ensure everyone understands every part of the project.  
   - Share ideas, ask questions, and keep the teamwork strong! 💬

4. **Submission** 🚀  
   - Create a public GitHub repository 📂  
   - Upload your final ERD and `ecommerce.sql` file.  
   - Ensure everything is accessible to the reviewer 🔍

---

## 🧑‍🤝‍🧑 Group Collaboration Tips

- Stay connected and meet regularly 👥  
- Use GitHub for version control, documentation, and teamwork 📘  
- Track your progress, share updates, and troubleshoot together 🔧  
- Make sure everyone is in the loop 🧭

---

## 🗃️ Tables to Be Created

| Table Name             | Description                                                |
|------------------------|------------------------------------------------------------|
| `product_image`        | Stores product image URLs or file references 🖼️            |
| `color`                | Manages available color options 🎨                         |
| `product_category`     | Classifies products into categories (e.g., clothing, electronics) 🗂️ |
| `product`              | Stores general product details (name, brand, base price) 📦 |
| `product_item`         | Represents purchasable items with specific variations 🧾   |
| `brand`                | Stores brand-related data 🏷️                               |
| `product_variation`    | Links a product to its variations (e.g., size, color) 🔄   |
| `size_category`        | Groups sizes into categories (e.g., clothing sizes, shoe sizes) 📏 |
| `size_option`          | Lists specific sizes (e.g., S, M, L, 42) 📐                |
| `product_attribute`    | Stores custom attributes (e.g., material, weight) 🧵        |
| `attribute_category`   | Groups attributes into categories (e.g., physical, technical) 📚 |
| `attribute_type`       | Defines types of attributes (e.g., text, number, boolean) 🧪 |
