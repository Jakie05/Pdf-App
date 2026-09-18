CREATE TABLE technologies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    technology_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_category_technology
        FOREIGN KEY (technology_id)
        REFERENCES technologies(id)
        ON DELETE CASCADE,

    CONSTRAINT unique_category_per_technology
        UNIQUE (technology_id, name)
);

CREATE TABLE questions (
    id SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL,
    question TEXT NOT NULL,
    answer TEXT,
    explanation TEXT,
    difficulty VARCHAR(20) NOT NULL DEFAULT 'medium',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_question_category
        FOREIGN KEY (category_id)
        REFERENCES categories(id)
        ON DELETE CASCADE,

    CONSTRAINT check_difficulty
        CHECK (difficulty IN ('easy', 'medium', 'hard'))
);
