--Run Third

-- Bulk insert account information 
BULK INSERT acct_info
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\acct_info.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2)

BULK INSERT acct_bal
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\acct_bal.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);	

BULK INSERT acct_bene
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\acct_bene.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);		

BULK INSERT acct_branch
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\acct_branch.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);

BULK INSERT acct_contact
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\acct_contact.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);	

BULK INSERT acct_holders
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\acct_holders.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);

BULK INSERT acct_holding
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\acct_holding.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);
	
BULK INSERT acct_jurisdiction
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\acct_jurisdiction.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);	

BULK INSERT acct_limit
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\acct_limit.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);

BULK INSERT acct_mobile
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\acct_mobile.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);

BULK INSERT acct_pass
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\acct_pass.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);	

BULK INSERT acct_poa
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\acct_poa.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);

-- Bulk insert customer information 
BULK INSERT cust_info
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\cust_info.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);	

BULK INSERT cust_contact
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\cust_contact.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);
    
BULK INSERT cust_emp
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\cust_emp.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);	

BULK INSERT cust_id
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\cust_id.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);	

BULK INSERT cust_privacy
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\cust_privacy.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);	

BULK INSERT cust_tax
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\cust_tax.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);	

-- Bulk insert employee information 
BULK INSERT emp_info
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\emp_info.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);

BULK INSERT emp_contact
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\emp_contact.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);

BULK INSERT emp_pass
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\emp_pass.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);

BULK INSERT emp_position
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\emp_position.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);
    
BULK INSERT emp_rep_id
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\emp_rep_id.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);
    
BULK INSERT emp_salary
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\emp_salary.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);
    
BULK INSERT emp_tax
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\emp_tax.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);

BULK INSERT emp_termination
FROM 'C:\Users\Juice\Documents\_Champlain College\9_Spring_2024\1_SDEV435_Applied_Software_Practice\Data_Gen_Project\CSV_Files\emp_termination.csv'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2);