create EXTENSION IF NOT EXISTS "uuid-ossp";

create TABLE IF NOT EXISTS carts (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(8) CHECK (status IN ('OPEN', 'ORDERED'))
);

create TABLE IF NOT EXISTS cart_items (
	cart_id UUID REFERENCES carts(id),
	product_id UUID NOT NULL,
	count INTEGER
)
