
 --SPOTIFY REAL DATA--

-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

select * from spotify;

select count(*) from spotify;

select count(distinct artist) as total_artist from spotify;

select count(distinct album ) as total_album from spotify;

select distinct album_type from spotify;

----------------------------------------------------------------------------------------------------------------------------------------------------------

--- DATA ANALYSIS -- 

-- Retrieve the names of all tracks that have more than 1 billion streams.
select count(track) from spotify where stream > 1000000000;


-- List all albums along with their respective artists.
select distinct album,artist from spotify order by 1;

	
-- Get the total number of comments for tracks where licensed = TRUE.

select sum(comments) from spotify where licensed = 'true';


-- Find all tracks that belong to the album type single.


select track from spotify where album_type = 'single';
select count(track) from spotify where album_type = 'single';


-- Count the total number of tracks by each artist.

select artist,count(*) as total_counts from spotify group by artist order by 2 desc;

	
---------------------------------------------------------------------------------------------

-- Calculate the average danceability of tracks in each album.

select album,avg(danceability) as avg_count from spotify group by album;

-- Find the top 5 tracks with the highest energy values.

select track,max(energy)as max_energy from spotify group by track order by 2 desc limit 5;


-- List all tracks along with their views and likes where official_video = TRUE

select 
	track ,
	sum(views) as total_views,
	sum(likes) as total_likes
	from spotify 
	where official_video = 'true'
	group by track 
	order by 2 desc; 


-- For each album, calculate the total views of all associated tracks.

select 
	album,
	track,
	sum(views)total_views 
	from spotify 
	group by 1, 2
	order by 3 desc; 


-- Find the top 3 most-viewed tracks for each artist using window functions.

select 
	artist,
	track,
	sum(views) as total_views,
	dense_rank() over(partition by artist order by sum(views) desc) as rank
	from spotify
	group by 1,2
	order by 1, 3 desc










select * from spotify;















