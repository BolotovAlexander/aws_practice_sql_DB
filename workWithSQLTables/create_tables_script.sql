create EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255)
);

create TABLE IF NOT EXISTS carts (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(8) CHECK (status IN ('OPEN', 'ORDERED')),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

create TABLE IF NOT EXISTS cart_items (
	cart_id UUID,
	product_id UUID NOT NULL,
	count INTEGER,
    FOREIGN KEY (cart_id) REFERENCES carts(id)
    ON DELETE CASCADE ON UPDATE CASCADE
)

create TABLE IF NOT EXISTS orders (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    cart_id UUID,
    payment JSON,
    delivery JSON,
    comments TEXT,
    status TEXT,
    total INTEGER,
    FOREIGN KEY (cart_id) REFERENCES carts(id)
);