SET GLOBAL local_infile=1;
LOAD DATA LOCAL INFILE 'C:/Users/diego/videogame/data/title_score.csv'
INTO TABLE videogame FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@column1, @column2, @column3,@column4, @column5, @column6)
SET name=@column1, score=@column5
