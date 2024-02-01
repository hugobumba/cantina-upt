from flask import Flask, render_template, request, Response, session, flash
import mysql.connector

app = Flask(__name__)
app.config["DEBUG"] = True
app.config["SECRET_KEY"] = 'secretkey'

mydb = mysql.connector.connect(host="localhost", user="root", password="", database="cantina")

@app.route('/')
def index():
    return home()

@app.route('/home')
def home():
    if not session.get('login'):
        return render_template('login.html')
    else:
        if(session['usertype'] == 'Funcionário'):
            return render_template('homeworker.html')
        else:
            return render_template('homestudent.html')

@app.route('/login', methods=['POST'])
def login():
    if not session.get('login'):
        login = request.form
        username = login['username']
        mycursor = mydb.cursor()
        mycursor.execute("SELECT * FROM utilizadores WHERE numero = "+username)
        myresult = mycursor.fetchone()
        if myresult != None:
            session['login'] = True
            session['username'] = username
            session['usertype'] = myresult[2]
            if session['usertype'] == 'Funcionário':
                return render_template('homeworker.html')
            else:
                return render_template('homestudent.html')
    else:
        return home()

@app.route('/ementa')
def ementa():
    if not session.get('login'):
        return render_template('login.html')
    else:
        mycursor = mydb.cursor()
        mycursor.execute("SELECT dia, carnes.nome, peixes.nome, vegetarianos.nome, sopas.nome, sobremesas.nome FROM ementas INNER JOIN carnes ON ementas.carne = carnes.id INNER JOIN peixes ON ementas.peixe = peixes.id INNER JOIN vegetarianos ON ementas.vegetariano = vegetarianos.id INNER JOIN sopas ON ementas.sopa = sopas.id INNER JOIN sobremesas ON ementas.sobremesa = sobremesas.id")
        myresult = mycursor.fetchall()
        return render_template('ementa.html', myresult=myresult)

@app.route('/novaementa')
def novaementa():
    if not session.get('login'):
        return render_template('login.html')
    else:
        if(session['usertype'] == 'Funcionário'):
            ccarne = mydb.cursor()
            ccarne.execute("SELECT * FROM carnes")
            rcarne = ccarne.fetchall()
            return render_template('novaementa.html', rcarne=rcarne)
        else:
            return render_template('homestudent.html')

@app.route('/addementa', methods=['POST'])
def addementa():
    if not session.get('login'):
        return render_template('login.html')
    else:
        if(session['usertype'] == 'Funcionário'):
            addementa = request.form
            carne2 = addementa['selectcarne2']
            peixe2 = addementa['selectpeixe2']
            vegan2 = addementa['selectvegan2']
            sopa2 = addementa['selectsopa2']
            sobremesa2 = addementa['selectsobremesa2']
            carne3 = addementa['selectcarne3']
            peixe3 = addementa['selectpeixe3']
            vegan3 = addementa['selectvegan3']
            sopa3 = addementa['selectsopa3']
            sobremesa3 = addementa['selectsobremesa3']
            carne4 = addementa['selectcarne4']
            peixe4 = addementa['selectpeixe4']
            vegan4 = addementa['selectvegan4']
            sopa4 = addementa['selectsopa4']
            sobremesa4 = addementa['selectsobremesa4']
            carne5 = addementa['selectcarne5']
            peixe5 = addementa['selectpeixe5']
            vegan5 = addementa['selectvegan5']
            sopa5 = addementa['selectsopa5']
            sobremesa5 = addementa['selectsobremesa5']
            carne6 = addementa['selectcarne6']
            peixe6 = addementa['selectpeixe6']
            vegan6 = addementa['selectvegan6']
            sopa6 = addementa['selectsopa6']
            sobremesa6 = addementa['selectsobremesa6']
            sql = mydb.cursor()
            sql.execute("DELETE FROM ementas")
            mydb.commit()
            sql.execute("INSERT INTO ementas(dia, carne, peixe, vegetariano, sopa, sobremesa) VALUES(2, "+carne2+", "+peixe2+", "+vegan2+", "+sopa2+", "+sobremesa2+"), (3, "+carne3+", "+peixe3+", "+vegan3+", "+sopa3+", "+sobremesa3+"), (4, "+carne4+", "+peixe4+", "+vegan4+", "+sopa4+", "+sobremesa4+"), (5, "+carne5+", "+peixe5+", "+vegan5+", "+sopa5+", "+sobremesa5+"), (6, "+carne6+", "+peixe6+", "+vegan6+", "+sopa6+", "+sobremesa6+")")
            mydb.commit()
            return ementa()
        else:
            return render_template('homestudent.html')

@app.route('/novoproduto')
def novoproduto():
    if not session.get('login'):
        return render_template('login.html')
    else:
        if(session['usertype'] == 'Funcionário'):
            return render_template('novoproduto.html')
        else:
            return render_template('homestudent.html')

@app.route('/addprod', methods=['POST'])
def addprod():
    if not session.get('login'):
        return render_template('login.html')
    else:
        if(session['usertype'] == 'Funcionário'):
            addprod = request.form
            prodtype = addprod['selectcategoria']
            prodname = addprod['nomecategoria']
            mycursor = mydb.cursor()
            mycursor.execute("INSERT INTO "+prodtype+"(nome) VALUES('"+str(prodname)+"')")
            mydb.commit()
            return ementa()
        else:
            return render_template('homestudent.html')

@app.route('/escolhas')
def escolhas():
    if not session.get('login'):
        return render_template('login.html')
    else:
        if(session['usertype'] == 'Aluno'):
            mycursor = mydb.cursor()
            mycursor.execute("SELECT * FROM escolhas INNER JOIN utilizadores ON escolhas.numero = utilizadores.numero WHERE utilizadores.numero = "+session['username'])
            myresult = mycursor.fetchall()
            return render_template('escolhas.html', myresult=myresult)
        else:
            return render_template('homeworker.html')

@app.route('/comprar')
def comprar():
    if not session.get('login'):
        return render_template('login.html')
    else:
        if(session['usertype'] == 'Aluno'):
            mycursor = mydb.cursor()
            mycursor.execute("SELECT * FROM ementas")
            myresult = mycursor.fetchall()
            return render_template('comprar.html', myresult=myresult)
        else:
            return render_template('homeworker.html')

@app.route('/checkout', methods=['POST'])
def checkout():
    if not session.get('login'):
        return render_template('login.html')
    else:
        if(session['usertype'] == 'Aluno'):
            checkout = request.form
            suser = session['username']
            sdia = checkout['selectdia']
            ssopa = checkout['selectsopa']
            sprato = checkout['selectprato']
            sbebida = checkout['selectbebida']
            ssobremesa = checkout['selectsobremesa']
            mycursor = mydb.cursor()
            mycursor.execute("INSERT INTO escolhas(numero, dia, prato, sopa, bebida, sobremesa) VALUES("+suser+", "+sdia+", "+sprato+", "+ssopa+", "+sbebida+", "+ssobremesa+")")
            mydb.commit()
            return escolhas()
        else:
            return render_template('homeworker.html')

@app.route('/logout')
def logout():
    session['login'] = False
    session.pop('username', default=None)
    session.pop('usertype', default=None)
    return index()

app.run()