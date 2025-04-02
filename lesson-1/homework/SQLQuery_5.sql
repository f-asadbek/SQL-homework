CREATE TABLE account (
    account_id INT CONSTRAINT pk_account_id PRIMARY KEY,
    balance DECIMAL CONSTRAINT chk_balance CHECK (balance >= 0),
    account_type VARCHAR(255) CONSTRAINT chk_account_type CHECK (account_type IN ('Saving', 'Checking'))
);

ALTER TABLE account
DROP CONSTRAINT chk_balance;

ALTER TABLE account
DROP CONSTRAINT chk_account_type;

ALTER TABLE account
ADD CONSTRAINT chk_balance CHECK (balance >= 0);

ALTER TABLE account
ADD CONSTRAINT chk_account_type CHECK (account_type IN ('Saving', 'Checking'));