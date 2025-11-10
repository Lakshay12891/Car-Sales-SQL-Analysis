# README.md

# 🚗 Car Sales SQL Analysis

This project showcases SQL analysis and problem-solving on a **car sales dataset**, using real-world queries covering filtering, aggregation, joins, subqueries, and window functions.

---

## 📊 Dataset
**File:** `car_sales_data.csv`  
The dataset contains information about cars, including:
- Manufacturer  
- Model  
- Year of manufacture  
- Price  
- Fuel type  
- Mileage  
- Engine size  

---

## 🧮 SQL Topics Covered
✅ Basic SELECT Queries  
✅ Filtering & Conditions  
✅ Aggregation Functions  
✅ GROUP BY and HAVING  
✅ Subqueries  
✅ Joins (with custom `manufacturer_country` table)  
✅ Window Functions  
✅ Data Cleaning & Updates  

---

## 🧱 Project Files
| File | Description |
|------|--------------|
| `data/car_sales_data.csv` | Dataset used for analysis |
| `scripts/car_sales_data.sql` | SQL queries written and tested |
| `Queries.txt` | List of practice questions solved |

---

## 🤓 Sample Queries
```sql
-- Show the newest car for each fuel type
SELECT c.*
FROM car_sales_data c
JOIN (
    SELECT `Fuel type`, MAX(`Year of manufacture`) AS newest_year
    FROM car_sales_data
    GROUP BY `Fuel type`
) t
ON c.`Fuel type` = t.`Fuel type`
AND c.`Year of manufacture` = t.newest_year;
```

---

## 💡 Insights
Some example insights from the analysis:
- The **average car price** across the dataset.
- **Top 3 most expensive manufacturers** per country.
- Which **year** had the highest average price.
- **Ranking of cars** by price within each manufacturer.

---

## 🛠️ Tools Used
- MySQL 8+
- VS Code / MySQL Workbench
- CSV Data Import

---

## 📌 Author
**Lakshay Jain**  
🎓 BBA Student (DU SOL) | 🧠 AI & Data Enthusiast | 💻 Learning SQL & Python  
🛍️ Connect with me on [LinkedIn](https://www.linkedin.com/in/lakshay-jain-ai/)  
📂 Explore full project on GitHub → [GitHub Repository](https://github.com/lakshay12891/Car-Sales-SQL-Analysis)

---

# 🗄️ LinkedIn PDF Summary

## Car Sales SQL Analysis - Lakshay Jain

### Objective:
To perform end-to-end SQL analysis on car sales data to uncover trends and insights using MySQL.

---

### Key Queries Solved:
1. Display all cars made after 2015.  
2. Find distinct fuel types.  
3. Show all cars where manufacturer = 'Ford'.  
4. Find total number of cars.  
5. Get top 10 cheapest cars.  
6. Display average engine size by fuel type.  
7. Rank cars by price within manufacturer.  
8. Find top 3 expensive manufacturers per country.  

---

### Key Learnings:
- Used **GROUP BY**, **HAVING**, and **Window Functions**.
- Practiced **Subqueries** for advanced filtering.
- Created a secondary table `manufacturer_country` to explore **JOINs**.
- Generated insights on pricing trends, car age, and brand-level stats.

---

### Tools:
- MySQL 8+
- VS Code / MySQL Workbench

---

### Project Link:
🔗 [GitHub Repository](https://github.com/lakshay12891/Car-Sales-SQL-Analysis)

---

### Author:
**Lakshay Jain**  
BBA Student | AI & Data Enthusiast  
LinkedIn: [https://linkedin.com/in/YOUR-USERNAME](https://www.linkedin.com/in/lakshay-jain-ai/)

---

### Keywords:
#SQL #DataAnalysis #MySQL #Analytics #LearningJourney

