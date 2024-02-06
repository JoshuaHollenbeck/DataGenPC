import random
import string

# Employee Info
def get_termination_reason(termination_date_math):
    if termination_date_math is None:
        return None
    else:
        return random.randint(1, 4)

def get_rehireable(termination_reason_result):
    if termination_reason_result in [1, 2, 3]:
        return 1
    elif termination_reason_result == 4:
        return 0

def generate_rep_id(main_client):
    n = 5
    rep_id = "".join(random.choices(string.ascii_uppercase + string.digits, k=n))

    if main_client == 1:
        return rep_id
    else:
        return None
