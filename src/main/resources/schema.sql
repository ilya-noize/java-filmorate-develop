DROP ALL OBJECTS;

CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(30),
    login VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    birthday DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS mpa (
    mpa_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS films (
    film_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    mpa_id INTEGER REFERENCES mpa (mpa_id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(200) NOT NULL,
    duration INTEGER NOT NULL,
    release_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS likes (
    like_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    film_id INTEGER REFERENCES films (film_id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users (user_id) ON DELETE CASCADE,
    UNIQUE (film_id, user_id)
);

CREATE TABLE IF NOT EXISTS genre_types (
    genre_types_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS genres (
    genre_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    genre_types_id INTEGER REFERENCES genre_types (genre_types_id) ON DELETE CASCADE,
    film_id INTEGER REFERENCES films (film_id) ON DELETE CASCADE,
    UNIQUE (genre_types_id, film_id)
);

CREATE TABLE IF NOT EXISTS friends (
    user1_id INTEGER REFERENCES users (user_id) ON DELETE CASCADE,
    user2_id INTEGER REFERENCES users (user_id) ON DELETE CASCADE,
    PRIMARY KEY (user1_id, user2_id)
);