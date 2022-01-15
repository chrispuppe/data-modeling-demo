DROP TABLE IF EXISTS food_for_occasions;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS occasions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id SERIAL NOT NULL PRIMARY KEY,
    email_address VARCHAR(60),
    password VARCHAR(60),
    first_name VARCHAR(40),
    last_name VARCHAR(40)
);

CREATE TABLE recipes (
    recipe_id SERIAL NOT NULL PRIMARY KEY,
    recipe_name VARCHAR(100),
    user_id INTEGER REFERENCES users(user_id),
    ingredients TEXT,
    instructions TEXT,
    visibility BOOLEAN
);

CREATE TABLE occasions (
    occasions_id SERIAL NOT NULL PRIMARY KEY,
    occasion_name VARCHAR(80),
    user_id INTEGER REFERENCES users(user_id)
);

CREATE TABLE food_for_occasions (
    food_for_occasions_id SERIAL NOT NULL PRIMARY KEY,
    recipe_id INTEGER REFERENCES recipes(recipe_id),
    occasions_id INTEGER REFERENCES occasions(occasions_id)
);