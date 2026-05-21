# SQL-Portfolio
SQL projects covering data cleaning, reporting, joins, window functions, and business-focused analysis.  
# SQL Data Projects Portfolio
## Overview
This repository contains a set of SQL projects I’ve built to improve and demonstrate my skills in working with data.
The focus is on writing practical SQL that can be used in real business scenarios, such as extracting data, updating records, and building reporting datasets.
---
## What’s Inside
The work is grouped into three main areas:
### Simple Extractions
These are straightforward SQL queries used to:
- Pull and filter data
- Join tables together
- Perform basic aggregations
They represent the kind of queries often used in day-to-day reporting.
---
### Update Scripts
These scripts focus on modifying and maintaining data, including:
- Updating records based on conditions
- Fixing or standardising data
- Ensuring data consistency
They reflect more operational database work.
---
### Reporting Extract (More Advanced Work)
This section contains a more complex SQL query that brings together multiple tables into a single dataset.
It includes:
- Multi-table joins
- Window functions (like ROW_NUMBER)
- Data formatting and transformation
- Logic to return the most relevant records
This reflects how data is prepared in real reporting or ETL-style processes.
---
## Skills Used
- SQL joins (including LEFT JOINs)
- Aggregation and grouping
- Window functions
- Data cleaning and transformation
- CASE statements for business logic
- Structuring queries for reporting use
---
## Purpose of This Work
This repository is part of my ongoing development toward data-focused roles.
It’s focused on:
- Improving SQL ability through real examples
- Practising how data is structured and transformed in business systems
- Building more confidence with reporting-style queries
---
## Current Focus
Right now I’m focusing on:
- Writing cleaner and more structured SQL
- Getting more comfortable with advanced query patterns
- Building more realistic, end-to-end examples of data work


## Projects

### Account Licence Management

**Overview**  
This query extracts account and licence information from a CAFM system to support user management and licence auditing.

**Purpose**
- Identify which users are assigned which licences  
- Monitor account statuses (locked / disabled)  
- Track account creation and modification details  

**Key Features**
- Joins account data with licence tables
- Converts system dates into readable format (DD/MM/YYYY)
- Flags account status:
  - Locked (Yes/No)
  - Disabled (Yes/No)
- Highlights account creation and modification ownership

**Tables Used**
- dbo.Accounts
- dbo.AccountsUserLicenceTypes
- dbo.UserLicenceTypes

**Skills Demonstrated**
- SQL joins (LEFT JOIN)
- Data transformation (date formatting)
- Conditional logic (CASE statements)
- Data presentation for reporting

**File**
`User_Licence.sql`

### Task Monitoring and SLA Analysis

**Overview**  
This query extracts task-level data from a CAFM system to support performance monitoring and SLA tracking across buildings and contracts.

**Purpose**
- Track task progress and status  
- Identify late or overdue tasks  
- Provide RAG (Red/Amber/Green) status for operational reporting  
- Support performance analysis across locations and buildings  

**Key Features**
- Combines task, building, location, and performance data  
- Formats date and time fields for reporting (DD/MM/YYYY HH:MM)  
- Calculates number of days since estimated due date  
- Applies RAG status logic:
  - **Red** = overdue  
  - **Amber** = due today  
  - **Green** = not yet due  
- Flags late tasks using conditional logic  

**Tables Used**
- F_TASKS  
- FLOCATE  
- FAREALO  
- F_CONTRACT  
- SLA_TASK_PERFORMANCE  

**Skills Demonstrated**
- SQL joins across multiple relational tables  
- Date/time handling and formatting  
- Business logic using CASE statements  
- KPI calculation (Days, RAG, Late flags)  
- Preparing structured outputs for reporting (Power BI / dashboards)  

**File**
`Task_SLA_Analysis.sql`

### Task Event Analysis

**Overview**  
This query extracts task and event-level data from a CAFM system to provide visibility into task history, event logging, and operational activity.

**Purpose**
- Track events linked to tasks (e.g. updates, comments, status changes)  
- Analyse PPM-related activity across tasks and event logs  
- Provide a full audit trail of task interactions for reporting and analysis  

**Key Features**
- Combines task, building, contract, and event data  
- Links task records with event history for deeper insight  
- Formats date and time fields for reporting (DD/MM/YYYY HH:MM)  
- Applies conditional filtering for:
  - PPM task types  
  - PPM-related caller sources  
- Uses parameterised filtering for region/building codes (anonymised)  

**Tables Used**
- F_TASKS  
- FLOCATE  
- F_BD_DETAILS  
- F_CONTRACT  
- F_EVENTS  
- FINFILE  

**Skills Demonstrated**
- SQL joins across multiple relational tables  
- Handling event-driven data and audit logs  
- Date/time formatting and transformation  
- Conditional filtering with AND/OR logic  
- Parameterisation for reusable queries  
- Structuring outputs for reporting (Power BI / operational dashboards)  

**File**
`Task_Event_Analysis.sql`
