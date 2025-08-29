-- Insert Mood Logs
INSERT INTO Mood_Logs (session_id, mood_before, mood_after, mood_intensity_before, mood_intensity_after, mood_change_notes) VALUES
(1, 'Anxious', 'Calm', 8, 4, 'Significant reduction in anxiety levels after ambient music'),
(2, 'Stressed', 'Neutral', 7, 5, 'Classical music helped achieve emotional balance'),
(3, 'Sad', 'Neutral', 6, 5, 'Slight improvement in mood'),
(4, 'Very Sad', 'Sad', 9, 7, 'Music helped process difficult emotions'),
(5, 'Stressed', 'Calm', 8, 3, 'Group setting enhanced the calming effect'),
(6, 'Sad', 'Happy', 6, 7, 'Breakthrough session with emotional release'),
(7, 'Very Sad', 'Sad', 9, 6, 'Music provided comfort during grief processing'),
(8, 'Sad', 'Calm', 7, 4, 'Spiritual aspects of music were healing'),
(9, 'Neutral', 'Happy', 5, 7, 'Patient chose music that elevated mood'),
(10, 'Angry', 'Neutral', 8, 5, 'Music helped channel and process anger'),
(11, 'Anxious', 'Calm', 7, 4, 'Indie folk music was particularly soothing'),
(12, 'Stressed', 'Happy', 8, 7, 'Nature themes in music created positive shift'),
(13, 'Very Sad', 'Neutral', 9, 5, 'Group support combined with music was effective'),
(14, 'Sad', 'Calm', 6, 4, 'Music helped process relationship emotions'),
(15, 'Neutral', 'Very Happy', 5, 9, 'Uplifting music created significant joy'),
(16, 'Anxious', 'Happy', 6, 8, 'Continued progress with familiar therapeutic music'),
(17, 'Stressed', 'Very Happy', 7, 9, 'Coldplay session was particularly effective');

select * from Mood_Logs;