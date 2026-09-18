# Phase 3 — Admin Panel Faculty Report

## Purpose

Created an Admin Panel where an administrator can view, add, edit and delete records from the `Users` table.

## Important Design Choice

The GridView does **not** use built-in inline editing. `ShowEditButton="True"`, `RowEditing`, `RowUpdating`, `RowCancelingEdit`, edit templates and `FindControl()` casts were removed.

Instead, the GridView uses simple custom commands through `RowCommand`. Clicking **Edit** loads the selected user's data into the form at the top of the page and changes the button from **Add User** to **Update User**.

This matches the simple faculty reference pattern where an ID is stored in ViewState, `filldata()` loads the selected record, and the same button handles Insert/Update depending on its text.

## Files Changed

### `AdminPanel.aspx`

- Kept the existing Admin Panel design.
- Kept the Add User form at the top.
- Changed the Users GridView to use `ButtonField` commands:
  - `cmd_edit`
  - `cmd_delete`
- Removed `ShowEditButton="True"`.
- Removed `EditItemTemplate` controls.
- Removed GridView edit/update/cancel event wiring.
- Password is not displayed in the Users GridView.

### `AdminPanel.aspx.cs`

- `btnAdd_Click()` now performs both Add and Update.
- `GridView1_RowCommand()` handles Edit and Delete.
- `filldata()` loads the selected user into the top form.
- `clear()` resets the form and changes the button back to `Add User`.
- `ViewState["Id"]` stores the selected user's ID while editing.
- Password is left blank while editing, so the existing password is not displayed.
- Password validation is required when adding a user but disabled while updating a user.
- Removed `RowUpdating`, `RowCancelingEdit`, `RowDataBound`, `FindControl()` and explicit `LinkButton` casting.

## How Edit Works

1. Admin clicks **Edit** in the GridView.
2. `GridView1_RowCommand()` receives `cmd_edit`.
3. The selected row index comes from `e.CommandArgument`.
4. The actual user ID is obtained from `GridView1.DataKeys`.
5. The ID is stored in `ViewState["Id"]`.
6. The button changes to `Update User`.
7. `filldata()` loads Full Name, Email and Role into the form.
8. Admin changes the values and clicks `Update User`.
9. `btnAdd_Click()` executes the SQL `UPDATE`.
10. The GridView reloads and the form is cleared.

## How Delete Works

1. Admin clicks **Delete**.
2. `GridView1_RowCommand()` receives `cmd_delete`.
3. The user ID is obtained from the GridView `DataKeys`.
4. The SQL `DELETE` is executed.
5. Because Phase 1 uses `ON DELETE CASCADE`, related CareerProfile, Skills, Education and Experience records are also deleted.

The logged-in Admin cannot delete their own account.

## Faculty Explanation

If my faculty asks what I changed in Phase 3, I can say:

> I created an Admin Panel using ASP.NET Web Forms. I used Session role checking so only Admin users can access it. I displayed the Users table using a GridView. Instead of using GridView's built-in inline editing, I used RowCommand for Edit and Delete. When Edit is clicked, I store the selected user ID in ViewState, load the user's data into the form, and change the button from Add User to Update User. The same button then performs the UPDATE operation. Delete is also handled through RowCommand.

## File → Change → Why

| File | Change | Why |
|---|---|---|
| `AdminPanel.aspx` | GridView now uses custom `cmd_edit` and `cmd_delete` commands | Keeps the GridView simple and avoids inline Update/Cancel buttons |
| `AdminPanel.aspx.cs` | Added `GridView1_RowCommand` | Handles Edit/Delete in the faculty-style command pattern |
| `AdminPanel.aspx.cs` | Added `filldata()` | Loads the selected user's values into the top form |
| `AdminPanel.aspx.cs` | `btnAdd_Click()` handles Add/Update | Same simple button pattern as the faculty reference |
| `AdminPanel.aspx.cs` | Removed `RowUpdating`, `RowCancelingEdit`, `RowDataBound` and `FindControl()` | Those were unnecessary for the selected UI |
| `AdminPanel.aspx.cs` | Removed `LinkButton` casting | Avoids the class-casting code the faculty does not want |

## Next Phase

**Phase 4 — User Career Profile**

Do not start Phase 4 until Phase 3 is tested successfully.
