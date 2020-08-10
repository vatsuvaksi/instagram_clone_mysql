-- finding oldest users;
select * from users order by created_at limit 5; 
-- most day
select dayname(created_at) as day, count(*) as countt from users group by day order by countt DESC limit 1;
-- inactive people.
SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL; 
-- most likes on a single photos
SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;
-- top most hashtags
select tag_name,count(*) as tag_count from tags join photo_tags on tags.id=photo_tags.tag_id group by tag_id order by tag_count DESC limit 5;