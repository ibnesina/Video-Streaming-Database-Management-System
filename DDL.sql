-- DDL
-- Drop Tables
DROP TABLE react;
DROP TABLE watch;
DROP TABLE playlistVideo;
DROP TABLE playlist;
DROP TABLE videoQuality;
DROP TABLE video;
DROP TABLE subscription;
DROP TABLE channel;
DROP TABLE users;

--Table Creation
CREATE TABLE users(
    user_id INTEGER PRIMARY KEY,
    user_name VARCHAR(30),
    user_email VARCHAR(30),
    user_gender VARCHAR(10),
    user_birthday DATE,
    user_country VARCHAR(20),
    user_extra_column VARCHAR(20)
);

CREATE TABLE channel(
    channel_id INTEGER PRIMARY KEY,
    channel_name VARCHAR(30),
    channel_publish_date DATE,
    channel_type VARCHAR(20),
    channel_privacy VARCHAR(10),
    user_id INTEGER,
    FOREIGN KEY(user_id) REFERENCES users
);

CREATE Table subscription(
    subscription_id INT PRIMARY KEY,
    user_id INTEGER,
    channel_id INTEGER,
    subscription_date DATE,
    FOREIGN KEY(user_id) REFERENCES users,
    FOREIGN KEY(channel_id) REFERENCES channel
);

CREATE TABLE video(
    video_id INTEGER PRIMARY KEY,
    channel_id INTEGER,
    video_title VARCHAR(30),
    video_language VARCHAR(20),
    video_upload_date DATE,
    video_duration INT,
    video_type VARCHAR(20),
    video_privacy VARCHAR(10),
    FOREIGN KEY(channel_id) REFERENCES channel
);

CREATE TABLE videoQuality(
    video_quality_id INTEGER,
    video_id INTEGER,
    video_quality VARCHAR(15),
    PRIMARY KEY(video_quality_id, video_id),
    FOREIGN KEY(video_id) REFERENCES video
);

CREATE TABLE playlist(
    playlist_id INTEGER primary key,
    user_id INTEGER,
    playlist_name VARCHAR(30),
    playlist_creation_date DATE,
    playlist_privacy VARCHAR(20),
    FOREIGN KEY(user_id) REFERENCES users
);

CREATE TABLE playlistVideo(
    playlist_id INTEGER,
    video_id INTEGER,
    save_date DATE,
    FOREIGN KEY(video_id) REFERENCES video,
    FOREIGN KEY(playlist_id) REFERENCES playlist
);

CREATE TABLE watch(
    watch_id INT PRIMARY KEY,
    user_id INTEGER,
    video_id INTEGER,
    watch_date DATE,
    FOREIGN KEY(user_id) REFERENCES users,
    FOREIGN KEY(video_id) REFERENCES video
);

create TABLE react(
    react_id int PRIMARY KEY,
    user_id INTEGER,
    video_id INTEGER,
    react_date DATE,
    react_type VARCHAR(10),
    FOREIGN KEY(user_id) REFERENCES users,
    FOREIGN KEY(video_id) REFERENCES video
);

--Tables 
DESC users;
DESC channel;
DESC subscription;
DESC video;
DESC videoQuality;
DESC playlist;
DESC playlistVideo;
DESC watch;
DESC react;