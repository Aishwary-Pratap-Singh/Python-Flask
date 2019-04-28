from flask import Flask,render_template,request,session,redirect,url_for,flash
from flask_sqlalchemy import SQLAlchemy
from flask_bootstrap import Bootstrap
from flask_wtf import FlaskForm
from wtforms import StringField,PasswordField,BooleanField
from wtforms.validators  import InputRequired,Email,Length
from datetime import datetime
from flask_mail import Mail
from werkzeug.security import generate_password_hash,check_password_hash
from werkzeug.utils import secure_filename
from flask_login import LoginManager,UserMixin,login_required,logout_user,current_user,login_user
import json
import os
import math

local_server=True
with open('config.json','r') as f:
    params =json.load(f)['params']
app = Flask(__name__)
app.config['SECRET_KEY']='THISISSUPPOSETOBESECRETE'
bootstrap = Bootstrap(app)
app.config["UPLOAD_FOLDER"] = params["uploader_location"]
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params["gmail-User"],
    MAIL_PASSWORD =params["gmail-Pwd"]
)
mail=Mail(app)
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else :
    app.config['SQLALCHEMY_DATABASE_URI'] = params['pro_uri']
db = SQLAlchemy(app)

""" Forms CLass """
class Loginform(FlaskForm):
    username = StringField('username',validators=[InputRequired(),Length(min=4,max=30)])
    password = PasswordField('password',validators=[InputRequired(),Length(min=4,max=20)])
    remember =  BooleanField("remenber me")

class Registrationform(FlaskForm):
    username = StringField('username',validators=[InputRequired(),Length(min=4,max=30)])
    email = StringField('email',validators=[InputRequired(),Length(min=4,max=50)])
    password = PasswordField('password',validators=[InputRequired(),Length(min=4,max=20)])



""" Data Base Classes """
class User(UserMixin,db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(30),unique=True)
    email =  db.Column(db.String(50),unique=True)
    pwd =  db.Column(db.String(20),nullable=False)


class Contact(db.Model):
    SNo = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(20),nullable=False)
    email = db.Column(db.String(25),nullable=False)
    phoneNum = db.Column(db.String(11),nullable=False)
    msg = db.Column(db.String(200), nullable=False)
    date = db.Column(db.String(12),nullable=True)

class Post(db.Model):
    Sno = db.Column(db.Integer, primary_key=True)
    Title = db.Column(db.String(30),nullable=False)
    slag = db.Column(db.String(25),nullable=False)
    content = db.Column(db.String(500), nullable=False)
    tag_line = db.Column(db.String(500), nullable=False)
    img_file = db.Column(db.String(25), nullable=False)
    date = db.Column(db.String(12),nullable=True)


""" Pages Routes """

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

@app.route("/")
def home():
    posts=Post.query.filter_by().all()
    last = math.ceil(len(posts)/int(params["no_of_post"]))

    #[0:params["no_of_post"]]

    page =(request.args.get('page'))
    if(not str(page).isnumeric()):
        page=1
    page=int(page)
    posts=posts[(page-1)*int(params["no_of_post"]): (page-1)*int(params["no_of_post"])+int(params["no_of_post"])]
    if page == 1:
        prev = "#"
        next = "/?page="+str(page+1)
    elif page == last:
        page = "/?page="+str(page-1)
        next = "#"
    else:
        prev = "/?page="+str(page-1)
        next = "/?page="+str(page+1)

    return render_template('index.html',params=params,posts=posts,prev=prev,next=next)

@app.route("/about")
def about():

    return render_template('about.html',params=params)

@app.route("/Login",methods=["GET","POST"])
def login():
    form = Loginform()
    if form.validate_on_submit():
        user = User.query.filter_by(username=form.username.data).first()
        if user :
            if check_password_hash(user.pwd,form.password.data):
                login_user(user,remember=form.remember.data)
                return redirect(url_for("Dashboard"))
        return '<h1> Username or password was inccorect </h1>'

    return render_template('login.html',params=params,form=form)


@app.route("/SignUp",methods=["GET","POST"])
def SignUp():
    form = Registrationform()
    if form.validate_on_submit():
        if request.method == "POST":
            hashed_pwd = generate_password_hash(form.password.data,method="sha256")
            entry = User(username=form.username.data,email=form.email.data,pwd=hashed_pwd)
            db.session.add(entry)
            db.session.commit()
            return redirect(url_for("Dashboard"))
    return render_template('Registrationform.html',params=params,form=form)


@app.route("/Dashboard")
@login_required
def Dashboard():
    posts = Post.query.all()
    return render_template("Dashboard.html",params=params,name=current_user.username,posts=posts)

@app.route("/contact",methods=['GET','POST'])
def contact():
    ''' SNo,Name,email,phoneNum,msg,date'''
    if request.method ==  'POST':
        """Add entry to the database"""
        name=request.form.get('name')
        email=request.form.get('email')
        phone=request.form.get("phone")
        msg=request.form.get('msg')
        entry = Contact(Name=name,email=email,phoneNum=phone,msg=msg,date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from'+' '+name,
                          sender=email,
                          recipients=[params['gmail-User']],
                          body = msg + '\n' + phoneNum )
    return render_template('contact.html',params=params)

@app.route("/post/<string:post_slug>",methods=["GET"])
def post_route(post_slug):
    post=Post.query.filter_by(slag=post_slug).first()
    return render_template('post.html',params=params,post=post)



@app.route("/Uploader",methods=["GET","POST"])
@login_required
def uploader():
    if current_user. is_authenticated:
        if request.method == "POST":
            f = request.files['file1']
            f.save(os.path.join(app.config["UPLOAD_FOLDER"],secure_filename(f.filename)))
            return "Uploaded Sucessfully"





@app.route("/edit/<string:Sno>",methods=["GET","POST"])
@login_required
def edit(Sno):

    if current_user. is_authenticated:
           if request.method == "POST":
                box_title = request.form.get("title")
                tag_line = request.form.get("tag_line")
                slug = request.form.get("slug")
                content = request.form.get("content")
                img_file = request.form.get("img_file")
                date= datetime.now()

                if Sno == '0':
                    post =Post(Title=box_title,tag_line=tag_line,slag=slug,content=content,img_file=img_file,date=date)
                    db.session.add(post)
                    db.session.commit()
                else:
                    post =Post.query.filter_by(Sno=Sno).first()
                    post.Title = box_title
                    post.tag_line = tag_line
                    post.slag  = slug
                    post.content = content
                    post.img_file = img_file
                    post.date = date
                    db.session.commit()
                    return redirect('/edit/'+Sno)
           post=Post.query.filter_by(Sno=Sno).first()
           return render_template("edit.html",params=params,post=post)






@app.route("/Logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for("Dashboard"))

@app.route("/Delete/<string:Sno>",methods=["GET","POST"])
@login_required
def delete(Sno):
    if current_user. is_authenticated:
        post=Post.query.filter_by(Sno=Sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect(url_for("Dashboard"))

if __name__ == "__main__":
        app.run(debug=True,port=3000)
