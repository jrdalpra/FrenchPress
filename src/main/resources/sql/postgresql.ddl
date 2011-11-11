CREATE TABLE IF NOT EXISTS mediaitems (ID BIGINT NOT NULL, MIMETYPE VARCHAR(255), NAME VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE IF NOT EXISTS comments (ID BIGINT NOT NULL, AUTHOREMAIL VARCHAR(255), AUTHORNAME VARCHAR(255), AUTHORURL VARCHAR(255), BODY VARCHAR(255), AUTHOR_ID BIGINT, PRIMARY KEY (ID))
CREATE TABLE IF NOT EXISTS pages (ID BIGINT NOT NULL, BODY TEXT, TITLE VARCHAR(255), AUTHOR_ID BIGINT, PRIMARY KEY (ID))
CREATE TABLE IF NOT EXISTS users (ID BIGINT NOT NULL, EMAILADDRESS VARCHAR(255), FIRSTNAME VARCHAR(255), LASTNAME VARCHAR(255), PASSWORD VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE IF NOT EXISTS settings (ID BIGINT NOT NULL, PRIMARY KEY (ID))
CREATE TABLE IF NOT EXISTS attachments (ID BIGINT NOT NULL, MIMETYPE VARCHAR(255), NAME VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE IF NOT EXISTS posts (ID BIGINT NOT NULL, BODY TEXT, SLUG VARCHAR(255), TITLE VARCHAR(255), AUTHOR_ID BIGINT, POSTED TIMESTAMP, PRIMARY KEY (ID))
ALTER TABLE posts ADD CONSTRAINT UNQ_posts_0 UNIQUE (slug)
ALTER TABLE posts ADD CONSTRAINT FK_posts_AUTHOR_ID FOREIGN KEY (AUTHOR_ID) REFERENCES users (ID)
ALTER TABLE comments ADD CONSTRAINT FK_comments_AUTHOR_ID FOREIGN KEY (AUTHOR_ID) REFERENCES users (ID)
ALTER TABLE pages ADD CONSTRAINT FK_pages_AUTHOR_ID FOREIGN KEY (AUTHOR_ID) REFERENCES users (ID)
