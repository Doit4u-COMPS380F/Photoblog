-- -- INSERT INTO PHOTO (username, caption) VALUES ('admin', 'This is a test caption');
--
-- INSERT INTO users (username, password) SELECT 'admin', '{noop}adminpw' WHERE NOT EXISTS (SELECT * FROM users WHERE username = 'admin');
-- INSERT INTO user_roles (username, role) SELECT 'admin', 'ROLE_USER' WHERE NOT EXISTS (SELECT * FROM user_roles WHERE username = 'admin' AND role = 'ROLE_USER');
-- INSERT INTO user_roles (username, role) SELECT 'admin', 'ROLE_ADMIN' WHERE NOT EXISTS (SELECT * FROM user_roles WHERE username = 'admin' AND role = 'ROLE_ADMIN');
--
-- INSERT INTO users (username, password) SELECT 'user1', '{noop}user1pw' WHERE NOT EXISTS (SELECT * FROM users WHERE username = 'user1');
-- INSERT INTO user_roles (username, role) SELECT 'user1', 'ROLE_USER' WHERE NOT EXISTS (SELECT * FROM user_roles WHERE username = 'user1');
--
-- INSERT INTO users (username, password) SELECT 'user2', '{noop}user2pw' WHERE NOT EXISTS (SELECT * FROM users WHERE username = 'user2');
-- INSERT INTO user_roles (username, role) SELECT 'user2', 'ROLE_USER' WHERE NOT EXISTS (SELECT * FROM user_roles WHERE username = 'user2');

-- admin adminPw! ADMIN USER
-- keith keithPw! ADMIN USER
-- user1 user1Pw! USER
-- user2 user2Pw! USER