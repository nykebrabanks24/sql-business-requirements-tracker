DROP DATABASE IF EXISTS ba_requirements;
CREATE DATABASE ba_requirements;
USE ba_requirements;

CREATE TABLE Stakeholders (
    stakeholder_id INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    contact_email VARCHAR(100)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    start_date DATE,
    end_date DATE
);

CREATE TABLE Requirements (
    requirement_id INT PRIMARY KEY,
    project_id INT,
    stakeholder_id INT,
    description TEXT,
    status VARCHAR(20),
    created_on DATE,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (stakeholder_id) REFERENCES Stakeholders(stakeholder_id)
);

CREATE TABLE UserStories (
    story_id INT PRIMARY KEY,
    requirement_id INT,
    title VARCHAR(100),
    acceptance_criteria TEXT,
    status VARCHAR(20),
    FOREIGN KEY (requirement_id) REFERENCES Requirements(requirement_id)
);

CREATE TABLE Issues (
    issue_id INT PRIMARY KEY,
    story_id INT,
    reported_by VARCHAR(100),
    description TEXT,
    status VARCHAR(20),
    created_on DATE,
    FOREIGN KEY (story_id) REFERENCES UserStories(story_id)
);




INSERT INTO Stakeholders VALUES 
(1, 'Jane Doe', 'Product Owner', 'jane.doe@email.com');

INSERT INTO Projects VALUES 
(1, 'HR System Upgrade', 'Modernizing the HR software platform', '2024-01-10', '2024-06-30');

INSERT INTO Requirements VALUES 
(1, 1, 1, 'HR must be able to upload employee documents securely', 'In Progress', '2024-01-15');

INSERT INTO UserStories VALUES 
(1, 1, 'Upload PDF securely', 'Given an HR staff member, when they upload a PDF, it must be encrypted and stored securely.', 'Open');

INSERT INTO Issues VALUES 
(1, 1, 'QA Team', 'PDF upload fails when file size >5MB', 'Open', '2024-03-01');

SELECT R.requirement_id, P.name AS project_name, R.description, R.status
FROM Requirements R
JOIN Projects P ON R.project_id = P.project_id;

-- 2. Show all issues reported for each user story
SELECT U.title, I.description AS issue_description, I.status
FROM Issues I
JOIN UserStories U ON I.story_id = U.story_id;

-- 3. Requirements per stakeholder
SELECT S.name, COUNT(R.requirement_id) AS total_requirements
FROM Stakeholders S
JOIN Requirements R ON S.stakeholder_id = R.stakeholder_id
GROUP BY S.name;