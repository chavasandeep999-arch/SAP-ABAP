# 🛒 Grocery Store Management System using SAP RAP

<div align="center">

![SAP](https://img.shields.io/badge/SAP-RAP-blue?style=for-the-badge&logo=sap)
![ABAP](https://img.shields.io/badge/ABAP-Cloud-green?style=for-the-badge)
![OData V4](https://img.shields.io/badge/OData-V4-orange?style=for-the-badge)
![Fiori Elements](https://img.shields.io/badge/Fiori-Elements-blueviolet?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-success?style=for-the-badge)

### A cloud-ready Grocery Store Management application developed using SAP RESTful ABAP Programming Model (RAP), SAP Fiori Elements, OData V4, and ABAP Cloud.

</div>

---

# 📖 Table of Contents

- Overview
- Features
- System Architecture
- Technologies Used
- Project Structure
- Database Design
- CDS Views
- RAP Business Object
- Validations
- Determinations
- Value Helps
- Draft Management
- Business Workflow
- Application Screens
- Learning Outcomes
- Future Enhancements
- Author

---

# 📖 Overview

The **Grocery Store Management System** is an enterprise application developed using the **SAP RESTful ABAP Programming Model (RAP)**.

The application enables grocery store employees to efficiently manage grocery products through a modern SAP Fiori interface.

Users can:

- Create Products
- Update Products
- Delete Products
- Search Products
- Maintain Product Categories
- Assign Products to Stores
- Manage Product Pricing

The application follows SAP's modern cloud architecture by implementing:

- CDS View Entities
- Managed RAP Business Objects
- Behavior Definitions
- Behavior Implementations
- OData V4 Services
- SAP Fiori Elements

The project demonstrates enterprise application development using SAP Business Technology Platform (BTP) ABAP Environment.

---

# 🚀 Features

✅ Product Management

✅ Store Management

✅ Category Management

✅ Product Search

✅ CRUD Operations

✅ Draft Handling

✅ Automatic Default Currency

✅ Product Duplicate Validation

✅ Store Value Help

✅ Category Value Help

✅ Currency Value Help

✅ SAP Fiori Elements UI

✅ OData V4 Service

---

# 🏗️ System Architecture

```text
                SAP Fiori Elements
                        │
                        ▼
                 OData V4 Service
                        │
                        ▼
          RAP Business Object Layer
   (Behavior Definition + Implementation)
                        │
                        ▼
               CDS View Entities
                        │
                        ▼
               SAP HANA Database
```

---

# 🛠 Technologies Used

| Technology | Purpose |
|------------|---------|
| SAP RAP | Business Object Development |
| ABAP Cloud | Backend Development |
| CDS View Entities | Data Modeling |
| Behavior Definition | Business Rules |
| Behavior Implementation | Validations & Determinations |
| SAP HANA | Database |
| SAP Fiori Elements | User Interface |
| OData V4 | RESTful Service |
| Eclipse ADT | Development Environment |

---

# 📂 Project Structure

```
Z_GROCERY_STORE
│
├── Database Tables
│   ├── ZGS_PRODUCT
│   ├── ZGS_STORE
│   └── ZGS_CATEGORY
│
├── CDS Views
│   ├── ZI_GS_PRODUCT
│   ├── ZR_GSPRODUCT
│   ├── ZC_GSPRODUCT
│   ├── ZI_GS_STORE
│   ├── ZI_GS_CATEGORY
│   ├── ZI_GS_STORE_VH
│   └── ZI_GS_CATEGORY_VH
│
├── Metadata Extension
│   └── ZC_GSPRODUCT
│
├── Behavior Definitions
│   ├── ZR_GSPRODUCT
│   └── ZC_GSPRODUCT
│
├── Behavior Pool
│   └── ZBP_R_GSPRODUCT
│
├── Service Definition
│   └── ZUI_GSPRODUCT
│
├── Service Binding
│   └── ZUI_GSPRODUCT_O4
│
└── Demo Data Classes
    ├── ZCL_GS_LOAD_CATEGORY_DATA
    ├── ZCL_GS_LOAD_STORE_DATA
    └── ZCL_GS_LOAD_PRODUCT_DATA
```

---

# 🗄 Database Design

## Product Table

**Table Name**

```
ZGS_PRODUCT
```

| Field | Description |
|--------|-------------|
| ProductID | Unique Product Identifier |
| ProductName | Product Name |
| StoreID | Store Identifier |
| CategoryID | Category Identifier |
| BasePrice | Product Price |
| Currency | Product Currency |
| PriceCategory | Product Price Category |
| CreatedBy | Audit Field |
| CreatedAt | Audit Field |
| LastChangedBy | Audit Field |
| LastChangedAt | Audit Field |

---

## Store Table

**Table Name**

```
ZGS_STORE
```

Stores grocery store information.

Examples

- Aldi
- Lidl
- Kaufland
- Rewe
- Edeka

---

## Category Table

**Table Name**

```
ZGS_CATEGORY
```

Stores product categories.

Examples

- Dairy Products
- Bakery
- Fruits
- Vegetables
- Frozen Foods
- Beverages
- Household
- Snacks

---

# 📑 CDS Views

## Interface View

```
ZI_GS_PRODUCT
```

Acts as the primary interface between the database and RAP Business Object.

---

## Root View Entity

```
ZR_GSPRODUCT
```

Represents the RAP Business Object.

Responsible for exposing business data.

---

## Projection View

```
ZC_GSPRODUCT
```

Used for exposing business data to SAP Fiori.

---

# ⚙ RAP Business Object

The application uses **Managed RAP Business Objects**.

Supported operations include:

- Create
- Read
- Update
- Delete
- Draft
- Activate
- Edit
- Resume
- Discard

The business object automatically handles transactional consistency.

---

# ✅ Business Validations

The following validations are implemented.

## 1. Product Name Validation

Ensures that the Product Name is not empty.

---

## 2. Base Price Validation

Ensures that Base Price is greater than zero.

---

## 3. Store Validation

Ensures that a Store is selected.

---

## 4. Category Validation

Ensures that a Category is selected.

---

## 5. Currency Validation

Checks whether the entered currency exists in the SAP standard Currency CDS View.

---

## 6. Duplicate Product Validation

Checks whether a Product ID already exists before saving.

This prevents duplicate products from being created.

---

# 🔄 Determinations

## 1. Default Currency Determination

Automatically assigns the default currency as:

```
EUR
```

whenever the Currency field is left empty during product creation.

---

## 2. Price Category Determination

Automatically categorizes products into pricing groups based on the entered Base Price.

Example

| Base Price | Category |
|------------|----------|
| €0 – €10 | Budget |
| €10 – €50 | Standard |
| Above €50 | Premium |

This determination improves reporting and product classification.

---

# 🔍 Value Helps

The application provides three value helps.

## Store Value Help

Allows users to select available stores.

Examples

- Aldi
- Lidl
- Rewe
- Kaufland

---

## Category Value Help

Allows users to select grocery categories.

Examples

- Dairy
- Bakery
- Fruits
- Vegetables

---

## Currency Value Help

Uses SAP Standard CDS

```
I_CurrencyStdVH
```

Users can select

- EUR
- USD
- INR
- GBP

instead of entering values manually.

---

# 📋 Draft Management

The application supports RAP Draft.

Features

- Create Draft
- Edit Draft
- Resume Draft
- Activate Draft
- Discard Draft

Draft functionality enables users to temporarily save incomplete work before committing it to the active database.

---

# 🔄 Business Workflow

```
User
 │
 ▼
SAP Fiori Application
 │
 ▼
Enter Product Information
 │
 ▼
RAP Business Object
 │
 ▼
Business Validations
 │
 ▼
Business Determinations
 │
 ▼
Draft Record Created
 │
 ▼
Activate Draft
 │
 ▼
Save to SAP HANA Database
 │
 ▼
OData V4 Service
 │
 ▼
Updated Product Displayed
```

---

# 📸 Application Features

The application provides the following capabilities.

- Product List Report

- Object Page

- Product Creation

- Product Editing

- Product Deletion

- Search

- Filter

- Sort

- Draft Handling

- Value Helps

- Validation Messages

- Automatic Currency Assignment

- Audit Information

---

# 🎯 Learning Outcomes

Through this project, the following SAP concepts were implemented.

- SAP RAP

- CDS View Entities

- Managed Business Objects

- Behavior Definitions

- Behavior Implementations

- Validations

- Determinations

- Value Helps

- Draft Handling

- OData V4 Services

- SAP Fiori Elements

- SAP HANA Database

- ABAP Cloud Development

---

# 🔮 Future Enhancements

Future improvements may include:

- Inventory Management

- Supplier Management

- Discount Management

- Barcode Scanner Integration

- Sales Dashboard

- Purchase Orders

- Product Images

- Stock Monitoring

- User Roles & Authorization

- SAP Build Apps Integration

- SAP Analytics Cloud Dashboard

---

# 👨‍💻 Author

## Nilesh Dokuparthi

**Master of Science in Applied Computer Science**

SRH University of Applied Sciences, Munich

### Technologies

- SAP RAP
- ABAP Cloud
- SAP HANA
- SAP Fiori Elements
- OData V4
- Eclipse ADT

---

# 🤝 Contributing

Contributions are welcome.

If you have suggestions for improving the project, feel free to:

- Fork the repository
- Create a feature branch
- Commit your changes
- Open a Pull Request

---

# 📄 License

This project is licensed under the **MIT License**.

---

<div align="center">

## ⭐ If you found this project useful, consider giving it a Star!

Made with ❤️ using **SAP RESTful ABAP Programming Model (RAP)**

</div>
