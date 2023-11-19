WITH inserted_cart_id AS (
  INSERT INTO carts (user_id, created_at, updated_at, status)
  VALUES
    ('T2xla3NhbmRyX0JvbG90b3Y6VEVTVF9QQVNTV09SRA==', '2023-11-20T12:00:00Z', '2023-11-30T12:30:00Z', 'OPEN')
  RETURNING id
)
// TODO change id

INSERT INTO cart_items (cart_id, product_id, count)
SELECT id, '80091538-6e85-45ca-a21f-6c7c780c8a31', 1 FROM inserted_cart_id
UNION ALL
SELECT id, 'a8b0ab34-2af1-4d77-b546-579b09d3ae5f', 2 FROM inserted_cart_id
UNION ALL
SELECT id, '6f3196f9-0528-43a0-8177-b54988a2b338', 3 FROM inserted_cart_id;