-- Run Second
TRUNCATE TABLE acct_bal;
TRUNCATE TABLE acct_bene;
TRUNCATE TABLE acct_branch;
TRUNCATE TABLE acct_contact;
TRUNCATE TABLE acct_holders;
TRUNCATE TABLE acct_jurisdiction;
TRUNCATE TABLE acct_limit;
TRUNCATE TABLE acct_mobile;
TRUNCATE TABLE acct_pass;
TRUNCATE TABLE acct_poa;
TRUNCATE TABLE acct_trade;
DELETE FROM acct_transaction;

TRUNCATE TABLE cust_contact;
TRUNCATE TABLE cust_emp;
TRUNCATE TABLE cust_id;
TRUNCATE TABLE cust_privacy;
TRUNCATE TABLE cust_tax;

TRUNCATE TABLE emp_contact;
TRUNCATE TABLE emp_pass;
TRUNCATE TABLE emp_position;
DELETE FROM emp_rep_id;
TRUNCATE TABLE emp_salary;
TRUNCATE TABLE emp_tax;
TRUNCATE TABLE emp_termination;

DELETE FROM acct_info;
DBCC CHECKIDENT ('acct_info', RESEED, 0);
DELETE FROM cust_info;
DBCC CHECKIDENT ('cust_info', RESEED, 0);
DELETE FROM emp_info;
DBCC CHECKIDENT ('emp_info', RESEED, 0);    