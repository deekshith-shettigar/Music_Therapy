-- Find all therapy sessions of a specific user
SELECT 
    u.name,
    s.title,
    s.artist,
    se.start_time,
    se.end_time,
    se.session_type,
    TIMESTAMPDIFF(MINUTE, se.start_time, se.end_time) AS duration_minutes
FROM Sessions se
JOIN Users u ON se.user_id = u.user_id
JOIN Songs s ON se.song_id = s.song_id
WHERE u.name = 'Alice Johnson'
ORDER BY se.start_time;

-- Track mood improvement after each session
SELECT 
    u.name,
    s.title,
    s.artist,
    m.mood_before,
    m.mood_after,
    m.mood_intensity_before,
    m.mood_intensity_after,
    (m.mood_intensity_after - m.mood_intensity_before) AS mood_change_score,
    m.mood_change_notes
FROM Mood_Logs m
JOIN Sessions se ON m.session_id = se.session_id
JOIN Users u ON se.user_id = u.user_id
JOIN Songs s ON se.song_id = s.song_id
ORDER BY u.name, se.start_time;

-- Songs that improve mood the most (by frequency of positive changes)
SELECT 
    s.title,
    s.artist,
    s.genre,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN m.mood_intensity_after > m.mood_intensity_before THEN 1 ELSE 0 END) AS improvement_count,
    ROUND(AVG(m.mood_intensity_after - m.mood_intensity_before), 2) AS avg_mood_change,
    ROUND(
        (SUM(CASE WHEN m.mood_intensity_after > m.mood_intensity_before THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 
        2
    ) AS improvement_percentage
FROM Mood_Logs m
JOIN Sessions se ON m.session_id = se.session_id
JOIN Songs s ON se.song_id = s.song_id
GROUP BY s.song_id, s.title, s.artist, s.genre
HAVING COUNT(*) >= 1
ORDER BY improvement_percentage DESC, avg_mood_change DESC;

-- Most common mood transitions (before → after)
SELECT 
    mood_before,
    mood_after,
    COUNT(*) AS frequency,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Mood_Logs), 2) AS percentage
FROM Mood_Logs
GROUP BY mood_before, mood_after
ORDER BY frequency DESC;

-- Average session duration by genre
SELECT 
    s.genre,
    COUNT(*) AS session_count,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, se.start_time, se.end_time)), 2) AS avg_duration_minutes,
    ROUND(AVG(s.duration / 60.0), 2) AS avg_song_duration_minutes,
    ROUND(AVG(s.bpm), 0) AS avg_bpm
FROM Sessions se
JOIN Songs s ON se.song_id = s.song_id
WHERE se.end_time IS NOT NULL
GROUP BY s.genre
ORDER BY avg_duration_minutes DESC;

-- Patient progress over time (mood improvement trends)
SELECT 
    u.name,
    COUNT(*) AS total_sessions,
    ROUND(AVG(m.mood_intensity_before), 2) AS avg_starting_mood,
    ROUND(AVG(m.mood_intensity_after), 2) AS avg_ending_mood,
    ROUND(AVG(m.mood_intensity_after - m.mood_intensity_before), 2) AS avg_improvement,
    SUM(CASE WHEN m.mood_intensity_after > m.mood_intensity_before THEN 1 ELSE 0 END) AS sessions_with_improvement,
    ROUND(
        (SUM(CASE WHEN m.mood_intensity_after > m.mood_intensity_before THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 
        2
    ) AS improvement_rate_percentage
FROM Users u
JOIN Sessions se ON u.user_id = se.user_id
JOIN Mood_Logs m ON se.session_id = m.session_id
GROUP BY u.user_id, u.name
ORDER BY avg_improvement DESC;

-- Most effective genres for specific starting moods
SELECT 
    m.mood_before,
    s.genre,
    COUNT(*) AS session_count,
    ROUND(AVG(m.mood_intensity_after - m.mood_intensity_before), 2) AS avg_improvement,
    SUM(CASE WHEN m.mood_intensity_after > m.mood_intensity_before THEN 1 ELSE 0 END) AS improvement_count
FROM Mood_Logs m
JOIN Sessions se ON m.session_id = se.session_id
JOIN Songs s ON se.song_id = s.song_id
GROUP BY m.mood_before, s.genre
HAVING COUNT(*) >= 1
ORDER BY m.mood_before, avg_improvement DESC;

-- Session effectiveness by time of day
SELECT 
    CASE 
        WHEN HOUR(se.start_time) BETWEEN 6 AND 11 THEN 'Morning (6-11 AM)'
        WHEN HOUR(se.start_time) BETWEEN 12 AND 17 THEN 'Afternoon (12-5 PM)'
        WHEN HOUR(se.start_time) BETWEEN 18 AND 21 THEN 'Evening (6-9 PM)'
        ELSE 'Night/Early Morning'
    END AS time_period,
    COUNT(*) AS session_count,
    ROUND(AVG(m.mood_intensity_after - m.mood_intensity_before), 2) AS avg_mood_improvement,
    SUM(CASE WHEN m.mood_intensity_after > m.mood_intensity_before THEN 1 ELSE 0 END) AS sessions_improved,
    ROUND(
        (SUM(CASE WHEN m.mood_intensity_after > m.mood_intensity_before THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 
        2
    ) AS improvement_percentage
FROM Sessions se
JOIN Mood_Logs m ON se.session_id = m.session_id
GROUP BY time_period
ORDER BY avg_mood_improvement DESC;

-- Songs with consistent positive outcomes (low variance, high improvement)
SELECT 
    s.title,
    s.artist,
    s.genre,
    COUNT(*) AS session_count,
    ROUND(AVG(m.mood_intensity_after - m.mood_intensity_before), 2) AS avg_improvement,
    ROUND(STDDEV(m.mood_intensity_after - m.mood_intensity_before), 2) AS improvement_variance,
    MIN(m.mood_intensity_after - m.mood_intensity_before) AS min_improvement,
    MAX(m.mood_intensity_after - m.mood_intensity_before) AS max_improvement
FROM Songs s
JOIN Sessions se ON s.song_id = se.song_id
JOIN Mood_Logs m ON se.session_id = m.session_id
GROUP BY s.song_id, s.title, s.artist, s.genre
HAVING COUNT(*) >= 2 AND AVG(m.mood_intensity_after - m.mood_intensity_before) > 0
ORDER BY avg_improvement DESC, improvement_variance ASC;

-- Monthly therapy session summary
SELECT 
    DATE_FORMAT(se.start_time, '%Y-%m') AS month,
    COUNT(DISTINCT se.user_id) AS unique_patients,
    COUNT(*) AS total_sessions,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, se.start_time, se.end_time)), 2) AS avg_session_duration,
    ROUND(AVG(m.mood_intensity_after - m.mood_intensity_before), 2) AS avg_mood_improvement
FROM Sessions se
JOIN Mood_Logs m ON se.session_id = m.session_id
WHERE se.end_time IS NOT NULL
GROUP BY DATE_FORMAT(se.start_time, '%Y-%m')
ORDER BY month;

-- Patient demographics and outcomes
SELECT 
    u.gender,
    u.age,
    COUNT(*) AS total_sessions,
    ROUND(AVG(m.mood_intensity_before), 2) AS avg_pre_session_mood,
    ROUND(AVG(m.mood_intensity_after), 2) AS avg_post_session_mood,
    ROUND(AVG(m.mood_intensity_after - m.mood_intensity_before), 2) AS avg_improvement
FROM Users u
JOIN Sessions se ON u.user_id = se.user_id
JOIN Mood_Logs m ON se.session_id = m.session_id
GROUP BY u.gender, u.age
ORDER BY avg_improvement DESC;


