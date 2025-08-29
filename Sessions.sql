-- Sessions table (when a user listens to a song for therapy)
CREATE TABLE Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    song_id INT,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    session_type ENUM('Individual', 'Group', 'Self-directed') DEFAULT 'Individual',
    therapist_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (song_id) REFERENCES Songs(song_id) ON DELETE CASCADE
);