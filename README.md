# 🛒 Django E-Commerce Website

A full-stack E-Commerce web application developed using **Python** and **Django**. The application enables users to browse products, manage their shopping cart, register/login securely, and place orders through a responsive and user-friendly interface.

---

## 📌 Table of Contents

- Overview
- Features
- Tech Stack
- Project Structure
- Installation
- Usage
- Screenshots
- Future Enhancements
- Author

---

# 📖 Overview

This project demonstrates the implementation of a complete E-Commerce website using the Django framework. It follows the MVC (Model-View-Template) architecture and includes both customer-facing functionality and an administrative dashboard for managing products and orders.

---

# ✨ Features

### 👤 User Features

- User Registration
- User Login & Logout
- Browse Products
- Product Categories
- Product Details Page
- Add to Cart
- Update Cart Quantity
- Remove Items from Cart
- Checkout Process
- Order Placement
- User Profile

### 🛠 Admin Features

- Admin Dashboard
- Add Products
- Update Products
- Delete Products
- Manage Categories
- Manage Orders
- Upload Product Images

---

# 🛠 Tech Stack

## Backend

- Python
- Django 5
- SQLite3

## Frontend

- HTML5
- CSS3
- Bootstrap
- JavaScript

## Tools & Technologies

- Git
- GitHub
- VS Code
- Virtual Environment (venv)

---

# 📂 Project Structure

```
ecommerce/
│
├── ecommerce/
│   ├── settings.py
│   ├── urls.py
│   └── ...
│
├── store/
│   ├── migrations/
│   ├── models.py
│   ├── views.py
│   ├── urls.py
│   └── admin.py
│
├── media/
├── static/
├── templates/
├── db.sqlite3
├── manage.py
├── requirements.txt
└── README.md
```

---

# ⚙️ Installation & Setup

## 1️⃣ Clone the Repository

```bash
git clone https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git
```

---

## 2️⃣ Navigate to the Project

```bash
cd imcc-semester1-project
```

---

## 3️⃣ Create Virtual Environment

```bash
python -m venv venv
```

---

## 4️⃣ Activate Virtual Environment

### Windows

```bash
venv\Scripts\activate
```

### Linux / macOS

```bash
source venv/bin/activate
```

---

## 5️⃣ Install Dependencies

```bash
pip install -r requirements.txt
```

---

## 6️⃣ Apply Database Migrations

```bash
python manage.py migrate
```

---

## 7️⃣ Create Superuser (Optional)

```bash
python manage.py createsuperuser
```

---

## 8️⃣ Start the Development Server

```bash
python manage.py runserver
```

Visit:

```
http://127.0.0.1:8000/
```

---

# 💻 Usage

### User

- Register an account
- Login
- Browse products
- Add items to cart
- Update cart
- Place an order

### Administrator

Visit:

```
http://127.0.0.1:8000/admin/
```

Login using the superuser credentials to:

- Manage products
- Manage categories
- Manage orders
- Manage users

# 📚 Learning Outcomes

During the development of this project, I gained practical experience in:

- Django Framework
- MVC (Model-View-Template) Architecture
- Django ORM
- Authentication & Authorization
- CRUD Operations
- File/Image Upload Handling
- Static & Media File Management
- Git & GitHub Version Control
- Database Migrations
- Responsive Web Design

---

# 👩‍💻 Author

**Shraddha Bhakare**

📧 Email: shraddhabhakare620@gmail.com

🔗 GitHub: https://github.com/Shraddha06-Bhakare

🔗 LinkedIn: https://www.linkedin.com/in/shraddha-bhakare-9845ba233/

---

# ⭐ Support

If you found this project helpful, consider giving it a ⭐ on GitHub!

---

**Thank you for visiting this repository! 😊**