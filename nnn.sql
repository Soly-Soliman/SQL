

CREATE TABLE EmployeeData (
    ID BIGINT PRIMARY KEY,                  -- Unique identifier for the employee
    Username NVARCHAR(100),                -- Username or domain account (e.g., adventure-works\ken0)
    JobTitle NVARCHAR(100),                -- Job title (e.g., Chief Executive Officer)
    DateOfBirth DATE,                      -- Date of birth
    Gender CHAR(1),                        -- Gender (e.g., 'S')
    MaritalStatus CHAR(1),                 -- Marital status (e.g., 'M' for married)
    HireDate DATE,                         -- Date of hire
    EmployeeLevel INT,                     -- Employee level or rank
    DepartmentCode INT,                    -- Department code or ID
    LocationCode INT,                      -- Location or office code
    EmploymentType INT,                    -- Employment type (e.g., full-time/part-time indicator)
    GUID UNIQUEIDENTIFIER,                 -- Unique global identifier for the employee
    TerminationDate DATE,                  -- Date of termination or end of employment
    PlaceholderColumn14 NVARCHAR(100),    -- Placeholder for missing column 14 (update as needed)
    PlaceholderColumn15 NVARCHAR(100)     -- Placeholder for missing column 15 (update as needed)
);
