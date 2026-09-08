# AI Resume Web Application — Phase 2 Handoff

**Current phase:** Phase 2 — Registration + Login + Session + Role redirection (CODE COMPLETE, NOT RUN)
**Next phase:** Phase 3 — Admin Panel (**do not start until the owner asks**)

## IMPORTANT before testing
The `ApplicationDatabase.mdf` shipped in the Phase 1 zip still has the OLD schema
(it contains TargetJobTitle / PrimarySkills etc. and no CareerProfile table).
Run `App_Data/AIResume_Database.sql` against the local database first
(Visual Studio: Server Explorer > Data Connections > ApplicationDatabase.mdf > New Query > paste > Execute).
Without this, Register and Login will throw SQL errors (invalid column names).

## Completed work
**Registration** (`Register.aspx`, `.cs`, `.designer.cs`)
- Form now collects only: Full Name, Email, Password, Confirm Password (+ the existing Terms checkbox, UI only).
- Removed controls for old columns: Gender, Country, DOB, Phone, CityState, Languages, TargetJobTitle,
  Career Domain (ddlRole), ExperienceLevel, Industry, PrimarySkills, JobSearchStatus, LinkedIn, Portfolio
  (aspx + designer cleaned; the whole "AI Resume Personalization Profile" section was removed).
- Code-behind: confirm-password check in C# -> duplicate email check (select) -> insert
  `Users(FullName,Email,Password,Role,CreatedAt)` with Role `'User'` hard-coded and `GETDATE()` for CreatedAt
  -> `Response.Redirect("Login.aspx")`.
- Duplicate email / password mismatch show a message in the existing `lblError`.
- GridView1 (list of registered users, existing feature) trimmed to Id, Full Name, Email, Role, Created At.
  The Password column was removed from the grid and the SELECT lists columns explicitly (no `select *`).
  `fillgrid()` now runs only on first load (`!IsPostBack`) and connections are closed.

**Login** (`Login.aspx.cs`; markup unchanged)
- Query: `select Id, FullName, Email, Role from Users where Email='..' and Password='..'`
- Sets `Session["userId"]`, `Session["userName"]`, `Session["role"]`
  (`Session["userEmail"]` was already set by the old code; kept, harmless, not used anywhere).
- Role "Admin" -> `AdminPanel.aspx`; anything else -> `Dashboard.aspx`.
- Failed login shows "Invalid email or password combination." in `lblError`.

## Files
- Changed: `Register.aspx`, `Register.aspx.cs`, `Register.aspx.designer.cs`, `Login.aspx.cs`
- Created: this handoff file
- Deleted: none
- Database changes: none (Phase 1 script not modified)
- Not touched: Website.Master, ResumeTemplateBase.cs, ResumeBuilder, Dashboard, any other page

## Tests
Nothing could be executed in the authoring environment (no .NET compiler, no SQL Server/LocalDB).
Code was reviewed statically; control IDs in aspx / designer / code-behind were cross-checked.
**Manual test script (run on Windows + Visual Studio after applying the SQL script):**
1. admin@resumeai.com / admin123 -> goes to AdminPanel.aspx (404 until Phase 3 — expected). Session role = Admin.
2. demo@resumeai.com / demo123 -> Dashboard.aspx. Session role = User.
3. Register Test Student / teststudent@example.com / test123 -> redirected to Login; row has Role=User, CreatedAt set.
4. Register the same email again -> message, no 2nd row.
5. Wrong password -> error message, stays on Login.

## Known issues / notes for the next agent
- `AdminPanel.aspx` does not exist yet. Admin login redirects to a 404 until Phase 3 creates it.
- Existing private pages (Dashboard, CareerProfile, etc.) only check `Session["userId"]`; no role checks yet (Phase 3/4 job).
  An Admin who opens Dashboard.aspx directly is currently allowed.
- SQL is string-concatenated (faculty style, as instructed) => SQL injection possible, and a `'` in a name/email/password
  breaks the query. Passwords are stored in plain text (matches Phase 1 sample data).
- Register page still publicly lists all users (Id/Name/Email/Role/CreatedAt). Consider removing it later.
- `AppPageBase.cs` shows as deleted in `git status` (done before Phase 2). Pages inherit `System.Web.UI.Page` directly.
- Nothing is committed to git; changes are in the working tree.

## Next phase
Phase 3 — Admin Panel (create `AdminPanel.aspx`, guard with `Session["role"] == "Admin"`). Do NOT start Phase 3 without instruction.
