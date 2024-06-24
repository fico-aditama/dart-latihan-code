ALTER TABLE products
ADD COLUMN IF NOT EXISTS product_qty INT;

UPDATE your_table
SET product_quantity = FLOOR(1 + RAND() * 9);
