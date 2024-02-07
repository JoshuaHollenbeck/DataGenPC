from datetime import datetime, timedelta
import random

# Customer information
def generate_num(probability = 0.96):
    return 1 if random.random() < probability else 0

def generate_employment_status(generated_num):
    return 1 if generated_num == 1 else 0

def generate_exp_date():
    exp_month = random.randint(1, 12)
    exp_year = random.randint(2024, 2035)
    return f"{exp_month}/{exp_year}"

def generate_id_types():
    return random.randint(1, 5)

generated_cust_id = set()

def generate_secondary_id(num):
    while True:  # Infinite loop to keep generating until a unique number is found.
        if num == 1:
            cust_id = random.randint(100000, 999999999)

            if cust_id not in generated_cust_id:
                generated_cust_id.add(cust_id)
                #Fill empty digits up to 10
                return cust_id
        else:
            return None

def generate_dates():
    # Start date and end date for cust since date, birthdate, and acct closure date
    start_date = datetime(1970, 1, 1)
    end_date = datetime.today()

    # Math to get cust since date
    cust_since_math = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))
    joint_cust_since_math = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))

    # Math to get birthdate
    years_to_subtract = random.randint(1, 80)

    birth_date_math = cust_since_math - timedelta(days=years_to_subtract * 365)
    joint_birth_date_math = joint_cust_since_math - timedelta(days=years_to_subtract * 365)

    # Math to get acct closure date
    closed_date_math = cust_since_math + timedelta(days=random.randint(0, (end_date - cust_since_math).days))

    # Customer since date
    cust_since = cust_since_math.strftime("%Y-%m-%d")

    # Customer birth dates
    birth_date = birth_date_math.strftime("%Y-%m-%d")
    joint_birth_date = joint_birth_date_math.strftime("%Y-%m-%d")

    # Employee hire date
    hire_date = cust_since_math.strftime("%Y-%m-%d")
    
    # Employee birth date
    emp_birth_date = birth_date_math.strftime("%Y-%m-%d")

    # Get random for termination chance
    if random.random() < 0.45:
        termination_date_math = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))
    else:
        termination_date_math = None

    return cust_since, birth_date, joint_birth_date, closed_date_math, emp_birth_date, hire_date, termination_date_math
