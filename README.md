# SQL Portfolio

SQL projects demonstrating data extraction, transformation, and reporting using real-world, business-focused scenarios.

## Overview
This repository showcases SQL work focused on practical data analysis and reporting.

The projects reflect how SQL is used in a business environment to:
- Extract and combine data from multiple tables  
- Clean and transform datasets  
- Apply business logic to operational data  
- Prepare data for reporting and dashboards  

## Project Categories

### Data Extraction
Queries focused on retrieving and structuring data for reporting, including:
- Filtering and joining tables  
- Basic aggregations  
- Supporting day-to-day reporting needs  

### Data Maintenance
Scripts used to update and maintain data quality, including:
- Updating records based on specific conditions  
- Cleaning and standardising data  
- Supporting consistency across datasets  

### Reporting & Analysis
More advanced queries designed for reporting and analysis, including:
- Multi-table joins  
- Window functions (e.g. ROW_NUMBER)  
- Date formatting and transformation  
- Applying business logic to return meaningful outputs  

## Skills Demonstrated
- SQL joins (including LEFT JOINs)
- Aggregation and grouping
- Window functions
- Data cleaning and transformation
- CASE statements for business logic
- Structuring queries for reporting
- Working with relational datasets  

## About This Portfolio
These projects are based on realistic business scenarios, including CAFM system data (anonymised where required).

They demonstrate:
- Working with large, multi-table datasets  
- Applying business rules to operational data  
- Creating structured outputs for reporting tools such as Power BI  


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

### Task Resource and Lifecycle Analysis

**Overview**  
This query analyses the full lifecycle of tasks within a CAFM system, including timing, resource allocation, and completion data.

**Purpose**
- Track tasks from creation through to completion  
- Analyse task assignment and resource usage  
- Provide visibility into task timelines and performance  
- Support contract-level reporting and analysis  

**Key Features**
- Combines task, building, contract, and resource data  
- Tracks multiple lifecycle stages:
  - Logged date  
  - Start date  
  - Finish date  
  - Estimated due date  
- Identifies the most recent resource assigned to each task using window functions  
- Flags whether resources are internal or external  
- Uses parameterised filtering for contract-level analysis (anonymised)  

**Tables Used**
- F_TASKS  
- FLOCATE  
- F_CONTRACT_GROUP  
- SLA_TASK_PERFORMANCE  
- F_TASK_TIME  
- F_RESOURCE  

**Skills Demonstrated**
- SQL joins across multiple relational tables  
- Window functions (ROW_NUMBER for latest record selection)  
- Task lifecycle analysis  
- Date/time formatting and transformation  
- Resource allocation tracking  
- Parameterisation for reusable queries  

**File**
`Task_Resource_Analysis.sql`
