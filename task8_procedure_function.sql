-- Create Employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name TEXT NOT NULL,
    salary DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO employees VALUES 
(1, 'Alice', 45000),
(2, 'Bob', 60000),
(3, 'Charlie', 52000);

-- Stored Procedure: Increase salary by % for a given employee
DELIMITER //
CREATE PROCEDURE IncreaseSalary(IN emp INT, IN percent DECIMAL(5,2))
BEGIN
    UPDATE employees
    SET salary = salary + (salary * percent / 100)
    WHERE emp_id = emp;
END;
//
DELIMITER ;

-- Function: Calculate tax based on salary
DELIMITER //
CREATE FUNCTION CalculateTax(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE tax DECIMAL(10,2);
    IF salary <= 50000 THEN
        SET tax = salary * 0.05;
    ELSE
        SET tax = salary * 0.1;
    END IF;
    RETURN tax;
END;
//
DELIMITER ;

-- Example usage:
-- CALL IncreaseSalary(1, 10);  -- Increases Alice’s salary by 10%
-- SELECT name, salary, CalculateTax(salary) AS tax FROM employees;
