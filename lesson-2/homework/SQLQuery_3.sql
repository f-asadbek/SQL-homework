CREATE TABLE photos (
    id INT IDENTITY(1, 1),
    photo VARBINARY(MAX)
);

INSERT INTO photos
SELECT
BulkColumn FROM OPENROWSET(BULK '/Users/a.fayzullayev/Desktop/pexels-souvenirpixels-414612.jpg', SINGLE_BLOB) AS image_file;

SELECT * FROM photos;