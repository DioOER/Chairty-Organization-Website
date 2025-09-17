CREATE DATABASE OCharityDB;
USE OCharityDB;

CREATE TABLE Donor (
    donor_id INT PRIMARY KEY,
    donor_type VARCHAR(20) NOT NULL,
    donor_name VARCHAR(120) NOT NULL,
    donor_email VARCHAR(150) UNIQUE NOT NULL,
    donor_phone VARCHAR(20)
);

CREATE TABLE Donation (
    donation_id INT PRIMARY KEY,
    donor_id INT NOT NULL,
    campaign_id INT NOT NULL,
    donation_amount DECIMAL(12,2) NOT NULL,
    donation_date DATE NOT NULL,
    FOREIGN KEY (donor_id) REFERENCES Donor(donor_id)
);

CREATE TABLE CharityOrganization (
    org_id INT PRIMARY KEY,
    org_name VARCHAR(150) NOT NULL,
    org_mission TEXT,
    org_contact_info VARCHAR(200),
    org_founded_year YEAR
);

CREATE TABLE Campaign (
    campaign_id INT PRIMARY KEY,
    org_id INT NOT NULL,
    campaign_title VARCHAR(150) NOT NULL,
    campaign_goal_amount DECIMAL(12,2) NOT NULL,
    campaign_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (org_id) REFERENCES CharityOrganization(org_id)
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(120) NOT NULL,
    staff_role VARCHAR(20) NOT NULL,
    staff_email VARCHAR(150) UNIQUE NOT NULL,
    staff_password VARCHAR(255) NOT NULL
);

CREATE TABLE Beneficiary (
    beneficiary_id INT PRIMARY KEY,
    beneficiary_name VARCHAR(150) NOT NULL,
    beneficiary_type VARCHAR(20) NOT NULL,
    beneficiary_notes TEXT,
    campaign_id INT NOT NULL,
    FOREIGN KEY (campaign_id) REFERENCES Campaign(campaign_id)
);
INSERT INTO Donor (donor_id, donor_type, donor_name, donor_email, donor_phone)
VALUES 
(1, 'Individual', 'Carlos Ramirez', 'carlos.ramirez@example.com', '555-1010'),
(2, 'Company', 'Bright Future LLC', 'donations@brightfuture.com', '555-2020'),
(3, 'Individual', 'Emily Davis', 'emily.davis@example.com', '555-3030');

INSERT INTO CharityOrganization (org_id, org_name, org_mission, org_contact_info, org_founded_year)
VALUES 
(1, 'Unidos por Todos', 'Providing community health and education support', 'contact@unidos.org', 2012);

INSERT INTO Campaign (campaign_id, org_id, campaign_title, campaign_goal_amount, campaign_status)
VALUES 
(1, 1, 'Food for Families', 8000.00, 'active'),
(2, 1, 'Back to School Drive', 6000.00, 'active');

INSERT INTO Donation (donation_id, donor_id, campaign_id, donation_amount, donation_date)
VALUES 
(1, 1, 1, 120.00, '2025-09-05'),
(2, 2, 1, 1500.00, '2025-09-06'),
(3, 3, 2, 75.00, '2025-09-07');

INSERT INTO Staff (staff_id, staff_name, staff_role, staff_email, staff_password)
VALUES 
(1, 'Maria Gonzalez', 'Admin', 'maria.gonzalez@unidos.org', 'pass123'),
(2, 'David Thompson', 'Coordinator', 'david.thompson@unidos.org', 'secure456');

INSERT INTO Beneficiary (beneficiary_id, beneficiary_name, beneficiary_type, beneficiary_notes, campaign_id)
VALUES 
(1, 'San Pedro Community', 'group', 'Local families receiving food assistance', 1),
(2, 'Roosevelt Elementary Students', 'group', 'Children receiving school supplies', 2);
