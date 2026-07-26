# 📉 Customer Retention Analytics using SQL

### Turning 7,043 Raw Customer Records into Actionable Retention Decisions with Advanced SQL

![SQL](https://img.shields.io/badge/SQL-MySQL%208-4479A1?logo=mysql&logoColor=white)
![Python](https://img.shields.io/badge/Python-Data%20Pipeline-3776AB?logo=python&logoColor=white)


> **Can SQL identify which customers are most likely to churn—and who should be retained first?**
>
> This project answers that question by building an end-to-end SQL analytics pipeline that transforms raw telecom customer data into business decisions. Using advanced SQL concepts—including **CTEs, Window Functions (`NTILE`, `ROW_NUMBER`), Dynamic SQL, and Rule-Based Risk Scoring**—the analysis identifies churn drivers, ranks customers by lifetime value, prioritises high-risk accounts, and converts insights into strategic retention recommendations.

---

# 🚀 Executive Summary 

| Business Finding | Business Impact |
|------------------|-----------------|
| 📉 **26.54% Customer Churn** | Nearly **1 in 4 customers** leave, highlighting a major revenue retention challenge. |
| 📄 **15× Higher Churn** | Month-to-month customers churn **15 times** more than customers on two-year contracts, making contract type the strongest retention driver. |
| 💰 **37× Customer Value Gap** | The highest-value customer segment generates **37 times** more lifetime revenue than the lowest-value segment, showing why retention budgets should be value-based rather than evenly distributed. |
| 🎯 **599 High-Risk Customers Identified** | A SQL-based risk scoring framework pinpoints the customers who should be contacted first, enabling targeted and cost-effective retention campaigns. |

---

# 💡 Decision-Driven Analytics

Most SQL portfolio projects stop after generating reports or dashboards.

This project goes further by demonstrating how SQL can be used to solve an end-to-end business problem—from raw data validation to executive decision-making.

Rather than simply analysing historical churn, the project answers critical business questions:

- Which customers are most likely to leave?
- Which customer segments generate the highest long-term revenue?
- Which factors contribute most to customer churn?
- Which customers should be prioritised first for retention?
- How can limited retention budgets maximise business ROI?

The final output is not just a collection of SQL queries—it is a decision-support framework that helps businesses prioritise retention efforts using measurable business impact.

---

# 🛠 SQL Skills Demonstrated

| SQL Concept | Business Purpose | Implementation |
|-------------|------------------|----------------|
| Data Cleaning & Validation | Ensure reliable analysis | `00_data_cleaning.sql` |
| Dynamic SQL (`PREPARE` / `EXECUTE`) | Automatically validate NULL values across all columns | `00_data_cleaning.sql` |
| Aggregate Functions | Revenue & churn analysis | `02–05 SQL files` |
| CASE Statements | Customer risk classification | `08_customer_risk_score.sql` |
| Common Table Expressions (CTEs) | Multi-stage risk calculations | `08_customer_risk_score.sql` |
| Window Function – `NTILE()` | Customer Lifetime Value segmentation | `06_customer_value_analysis.sql` |
| Window Function – `ROW_NUMBER()` | Retention priority ranking | `07_retention_priority.sql` |
| Business Rule Engine | High / Medium / Low Risk scoring | `08_customer_risk_score.sql` |

> **Every insight presented in this README is generated directly from the SQL scripts included in the `sql/` directory.**

---

# Business Problem

Subscription-based businesses often know **who has already churned**, but they struggle to determine:

- Which customers are most likely to churn next?
- Which customer segments create the greatest financial value?
- Which business factors have the strongest influence on customer retention?
- How should limited retention resources be allocated for maximum ROI?

This project addresses these challenges by building a complete SQL analytics pipeline that transforms raw customer data into actionable business recommendations.

---

# Dataset

**Dataset:** IBM Telco Customer Churn Dataset

The dataset contains **7,043 customer records** covering:

- Customer demographics
- Contract information
- Internet & telecom services
- Billing history
- Customer churn status

Before analysis, the dataset was validated to ensure high data quality.

| Validation Check | Result |
|------------------|--------|
| Total Records | 7,043 |
| Duplicate Customer IDs | None |
| Missing Values | Dynamically validated |
| Blank `TotalCharges` | Converted to NULL |
| Data Types | Validated & transformed |

---

# Analytics Workflow

```text
Raw CSV Dataset
        │
        ▼
Python Data Import
        │
        ▼
MySQL Database
        │
        ▼
Data Cleaning & Validation
        │
        ▼
Data Transformation
        │
        ▼
Exploratory Analysis
        │
        ▼
Revenue Analysis
        │
        ▼
Customer Segmentation
        │
        ▼
Customer Lifetime Value Analysis (NTILE)
        │
        ▼
Retention Priority Ranking (ROW_NUMBER)
        │
        ▼
Rule-Based Customer Risk Scoring
        │
        ▼
Strategic Business Recommendations
```

Each stage builds on the previous one, creating a complete analytics workflow rather than a collection of independent SQL queries.

---
# Key Business Insights

## 1. Overall Customer Churn

The dataset contains **7,043 customers**, of which **1,869 customers (26.54%)** have churned.

| Customer Status | Count |
|-----------------|------:|
| Active Customers | 5,174 |
| Churned Customers | 1,869 |

### Business Insight

Approximately **one in every four customers leaves the company**, indicating that customer retention is a significant business challenge rather than isolated customer behaviour.

This level of churn can substantially increase customer acquisition costs and reduce long-term profitability if proactive retention strategies are not implemented.

---

## 2. Revenue Analysis

| Metric | Churned Customers | Retained Customers |
|---------|------------------:|-------------------:|
| Average Monthly Revenue | **$74.44** | $61.27 |
| Average Lifetime Revenue | $1,531.80 | **$2,555.34** |

### Business Insight

Although churned customers generate **21.5% higher monthly revenue**, they leave much earlier, resulting in significantly lower lifetime value.

This suggests that increasing customer retention delivers greater long-term profitability than increasing monthly pricing.

> **Business Perspective:** Losing premium-paying customers early has a larger financial impact than losing low-value customers.

---

## 3. Customer Segmentation

| Customer Segment | Churn Rate |
|------------------|-----------:|
| Senior Citizens | **41.68%** |
| Non-Senior Customers | 23.61% |
| Customers without Partner | 32.96% |
| Customers with Partner | 19.66% |
| Customers without Dependents | 31.28% |
| Customers with Dependents | 15.45% |

### Business Insight

Customer demographics influence churn behaviour.

Senior citizens experience the highest churn rate, while customers with partners and dependents demonstrate substantially stronger retention.

These findings suggest that retention strategies should be personalised rather than applied uniformly across the customer base.

---

## 4. Contract Analysis

| Contract Type | Churn Rate |
|---------------|-----------:|
| Month-to-Month | **42.71%** |
| One-Year Contract | 11.27% |
| Two-Year Contract | **2.83%** |

### Business Insight

Contract duration is the strongest predictor of customer retention identified in this analysis.

Customers on month-to-month contracts churn nearly **15 times more frequently** than customers on two-year contracts.

Rather than spending retention budgets equally across all customers, organisations should prioritise month-to-month subscribers, where interventions are most likely to generate measurable business value.

---

## 5. Service Analysis

| Service Factor | Churn Rate |
|----------------|-----------:|
| Fiber Optic Internet | **41.89%** |
| No Online Security | **41.77%** |
| No Tech Support | **41.64%** |

### Business Insight

Customers using Fiber Optic Internet experience the highest churn despite paying higher monthly charges.

Similarly, customers without Online Security and Tech Support are considerably more likely to leave.

This suggests that service quality, customer support, and value-added services play a critical role in customer retention beyond pricing alone.

---

## 6. Customer Lifetime Value Analysis

Customers were segmented into four lifetime value groups using SQL Window Functions (`NTILE()`).

| Customer Value Quartile | Average Lifetime Revenue |
|-------------------------|-------------------------:|
| Q1 (Highest Value) | **$5,719.28** |
| Q2 | $2,399.58 |
| Q3 | $861.38 |
| Q4 (Lowest Value) | $152.97 |

### Business Insight

The highest-value customers generate approximately **37× more lifetime revenue** than the lowest-value segment.

This demonstrates that treating every customer equally is financially inefficient.

Retention investments should instead prioritise customers with the greatest long-term business value.

---

## 7. Customer Risk Classification

A SQL rule-based scoring framework classified customers according to their churn risk.

| Risk Level | Customers |
|------------|----------:|
| 🔴 High Risk | 599 |
| 🟠 Medium Risk | 1,098 |
| 🟢 Low Risk | 3,477 |

### High-Risk Customer Profile

High-risk customers commonly exhibit the following characteristics:

- Month-to-Month Contract
- Fiber Optic Internet
- No Online Security
- No Tech Support

### Business Insight

Rather than asking customer service teams to contact every customer, organisations can prioritise outreach towards the **599 highest-risk customers**, improving the efficiency of retention campaigns while reducing operational costs.

---

# Strategic Business Recommendations

| Recommendation | Business Justification |
|----------------|------------------------|
| **Convert Month-to-Month Customers to Long-Term Contracts** | Month-to-month customers churn **15×** more than customers on two-year contracts (42.71% vs. 2.83%). Prioritising contract upgrades can significantly improve customer retention. |
| **Improve Fiber Optic Customer Experience** | Fiber Optic customers have the highest churn rate (**41.89%**) despite paying higher monthly charges, indicating potential service quality or pricing issues. |
| **Promote Value-Added Services** | Customers without Online Security (**41.77%**) or Tech Support (**41.64%**) churn considerably more, making these services strong retention opportunities. |
| **Prioritise High-Value Customers** | The highest-value customer segment generates **37×** more lifetime revenue than the lowest segment. Retention budgets should focus on customers with the greatest business value. |
| **Deploy Risk-Based Retention Campaigns** | The SQL risk model identifies **599 High-Risk customers**, enabling customer success teams to prioritise outreach where it is likely to have the greatest impact. |
| **Strengthen Early Customer Engagement** | Churned customers generate higher monthly revenue but lower lifetime revenue, indicating that improving retention during the early customer lifecycle can maximise long-term profitability. |

---

---

# Technology Stack

| Category | Technologies |
|----------|--------------|
| Database | MySQL 8 |
| Language | SQL, Python |
| Python Libraries | pandas, SQLAlchemy, PyMySQL |
| SQL Concepts | Data Cleaning, Dynamic SQL, Aggregate Functions, CASE Statements, CTEs, Window Functions (`NTILE`, `ROW_NUMBER`), INFORMATION_SCHEMA |

---

# Repository Structure

```text
customer-retention-analytics-sql/
│
├── README.md
├── LICENSE
├── requirements.txt
├── .gitignore
│
├── data/
│   └── telco_table.csv
│
├── reports/
│   └── 09_business_recommendations.md
│
├── scripts/
│   └── import_dataset.py
│
├── sql/
│   ├── 00_data_cleaning.sql
│   ├── 01_data_transformation.sql
│   ├── 02_exploratory_analysis.sql
│   ├── 03_revenue_analysis.sql
│   ├── 04_customer_segmentation.sql
│   ├── 05_service_analysis.sql
│   ├── 06_customer_value_analysis.sql
│   ├── 07_retention_priority.sql
│   └── 08_customer_risk_score.sql
│
└── screenshots/
    ├── 00_data_validation/
    ├── 01_exploratory_analysis/
    ├── 02_revenue_analysis/
    ├── 03_customer_segmentation/
    ├── 04_service_analysis/
    ├── 05_customer_value_analysis/
    ├── 06_retention_priority/
    └── 07_customer_risk_score/
```

> **All SQL queries are available in the `sql/` directory, while query outputs and analysis results are provided in the `screenshots/` folder.**

---

# Getting Started

### Prerequisites

- MySQL 8+
- Python 3.x

### 1. Install Dependencies

```bash
pip install -r requirements.txt
```

### 2. Create the Database

```sql
CREATE DATABASE telco_db;
```

### 3. Import the Dataset

Update the database credentials and dataset path in:

```text
scripts/import_dataset.py
```

Run:

```bash
python scripts/import_dataset.py
```

### 4. Execute the SQL Pipeline

Run the SQL scripts in the following order:

```text
00_data_cleaning.sql
01_data_transformation.sql
02_exploratory_analysis.sql
03_revenue_analysis.sql
04_customer_segmentation.sql
05_service_analysis.sql
06_customer_value_analysis.sql
07_retention_priority.sql
08_customer_risk_score.sql
```

---

# Project Highlights

This project demonstrates how SQL can be used to solve a complete business problem rather than simply retrieve data.

Key capabilities demonstrated include:

- Transforming raw customer data into an analytics-ready dataset.
- Performing exploratory and revenue analysis using SQL.
- Identifying customer churn drivers through business-focused segmentation.
- Using SQL Window Functions (`NTILE`, `ROW_NUMBER`) for customer value analysis and retention prioritisation.
- Building a rule-based customer risk scoring framework using CTEs and `CASE` expressions.
- Translating analytical findings into strategic, data-driven business recommendations.

---

# Future Enhancements

Potential areas for extending this project include:

- Integrate the SQL pipeline with an interactive Power BI dashboard for business users and executive reporting.
- Apply predictive machine learning models to estimate customer churn probability and compare their performance with the current rule-based risk scoring approach.
- Incorporate additional customer behavioural data (such as support interactions or product usage) to further refine customer segmentation and risk assessment.
- Evaluate the effectiveness of retention strategies by analysing customer outcomes after targeted retention campaigns.
---
