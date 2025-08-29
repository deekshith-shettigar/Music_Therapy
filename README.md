# Music Therapy Tracking Database

## Overview
This project is a Music Therapy Tracking Database designed to manage and track therapeutic music sessions for patients. It stores information about users (patients), songs used in therapy, therapy sessions, and mood logs recorded before and after each session.

## Database Schema
The database schema consists of four main tables:

- **Users**: Stores patient information such as user ID, name, age, gender, email, and registration date. One patient can attend multiple therapy sessions over time.
- **Songs**: Contains details about songs including song ID, title, artist, genre, duration, beats per minute (BPM), energy level, and the date the song was added. One song can be used across multiple therapeutic sessions.
- **Sessions**: Represents therapy sessions linking a patient with a song. It includes session ID, references to user and song, start and end times, session type, therapist notes, and creation date.
- **Mood_Logs**: Records mood assessments for each session, including mood before and after the session, intensity levels, notes on mood changes, and timestamps. Each session generates exactly one mood assessment record.

## ER Diagram

![Database Schema](./ER_Diagram.png.png)

*Note: The above image illustrates the relationships and fields of the database tables.*

## Included SQL Files
- `Users.sql` - SQL script for creating and managing the Users table.
- `Songs.sql` - SQL script for creating and managing the Songs table.
- `Sessions.sql` - SQL script for creating and managing the Sessions table.
- `Mood_Logs.sql` - SQL script for creating and managing the Mood_Logs table.
- `Insert Users.sql`, `Insert Songs.sql`, `Insert Sessions.sql`, `Insert Mood Logs.sql` - SQL scripts for inserting sample data into the respective tables.
- `MusicTherapyDB.sql` - Main database creation script.
- `SELECT_QUERIES.sql` - Sample queries for retrieving data from the database.

## Usage
Use the provided SQL scripts to set up the database schema and populate it with sample data. The database can be used to track patient therapy sessions, songs used, and mood changes over time.

---

This README provides a comprehensive overview of the Music Therapy Tracking Database project and its structure.
