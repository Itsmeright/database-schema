
CREATE TABLE suppliers(
	s_id SERIAL UNIQUE PRIMARY KEY,
	suppliers_name VARCHAR (250) UNIQUE NOT NULL,
	country VARCHAR (50) NOT NULL,
	product_name VARCHAR (250) NOT NULL, 
	cost_price MONEY NOT NULL
);

CREATE TABLE products(
	p_id SERIAL UNIQUE PRIMARY KEY,
	s_id INTEGER UNIQUE REFERENCES suppliers(s_id),
	product_name VARCHAR(250) UNIQUE NOT NULL,
	description TEXT NOT NULL,
	product_category VARCHAR(50) NOT NULL,
	price MONEY NOT NULL
	
);

CREATE TABLE customers(
	c_id SERIAL UNIQUE PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	address VARCHAR(250) NOT NULL,
	date_of_birth DATE NOT NULL,
	gender CHAR (50),
	email VARCHAR(250) UNIQUE NOT NULL,
	card_numbers INTEGER NOT NULL,
	security_code INTEGER NOT NULL,
	expiry_date INTEGER NOT NULL,
	phone_number VARCHAR(50) NOT NULL,
	date_accessed TIMESTAMP NOT NULL
);


CREATE TABLE orders (
	o_id SERIAL UNIQUE PRIMARY KEY,
	order_date TIMESTAMP NOT NULL,
	c_id INTEGER UNIQUE REFERENCES customers(c_id),
	p_id INTEGER UNIQUE REFERENCES products(p_id),
	delivery_date DATE NOT NULL,
	price MONEY UNIQUE NOT NULL 
	
);

CREATE TABLE payments(
	id SERIAL UNIQUE PRIMARY KEY,
	o_id INTEGER UNIQUE NOT NULL REFERENCES orders(o_id),
	c_id INTEGER UNIQUE NOT NULL REFERENCES customers(c_id)
);

CREATE TABLE logistics(
	l_id SERIAL UNIQUE PRIMARY KEY,
	company VARCHAR(250) UNIQUE NOT NULL,
	liason VARCHAR (250) NOT NULL

);


CREATE TABLE reviews(

	r_id SERIAL UNIQUE PRIMARY KEY,
	o_id INTEGER UNIQUE NOT NULL REFERENCES orders(o_id),
	delivery_fulfilled BOOLEAN NOT NULL,
	delivery_date DATE NOT NULL,
	d_id INTEGER UNIQUE NOT NULL REFERENCES logistics(l_id),
	returned BOOLEAN NOT NULL,
	review TEXT 
)
