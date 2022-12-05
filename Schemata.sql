DROP TABLE Employees  CASCADE CONSTRAINTS ;
DROP TABLE Departments  CASCADE CONSTRAINTS ;
DROP TABLE Dept_Emp  CASCADE CONSTRAINTS ;
DROP TABLE Salaries  CASCADE CONSTRAINTS ;
DROP TABLE Dept_Manager  CASCADE CONSTRAINTS ;
DROP TABLE Titles  CASCADE CONSTRAINTS ;


CREATE TABLE Employees (
     emp_no  VARCHAR2(100)  NOT NULL,
     emp_title_id VARCHAR2(100) NOT NULL,
     birth_date DATE   NOT NULL,
     first_name VARCHAR2(100)   NOT NULL,
     last_name VARCHAR2(100),
     sex  VARCHAR2(100),
     hire_date DATE,
    CONSTRAINT pk_Employees PRIMARY KEY (emp_no));

CREATE TABLE Departments (
    dept_no VARCHAR2(100)   NOT NULL,
    dept_name VARCHAR2(100)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (dept_no));

CREATE TABLE Dept_Emp (
    emp_no VARCHAR2(100)   NOT NULL,
    dept_no VARCHAR2(100)   NOT NULL);

CREATE TABLE Dept_Manager (
    dept_no VARCHAR2(100)   NOT NULL,
    emp_no VARCHAR2(100)   NOT NULL);

CREATE TABLE Salaries (
    emp_no VARCHAR2(100)   NOT NULL,
    salary INT   NOT NULL);

CREATE TABLE Titles (
    title_id VARCHAR2(100)   NOT NULL,
    tile VARCHAR2(100)   NOT NULL);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

--ALTER TABLE Titles ADD CONSTRAINT fk_Tiles_title_id FOREIGN KEY(title_id)
--REFERENCES Employees (emp_title_id);

