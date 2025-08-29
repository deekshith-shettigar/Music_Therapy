-- Mood_Logs table (before and after listening)
CREATE TABLE Mood_Logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    session_id INT,
    mood_before ENUM('Very Sad', 'Sad', 'Neutral', 'Happy', 'Very Happy', 'Anxious', 'Stressed', 'Calm', 'Excited', 'Angry') NOT NULL,
    mood_after ENUM('Very Sad', 'Sad', 'Neutral', 'Happy', 'Very Happy', 'Anxious', 'Stressed', 'Calm', 'Excited', 'Angry') NOT NULL,
    mood_intensity_before INT CHECK (mood_intensity_before BETWEEN 1 AND 10), -- 1-10 scale
    mood_intensity_after INT CHECK (mood_intensity_after BETWEEN 1 AND 10),
    mood_change_notes TEXT,
    logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id) REFERENCES Sessions(session_id) ON DELETE CASCADE
);