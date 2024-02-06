from faker import Faker
import random

fake = Faker("en_US")

def generate_first_name():
    return fake.first_name()

def generate_middle_name():
    return fake.first_name() if random.random() < 0.32 else None

def generate_last_name():
    return fake.last_name()

def generate_suffix():
    return fake.suffix() if random.random() < 0.03 else None

def generate_phone_home():
    area_code = fake.random_number(digits=3, fix_len=True)
    central_office_code = fake.random_number(digits=3, fix_len=True)
    line_number = fake.random_number(digits=4, fix_len=True)
    return f"{area_code}-{central_office_code}-{line_number}"

def generate_phone_business():
    area_code = fake.random_number(digits=3, fix_len=True)
    central_office_code = fake.random_number(digits=3, fix_len=True)
    line_number = fake.random_number(digits=4, fix_len=True)
    return (f"{area_code}-{central_office_code}-{line_number}"
            if random.random() < 0.21 else None)

def generate_email(first_name, last_name):
    domain_name = "@example.com"

    first_email = [
        first_name.lower(),
        first_name[0].lower(),
        last_name.lower(),
        last_name[0].lower(),
        fake.safe_color_name().lower(),
        fake.word().lower(),
        fake.building_number(),
        fake.street_suffix().lower(),
    ]

    spacing_email = ["_", ".", ""]

    first_choice = random.choice(first_email)
    second_email = random.choice(
        [name for name in first_email if name != first_choice])

    email = f"{first_choice}{random.choice(spacing_email)}{second_email}{domain_name}"

    return email

def generate_job(generated_num):
    job = fake.job()

    # Split by comma and take the first par
    job = job.split(',')[0]

    # Split by "/" and take the first par
    job = job.split('/')[0]

    # Capitalize job title
    job = str.title((job))

    return job if generated_num == 1 else None

def generate_employer(generated_num):
    if generated_num == 1:
        choices = [
            fake.first_name().title() + " " + fake.company_suffix(),
            fake.last_name().title() + " " + fake.company_suffix(),
            fake.safe_color_name().title() + " " + fake.word().title() + " " +
            fake.company_suffix(),
            fake.safe_color_name().title() + " " + fake.company_suffix(),
            fake.word().title() + " " + fake.safe_color_name().title() + " " +
            fake.company_suffix(),
            fake.word().title() + " " + fake.company_suffix(),
            fake.street_suffix().title() + " " + fake.company_suffix(),
            fake.last_name().title() + " & Sons",
            fake.first_name().title() + " & Sons",
        ]

        sep = ","
        return random.choice(choices)

    else:
        return None

def generate_passport_num():
    return fake.passport_number()

def generate_tax_id():
    area_num = fake.random_number(digits=3, fix_len=True)
    group_num = fake.random_number(digits=2, fix_len=True)
    serial_num = fake.random_number(digits=4, fix_len=True)
    
    return f"{area_num}-{group_num}-{serial_num}"

def generate_acct_pass():
    word = fake.word()
    num = random.randint(1, 9999)
    return f"{word}{num}"

def generate_emp_pass(main_client):
    if main_client == 1:
        emp_pass = fake.password(length=8)
        return emp_pass
    else:
        return None

def generate_poa_first_name(poa_num):
    if poa_num == 1:
        return fake.first_name()
    else:
        return None

def generate_poa_last_name(poa_num):
    if poa_num == 1:
        return fake.last_name()
    else:
        return None