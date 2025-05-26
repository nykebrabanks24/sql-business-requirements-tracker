# Business Requirements Tracker (SQL Project)

This project simulates a simplified system a Business Analyst might use to track project requirements, user stories, stakeholder feedback, and reported issues.

## 📊 Tables
- **Stakeholders**: Key project decision-makers
- **Projects**: The business initiatives
- **Requirements**: Detailed business needs
- **UserStories**: Agile-aligned stories for development
- **Issues**: Bugs or feedback from testing

## 💻 Sample Business Questions
- What is the status of each requirement by project?
- Which stories have open issues?
- How many requirements does each stakeholder own?

## 📦 Tools Used
- MySQL Workbench
- GitHub
- Excel for reporting

## 📁 How to Run
1. Run `database_schema.sql` to create the structure.
2. Run `sample_data.sql` to populate tables.
3. Run `business_queries.sql` to extract business insights.

## 📁 Project Structure

```
sql-business-requirements-tracker/
├── SQL/
│   ├── database_schema.sql
│   ├── sample_data.sql
│   └── business_queries.sql
├── CSV/
│   ├── requirements_by_stakeholder.csv
│   ├── status_by_project.csv
│   └── open_issues_by_userstory.csv
├── PowerBI/
│   ├── powerbi_dashboard.pbix
│   └── dashboard_screenshot.png
└── README.md
```
