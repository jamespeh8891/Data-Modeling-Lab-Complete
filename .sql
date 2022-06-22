CREATE TABLE users(
user_id SERIAL PRIMARY KEY,
username VARCHAR(30),
email_address VARCHAR(50)
);

CREATE TABLE user_password(
user_password_id SERIAL PRIMARY KEY,
user_id INT NOT NULL REFERENCES users(user_id),
password VARCHAR(1000)
);

CREATE TABLE recipes(
recipe_id SERIAL PRIMARY KEY,
user_id INT NOT NULL REFERENCES users(user_id),
recipe_instructions VARCHAR(500),
recipe_image TEXT, 
ingredients VARCHAR(500)
);

CREATE TABLE ingredients(
recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
ingredient_id SERIAL PRIMARY KEY,
name_of_ingredient VARCHAR(25),
quantity_of_ingredient INT
);

CREATE TABLE grocery_list(
recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
ingredient_id INT NOT NULL REFERENCES ingredients(ingredient_id),
name_of_ingredient VARCHAR(25),
quantity_of_ingredient INT
);

CREATE TABLE occasions(
occasions_id SERIAL PRIMARY KEY,
recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
user_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE occasion_name(
occasion_name_id SERIAL PRIMARY KEY,
occasion_name VARCHAR(30),
recipe_id INT NOT NULL REFERENCES recipes(recipe_id)
);
