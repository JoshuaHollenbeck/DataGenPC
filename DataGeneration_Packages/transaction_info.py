from datetime import datetime, timedelta
from DataGeneration_Packages import trade_info
import random

transactions_data = []

holdings_data = []

# Transactions
def get_transaction_types(transaction_type):
    transaction_types = {
        1: (1, "Deposit", "DEP"),
        2: (2, "Withdrawal", "WDL"),
        3: (3, "Buy", "BUY"),
        4: (4, "Sell", "SELL"),
        5: (5, "Check", "CHK"),
        6: (6, "Debit Card", "DBT"),
        7: (7, "Credit Card", "CRD"),
        8: (8, "Journal", "JRNL"),
        9: (9, "Interest Earned", "I-E"),
        10: (10, "ACH", "ACH"),
        11: (11, "Wire", "WIR"),
    }
    return transaction_types.get(transaction_type)

def generate_transaction_dates(cust_since, closed_date):
    generated_dates = []
    num_transactions = 100
    # random.randint(
    #     100, 5000)

    # Generate range of dates
    for i in range(num_transactions):
        transaction_date = cust_since + \
            timedelta(days=random.randint(
                0, (closed_date - cust_since).days))
        generated_dates.append(
            transaction_date)

    # Sort range of dates from earliest to latest
    generated_dates.sort()

    return generated_dates

def get_transaction_details(acct_type):
    ira_transaction_type_list = [
        1, 3, 4]
    brokerage_transaction_type_list = [
        1, 2, 3, 4, 5, 6, 7, 9, 10, 11]
    checking_transaction_type_list = [
        1, 2, 5, 6, 7, 10, 11]
    savings_transaction_type_list = [
        1, 2, 5, 9, 10, 11]

    if acct_type in [1, 2, 3, 4, 5, 6, 7]:
        type_list = ira_transaction_type_list
        amt_min, amt_max = 50.00, 1000.00

    elif acct_type in [8, 9, 10, 11, 12, 13, 14, 15]:
        type_list = brokerage_transaction_type_list
        amt_min, amt_max = 50.00, 1000.00

    elif acct_type in [16, 17]:
        type_list = checking_transaction_type_list
        amt_min, amt_max = 25.00, 100.00

    else:
        type_list = savings_transaction_type_list
        amt_min, amt_max = None, None

    transaction_type = random.choice(
        type_list)
    transaction_info = get_transaction_types(
        transaction_type)

    return transaction_type, transaction_info, amt_min, amt_max

def generate_transactions(acct_num, acct_type, generated_dates, acct_bal_value):
    temp_transactions = []
    stock_info = {}
    final_acct_balances = {}

    # Start with a positive initial balance if the current balance is 0.
    # Ensure the first transaction is a deposit (type 1).
    if acct_bal_value == 0:
        initial_deposit = round(random.uniform(2500.00, 5000.00), 4)
        temp_transactions.append({
            "acct_num": acct_num,
            "acct_type": acct_type,
            "transaction_type": 1,
            "transaction_amt": initial_deposit,
            "transaction_date": generated_dates[0].strftime("%Y-%m-%d"),
            "pre_bal": acct_bal_value,
            "post_bal": initial_deposit,
            "rep_id": None
        })
        acct_bal_value += initial_deposit  # Update the account balance to reflect the deposit.
    
    running_balance = acct_bal_value  # Update the running balance to reflect the initial deposit.
    
    for transaction_date in generated_dates:
        trade_status = "5"
        trade_fees = "00.00"
        currency = "USD"
        transaction_date_str = transaction_date.strftime(
            "%Y-%m-%d")
        stock_exchange, stock_id, trade_price = trade_info.generate_trade()
        sell_quantity = random.randint(
            1, 5)

        if acct_type in [1, 2, 3, 4, 5, 6, 7]:
            transaction_type, transaction_info, amt_min, amt_max = get_transaction_details(
                acct_type)
            if transaction_info[0] == 4:
                transaction_amt = round(
                    sell_quantity * trade_price, 4)
            else:
                transaction_amt = round(
                    random.uniform(amt_min, amt_max), 4)
            buy_quantity = round(
                transaction_amt / trade_price, 4)

            # Buy
            if transaction_info[0] == 3:
                transaction_data = {
                    "acct_num": acct_num,
                    "acct_type": acct_type,
                    "transaction_type": transaction_info[0],
                    "transaction_amt": transaction_amt,
                    "transaction_date": transaction_date_str,
                    "stock_exchange": stock_exchange,
                    "stock_id": stock_id,
                    "trade_quantity": buy_quantity,
                    "trade_price": trade_price,
                    "trade_amount": transaction_amt,
                    "trade_status": trade_status,
                    "trade_fees": trade_fees,
                    "currency": currency,
                    "rep_id": None
                }
                temp_transactions.append(
                    transaction_data)

                if stock_id not in stock_info:
                    stock_info[stock_id] = {
                        "quantity": 0, "total_cost": 0.0}

                if stock_id in stock_info:
                    stock_info[stock_id]["quantity"] += buy_quantity
                    stock_info[stock_id]["total_cost"] += transaction_amt

            # Sell
            elif transaction_info[0] == 4:
                transaction_data = {
                    "acct_num": acct_num,
                    "acct_type": acct_type,
                    "transaction_type": transaction_info[0],
                    "transaction_amt": transaction_amt,
                    "transaction_date": transaction_date_str,
                    "stock_exchange": stock_exchange,
                    "stock_id": stock_id,
                    "trade_quantity": sell_quantity,
                    "trade_price": trade_price,
                    "trade_amount": transaction_amt,
                    "trade_status": trade_status,
                    "trade_fees": trade_fees,
                    "currency": currency,
                    "rep_id": None
                }
                temp_transactions.append(
                    transaction_data)

                if stock_id not in stock_info:
                    stock_info[stock_id] = {
                        "quantity": 0, "total_cost": 0.0}

                if stock_id in stock_info:
                    stock_info[stock_id]["quantity"] -= sell_quantity
                    stock_info[stock_id]["total_cost"] -= transaction_amt

            else:
                transaction_data = {
                    "acct_num": acct_num,
                    "acct_type": acct_type,
                    "transaction_type": transaction_info[0],
                    "transaction_amt": transaction_amt,
                    "transaction_date": transaction_date_str,
                    "rep_id": None
                }
                temp_transactions.append(
                    transaction_data)

        elif acct_type in [8, 9, 10, 11, 12, 13, 14, 15]:
            transaction_type, transaction_info, amt_min, amt_max = get_transaction_details(
                acct_type)
            if transaction_info[0] == 4:
                transaction_amt = round(
                    sell_quantity * trade_price, 4)
            else:
                transaction_amt = round(
                    random.uniform(amt_min, amt_max), 4)
            buy_quantity = round(
                transaction_amt / trade_price, 4)

            # Buy
            if transaction_info[0] == 3:
                transaction_data = {
                    "acct_num": acct_num,
                    "acct_type": acct_type,
                    "transaction_type": transaction_info[0],
                    "transaction_amt": transaction_amt,
                    "transaction_date": transaction_date_str,
                    "stock_exchange": stock_exchange,
                    "stock_id": stock_id,
                    "trade_quantity": buy_quantity,
                    "trade_price": trade_price,
                    "trade_amount": transaction_amt,
                    "trade_status": trade_status,
                    "trade_fees": trade_fees,
                    "currency": currency,
                    "rep_id": None
                }
                temp_transactions.append(
                    transaction_data)

                if stock_id not in stock_info:
                    stock_info[stock_id] = {
                        "quantity": 0, "total_cost": 0.0}

                if stock_id in stock_info:
                    stock_info[stock_id]["quantity"] += buy_quantity
                    stock_info[stock_id]["total_cost"] += transaction_amt

            # Sell
            elif transaction_info[0] == 4:
                transaction_data = {
                    "acct_num": acct_num,
                    "acct_type": acct_type,
                    "transaction_type": transaction_info[0],
                    "transaction_amt": transaction_amt,
                    "transaction_date": transaction_date_str,
                    "stock_exchange": stock_exchange,
                    "stock_id": stock_id,
                    "trade_quantity": sell_quantity,
                    "trade_price": trade_price,
                    "trade_amount": transaction_amt,
                    "trade_status": trade_status,
                    "trade_fees": trade_fees,
                    "currency": currency,
                    "rep_id": None
                }
                temp_transactions.append(
                    transaction_data)

                if stock_id not in stock_info:
                    stock_info[stock_id] = {
                        "quantity": 0, "total_cost": 0.0}

                if stock_id in stock_info:
                    stock_info[stock_id]["quantity"] -= sell_quantity
                    stock_info[stock_id]["total_cost"] -= transaction_amt

            else:
                transaction_data = {
                    "acct_num": acct_num,
                    "acct_type": acct_type,
                    "transaction_type": transaction_info[0],
                    "transaction_amt": transaction_amt,
                    "transaction_date": transaction_date_str,
                    "rep_id": None
                }
                temp_transactions.append(
                    transaction_data)

        elif acct_type in [16, 17]:
            transaction_type, transaction_info, amt_min, amt_max = get_transaction_details(
                acct_type)
            transaction_amt = round(
                random.uniform(amt_min, amt_max), 4)

            transaction_data = {
                "acct_num": acct_num,
                "acct_type": acct_type,
                "transaction_type": transaction_info[0],
                "transaction_amt": transaction_amt,
                "transaction_date": transaction_date_str,
                "rep_id": None
            }
            temp_transactions.append(
                transaction_data)

        else:
            transaction_type, transaction_info, amt_min, amt_max = get_transaction_details(
                acct_type)

            if transaction_info[0] == 9:
                savings_transaction_amt = round(
                    acct_bal_value * 0.0045, 4)
            else:
                savings_transaction_amt = round(
                    random.uniform(25.00, 50.00), 4)

            transaction_data = {
                "acct_num": acct_num,
                "acct_type": acct_type,
                "transaction_type": transaction_info[0],
                "transaction_amt": savings_transaction_amt,
                "transaction_date": transaction_date_str,
                "rep_id": None
            }
            temp_transactions.append(
                transaction_data)

    # First loop for preprocessing transactions based on running_balance
    for transaction in temp_transactions:
        transaction_type = transaction["transaction_type"]
        transaction_amt = transaction["transaction_amt"]
        acct_num = transaction["acct_num"]
        
        if running_balance <= 1000:
            transaction["transaction_type"] = 1
            transaction_amt = round(
                random.uniform(2500.00, 5000.00), 4)
            transaction["transaction_amt"] = transaction_amt
        
        transaction['pre_bal'] = running_balance

        if transaction_type in [1, 4]:    
            running_balance += transaction_amt
        else:
            running_balance -= transaction_amt

        transaction['post_bal'] = running_balance

    # Second loop for actually processing transactions
    for transaction in temp_transactions:
        acct_num = transaction["acct_num"]
        # Capture the current balance as the previous balance before modifying it
        previous_bal = acct_bal_value

        transaction_type = transaction["transaction_type"]
        transaction_amt = transaction["transaction_amt"]

        if transaction_type in [1, 4]:
            acct_bal_value += transaction_amt
        else:
            acct_bal_value -= transaction_amt

         # Set stock trade-related fields to None for non-trade transactions
        if transaction_type not in [3, 4]:  # Assuming 3 and 4 are valid trade types
            transaction["stock_exchange"] = None
            transaction["stock_id"] = None
            transaction["trade_quantity"] = None
            transaction["trade_price"] = None
            transaction["trade_amount"] = None
            transaction["trade_status"] = None
            transaction["trade_fees"] = None
            transaction["currency"] = None

        # Proceed with setting transaction and balance details
        final_acct_balances[acct_num] = round(
            acct_bal_value, 4)
        transaction["transaction_id"] = len(
            transactions_data) + 1
        transaction["pre_bal"] = round(
            previous_bal, 4)
        transaction["post_bal"] = round(
            acct_bal_value, 4)
        transactions_data.append(
            transaction)

    return stock_info, final_acct_balances

def holding_total(acct_num, acct_type, stock_info):
    for stock_id in stock_info:
        if stock_info[stock_id]["quantity"] > 0:
            average_cost = stock_info[stock_id]["total_cost"] / \
                stock_info[stock_id]["quantity"]
        else:
            average_cost = 0.0

        holding_data = {
            "acct_num": acct_num,
            "acct_type": acct_type,
            "stock_id": stock_id,
            "quantity": round(stock_info[stock_id]["quantity"], 4),
            "average_cost": round(average_cost, 4)
        }
        holdings_data.append(
            holding_data)
