from datetime import datetime, timedelta
from tqdm import tqdm
from DataGeneration_Packages import acct_info
from DataGeneration_Packages import bene_info
from DataGeneration_Packages import city_info
from DataGeneration_Packages import cust_info
from DataGeneration_Packages import dataframes_info
from DataGeneration_Packages import emp_info
from DataGeneration_Packages import faker_info
from DataGeneration_Packages import poa_info
from DataGeneration_Packages import trade_info
from DataGeneration_Packages import transaction_info
import random

def main():
    accounts_data = []

    beneficiaries_data = []

    joints_data = []

    employees_data = []

    customers_data = []

    account_holders_data = []

    # Number of records to generate
    cust_records = 100
    emp_records = 352543

    # Generate custs
    for i in tqdm(range(cust_records), desc=dataframes_info.format_desc("Generating Customers"), bar_format=dataframes_info.bar_format):
        # Customer information
        first_name = faker_info.generate_first_name()
        joint_first_name = faker_info.generate_first_name()
        last_name = faker_info.generate_last_name()
        is_cust = 1
        is_joint = 1

        # Customer city state zip lat and lon
        chosen_city = random.choice(
            city_info.city_info)
        zip_id, city, state, state_id, zip, lat1, lon1 = chosen_city

        cust_since, birth_date, joint_birth_date, closed_date_math, emp_birth_date, hire_date, termination_date_math = cust_info.generate_dates()

        generated_num = cust_info.generate_num()
        joint_generated_num = cust_info.generate_num()

        employer_choice = faker_info.generate_employer(
            generated_num)
        joint_employer_choice = faker_info.generate_employer(
            joint_generated_num)

        generated_address = city_info.generate_address()
        generated_address_2 = city_info.generate_address_2()

        cust_secondary_id = cust_info.generate_secondary_id(
            is_cust)
        joint_secondary_id = cust_info.generate_secondary_id(
            is_joint)

        # Account information
        account_holder_name = f"{first_name} {last_name}"
        online_banking = random.getrandbits(
            1)
        mobile_banking = random.getrandbits(
            1)
        two_factor = random.getrandbits(
            1)
        biometrics = random.getrandbits(
            1)
        voice_auth = random.getrandbits(
            1)
        do_not_call = random.getrandbits(
            1)
        share_affiliates = random.getrandbits(
            1)

        # Get the closest branch
        closest_branch = acct_info.get_closest_branch(
            lat1, lon1)

        # Generate power of attorney chances
        poa_num = poa_info.generate_poa_chance()

        # Get acct closure status
        acct_status = acct_info.get_acct_status()
        closed_date = acct_info.get_closed_date(
            acct_status, closed_date_math)

        # Number of accts to create per customer
        num_of_accts = random.randint(
            1, 5)

        # Generate customer data
        customer_data = {
            "cust_secondary_id": str(cust_secondary_id).zfill(10),
            "first_name": first_name,
            "middle_name": faker_info.generate_middle_name(),
            "last_name": last_name,
            "suffix": faker_info.generate_suffix(),
            "date_of_birth": birth_date,
            "client_since": cust_since,
            "id_type": cust_info.generate_id_types(),
            "cust_email": faker_info.generate_email(first_name, last_name),
            "cust_phone_home": faker_info.generate_phone_home(),
            "cust_phone_business": faker_info.generate_phone_business(),
            "cust_address": generated_address,
            "cust_address_2": generated_address_2,
            "cust_city": city,
            "cust_state": state_id,
            "cust_zip": zip_id,
            "cust_country": acct_info.generate_jurisdiction_country(),
            "employment_status": cust_info.generate_employment_status(generated_num),
            "employer_name": employer_choice,
            "occupation": faker_info.generate_job(generated_num),
            "cust_tax_id": faker_info.generate_tax_id(),
            "id_state": state_id,
            "id_num": faker_info.generate_passport_num(),
            "id_exp": cust_info.generate_exp_date(),
            "mothers_maiden": faker_info.generate_last_name(),
            "contact_method": acct_info.generate_contact_method(),
            "voice_auth": voice_auth,
            "do_not_call": do_not_call,
            "share_affiliates": share_affiliates,
        }
        customers_data.append(
            customer_data)

        # Generate account data
        for j in range(num_of_accts):
            # Generate acct type and acct type info
            generate_acct_type = random.randint(
                1, 19)

            acct_type_info = acct_info.get_acct_types(
                generate_acct_type)

            acct_type_id, (acct_type_name,
                           acct_type_abbr) = generate_acct_type, acct_type_info

            acct_num = acct_info.generate_acct_nums(
                generate_acct_type)

            registration_name = f"{account_holder_name} {acct_type_name}"

            account_nickname = f"{first_name} {acct_type_abbr}"

            initial_contact = random.choice(
                [1, 2, 3, 4])

            account_data = {
                "acct_num": acct_num,
                "cust_secondary_id": str(cust_secondary_id).zfill(10),
                "initial_contact_method": initial_contact,
                "acct_type": generate_acct_type,
                "registration_name": registration_name,
                "acct_objective": acct_info.generate_investment_objectives(),
                "acct_funding": acct_info.generate_source_of_funding(),
                "acct_purpose": acct_info.generate_purpose_of_account(),
                "acct_activity": acct_info.generate_anticipated_activity(),
                "acct_nickname": account_nickname,
                "rep_id": None,
                "acct_status": acct_status,
                "closed_date": closed_date,
                "contact_name": account_holder_name,
                "contact_address": generated_address,
                "contact_address_2": generated_address_2,
                "contact_city": city,
                "contact_state": state_id,
                "contact_zip": zip_id,
                "jurisdiction_country": acct_info.generate_jurisdiction_country(),
                "jurisdiction_state": state_id,
                "acct_pass": faker_info.generate_acct_pass(),
                "poa_cust_id": cust_info.generate_secondary_id(poa_num),
                "poa_role": poa_info.generate_poa_role(poa_num),
                "poa_first_name": faker_info.generate_poa_first_name(poa_num),
                "poa_last_name": faker_info.generate_poa_last_name(poa_num),
                "poa_tax_id": faker_info.generate_tax_id(),
                "acct_bal": acct_info.acct_bal(acct_status),
                "online": online_banking,
                "mobile": mobile_banking,
                "two_factor": two_factor,
                "biometrics": biometrics,
                "atm_limit": acct_info.generate_atm_limits(),
                "ach_limit": acct_info.generate_ach_limits(),
                "wire_limit": acct_info.generate_wire_limits(),
                "client_since": cust_since,
                "acct_branch_id": closest_branch,
                "acct_escheat": 0,
                "acct_ownr_decsd": 0,
                "anti_money_launder": 0,
                "ct_order_collect": 0,
                "ct_order_froze": 0,
                "ct_order_garnish": 0,
                "closed_by_bank": 0,
                "closed_by_cust": 0,
                "fraud": 0,
                "inactive": 0,
                "know_your_cust": 0,
                "patriot_act": 0,
                "pending_docs": 0,
                "pending_toa_out": 0,
                "undeliverable_mail": 0
            }
            accounts_data.append(
                account_data)

            # Generate joint cutomer data if acct_type is joint
            if generate_acct_type in [8, 11, 14, 17, 19]:

                # Check if joint customer already exists in customers_data
                joint_customer_exists = any(cust['cust_secondary_id'] == str(
                    joint_secondary_id).zfill(10) for cust in customers_data)

                # If joint customer does not exist, add to customers_data
                if not joint_customer_exists:
                    joint_data = {
                        "cust_secondary_id": str(joint_secondary_id).zfill(10),
                        "joint_cust_secondary_id": str(joint_secondary_id).zfill(10),
                        "first_name": joint_first_name,
                        "middle_name": faker_info.generate_middle_name(),
                        "last_name": last_name,
                        "suffix": faker_info.generate_suffix(),
                        "date_of_birth": joint_birth_date,
                        "client_since": cust_since,
                        "id_type": cust_info.generate_id_types(),
                        "cust_email": faker_info.generate_email(joint_first_name, last_name),
                        "cust_phone_home": faker_info.generate_phone_home(),
                        "cust_phone_business": faker_info.generate_phone_business(),
                        "cust_address": generated_address,
                        "cust_address_2": generated_address_2,
                        "cust_city": city,
                        "cust_state": state_id,
                        "cust_zip": zip_id,
                        "cust_country": acct_info.generate_jurisdiction_country(),
                        "employment_status": cust_info.generate_employment_status(joint_generated_num),
                        "employer_name": joint_employer_choice,
                        "occupation": faker_info.generate_job(joint_generated_num),
                        "cust_tax_id": faker_info.generate_tax_id(),
                        "id_state": state_id,
                        "id_num": faker_info.generate_passport_num(),
                        "id_exp": cust_info.generate_exp_date(),
                        "mothers_maiden": faker_info.generate_last_name(),
                        "contact_method": acct_info.generate_contact_method(),
                        "voice_auth": voice_auth,
                        "do_not_call": do_not_call,
                        "share_affiliates": share_affiliates,
                        "acct_num": acct_num,
                    }
                    customers_data.append(
                        joint_data)
                    joints_data.append(
                        joint_data)

            # Add account holder data for joint accounts, ensuring both cust_secondary_id and joint_cust_secondary_id are recorded
            acct_holder_data = {
                "acct_num": acct_num,
                "cust_secondary_id": str(cust_secondary_id).zfill(10),
                "joint_cust_secondary_id": str(joint_secondary_id).zfill(10) if generate_acct_type in [8, 11, 14, 17, 19] else None,
                "client_since": cust_since
            }
            account_holders_data.append(
                acct_holder_data)

        # Generate beneficiary number between 1 and 4
        num_beneficiaries = random.randint(
            1, 4)
        has_bene = 1

        for l in range(num_beneficiaries):
            bene_data = {
                "acct_num": acct_num,
                "bene_cust_id": cust_info.generate_secondary_id(has_bene),
                "bene_first_name": faker_info.generate_first_name(),
                "bene_last_name": last_name,
                "bene_tax_id": faker_info.generate_tax_id(),
                "bene_relationship": bene_info.generate_bene_relationship(),
                "bene_portion": bene_info.generate_bene_portion(num_beneficiaries),
                "client_since": cust_since,
            }
            beneficiaries_data.append(
                bene_data)

    # Generate transactions
    for account in tqdm(accounts_data, desc=dataframes_info.format_desc("Generating Transactions"), bar_format=dataframes_info.bar_format):
        acct_num = account["acct_num"]
        acct_type = account["acct_type"]
        acct_bal_value = account["acct_bal"]
        cust_since = datetime.strptime(
            account["client_since"], "%Y-%m-%d")
        closed_date = datetime.strptime(
            account["closed_date"], "%Y-%m-%d") if account["closed_date"] else datetime.now()

        generated_dates = transaction_info.generate_transaction_dates(
            cust_since, closed_date)

        stock_info, final_acct_balances = transaction_info.generate_transactions(
            acct_num, acct_type, generated_dates, acct_bal_value)

        transaction_info.holding_total(
            acct_num, acct_type, stock_info)

    # Generate employees
    for i in tqdm(range(emp_records), desc=dataframes_info.format_desc("Generating Employees"), bar_format=dataframes_info.bar_format):
        # Employee information
        emp_first_name = faker_info.generate_first_name()
        emp_last_name = faker_info.generate_last_name()

        cust_since, birth_date, joint_birth_date, closed_date_math, emp_birth_date, hire_date, termination_date_math = cust_info.generate_dates()

        termination_reason_result = emp_info.get_termination_reason(
            termination_date_math)
        rehireable_result = emp_info.get_rehireable(
            termination_reason_result)

        emp_city, emp_state_id, emp_zip_id, position, main_client, salary = city_info.generate_zip_position_salary()

        emp_id = i + 1
        emp_secondary_id = i + 1
        is_emp = 1

        # Generate employee data
        employee_data = {
            "emp_secondary_id": emp_secondary_id,
            "emp_first_name": emp_first_name,
            "emp_middle_name": faker_info.generate_middle_name(),
            "emp_last_name": emp_last_name,
            "emp_suffix": faker_info.generate_suffix(),
            "emp_date_of_birth": emp_birth_date,
            "rep_id": emp_info.generate_rep_id(main_client),
            "hire_date": hire_date,
            "termination_date": termination_date_math,
            "emp_email": faker_info.generate_email(emp_first_name, emp_last_name),
            "emp_phone": str(faker_info.generate_phone_home()),
            "emp_address": city_info.generate_address(),
            "emp_address_2": city_info.generate_address_2(),
            "emp_city": emp_city,
            "emp_state": emp_state_id,
            "emp_zip": emp_zip_id,
            "emp_tax_id": faker_info.generate_tax_id(),
            "effective_date": hire_date,
            "salary_amount": salary,
            "position_location_id": position,
            "mc_access": main_client,
            "start_date": hire_date,
            "end_date": termination_date_math,
            "reason": termination_reason_result,
            "rehireable": rehireable_result,
            "emp_pass": faker_info.generate_emp_pass(main_client)
        }
        employees_data.append(
            employee_data)

    dataframes_info.generate_cust_data(
        customers_data)

    dataframes_info.generate_acct_data(
        accounts_data, account_holders_data, beneficiaries_data, joints_data, final_acct_balances)

    dataframes_info.generate_emp_data(
        employees_data)

    dataframes_info.get_final_acct_bal()


if __name__ == "__main__":
    main()
