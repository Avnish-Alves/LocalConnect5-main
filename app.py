from flask import Flask, render_template, request, redirect, url_for,session,flash
import mysql.connector
import os
from werkzeug.utils import secure_filename

app = Flask(__name__)

# MySQL connection
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="localhost"
)

app.secret_key = 'secretkey123'

cursor = db.cursor(dictionary=True)

UPLOAD_FOLDER = 'static/uploads'
ALLOWED_EXTENSIONS = {'jpg', 'jpeg', 'png'}

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/')
def index():
    return render_template('index.html')



@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        name = request.form['name']
        username = request.form['username']
        email = request.form['email'] 
        password = request.form['password']
        usercity = request.form['usercity']
        userarea = request.form['userarea']
        cursor = db.cursor()
        cursor.execute("INSERT INTO users (name, username, email, password, city,address) VALUES (%s, %s, %s, %s, %s,%s)", (name, username, email, password, usercity,userarea))
        db.commit()
        return redirect(url_for('login'))
    return render_template('signup.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        cursor = db.cursor()
        cursor.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, password))
        user = cursor.fetchone()
        if user:
            return redirect(url_for('userpage'))
        else:
            return "Invalid username or password"
    return render_template('login.html')

@app.route('/userpage')
def userpage():
    return render_template('userpage.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        fname = request.form['fname']
        lname = request.form['lname']
        email = request.form['email']
        password = request.form['password']
        number = request.form['number']
        gst = request.form['gst']
        shop = request.form['shop']
        area = request.form['area']
        username = request.form['username']
        

        cursor = db.cursor()
        cursor.execute('INSERT INTO service_providers (fname, lname,username, email, password_hash,number, gst,shop,area) VALUES (%s, %s, %s,%s,%s,%s,%s,%s,%s)',
                       (fname,lname,username, email, password,gst,number,shop,area))
        db.commit()
        cursor.close()
        return redirect('/login')

    return render_template('registerform.html')

@app.route('/shopkeeper_login', methods=['GET', 'POST'])
def shopkeeper_login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        cursor = db.cursor()
        cursor.execute('SELECT * FROM service_providers WHERE username = %s AND password_hash = %s',
                       (username, password))
        provider = cursor.fetchone()
        cursor.close()

        if provider:
            session['provider_id'] = provider[0]
            session['username'] = provider[3]
            flash('Login successful!', 'success')
            return redirect('/dashboard')
        else:
            flash('Invalid username or password', 'error')

    return render_template('login.html')


@app.route('/dashboard')
def dashboard():
    if 'username' in session:
        cursor = db.cursor()
        cursor.execute('SELECT * FROM service_providers WHERE username = %s', (session['username'],))
        shop = cursor.fetchall()
        
        # Fetch booking data from the database
        cursor.execute('SELECT * FROM booking')
        bookings = cursor.fetchall()
        
        cursor.close()
        return render_template('dashboard.html', shop=shop, bookings=bookings)  # Pass bookings data to the template
    else:
        return redirect('/login')


@app.route('/logout')
def logout():
    session.clear()
    flash('You have been logged out', 'success')
    return redirect('/login')

@app.route('/add_worker', methods=['GET', 'POST'])
def add_worker():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        worker_id = request.form['worker_id']
        experience = request.form['experience']
        photo = request.files['photo']
        services = request.form['services']

        if photo.filename == '':
            flash('Please upload a photo', 'error')
            return redirect(request.url)

        if photo and allowed_file(photo.filename):
            filename = secure_filename(photo.filename)
            photo.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        else:
            flash('Invalid file format. Please upload jpg, jpeg, or png files only.', 'error')
            return redirect(request.url)

        cursor = db.cursor()
        cursor.execute('INSERT INTO workers (name, email, worker_id, experience,services, photo) VALUES (%s, %s, %s, %s, %s, %s)',
                       (name, email, worker_id, experience, services, filename))
        db.commit()
        cursor.close()
        flash('Worker added successfully!', 'success')
        return redirect('/dashboard')

    return render_template('add_workers.html')


@app.route('/hi')
def hi():
    services = "Pipe Installation and Repair"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    workers = cursor.fetchall()
    cursor.close()
    return render_template('hi.html', workers=workers)



@app.route('/services')
def services():
    return render_template('services.html')

@app.route('/Shopkeeper')
def Shopkeeper():
    return render_template('Shopkeeper.html')

@app.route('/aboutus')
def abs():
    return render_template('aboutus.html')

@app.route('/contactus')
def cu():
    return render_template('/contactus.html')
    
    

@app.route('/hi1')
def hi1():
    services = "Fixture Installation and Repair"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    worker = cursor.fetchall()
    cursor.close()
    return render_template('hi1.html', worker=worker)


@app.route('/hi2')
def hi2():
    services = "Water Heater Installation and Repair"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    work = cursor.fetchall()
    cursor.close()
    return render_template('hi2.html', work=work)



@app.route('/hi3')
def hi3():
    services = "Drain Cleaning"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    work1 = cursor.fetchall()
    cursor.close()
    return render_template('hi3.html', work1=work1)


@app.route('/cabinet')
def cabinet():
    services = "Cabinet Installation and Repair"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    cabinet = cursor.fetchall()
    cursor.close()
    return render_template('cabinet.html', cabinet=cabinet)

@app.route('/furniture')
def furniture():
    services = "Furniture Assembly"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    furniture = cursor.fetchall()
    cursor.close()
    return render_template('furniture.html', furniture=furniture)


@app.route('/door')
def door():
    services = "Door and Window Repair/Installation"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    door = cursor.fetchall()
    cursor.close()
    return render_template('door.html', door=door)



@app.route('/trim')
def trim():
    services = "Trim and Molding"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    trim = cursor.fetchall()
    cursor.close()
    return render_template('trim.html', trim=trim)


@app.route('/electrical')
def electrical():
    services = "Electrical Wiring"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    electrical = cursor.fetchall()
    cursor.close()
    return render_template('electrical.html', electrical=electrical)

@app.route('/outlet')
def outlet():
    services = "Outlet Installation and Repair"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    outlet = cursor.fetchall()
    cursor.close()
    return render_template('outlet.html', outlet=outlet)


@app.route('/circuit')
def circuit():
    services = "Circuit Breaker Services"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    circuit = cursor.fetchall()
    cursor.close()
    return render_template('circuit.html', circuit=circuit)



@app.route('/lighting')
def lighting():
    services = "Lighting Installation and Repair"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    lighting = cursor.fetchall()
    cursor.close()
    return render_template('lighting.html', lighting=lighting)


@app.route('/interior')
def interior():
    services = "Interior Painting"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    interior = cursor.fetchall()
    cursor.close()
    return render_template('interior.html', interior=interior)



@app.route('/exterior')
def exterior():
    services = "Exterior Painting"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    exterior = cursor.fetchall()
    cursor.close()
    return render_template('exterior.html', exterior=exterior)




@app.route('/refinishing')
def refinishing():
    services = "Cabinet Painting/Refinishing"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    refinishing = cursor.fetchall()
    cursor.close()
    return render_template('refinishing.html', refinishing=refinishing)



@app.route('/deck')
def deck():
    services = "Deck and Fence Staining/Painting"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    deck = cursor.fetchall()
    cursor.close()
    return render_template('deck.html', deck=deck)




@app.route('/routine')
def routine():
    services = "Routine Maintenance"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    routine = cursor.fetchall()
    cursor.close()
    return render_template('routine.html', routine=routine)




@app.route('/diagnostic')
def diagnostic():
    services = "Diagnostic Services"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    diagnostic = cursor.fetchall()
    cursor.close()
    return render_template('diagnostic.html', diagnostic=diagnostic)





@app.route('/repairs')
def repairs():
    services = "Repairs"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    repairs = cursor.fetchall()
    cursor.close()
    return render_template('repairs.html', repairs=repairs)




@app.route('/tire')
def tire():
    services = "Tire Services"
    cursor = db.cursor()
    cursor.execute('SELECT * FROM workers WHERE services = %s ',(services, ))
    tire = cursor.fetchall()
    cursor.close()
    return render_template('tire.html', tire=tire)

@app.route('/booking', methods=['GET', 'POST'])
def booking():
    if request.method == 'POST':
        name = request.form['name']
        workername = request.form['worker']
        phone = request.form['phone']
        email = request.form['email']
        date = request.form['date']
        time = request.form['time']
        address = request.form['address']
        cursor = db.cursor()
        cursor.execute('INSERT INTO booking (custname,workername, number, email, date,time, address) VALUES (%s, %s, %s, %s, %s,%s,%s)',
                       (name,workername,phone, email, date, time, address))
        db.commit()
        cursor.close()
    return render_template('book.html')

@app.route('/reg_workers')
def reg_workers():
    if 'provider_id' in session:
        
            provider_id = session['provider_id']
            cursor = db.cursor()
            cursor.execute('SELECT * FROM workers WHERE provider_id = %s', (provider_id,))
            providers = cursor.fetchall()
            cursor.close()
            return render_template('registered_wrokers.html', providers=providers, provider_id=provider_id)
        
    else:
        return redirect('/login')


    

if __name__ == '__main__':
    app.run(debug=True)