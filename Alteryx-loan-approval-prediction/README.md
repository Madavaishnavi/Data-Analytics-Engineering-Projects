# Credit Risk Prediction – Alteryx Workflow

This project presents a complete Credit Risk Prediction workflow using **Alteryx Designer**. The goal of the challenge is to predict whether a loan applicant will be approved based on their financial and demographic profile.

 **Problem Statement**: The goal of this project is to build a complete data analytics and predictive modeling pipeline using Alteryx Designer. The task is to prepare real-world credit data from a Kaggle competition, engineer meaningful features, and apply a logistic regression model to predict whether a loan applicant is approved or not.

This solution highlights the use of Alteryx as a data science platform, showcasing its capabilities in:

- Data preparation (cleaning, filtering, transforming)

- Feature selection and outlier handling

- Model training and scoring

- Low-code machine learning workflow development

---

## Project Structure

```code
Alteryx-loan-approval-prediction/
├── Loan_approval_prediction.yxmd              # Main Alteryx workflow file
├── train.csv                           # Training dataset from Kaggle
├── test.csv                            # Test dataset from Kaggle
├── workflow-screenshot.png            # Screenshot of the Alteryx pipeline
└── README.md                           # Project documentation
```
## Overview
This project demonstrates:

- Data cleaning and preprocessing

- Feature engineering using percentile filters

- Data summarization and selection

- Binary classification using logistic regression

- A visual, drag-and-drop workflow created entirely in Alteryx

## Dataset Information

Source: [Kaggle Competition ](https://www.kaggle.com/competitions/playground-series-s4e10)




| **Column Name**           | **Description**                                      |
|---------------------------|------------------------------------------------------|
| `person_age`              | Applicant’s age                                      |
| `person_income`           | Yearly income                                        |
| `person_home_ownership`   | Type of home ownership                               |
| `person_emp_length`       | Employment length in years                           |
| `loan_intent`             | Reason for the loan (education, medical, etc.)       |
| `loan_amnt`               | Loan amount requested                                |
| `loan_int_rate`           | Interest rate (%)                                    |
| `loan_status`             |  **Target Variable** (1 = Approved, 0 = Denied)     |



## Workflow Components (Alteryx Designer)

The following tools were used in the .yxmd pipeline:

- Input Data: Reads train/test datasets

- Select & Filter: Drops irrelevant columns, filters rows

- Formula Tool: Applies percentile-based income filters

- Summarize: Aggregates applicant-level info

- Logistic Regression: Classifies approval outcome

- Browse & Output: Visualizes and exports predictions

## Tools & Technologies
- Platform: Alteryx Designer (x64)

- Model: Logistic Regression (binary classifier)

## Techniques:

- Outlier handling (income)

- Categorical encoding

- Data sampling and filtering


## Workflow Preview

![image](https://github.com/user-attachments/assets/d5dbd1c3-7eb0-4df0-8624-7249f44d577a)

