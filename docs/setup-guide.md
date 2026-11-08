# Local Setup & Installation Guide

## 1. System Requirements & Prerequisites

Before running the project locally, ensure your environment meets the following specifications:

* **Operating System**: Windows 10 / 11 (64-bit)
* **IDE**: [Visual Studio 2022](https://visualstudio.microsoft.com/) (Community, Professional, or Enterprise)
  * Required Workload: **ASP.NET and web development**
* **Runtime / Framework**: **.NET Framework 4.8.1 Developer Pack**
* **Database**: **Microsoft SQL Server Express / LocalDB** (included automatically with Visual Studio's Data Storage workload)

---

## 2. Quickstart Setup (One-Click)

The repository provides a self-bootstrapping script that restores dependencies and builds the solution automatically.

1. Open PowerShell or Command Prompt in the repository root:
   ```cmd
   cd d:\FORAI\CSharp_AIResumeWebApplication
   ```
2. Execute the setup script:
   ```cmd
   setup.bat
   ```
3. Open `AI-Resume WebApplication.sln` in Visual Studio 2022 and press **F5** (or **Ctrl + F5**) to launch the web application in IIS Express.

---

## 3. Manual Step-by-Step Setup

### Step 1: Open the Solution in Visual Studio
* Double-click `AI-Resume WebApplication.sln` to open the project.
* Visual Studio will detect project references and package configurations.

### Step 2: Restore NuGet Dependencies
* In Visual Studio, go to **Tools** &rarr; **NuGet Package Manager** &rarr; **Package Manager Console**.
* Run:
  ```powershell
  Update-Package -reinstall
  ```
  *(Or right-click the solution in Solution Explorer and select **Restore NuGet Packages**).*

### Step 3: Database Verification & Initialization
1. In Visual Studio, open **Server Explorer** (`View > Server Explorer` or `Ctrl + Alt + S`).
2. Expand **Data Connections**. If `ApplicationDatabase.mdf` is not listed:
   * Right-click **Data Connections** &rarr; **Add Connection...**
   * Data Source: **Microsoft SQL Server Database File (SqlClient)**
   * Database file name: Browse to `AI-Resume WebApplication\App_Data\ApplicationDatabase.mdf`
   * Click **Test Connection** &rarr; **OK**.
3. To re-seed the tables or reset demo data:
   * Open [`AI-Resume WebApplication/App_Data/AIResume_Database.sql`](../AI-Resume%20WebApplication/App_Data/AIResume_Database.sql) in Visual Studio.
   * Click the **Execute (Green Play)** button, selecting the active database connection.

---

## 4. Default Demonstration Accounts

The database comes pre-seeded with test accounts for evaluation:

| Role | Email Address | Password | Landing Page | Capabilities |
| :--- | :--- | :--- | :--- | :--- |
| **Administrator** | `admin@resumeai.com` | `admin123` | `AdminPanel.aspx` | Full user CRUD, role management |
| **Candidate** | `demo@resumeai.com` | `demo123` | `Dashboard.aspx` | Resume builder, ATS scan, PDF export |

---

## 5. Troubleshooting Common Issues

### Issue 1: "The imported project Microsoft.WebApplication.targets was not found"
* **Cause**: Missing Web Application workload or Visual Studio build tools targets.
* **Resolution**: Open Visual Studio Installer, ensure **ASP.NET and web development** is installed, and verify the conditional import in `.csproj`:
  ```xml
  <Import Project="$(VSToolsPath)\WebApplications\Microsoft.WebApplication.targets" Condition="'$(VSToolsPath)' != '' and Exists('$(VSToolsPath)\WebApplications\Microsoft.WebApplication.targets')" />
  ```

### Issue 2: LocalDB Connection Failure
* **Cause**: LocalDB service instance is stopped or corrupted.
* **Resolution**: Open Command Prompt and restart the local database instance:
  ```cmd
  sqllocaldb stop mssqllocaldb
  sqllocaldb start mssqllocaldb
  sqllocaldb info mssqllocaldb
  ```

### Issue 3: Stale Browser Styles in Resume Preview
* **Resolution**: The resume engine injects styles directly into the page via `<style>` tags to bypass browser caching. If other asset changes are not visible, perform a hard refresh using `Ctrl + F5`.
