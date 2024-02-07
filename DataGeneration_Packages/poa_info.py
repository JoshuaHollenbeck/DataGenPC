import random

# POA information
def generate_poa_chance():
    if random.random() < 0.18:
        poa_num = 1
    else:
        poa_num = 0

    return poa_num

def generate_poa_role(poa_num):
    if poa_num == 1:
        cust_poa = random.randint(1, 3)
        return cust_poa
    else:
        return None

