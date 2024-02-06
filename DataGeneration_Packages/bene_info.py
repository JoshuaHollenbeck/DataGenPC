import random

# Beneficiary information
def generate_bene_cust_id():
    bene_cust_id = random.randint(100000, 1000000000)
    
    return str(bene_cust_id).zfill(10)

def generate_bene_relationship():
    cust_bene_relationship = random.randint(1, 10)
    
    return cust_bene_relationship

def generate_bene_portion(num_beneficiaries):
    return round(100 / num_beneficiaries, 2)
