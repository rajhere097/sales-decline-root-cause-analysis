# 📉 Sales Decline Root Cause Analysis (End-to-End Data Pipeline)

This project analyzes a large-scale retail sales dataset (~500,000 transactions) from 2023 to 2026 to identify and understand the root cause of a significant sales decline observed in 2026. The project is designed as an end-to-end data pipeline covering data ingestion, transformation, analysis, and visualization using modern data tools.

🎯 Objective  
To answer the key business question:  
What is causing the sharp decline in sales in 2026?  
Is the drop driven by specific regions, products, or sales representatives, or is it a systemic issue affecting the entire business?

🏗️ Architecture (End-to-End Pipeline)  
Data Generation → AWS S3 → Snowflake → SQL Analysis → Python (EDA & Feature Engineering) → Power BI Dashboard  

AWS S3 is used as the data lake for storage, Snowflake serves as the data warehouse, SQL is used for transformations and window functions, Python is used for analysis and feature engineering, and Power BI is used for dashboarding and business insights.

📊 Dataset Details  
The dataset is a simulated retail dataset (SAP SD-like structure) with approximately 500,000 transactions spanning from 2023 to 2026.  
It includes features such as Order ID, Customer ID, Customer Name, Product, Region, Sales Representative, Sales Amount, and Order Date.  

Engineered features include Year, Quarter, Month, lag features (previous year/quarter/month sales), and rolling averages (2-year, 3-year, 3-quarter, and 3-month moving averages).

📈 Analysis Performed  
The analysis includes Year-over-Year (YoY), Quarter-over-Quarter (QoQ), and Month-over-Month (MoM) trends to understand performance over time. Rolling averages are used to smooth fluctuations and identify underlying patterns.  

Multi-dimensional analysis is performed across regions, products, and sales representatives to identify whether the decline is localized or widespread. SQL window functions such as LAG and aggregations are used extensively for time-based comparisons.

📊 Dashboard Highlights (Power BI)  
The dashboard includes KPI cards for total sales comparison (2025 vs 2026) and sales drop percentage. It also includes QoQ change visuals, monthly sales trends with moving averages, and detailed breakdowns by region, product, and sales representatives for root cause exploration.

🔍 Key Insights  
The sales decline is consistent across all regions, products, and sales representatives. No single segment is responsible for the drop. The decline is sharp and noticeable in early 2026, indicating that the issue is systemic rather than performance-driven.

🧠 Conclusion  
The analysis concludes that the decline is not due to individual or regional performance but likely due to broader business factors such as market conditions, pricing strategy, external economic impact, or supply chain issues.

🛠️ Tools & Technologies  
Python (Pandas, NumPy, Matplotlib, Seaborn), SQL (Window Functions, LAG, Aggregations), AWS S3, Snowflake, Power BI, Jupyter Notebook

📂 Project Files  
Power BI Dashboard (.pbix), SQL Scripts, Python Notebook, Dashboard Images

📌 Key Takeaways  
Built an end-to-end pipeline (S3 → Snowflake → BI), applied time-based analysis and feature engineering, demonstrated strong business understanding, and delivered actionable insights from large-scale data.

🔗 Project Link  
https://github.com/rajhere097/sales-decline-root-cause-analysis

👤 Author  
Ratnajit Chakraborty  
Email: rajhere1997@gmail.com  
LinkedIn: https://www.linkedin.com/in/ratnajit-chakraborty-076ab520a  
GitHub: https://github.com/rajhere097
