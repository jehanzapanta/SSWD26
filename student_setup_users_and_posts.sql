CREATE TABLE IF NOT EXISTS user (
    userId INTEGER PRIMARY KEY AUTOINCREMENT,
    user_name TEXT NOT NULL
);

INSERT INTO user (userId,user_name) VALUES (1,'Bob'),(2,'Alice'),(3,'Sydney');

-- CREATE THE vw_users VIEW HERE

CREATE VIEW IF NOT EXISTS vw_users AS
    SELECT 
        userId AS Id,
        user_name AS User
    FROM user;

CREATE TABLE IF NOT EXISTS blog_posts (
    postId INTEGER PRIMARY KEY AUTOINCREMENT,
    userId INTEGER NOT NULL REFERENCES user(userId),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    post_message TEXT NOT NULL
);
-- CREATE INSERTS FOR THE blog_posts TABLE HERE
INSERT INTO blog_posts (userId,post_message) VALUES (2,'HELLO');
INSERT INTO blog_posts (userId,post_message) VALUES (1,'HI');
INSERT INTO blog_posts (userId,post_message) VALUES (3,'HOLA');
INSERT INTO blog_posts (userId,post_message) VALUES (2,'WELCOME');

-- CREATE THE VIEW vw_posts HERE. THE VIEW SHOULD 
-- INCLUDE THE userId, user_name, created_at, and message
CREATE VIEW vw_posts AS
    SELECT
        u.userId As Id,
        u.user_name as User,
        p.created_at,
        p.post_message
    FROM
        blog_posts AS p 
    JOIN
        user AS u
    ON 
        p.userId = u.userId;




