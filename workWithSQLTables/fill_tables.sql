--First cart
WITH inserted_cart_id AS (
  INSERT INTO carts (user_id, created_at, updated_at, status)
  VALUES
    ('223e4567-e89b-12d3-a456-426614174001', '2023-11-11T12:00:00Z', '2023-11-11T12:30:00Z', 'OPEN')
  RETURNING id
)

INSERT INTO cart_items (cart_id, product_id, count)
SELECT id, '223e4567-e89b-12d3-a456-426614174002', 2 FROM inserted_cart_id
UNION ALL
SELECT id, '323e4567-e89b-12d3-a456-426614174003', 1 FROM inserted_cart_id;

--Second cart
WITH inserted_cart_id AS (
  INSERT INTO carts (user_id, created_at, updated_at, status)
  VALUES
    ('223e4567-e89b-12d3-a456-426614174001', '2023-11-20T12:00:00Z', '2023-11-30T12:30:00Z', 'OPEN')
  RETURNING id
)

INSERT INTO cart_items (cart_id, product_id, count)
SELECT id, '223e4567-e89b-12d3-a456-426614174004', 1 FROM inserted_cart_id
UNION ALL
SELECT id, '323e4567-e89b-12d3-a456-426614174005', 10 FROM inserted_cart_id
UNION ALL
SELECT id, '323e4567-e89b-12d3-a456-426614174006', 3 FROM inserted_cart_id;

--Third cart
WITH inserted_cart_id AS (
  INSERT INTO carts (user_id, created_at, updated_at, status)
  VALUES
    ('223e4567-e89b-12d3-a456-426614174001', '2023-11-02T12:00:00Z', '2023-11-30T12:30:00Z', 'OPEN')
  RETURNING id
)

INSERT INTO cart_items (cart_id, product_id, count)
SELECT id, '223e4567-e89b-12d3-a456-426614174007', 2 FROM inserted_cart_id
UNION ALL
SELECT id, '323e4567-e89b-12d3-a456-426614174008', 2 FROM inserted_cart_id;
