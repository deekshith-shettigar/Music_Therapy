-- Songs table
CREATE TABLE Songs (
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    artist VARCHAR(150) NOT NULL,
    genre VARCHAR(50),
    duration INT, -- duration in seconds
    bpm INT, -- beats per minute
    energy_level ENUM('Low', 'Medium', 'High'), -- for therapy categorization
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);