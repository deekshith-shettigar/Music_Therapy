-- Insert Sessions
INSERT INTO Sessions (user_id, song_id, start_time, end_time, session_type, therapist_notes) VALUES
(1, 1, '2024-01-15 10:00:00', '2024-01-15 10:08:00', 'Individual', 'Patient showed signs of relaxation during ambient music'),
(1, 2, '2024-01-16 14:30:00', '2024-01-16 14:35:00', 'Individual', 'Classical music helped with anxiety reduction'),
(2, 3, '2024-01-17 11:00:00', '2024-01-17 11:07:30', 'Individual', 'Patient engaged well with alternative rock'),
(2, 4, '2024-01-18 15:00:00', '2024-01-18 15:03:30', 'Individual', 'Emotional processing session'),
(3, 5, '2024-01-19 09:30:00', '2024-01-19 09:33:00', 'Group', 'Group discussion about silence and reflection'),
(3, 6, '2024-01-20 16:00:00', '2024-01-20 16:04:00', 'Individual', 'Working through emotional expression'),
(4, 7, '2024-01-21 13:00:00', '2024-01-21 13:03:40', 'Individual', 'Processing grief and loss'),
(4, 8, '2024-01-22 10:30:00', '2024-01-22 10:37:00', 'Individual', 'Spiritual and emotional healing focus'),
(5, 9, '2024-01-23 14:00:00', '2024-01-23 14:04:30', 'Self-directed', 'Patient chose song for personal reflection'),
(5, 10, '2024-01-24 11:30:00', '2024-01-24 11:36:30', 'Individual', 'Exploring darker emotions safely'),
(6, 11, '2024-01-25 15:30:00', '2024-01-25 15:34:50', 'Individual', 'Indie folk resonated well with patient'),
(6, 12, '2024-01-26 12:00:00', '2024-01-26 12:06:20', 'Individual', 'Nature imagery in music helped with grounding'),
(7, 13, '2024-01-27 16:30:00', '2024-01-27 16:34:00', 'Group', 'Seasonal affective disorder group session'),
(7, 14, '2024-01-28 10:00:00', '2024-01-28 10:03:20', 'Individual', 'Working through relationship issues'),
(8, 15, '2024-01-29 13:30:00', '2024-01-29 13:35:10', 'Individual', 'Hope and healing focused session'),
(1, 11, '2024-01-30 11:00:00', '2024-01-30 11:03:50', 'Individual', 'Follow-up session showing progress'),
(2, 15, '2024-01-31 14:00:00', '2024-01-31 14:04:50', 'Individual', 'Positive mood enhancement session');

select * from Sessions;