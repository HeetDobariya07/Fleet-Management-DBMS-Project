create database fleet_management;
use fleet_management;

CREATE TABLE Vehicle (
    vehicle_id INT PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    VIN VARCHAR(17) UNIQUE NOT NULL,
    registration_number VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Driver (
    driver_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    license_number VARCHAR(20) UNIQUE NOT NULL,
    contact_number VARCHAR(20) NOT NULL
);

CREATE TABLE MaintenanceTask (
    task_id INT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    task_description VARCHAR(200) NOT NULL,
    due_date DATE NOT NULL,
    completion_date DATE,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id)
);

CREATE TABLE Trip (
    trip_id INT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    driver_id INT NOT NULL,
    start_location VARCHAR(100) NOT NULL,
    end_location VARCHAR(100) NOT NULL,
    distance DECIMAL(10, 2) NOT NULL,
    fuel_consumption DECIMAL(10, 2) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id),
    FOREIGN KEY (driver_id) REFERENCES Driver(driver_id)
);

INSERT INTO Vehicle VALUES (1, 'Toyota', 'Camry', 2022, '1HGCM82633A004352', 'ABC123');
INSERT INTO Vehicle VALUES (2, 'Honda', 'Civic', 2020, 'JHMEH61600S215688', 'XYZ456');
INSERT INTO Vehicle VALUES (3, 'Ford', 'F-150', 2019, '1FTEW1EP9KFA25866', 'DEF789');
INSERT INTO Vehicle VALUES (4, 'Chevrolet', 'Tahoe', 2021, '1GNSKBKC0KR105746', 'GHI987');
INSERT INTO Vehicle VALUES (5, 'Nissan', 'Altima', 2018, '1N4AL3AP9JC167719', 'JKL654');

INSERT INTO Driver VALUES (1, 'John Doe', '123456', '9876543210');
INSERT INTO Driver VALUES (2, 'Jane Smith', '654321', '1234567890');
INSERT INTO Driver VALUES (3, 'David Johnson', '789012', '2345678901');
INSERT INTO Driver VALUES (4, 'Emily Davis', '890123', '3456789012');
INSERT INTO Driver VALUES (5, 'Michael Brown', '901234', '4567890123');
INSERT INTO Driver VALUES (6, 'Mukesh', '901553', '456545523');

INSERT INTO MaintenanceTask VALUES (1, 1, 'Oil Change', '2024-03-20', NULL);
INSERT INTO MaintenanceTask VALUES (2, 2, 'Tire Rotation', '2024-03-22', NULL);
INSERT INTO MaintenanceTask VALUES (3, 3, 'Brake Inspection', '2024-03-25', NULL);
INSERT INTO MaintenanceTask VALUES (4, 4, 'Oil Change', '2024-03-28', NULL);
INSERT INTO MaintenanceTask VALUES (5, 5, 'Fluid Check', '2024-03-30', NULL);

INSERT INTO Trip VALUES (1, 1, 1, 'City A', 'City B', 100.5, 10.2, '2024-03-14 09:00:00', '2024-03-14 12:00:00');
INSERT INTO Trip VALUES (2, 2, 2, 'City C', 'City D', 120.8, 9.8, '2024-03-15 10:00:00', '2024-03-15 13:00:00');
INSERT INTO Trip VALUES (3, 3, 3, 'City E', 'City F', 80.3, 12.5, '2024-03-16 11:00:00', '2024-03-16 14:00:00');
INSERT INTO Trip VALUES (4, 4, 4, 'City G', 'City H', 150.2, 11.2, '2024-03-17 12:00:00', '2024-03-17 15:00:00');
INSERT INTO Trip VALUES (5, 5, 5, 'City I', 'City J', 200.5, 10.0, '2024-03-18 13:00:00', '2024-03-18 16:00:00');

