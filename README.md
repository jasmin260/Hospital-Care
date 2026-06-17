# # Hospital Discharge Analysis Using SQL

## Project Overview

This project analyzes patient admission and discharge data from a tertiary-care cardiac hospital to identify discharge patterns, patient demographics, and hospital utilization trends. The analysis was performed using SQL and focuses on key operational metrics that support hospital management in monitoring patient flow and resource utilization.

The dataset contains admission records collected between **1 April 2017 and 31 March 2019** from a cardiac care unit with over **14,800 admissions** and **12,200+ unique patients**. The data includes patient demographics, admission and discharge details, medical history, laboratory parameters, and clinical conditions.

## Business Problem

As a Data Analyst at **AutoCare Hospital** (fictional organization), I was tasked with analyzing discharge-related metrics to help stakeholders understand patient turnover, length of stay, and demographic discharge patterns.

## Key Objectives

* Calculate Total Discharges
* Measure Average Daily Discharge Rate
* Calculate Average Length of Stay (ALOS)
* Analyze Distribution of Discharges by Age Group
* Analyze Distribution of Discharges by Gender
* Analyze Distribution of Discharges by Day of Week
* Identify trends that can support operational planning and hospital resource allocation

## Dataset Information

The dataset contains:

* Patient ID and admission details
* Admission Date and Discharge Date
* Age and Gender
* Locality (Urban/Rural)
* Admission Type (Emergency/Outpatient)
* Medical History (Diabetes, Hypertension, Coronary Artery Disease, Chronic Kidney Disease, etc.)
* Laboratory Parameters (Hemoglobin, Glucose, Creatinine, BNP, Ejection Fraction, etc.)
* Clinical Conditions and Comorbidities

## SQL Techniques Used

* Common Table Expressions (CTEs)
* Aggregate Functions (COUNT, SUM, AVG)
* CASE Statements
* GROUP BY and HAVING Clauses
* Window Functions (ROW_NUMBER)
* Data Cleaning and Deduplication
* Date Functions
* Subqueries
* Sorting and Ranking

## Analysis Performed

### Data Preparation

* Cleaned and standardized patient records
* Removed duplicate admissions using ROW_NUMBER()
* Created SQL Views for reusable reporting datasets
* Handled missing and invalid date values

### KPI Analysis

* Total number of discharged patients
* Average Daily Discharge Rate
* Average Length of Stay (ALOS)

### Demographic Analysis

* Discharge distribution across different age groups
* Gender-wise discharge analysis
* Weekday-wise discharge trends

## Key Insights

* Identified discharge patterns across weekdays.
* Evaluated patient stay duration and discharge efficiency.
* Analyzed demographic trends influencing discharge volume.
* Generated operational metrics that can support hospital capacity planning and performance monitoring.

## Tools & Technologies

* MySQL / SQL
* SQL Views
* CTEs
* Window Functions
* Data Cleaning & Transformation

## Skills Demonstrated

SQL | Data Cleaning | Data Analysis | Healthcare Analytics | KPI Reporting | Business Intelligence | Data Transformation | Problem Solving
