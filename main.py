from flask import Flask, request, render_template
from flask import json
from flask_wtf import FlaskForm
from wtforms import StringField
from flask.json import jsonify, load
from numpy import character
from sqlalchemy.util.langhelpers import method_is_overridden
import tools.sql_tools as sql

app = Flask(__name__)
app.config['SECRET_KEY'] = 'Thisisasecret!'

class LoginForm(FlaskForm):
    username = StringField('username')
    game = StringField('game')
    platform = StringField('platform')
    comment = StringField('comment')

@app.route("/")
def startup():
    return "Hello World"

@app.route("/collection")
def collection():
    collection = sql.collection()
    return collection


@app.route("/newcomment", methods=["GET","POST"])
def newcomment():
    platform = request.form.get("platform")
    comment = request.form.get("comment")
    videogame = request.form.get("game")
    username = request.form.get("username")
    return sql.new_comment(videogame, platform, username, comment)

@app.route("/comments")
def gamecomments():
    game = request.args['game']
    limit = request.args.get('limit')
    if limit == None:
        limit = 1000
    gamecomments = sql.gamecomments(game,limit)
    return gamecomments

@app.route("/platforms")
def gameplatforms():
    game = request.args['game']
    limit = request.args.get('limit')
    if limit == None:
        limit = 1000
    gamecomments = sql.gameplatforms(game,limit)
    return gamecomments

@app.route("/score")
def gamescore():
    game = request.args['game']
    return sql.score(game)

@app.route('/form', methods=['GET', 'POST'])
def form():
    form = LoginForm()
    if form.validate_on_submit():
        return sql.new_comment(form.game.data, form.platform.data, form.username.data, form.comment.data)
    return render_template('form.html', form=form)

app.run(debug=True)