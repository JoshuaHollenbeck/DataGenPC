import math
import random
from DataGeneration_Packages import city_info

# Account information
generated_acct_nums = set()

def generate_acct_nums(acct_type_id):
    # Infinite loop to keep generating until a unique number is found.
    while True:
        random_num = random.randint(1000000000, 9999999999)

        if acct_type_id in [16, 17]:
            acct_num = int(f"4000{random_num}")
        elif acct_type_id in [18, 19]:
            acct_num = int(f"6000{random_num}")
        else:
            acct_num = random_num

        if acct_num not in generated_acct_nums:
            generated_acct_nums.add(acct_num)
            return acct_num

def get_acct_status():
    if random.random() < 0.16:
        acct_status = 1
    else:
        acct_status = 0

    return acct_status

def get_closed_date(acct_status, closed_date_math):
    if acct_status == 1:
        closed_date = closed_date_math.strftime("%Y-%m-%d")
    else:
        closed_date = None

    return closed_date

def get_closest_branch(lat1, lon1):
    closest_branch = None

    # Initialize min_distance with infinity to ensure any subsequent distance is smaller
    min_distance = float('inf')

    # Loop through all company locations
    for comp_location in city_info.comp_zips:
        comp_id, _, _, _, _, _, lat2, lon2, type_id = comp_location

        # Calculate the distance from the current location to a given point using the haversine formula
        distance = haversine_distance(lat1, lon1, lat2, lon2)

        # Check if the current location is of type 'branch'
        if type_id == 2:
            # If the current distance is the smallest encountered so far, update min_distance and closest_branch
            if distance < min_distance:
                min_distance = distance
                closest_branch = comp_id

    # Return the ID of the closest branch found
    return closest_branch

def generate_contact_method():
    return 1 if random.random() < 0.34 else None

def generate_investment_objectives():
    cust_investment_objective = random.randint(1, 5)
    return cust_investment_objective

def generate_source_of_funding():
    cust_source_of_funding = random.randint(1, 7)
    return cust_source_of_funding

def generate_purpose_of_account():
    cust_purpose_of_account = random.randint(1, 7)
    return cust_purpose_of_account

def generate_anticipated_activity():
    cust_anticipated_activity = random.randint(1, 4)
    return cust_anticipated_activity

def generate_jurisdiction_country():
    return 1

def acct_bal(acct_status):
    acct_bal_value = round(random.uniform(5000.00, 10000.00), 2)
    if acct_status == 0:
        return 0
    else:
        return acct_bal_value

# Use haversine formula to compute the distance between two sets of latitudes and longitudes
def haversine_distance(lat1, lon1, lat2, lon2):
    # Earth's radius in kilometers
    R = 6371

    # Convert the difference in latitudes from degrees to radians
    dlat = math.radians(lat2 - lat1)

    # Convert the difference in longitudes from degrees to radians
    dlon = math.radians(lon2 - lon1)

    # Calculate the square of half the chord length between the two points using Haversine formula
    a = math.sin(dlat / 2) * math.sin(dlat / 2) + math.cos(math.radians(lat1)) * math.cos(math.radians(lat2)) * math.sin(dlon / 2) * math.sin(dlon / 2)

    # Compute the angular distance in radians
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))

    # Convert the angular distance from radians to actual distance using the Earth's radius
    distance = R * c

    return distance

def generate_atm_limits():
    atm_limits = [
        "500",
        "600",
        "700",
        "800",
        "900",
        "1000",
    ]
    return random.choice(atm_limits)

def generate_ach_limits():
    ach_limits = [
        "1000",
        "2000",
        "3000",
        "4000",
        "5000",
        "10000",
        "25000"
    ]
    return random.choice(ach_limits)

def generate_wire_limits():
    wire_limits = [
        "5000",
        "10000",
        "50000",
        "100000",
        "500000",
        "1000000",
        "5000000",
        "10000000"
    ]
    return random.choice(wire_limits)

def get_acct_types(acct_type):
    acct_types = {
        1: ("IRA Custodial Roth", "IRA-CH"), # Individual IRA
        2: ("Contributory IRA", "IRA-CO"), # Individual IRA
        3: ("Education Savings", "IRA-ED"), # Individual IRA
        4: ("Roth IRA", "IRA-RH"), # Individual IRA
        5: ("Rollover IRA", "IRA-RO"), # Individual IRA
        6: ("Roth Conversion IRA", "IRA-RV"), # Individual IRA
        7: ("Simplified Employee Pension IRA", "IRA-SEP"), # Individual IRA
        8: ("Bank One Community Property", "B1-CP"), # Joint Brokerage
        9: ("Bank One Custodial", "B1-CU"), # Individual Brokerage
        10: ("Bank One Individual", "B1-IND"), # Individual Brokerage
        11: ("Bank One Joint Tenants with Rights of Survivorship", "B1-JT"), # Joint Brokerage
        12: ("Bank One Living Trust", "B1-LT"), # Individual Brokerage
        13: ("Bank One Pension Trust", "B1-PT"), # Individual Brokerage
        14: ("Bank One Tenants in Common", "B1-TC"), # Joint Brokerage
        15: ("Bank One Testamentary Trust", "B1-TT"), # Individual Brokerage
        16: ("Bank Individual Checking", "B2-IC"), # Individual Checking
        17: ("Bank Joint Checking", "B2-JC"),  # Joint Checking
        18: ("Bank Individual Savings", "B2-IS"), # Individual Savings
        19: ("Bank Joint Savings", "B2-JS") # Joint Savings
    }
    return acct_types.get(acct_type)