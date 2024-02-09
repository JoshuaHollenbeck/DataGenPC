from DataGeneration_Packages import transaction_info
from tqdm import tqdm
import pandas as pd
import os

# tqdm Customization
def format_desc(text, length=65):
    return f"{text:.<{length}}"


# Show bar when generating data
bar_format = "{desc:<65}: {percentage:3.0f}%|{bar:100}| {n_fmt}/{total_fmt} | [{remaining}]"

# Function to save a DataFrame to a CSV file in a specified folder
def save_dataframe(df, filename, folder_path):
    full_path = os.path.join(
        folder_path, filename)
    df.to_csv(
        full_path, index=False)


# Ensure the csv_files directory exists
folder_path = 'CSV_Files'
if not os.path.exists(folder_path):
    os.makedirs(
        folder_path)

# Create dataframes
def create_dataframe_with_tqdm(data, name):
    desc = format_desc(
        f"Creating {name}")

    for i in tqdm(range(1), desc=desc, bar_format=bar_format):
        df = pd.DataFrame(
            data)

    return df

# Generate Customer Dataframes
def generate_cust_data(customers_data):
    df_customer_info = create_dataframe_with_tqdm(
        customers_data, "Customer Info Dataframe")

    # Customer information
    for i in tqdm(range(1), desc=format_desc("Sorting Customer Info"), bar_format=bar_format):
        df_customer_info = df_customer_info.sort_values(
            "client_since")

    for i in tqdm(range(1), desc=format_desc("Assigning Customer ID"), bar_format=bar_format):
        df_customer_info["cust_id"] = range(
            1, len(df_customer_info) + 1)

    df_cust_contact = df_customer_info[[
        "cust_id",
        "cust_email",
        "cust_phone_home",
        "cust_phone_business",
        "cust_address",
        "cust_address_2",
        "cust_city",
        "cust_state",
        "cust_zip",
        "cust_country"
    ]].copy()

    for i in tqdm(range(1), desc=format_desc("Converting Customer Contact Decimal to String"), bar_format=bar_format):
        df_cust_contact['cust_city'] = df_cust_contact['cust_city'].astype(
            str).replace('\.0', "", regex=True)

        df_cust_contact['cust_country'] = df_cust_contact['cust_country'].astype(
            str).replace('\.0', "", regex=True)

    df_cust_emp = df_customer_info[[
        "cust_id",
        "employment_status",
        "employer_name",
        "occupation"
    ]].copy()

    for i in tqdm(range(1), desc=format_desc("Converting Customer Employee Decimal to String"), bar_format=bar_format):
        df_cust_emp['employment_status'] = df_cust_emp['employment_status'].astype(
            str).replace('\.0', "", regex=True)

    df_cust_id = df_customer_info[[
        "cust_id",
        "id_type",
        "id_state",
        "id_num",
        "id_exp",
        "mothers_maiden"
    ]].copy().rename(columns={"cust_state": "id_state"})

    df_cust_info = df_customer_info[[
        "cust_id",
        "cust_secondary_id",
        "first_name",
        "middle_name",
        "last_name",
        "suffix",
        "date_of_birth",
        "client_since",
    ]].copy()

    df_cust_privacy = df_customer_info[[
        "cust_id",
        "voice_auth",
        "do_not_call",
        "share_affiliates"
    ]].copy()

    df_cust_tax = df_customer_info[[
        "cust_id",
        "cust_tax_id",
    ]].copy()

    combined_dataframes = [
        (df_cust_contact,
         "cust_contact.csv"),
        (df_cust_emp,
         "cust_emp.csv"),
        (df_cust_id,
         "cust_id.csv"),
        (df_cust_info,
         "cust_info.csv"),
        (df_cust_privacy,
         "cust_privacy.csv"),
        (df_cust_tax,
         "cust_tax.csv")
    ]

    for df, filename in tqdm(combined_dataframes, desc="Saving Customer CSV files", bar_format=bar_format):
        save_dataframe(
            df, filename, folder_path)

# Generate Account Dataframes
def generate_acct_data(accounts_data, account_holders_data, beneficiaries_data, joints_data, final_acct_balances):
    df_account_info = create_dataframe_with_tqdm(
        accounts_data, "Account Info Dataframe")
    df_account_holder_info = create_dataframe_with_tqdm(
        account_holders_data, "Account Holder Info Dataframe")
    df_beneficiary_info = create_dataframe_with_tqdm(
        beneficiaries_data, "Beneficiary Info Dataframe")
    df_joint_info = create_dataframe_with_tqdm(
        joints_data, "Joint Info Dataframe")
    df_transaction_info = create_dataframe_with_tqdm(
        transaction_info.transactions_data, "Transaction Info Dataframe")
    df_holding_info = create_dataframe_with_tqdm(
        transaction_info.holdings_data, "Holding Info Dataframe")

    # Account information
    for i in tqdm(range(1), desc=format_desc("Sorting Account Info"), bar_format=bar_format):
        df_account_info = df_account_info.sort_values(
            "client_since")

    for i in tqdm(range(1), desc=format_desc("Sorting Account Holder Info"), bar_format=bar_format):
        df_account_holder_info = df_account_holder_info.sort_values(
            "client_since")

    for i in tqdm(range(1), desc=format_desc("Sorting Beneficiary Info"), bar_format=bar_format):
        df_beneficiary_info = df_beneficiary_info.sort_values(
            "client_since")

    for i in tqdm(range(1), desc=format_desc("Sorting Trade Info"), bar_format=bar_format):
        df_transaction_info = df_transaction_info.sort_values(
            "transaction_date")

    for i in tqdm(range(1), desc=format_desc("Assigning acct_id to Account Info"), bar_format=bar_format):
        df_account_info["acct_id"] = range(
            1, len(df_account_info) + 1)

    for i in tqdm(range(1), desc=format_desc("Assigning acct_id to Account Holder Info"), bar_format=bar_format):
        df_account_holder_info["acct_id"] = range(
            1, len(df_account_holder_info) + 1)

    for i in tqdm(range(1), desc=format_desc("Assigning cust_id to Account Info"), bar_format=bar_format):
        df_account_info["cust_id"] = range(
            1, len(df_account_info) + 1)

    for i in tqdm(range(1), desc=format_desc("Assigning bene_id to Account Info"), bar_format=bar_format):
        df_beneficiary_info["acct_bene_id"] = range(
            1, len(df_beneficiary_info) + 1)

    for i in tqdm(range(1), desc=format_desc("Assigning acct_poa_id to Account Info"), bar_format=bar_format):
        df_account_info["acct_poa_id"] = range(
            1, len(df_account_info) + 1)

    for i in tqdm(range(1), desc=format_desc("Assigning transaction_id to Account Transactions"), bar_format=bar_format):
        df_transaction_info["acct_transaction_id"] = range(
            1, len(df_transaction_info) + 1)

    for i in tqdm(range(1), desc=format_desc("Assigning trade_id to Account Trade"), bar_format=bar_format):
        df_transaction_info["acct_trade_id"] = range(
            1, len(df_transaction_info) + 1)

    for i in tqdm(range(1), desc=format_desc("Assigning holding_id to Account Holding"), bar_format=bar_format):
        df_holding_info["acct_holding_id"] = range(
            1, len(df_holding_info) + 1)

    for acct_num, final_bal in tqdm(final_acct_balances.items(), desc=format_desc("Updating Account Balance"), bar_format=bar_format):
        df_account_info.loc[df_account_info['acct_num']
                            == acct_num, 'acct_bal'] = final_bal

    df_acct_bal = df_account_info[[
        "acct_id",
        "acct_bal"
    ]].copy()

    df_acct_bene = df_beneficiary_info[[
        "acct_bene_id",
        "acct_num",
        "bene_cust_id",
        "bene_first_name",
        "bene_last_name",
        "bene_tax_id",
        "bene_relationship",
        "bene_portion",
        "client_since",
    ]].copy()

    bene_acct_num_dict = {}

    for index, row in tqdm(df_acct_bene.iterrows(), total=df_acct_bene.shape[0], desc=format_desc("Updating Beneficiary Account Number to Account ID"), bar_format=bar_format):
        acct_num = row['acct_num']

        if acct_num not in bene_acct_num_dict:
            bene_acct_num_dict[acct_num] = len(
                bene_acct_num_dict) + 1

        df_acct_bene.at[index,
                        'acct_num'] = bene_acct_num_dict[acct_num]

    for i in tqdm(range(1), desc=format_desc("Renaming Account Number to Account ID"), bar_format=bar_format):
        df_acct_bene = df_acct_bene.rename(
            columns={'acct_num': 'acct_id'})

    for i in tqdm(range(1), desc=format_desc("Dropping Client Since"), bar_format=bar_format):
        df_acct_bene = df_acct_bene.drop(
            columns=['client_since'])

    df_acct_contact = df_account_info[[
        "acct_id",
        "contact_name",
        "contact_address",
        "contact_address_2",
        "contact_city",
        "contact_state",
        "contact_zip",
    ]].copy()

    for i in tqdm(range(1), desc=format_desc("Joining Joint Info to Account Holders"), bar_format=bar_format):
        if df_joint_info.empty:
            merged_df = df_account_holder_info.copy()
            merged_df['joint_cust_secondary_id'] = 'NONE'
        else:
            merged_df = pd.merge(df_account_info, df_joint_info[[
                                 'acct_num', 'joint_cust_secondary_id']], on='acct_num', how='left')

    df_acct_holders = df_account_holder_info[[
        "acct_id",
        "acct_num",
        "cust_secondary_id",
        "joint_cust_secondary_id",
        "client_since"
    ]].copy()

    for i in tqdm(range(1), desc=format_desc("Dropping Account Number and Client Since"), bar_format=bar_format):
        df_acct_holders.drop(
            ["acct_num", "client_since"], axis=1, inplace=True)

    df_acct_info = df_account_info[[
        "acct_id",
        "acct_num",
        "initial_contact_method",
        "acct_type",
        "registration_name",
        "acct_objective",
        "acct_funding",
        "acct_purpose",
        "acct_activity",
        "cust_secondary_id",
        "acct_nickname",
        "client_since",
        "acct_status",
        "closed_date",
        "rep_id",
    ]].copy()

    df_acct_jurisdiction = df_account_info[[
        "acct_id",
        "jurisdiction_country",
        "jurisdiction_state"
    ]].copy()

    df_acct_mobile = df_account_info[[
        "acct_id",
        "online",
        "mobile",
        "two_factor",
        "biometrics"
    ]].copy()

    df_acct_pass = df_account_info[[
        "acct_id",
        "acct_password"
    ]].copy()

    df_acct_poa = df_account_info[[
        "acct_poa_id",
        "acct_id",
        "poa_cust_id",
        "poa_role",
        "poa_first_name",
        "poa_last_name",
        "poa_tax_id",
    ]].copy()

    for i in tqdm(range(1), desc=format_desc("Dropping Empty Power of Attorney Rows"), bar_format=bar_format):
        df_acct_poa.dropna(subset=[
                           "poa_cust_id"], inplace=True)

    for i in tqdm(range(1), desc=format_desc("Converting Power of Attorney POA Role Decimal to String"), bar_format=bar_format):
        df_acct_poa['poa_role'] = df_acct_poa['poa_role'].astype(
            str).replace('\.0', "", regex=True)

    for i in tqdm(range(1), desc=format_desc("Converting Power of Attorney Customer ID Decimal to String"), bar_format=bar_format):
        df_acct_poa['poa_cust_id'] = df_acct_poa['poa_cust_id'].astype(
            str).replace('\.0', "", regex=True)

    for i in tqdm(range(1), desc=format_desc("Re-numbering Power of Attorney ID"), bar_format=bar_format):
        df_acct_poa["acct_poa_id"] = range(
            1, len(df_acct_poa) + 1)

    df_acct_restrict = df_account_info[[
        "acct_id",
        "acct_escheat",
        "acct_ownr_decsd",
        "anti_money_launder",
        "ct_order_collect",
        "ct_order_froze",
        "ct_order_garnish",
        "closed_by_bank",
        "closed_by_cust",
        "fraud",
        "inactive",
        "know_your_cust",
        "patriot_act",
        "pending_docs",
        "pending_toa_out",
        "undeliverable_mail"
    ]].copy()

    df_acct_limit = df_account_info[[
        "acct_id",
        "atm_limit",
        "ach_limit",
        "wire_limit"
    ]].copy()

    df_acct_transaction = df_transaction_info[[
        "acct_transaction_id",
        "acct_num",
        "transaction_type",
        "transaction_amt",
        "transaction_date",
        "pre_bal",
        "post_bal",
        "rep_id"
    ]].copy()

    df_acct_branch = df_account_info[[
        "acct_id",
        "acct_branch_id"
    ]].copy()

    df_acct_trade = df_transaction_info[[
        "acct_trade_id",
        "acct_transaction_id",
        "acct_num",
        "transaction_date",
        "transaction_type",
        "stock_exchange",
        "stock_id",
        "trade_quantity",
        "trade_price",
        "trade_status",
        "trade_fees",
        "currency",
    ]].copy()

    df_acct_holding = df_holding_info[[
        "acct_holding_id",
        "acct_num",
        "stock_id",
        "quantity",
        "average_cost"
    ]].copy()

    transaction_acct_num_dict = {}

    for index, row in tqdm(df_acct_transaction.iterrows(), total=df_acct_transaction.shape[0], desc=format_desc("Updating Transaction Account Number to Account ID"), bar_format=bar_format):
        acct_num = row['acct_num']

        if acct_num not in transaction_acct_num_dict:
            transaction_acct_num_dict[acct_num] = len(
                transaction_acct_num_dict) + 1

        df_acct_transaction.at[index,
                               'acct_num'] = transaction_acct_num_dict[acct_num]

    df_acct_transaction = df_acct_transaction.rename(
        columns={'acct_num': 'acct_id'})

    trade_acct_num_dict = {}

    for index, row in tqdm(df_acct_trade.iterrows(), total=df_acct_trade.shape[0], desc=format_desc("Updating Trade Account Number to Account ID"), bar_format=bar_format):
        acct_num = row['acct_num']

        if acct_num not in trade_acct_num_dict:
            trade_acct_num_dict[acct_num] = len(
                trade_acct_num_dict) + 1

        df_acct_trade.at[index,
                         'acct_num'] = trade_acct_num_dict[acct_num]

    df_acct_trade = df_acct_trade.rename(
        columns={'acct_num': 'acct_id'})

    for i in tqdm(range(1), desc=format_desc("Dropping Empty Account Trade Rows"), bar_format=bar_format):
        df_acct_trade.drop(
            df_acct_trade[df_acct_trade['stock_id'] < 0].index, inplace=True)

    stock_holdings_dict = {}

    for index, row in tqdm(df_acct_holding.iterrows(), total=df_acct_holding.shape[0], desc=format_desc("Updating Stock Holding Account Number to Account ID"), bar_format=bar_format):
        acct_num = row['acct_num']

        if acct_num not in stock_holdings_dict:
            stock_holdings_dict[acct_num] = len(
                stock_holdings_dict) + 1

        df_acct_holding.at[index,
                           'acct_num'] = stock_holdings_dict[acct_num]

    df_acct_holding = df_acct_holding.rename(
        columns={'acct_num': 'acct_id'})

    for i in tqdm(range(1), desc=format_desc("Dropping Empty Acct Holding Rows"), bar_format=bar_format):
        df_acct_holding.drop(
            df_acct_holding[df_acct_holding['quantity'] < 0].index, inplace=True)

    combined_dataframes = [
        (df_acct_bal,
         "acct_bal.csv"),
        (df_acct_contact,
         "acct_contact.csv"),
        (df_acct_info,
         "acct_info.csv"),
        (df_acct_pass,
         "acct_pass.csv"),
        (df_acct_jurisdiction,
         "acct_jurisdiction.csv"),
        (df_acct_mobile,
         "acct_mobile.csv"),
        (df_acct_holders,
         "acct_holders.csv"),
        (df_acct_bene,
         "acct_bene.csv"),
        (df_acct_poa,
         "acct_poa.csv"),
        (df_acct_restrict,
         "acct_restrict.csv"),
        (df_acct_limit,
         "acct_limit.csv"),
        (df_acct_transaction,
         "acct_transaction.csv"),
        (df_acct_branch,
         "acct_branch.csv"),
        (df_acct_trade,
         "acct_trade.csv"),
        (df_acct_holding,
         "acct_holding.csv")
    ]

    for df, filename in tqdm(combined_dataframes, desc="Saving Account CSV files", bar_format=bar_format):
        save_dataframe(
            df, filename, folder_path)

# Generate Employee Dataframes
def generate_emp_data(employees_data):
    df_employee_info = create_dataframe_with_tqdm(
        employees_data, "Customer Info Dataframe")

    # Employee information
    for i in tqdm(range(1), desc=format_desc("Sorting Employee Info"), bar_format=bar_format):
        df_employee_info = df_employee_info.sort_values(
            "hire_date")

    for i in tqdm(range(1), desc=format_desc("Assigning Employee ID"), bar_format=bar_format):
        df_employee_info["emp_id"] = range(
            1, len(df_employee_info) + 1)

    for i in tqdm(range(1), desc=format_desc("Assigning Employee Secondary ID"), bar_format=bar_format):
        df_employee_info["emp_secondary_id"] = [
            f"A{i:08}" for i in range(1, len(df_employee_info) + 1)]

    df_emp_contact = df_employee_info[[
        "emp_id",
        "emp_email",
        "emp_phone",
        "emp_address",
        "emp_address_2",
        "emp_city",
        "emp_state",
        "emp_zip",
    ]].copy()

    df_emp_info = df_employee_info[[
        "emp_id",
        "emp_secondary_id",
        "emp_first_name",
        "emp_middle_name",
        "emp_last_name",
        "emp_suffix",
        "emp_date_of_birth",
        "hire_date",
        "termination_date",
    ]].copy()

    df_emp_pass = df_employee_info[[
        "emp_id",
        "emp_password"
    ]].copy()

    for i in tqdm(range(1), desc=format_desc("Dropping Empty Employee Password Rows"), bar_format=bar_format):
        df_emp_pass.dropna(subset=[
                           "emp_password"], inplace=True)

    df_emp_tax = df_employee_info[[
        "emp_id",
        "emp_tax_id"
    ]].copy()

    df_emp_rep_id = df_employee_info[[
        "emp_id",
        "rep_id",
    ]].copy()

    for i in tqdm(range(1), desc=format_desc("Dropping Empty Employee Rep ID Rows"), bar_format=bar_format):
        df_emp_rep_id.dropna(subset=[
            "rep_id"], inplace=True)

    for i in tqdm(range(1), desc=format_desc("Assinging Salary ID"), bar_format=bar_format):
        df_employee_info["emp_salary_id"] = range(
            1, len(df_employee_info) + 1)

    df_emp_salary = df_employee_info[[
        "emp_salary_id",
        "emp_id",
        "effective_date",
        "end_date",
        "salary_amount"
    ]].copy()

    for i in tqdm(range(1), desc=format_desc("Assigning Employee Position ID"), bar_format=bar_format):
        df_employee_info["emp_position_id"] = range(
            1, len(df_employee_info) + 1)

    df_emp_position = df_employee_info[[
        "emp_position_id",
        "emp_id",
        "position_location_id",
        "start_date",
        "end_date",
    ]].copy()

    for i in tqdm(range(1), desc=format_desc("Sorting Termination Info"), bar_format=bar_format):
        df_employee_info = df_employee_info.sort_values(
            "termination_date")

    for i in tqdm(range(1), desc=format_desc("Assigning Employee Termindation ID"), bar_format=bar_format):
        df_employee_info["emp_termination_id"] = range(
            1, len(df_employee_info) + 1)

    df_emp_termination = df_employee_info[[
        "emp_termination_id",
        "emp_id",
        "termination_date",
        "reason",
        "rehireable"
    ]].copy()

    for i in tqdm(range(1), desc=format_desc("Converting Employee Decimal to String"), bar_format=bar_format):
        df_emp_termination['reason'] = df_emp_termination['reason'].astype(
            str).replace('\.0', "", regex=True)

        df_emp_termination['rehireable'] = df_emp_termination['rehireable'].astype(
            str).replace('\.0', "", regex=True)

    for i in tqdm(range(1), desc=format_desc("Dropping Termination Date Column"), bar_format=bar_format):
        df_emp_termination.dropna(subset=[
                                  "termination_date"], inplace=True)

    combined_dataframes = [
        (df_emp_contact,
         "emp_contact.csv"),
        (df_emp_info,
         "emp_info.csv"),
        (df_emp_pass,
         "emp_pass.csv"),
        (df_emp_tax,
         "emp_tax.csv"),
        (df_emp_rep_id,
         "emp_rep_id.csv"),
        (df_emp_salary,
         "emp_salary.csv"),
        (df_emp_position,
         "emp_position.csv"),
        (df_emp_termination,
         "emp_termination.csv")
    ]

    for df, filename in tqdm(combined_dataframes, desc="Saving Employee CSV files", bar_format=bar_format):
        save_dataframe(
            df, filename, folder_path)

def get_final_acct_bal():
    for i in tqdm(range(1), desc=format_desc("Getting Account Final Balance"), bar_format=bar_format):
        # Load transactions data
        transactions_df = pd.read_csv(
            'CSV_Files/acct_transaction.csv')

        # Convert transaction_date to datetime to ensure proper sorting
        transactions_df['transaction_date'] = pd.to_datetime(
            transactions_df['transaction_date'])

        # Sort transactions by acct_id and transaction_date, then drop duplicates to keep the last transaction per acct_id
        last_transactions_df = transactions_df.sort_values(
            by=['acct_id', 'transaction_date']).drop_duplicates('acct_id', keep='last')

        # Load account balances data
        acct_bal_df = pd.read_csv(
            'CSV_Files/acct_bal.csv')

        # Update acct_bal in acct_bal_df with post_bal from the corresponding last transaction
        for acct_id in last_transactions_df['acct_id']:
            post_bal = last_transactions_df[last_transactions_df['acct_id']
                                            == acct_id]['post_bal'].values[0]
            acct_bal_df.loc[acct_bal_df['acct_id']
                            == acct_id, 'acct_bal'] = post_bal

        # Overwrite the existing acct_bal.csv with the updated account balances
        acct_bal_df.to_csv(
            'CSV_Files/acct_bal.csv', index=False)

def get_cust_id_for_acct_info():
    for i in tqdm(range(1), desc=format_desc("Getting Customer ID For Account Info"), bar_format=bar_format):
        # Load the data
        df_cust_info = pd.read_csv(
            'CSV_Files/cust_info.csv')
        df_acct_info = pd.read_csv(
            'CSV_Files/acct_info.csv')

        # Merge the DataFrames
        df_merged = df_acct_info.merge(df_cust_info[['cust_id', 'cust_secondary_id']],
                                       on='cust_secondary_id',
                                       how='left')

        # Define the new order of columns, placing 'cust_id' right after 'acct_id'
        new_order = ['acct_id', 'cust_id'] + \
            [col for col in df_merged.columns if col not in [
                'acct_id', 'cust_id']]

        # Reorder the DataFrame according to the new column order
        df_merged = df_merged[new_order]

        # Optional: Drop the 'cust_secondary_id' column
        df_merged.drop(
            'cust_secondary_id', axis=1, inplace=True)

        # Overwrite the acct_info.csv file with the updated DataFrame
        df_merged.to_csv(
            'CSV_Files/acct_info.csv', index=False)

def remove_empty_trade():
    for i in tqdm(range(1), desc=format_desc("Getting Customer ID For Account Info"), bar_format=bar_format):
        # Load the data
        df_trade_info = pd.read_csv(
            'CSV_Files/acct_trade.csv')

        # Filter the DataFrame to keep only rows with 'transaction_type' 3 or 4, and create a copy
        df_filtered = df_trade_info[df_trade_info['transaction_type'].isin([
                                                                           3, 4])].copy()

        # Reset the index (optional, if you want a clean index)
        df_filtered.reset_index(
            drop=True, inplace=True)

        # Renumber 'acct_trade_id' starting from 1
        df_filtered['acct_trade_id'] = df_filtered.index + 1

        # Save the filtered DataFrame
        df_filtered.to_csv(
            'CSV_Files/acct_trade.csv', index=False)

    print(
        "Data generation complete!")
