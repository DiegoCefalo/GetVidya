from config.configuration import engine
import pandas as pd

def collection():
    """
    Queries all the games in the database
    Args:
    Returns:
        json with all the games in the database
    """
    query = f"""
            SELECT * FROM videogame
            """
    datos = pd.read_sql_query(query,engine)
    return datos.to_json(orient="records")

def score(game):
    """
    Queries games scores in the database
    Args:
        game (str): name of the game we want to know the score of.
    Returns:
        json with score of the game
    """
    query = f"""
            SELECT score FROM videogame WHERE name = '{game}'
            """
    datos = pd.read_sql_query(query,engine)
    return datos.to_json(orient="records")

def gamecomments(game,limit = 1000):
    """
    Queries all the comments from a game in the database.
    Args:
        game (str): name of the game
        limit (int): number of comments to return (max 1000)
    Returns:
        json with all the comments from a game or the maximum specified.
    """
    query = f"""
            SELECT videogame.name, comments.comment FROM videogame
            JOIN comments
            WHERE videogame.name = '{game}'
            LIMIT {limit}
            """
    datos = pd.read_sql_query(query,engine)
    return datos.to_json(orient="records")

def gameplatforms(game,limit = 1000):
    """
    Queries all the platforms from a game in the database.
    Args:
        game (str): name of the game
        limit (int): number of platforms to return (max 1000)
    Returns:
        json with all the platforms from a game or the maximum specified.
    """
    query = f"""
            SELECT videogame.name, platform.name AS platform FROM videogame
            JOIN platform
            WHERE videogame.name = '{game}'
            LIMIT {limit}
            """
    datos = pd.read_sql_query(query,engine)

    return datos.to_json(orient="records")

def getid(table,string):
    """
    Gets the id of the thing you are looking for in the database
    Args:
        table (str): name of the table
        string (str): name of the thing you are looking for
    Returns:
        theid (int): id of the thing you are looking for
    """
    theid =  engine.execute(f"SELECT id FROM {table} WHERE name = '{string}'").first()[0]
    return  theid

def check(selector,string):
    """
    check if an entry already exists.
    Args: 
        selector (str): category to check in tables.
        string (str): string to check in category.
    Returns:
        Boolean: true if exists, false if it doesnt.
    """
    if selector == "videogame":
        query = list(engine.execute(f"SELECT name FROM videogame WHERE name = '{string}';"))
        if len(query) > 0:
            return True
        else:
            return False
        
    elif selector == "platform":
        query = list(engine.execute(f"SELECT name FROM platform WHERE name = '{string}'"))
        if len(query) > 0:
            return True
        else:
            return False
        
    elif selector == "comment":
        query = list(engine.execute(f"SELECT comment FROM comments WHERE comment = '{string}'"))
        if len(query) > 0:
            return True
        else:
            return False

def insertgame(game):
    """
    Inserts a game into the videogame table.
    Args:
        game (str): name of the game to insert
    Returns:
        confirmation message: "Inserted correctly: (name of the game)"
    """
    engine.execute(f"""
    INSERT INTO videogame (name)
    VALUES ('{game}');
    """)
    return f"Inserted correctly: {game}"

def insertplatform(platform):
    """
    Inserts a platform into the platform table.
    Args:
        platform (str): name of the platform to insert
    Returns:
        confirmation message: "Inserted correctly: (name of the platform)"
    """
    engine.execute(f"""
    INSERT INTO platform (name)
    VALUES ('{platform}');
    """)
    return f"Se ha introducido correctamente: {platform}"

def new_comment(videogame, platform, username, comment):
    if check("videogame", videogame):
        game_id = getid("videogame", videogame)
    else:
        insertgame(videogame)
        game_id = getid("videogame", videogame)
    if check("platform", platform):
        plat_id = getid("platform", platform)
    else:
        insertplatform(platform)
        plat_id = getid("platform", platform)        
    if check("videogame", videogame) and check("platform", platform) and  check("comment", comment):
        return "This comment has already been posted"
    else:
        engine.execute(f"""
        INSERT INTO comments (comment, videogame_idname, username) VALUES
        ("{comment}", "{game_id}", "{username}");
        """)
        return f"Comment successfully loaded"