# 🚗 Car Sales Analysis Dashboard  


## 📌 Project Overview  
This project analyzes **car sales data** to extract valuable insights and create an interactive **Power BI dashboard**. Using **MySQL for data cleaning and transformation** and **Power BI for visualization**, the project highlights sales performance, revenue distribution, dealer rankings, and market trends to support data-driven decision-making.


<img width="1366" height="768" alt="Screenshot (4)" src="https://github.com/user-attachments/assets/773c0ad6-ea93-444e-9547-960ad7dee08b" />


---

## ✅ Objectives  
- Clean and prepare raw car sales data in MySQL.  
- Perform **exploratory data analysis (EDA)** for trend identification.  
- Build an **interactive Power BI dashboard**.  
- Derive insights on revenue, dealer performance, market patterns etc.  

---

## 🛠 Tools & Technologies  
- **Database:** MySQL  
- **Visualization:** Power BI  
- **Data Processing:** Excel / CSV  
- **Language:** SQL  

---

## 📂 Dataset Details  
The dataset includes:  
- `Car_ID` – Unique identifier for each car
- `customer_name` - Unique name for each customer
- `Gender` - Genders of customers
- `Company` – Car manufacturer  
- `Model` – Car model name  
- `Dealer_Name` – Dealer handling the sale  
- `Region` – Geographical location  
- `Price_USD` – Selling price in USD  
- `Sales_Date` – Date of sale  
- `Fuel_Type` – Petrol, Diesel, Electric  
- `Transmission` – Automatic, Manual
- `Annual income` - annual income of customers 
- `color` - color of car
- `Dealer no`
- `Body style`
- `Phone`
- `Dealer region`

---

## 🔍 Data Cleaning & Transformation (MySQL)
- Checking for and removing duplicates and null values.  
- Standardized column names and formats.  
- Converted `Sales_Date` to proper **DATE** format.

## Data exloration (MySQL)
- Created calculated fields for:
  - **Total Revenue**
  - **Units Sold**
  - **average price**
- Car sold and revenue for each sale month
- Best sales month and its revenue
- Amount of cars sold by each dealer
- Total revenue from each dealer region
- Total units sold by each car company
- Total revenue reenue from each car model
- Total male customers vs female customers
- Income bracket of customers
- Average car price for each gender
- Total count for each transmission count
- Total count for each body style
- Count for most popular color of car bought

---

## 📊 Dashboard Visualizations
The **Power BI Dashboard** includes:  
✔ **Monthly Sales vs Revenue Trends**  
✔ **Top 10 Dealers by Sales**  
✔ **Revenue by Region** (Map & Bar Chart)  
✔ **Top Car Companies by Units Sold**  
✔ **Top 10 Car Models**  
✔ **Transmission Type Analysis** 
✔ **Customer gender distribution**

---

## 📈 Key Insights  
- Car sales peaks towards the end of the year
- Top dealers region were austin and janesville
- Company with the highest units sold were chevrolet and dodge
- Males customers bought more car units than the female customers but the female customers had a higher average price
- Customers with income higher than 500k bought more cars compared to other income brackets
- Customers preffered the auto trnsmission to the manual transmission 

## Recomendations
- Increase availability of automatic cars in urban areas.
- Support underperforming dealers with better incentives and training and replicate strategies of top-performing dealers in other regions.
- Offer discounts and promotions during off-peak months to boost sales and increase advertising before peak seasons.
