![videogames](https://github.com/DiegoCefalo/GetVidya/blob/main/img/national-video-games-day.jpg)
# GetVidya
This project is meant to be a game recommender. It's an API that takes data from an SQL database which contains more than 200k comments reviewing videogames. These comments have been processed using the "spaCy" library to remove stopwords (words that do not contribute to the sentiment analysis) and the "NLTK" library to globalize the sentiment for each videogame. The data was obtained from kaggle:
* [Videogame data](https://www.kaggle.com/dahlia25/metacritic-video-game-comments)</br>
    Mysql was used to store the data and the "sqlalchemy" library was used to load the data into the database.
## Use of the API
    It runs on python Flask and for now it only works as a local server. The endpoints are:
* http://localhost:5000/ : This is just a test to check if the server is running. It returns "Hello World"
* http://localhost:5000/collection : Returns all the games in the database as a json
* http://localhost:5000/comments?(params) : It requires the name of the game as a parameter (e.g. game=The Legend of Zelda: Ocarina of Time) and returns a json with a maximum of 1000 comments of that game. You can limit the number of entries in this response using the parameter "limit" (e.g. limit=3).
* http://localhost:5000/platforms?(params) : It requires the name of the game as a parameter (e.g. game=The Legend of Zelda: Ocarina of Time) and returns a json with all the plaforms that support that game. You can limit the number of entries in this response using the parameter "limit" (e.g. limit=3).
* http://localhost:5000/newcomment : You can post a new comment through the "requests" library. It requires the parameter "data" to be equal to a dictionary containing the name, platform, username and comment to be posted. (e.g. comment = {'game' : 'The Legend of Zelda: Ocarina of Time','platform' : 'PSP','username': 'sweetbabyjezuz','comment' : 'i like this game'}.
* http://localhost:5000/score : It requires the name of the game as a parameter (e.g. game=The Legend of Zelda: Ocarina of Time) and returns a json with the overall sentiment of the comments about the game (the mean of the polarization of the comments where 1 is completely positive and -1 is completely negative). 
* http://localhost:5000/form :  same as /newcomment but you can fill out a form through the browser.
## Top Games
These are the top 10 games based on sentiment</br>
![top games](https://github.com/DiegoCefalo/GetVidya/blob/main/img/topgames.jpg)
 
 ## Used libraries
 * [Pandas](https://pandas.pydata.org/docs/)
 * [Numpy](https://numpy.org/doc/stable/)
 * [Seaborn](https://seaborn.pydata.org/)
 * [Matplotlib](https://matplotlib.org/stable/index.html)
 * [Regular Expressions](https://docs.python.org/3/library/re.html)
 * [spaCy](https://spacy.io/usage)
 * [NLTK](https://www.nltk.org/)
 * [Flask](https://flask.palletsprojects.com/en/2.0.x/)
 * [Flask-WTF](https://flask-wtf.readthedocs.io/en/0.15.x/)
 * [SQLalchemy](https://docs.sqlalchemy.org/en/14/)
