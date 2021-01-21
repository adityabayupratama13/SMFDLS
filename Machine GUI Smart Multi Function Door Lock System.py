import Tkinter
from Tkinter import *
import tkFont
import RPi.GPIO as GPIO
import hashlib
import signal
import time
import datetime
import MySQLdb
import cv2
import config
import face

from picamera import PiCamera

import glob
import os
import sys
import select
import numpy as np
import MFRC522
import requests

from pyfingerprint.pyfingerprint import PyFingerprint

POSITIVE_FILE_PREFIX = 'positive_'

win = Tk()
win.title("Smart Multi Fuction Door Lock System")
win.configure(bg='#ff7700')
win.attributes('-fullscreen', True)
myfont = tkFont.Font(family = 'Helvetica', size = 12, weight = "bold")

pinCode = StringVar()
cap = cv2.VideoCapture(0)

v = StringVar()

global db
global c

#For Switch From Inside Room
GPIO.setmode(GPIO.BOARD) 
GPIO.setup(36, GPIO.IN, pull_up_down=GPIO.PUD_DOWN ) 

#For Selenoid Relay
Relay = 37
GPIO.setup(Relay, GPIO.OUT)
GPIO.output(Relay, GPIO.LOW)

#For LED
LED = 32
GPIO.setup(LED, GPIO.OUT)
GPIO.output(LED, GPIO.LOW)

# Server For API
server = "http://mfdl.primexaviers.com/api"

def SendtoServer(address,device,requestaction, data):
    try:
        if requestaction == 1:
            if device==1:
                r = requests.get(url = server+address, params = data)
                return r.json()
            
        elif requestaction == 2:
            if device == 1:
                r = requests.post(url = server + address, data = data)
                return r.json()
            
            elif device == 2 :            
 
                r = requests.post(url = server + address, data = data)
                return r.json()
            
    except requests.exceptions.RequestException as e: 
        return 0
        
def main():
    while 1:
        insert_to_db()
        read_from_db()
        time.sleep(10)

if __name__ == '__main__':
    try:
        db = MySQLdb.connect("localhost","root","test","DoorLock")
        c= db.cursor(MySQLdb.cursors.DictCursor)

    except:
        print ("Not Connected To Database")
                              
def close():
    win.destroy()
    cap.release()
    cv2.destroyAllWindows()
    global continue_reading
    print ("Ctrl+C captured, ending read.")
    GPIO.output(LED, GPIO.LOW)
    continue_reading = False
    GPIO.cleanup()
    
def open1():
    top = Toplevel()
    top.title("Register Menu")
    top.attributes('-fullscreen', True)
    top.configure(bg='#ff7700')
    
    def RegPIN():
        Pinlbl = Label(top,  text = "Input Your ID", font=myfont, width=12)
        Pinlbl.grid(row=0,column=3)
        Pinlbl.configure(bg='#ff7700')
    
        pinCode = code.get()
        print("Pin code: ", pinCode) #Debug
    
        ID = pinin.get()
        userID = ''.join(str(e) for e in ID)

        print("ID Number: ", userID) #Debug        
        lockstatus = SendtoServer("/add/pin/1",1,2, {'PIN':pinCode,'UserID':userID})
        if lockstatus['status'] == 0:
            print("Input Data Fialed")
            Pinlbl = Label(top,  text = "Input Data Fialed", font=myfont, width=16)
            Pinlbl.grid(row=0,column=3)
            Pinlbl.configure(bg='#ff7700')
        
        else:
            print("Input Data Success")
            Pinlbl = Label(top,  text = "Input Data Success", font=myfont, width=16)
            Pinlbl.grid(row=0,column=3)
            Pinlbl.configure(bg='#ff7700')
    
    def RegisterFinger():
        continue_reading = True
        
        try:
            f = PyFingerprint('/dev/ttyUSB0', 57600, 0xFFFFFFFF, 0x00000000)

            if ( f.verifyPassword() == False ):
                raise ValueError('The given fingerprint sensor password is wrong!')

        except Exception as e:
            print('The fingerprint sensor could not be initialized!')
            print('Exception message: ' + str(e))
            exit(1)

        ## Gets some sensor information
        print('Currently used templates: ' + str(f.getTemplateCount()) +'/'+ str(f.getStorageCapacity()))

        ## Tries to enroll new finger
        try:
            Pinlbl = Label(top,  text = "Waiting for finger...", font=myfont, width=16)
            Pinlbl.grid(row=0,column=3)
            Pinlbl.configure(bg='#ff7700')
        
            print('Waiting for finger...')

            ## Wait that finger is read
            while ( f.readImage() == False ):
                pass

            ## Converts read image to characteristics and stores it in charbuffer 1
            f.convertImage(0x01)

            ## Checks if finger is already enrolled
            result = f.searchTemplate()
            positionNumber = result[0]
            
            print(positionNumber)

            if ( positionNumber >= 0 ):
                print('Template already exists at position #' + str(positionNumber))
                continue_reading = False

            Pinlbl = Label(top,  text = "Remove Finger...", font=myfont, width=16)
            Pinlbl.grid(row=0,column=3)
            Pinlbl.configure(bg='#ff7700')
            print('Remove finger...')
            time.sleep(2)

            Pinlbl = Label(top,  text = "Waiting Same Finger Again...", font=myfont, width=16)
            Pinlbl.grid(row=0,column=3)
            Pinlbl.configure(bg='#ff7700')
        
            print('Waiting for same finger again...')

            ## Wait that finger is read again
            while ( f.readImage() == False ):
                pass

            ## Converts read image to characteristics and stores it in charbuffer 2
            f.convertImage(0x02)

            ## Compares the charbuffers
            if ( f.compareCharacteristics() == 0 ):
                Pinlbl = Label(top,  text = "Fingers do not match", font=myfont, width=16)
                Pinlbl.grid(row=0,column=3)
                Pinlbl.configure(bg='#ff7700')
                raise Exception('Fingers do not match')
                continue_reading = False  
        
            ## Creates a template
            f.createTemplate()

            ## Saves template at new position number
            positionNumber = f.storeTemplate()
            Pinlbl = Label(top,  text = "Finger enrolled successfully!", font=myfont, width=16)
            Pinlbl.grid(row=0,column=3)
            Pinlbl.configure(bg='#ff7700')
            print('Finger enrolled successfully!')
            print(positionNumber)
            print('New template position #' + str(positionNumber))
        
            Pinlbl = Label(top,  text = "Input Your ID", font=myfont, width=16)
            Pinlbl.grid(row=0,column=3)
            Pinlbl.configure(bg='#ff7700')
        
            ID = pinin.get()
            userID = ''.join(str(e) for e in ID)
    
            print("ID Number: ", userID) 
            
            lockstatus = SendtoServer("/add/fingerprint/1",1,2, {'FingerPrint':str(positionNumber),'UserID':userID})
            if lockstatus['status'] == 0:
                pinlbl = Label(top,  text = "Input Data Failed", font=myfont, width=16)
                Pinlbl.grid(row=0,column=3)
                Pinlbl.configure(bg='#ff7700')
                print("Tambah Data Gagal")
            else:
                Pinlbl = Label(top,  text = "Input Data Succes", font=myfont, width=16)
                Pinlbl.grid(row=0,column=3)
                Pinlbl.configure(bg='#ff7700')
                print("Tambah Data Berhasil") 
        
            continue_reading = False

        except Exception as e:
            print('Operation failed!')
            print('Exception message: ' + str(e))
            continue_reading = False
            
    def ReC():
        Pinlbl = Label(top,  text = "Insert The Pin Code", font=myfont, width=16)
        Pinlbl.grid(row=0,column=3)
        Pinlbl.configure(bg='#ff7700')
        pinCode = code.get()
        print("Pin code: ", pinCode) #Debug
    
        c.execute("SELECT * FROM RFID WHERE ADMIN = '%s'" % (pinCode)) #PinCode = 711003  
        
        if c.rowcount != 1:
            print("Access Denied, YOU SHALL NOT PASS!")
    
        else:
        
            if __name__ == '__main__':
                camera = config.get_camera()
    
                # Create the directory for positive training images if it doesn't exist.
                if not os.path.exists(config.POSITIVE_DIR):
                        os.makedirs(config.POSITIVE_DIR)
                # Find the largest ID of existing positive images.
                # Start new images after this ID value.
                files = sorted(glob.glob(os.path.join(config.POSITIVE_DIR, 
                        POSITIVE_FILE_PREFIX + '[0-9][0-9][0-9].pgm')))
                count = 0
                if len(files) > 0:
                         # Grab the count from the last filename.
                         count = int(files[-1][-7:-4])+1
                print 'Capturing positive training images.'
            
                while True:
                    print 'Capturing image...'
                    Pinlbl = Label(top,  text = "Capturing Image", font=myfont, width=16)
                    Pinlbl.grid(row=0,column=3)
                    Pinlbl.configure(bg='#ff7700')
                    GPIO.output(LED, GPIO.HIGH)   #Turn off LED
                    image = camera.read()
                    # Convert image to grayscale.
                    image = cv2.cvtColor(image, cv2.COLOR_RGB2GRAY)
                    # Get coordinates of single face in captured image.
                    result = face.detect_single(image)
                    if result is None:
                        print 'Could not detect single face!  Check the image in capture.pgm' \
                        ' to see what was captured and try again with only one face visible.'
                        Pinlbl = Label(top,  text = "Waiting Detection Face", font=myfont, width=16)
                        Pinlbl.grid(row=0,column=3)
                        Pinlbl.configure(bg='#ff7700')
                    continue
                    x, y, w, h = result
                    # Crop image as close as possible to desired face aspect ratio.
                    # Might be smaller if face is near edge of image.
                    crop = face.crop(image, x, y, w, h)
                    # Save image to file.
                    filename = os.path.join(config.POSITIVE_DIR, POSITIVE_FILE_PREFIX + '%03d.pgm' % count)
                    cv2.imwrite(filename, crop)
                    print 'Found face and wrote training image', filename
                    count += 1
                    Pinlbl = Label(topwin,  text = "Face Detected", font=myfont, width=16)
                    Pinlbl.grid(row=0,column=3)
                    Pinlbl.configure(bg='#ff7700')
                    GPIO.output(LED, GPIO.LOW)   #Turn off LED
                    break
                
    def A1D():
        pinin.insert(END,1)
    def A2D():
        pinin.insert(END,2)
    def A3D():
        pinin.insert(END,3)
    def A4D():
        pinin.insert(END,4)
    def A5D():
        pinin.insert(END,5)
    def A6D():
        pinin.insert(END,6)
    def A7D():
        pinin.insert(END,7)
    def A8D():
        pinin.insert(END,8)
    def A9D():
        pinin.insert(END,9)
    def A0D():
        pinin.insert(END,0)
    
    def A1():
        code.insert(END,1)
    def A2():
        code.insert(END,2)
    def A3():
        code.insert(END,3)
    def A4():
        code.insert(END,4)
    def A5():
        code.insert(END,5)
    def A6():
        code.insert(END,6)
    def A7():
        code.insert(END,7)
    def A8():
        code.insert(END,8)
    def A9():
        code.insert(END,9)
    def A0():
        code.insert(END,0)
    def DeleteBoard():
	code.delete(0, END)
        pinin.delete(0, END)	
    
    CloseBut = Button(top, text='Close', font=myfont, command=top.destroy, bg='red', height=1, width=6)
    CloseBut.grid(row=6, column=2)
    RegPin = Button(top, text='R. Pin', font=myfont, command=RegPIN, bg='orange', height=1, width=6)
    RegPin.grid(row=2, column=0)
    RegFinger = Button(top, text='R. Finger', font=myfont, command=RegisterFinger, bg='blue', height=1, width=6)
    RegFinger.grid(row=2, column=1)
    Capture = Button(top, text='R. Face', font=myfont, command=ReC, bg='green', height=1, width=6)
    Capture.grid(row=2, column=2)
    
    Judul = Label(top,  text = "No. Pin", font=myfont, width=10)
    Judul.grid(row=0,column=0)
    Judul.configure(bg='#ff7700')
    Judul = Label(top,  text = "No. ID", font=myfont, width=10)
    Judul.grid(row=0,column=2)
    Judul.configure(bg='#ff7700')
    
    code = Entry(top, font=myfont, show ="*",  width=10)
    code.grid(row=1,column=0)
    pinin = Entry(top, font=myfont,show ="*", width=10)
    pinin.grid(row=1,column=2)
    
    pin1 = Button(top, text='1', font=myfont, command=A1, bg='yellow', height=1, width=6)
    pin1.grid(row=3, column=0)
    pin2 = Button(top, text='2', font=myfont, command=A2, bg='yellow', height=1, width=6)
    pin2.grid(row=3, column=1)
    pin3 = Button(top, text='3', font=myfont, command=A3, bg='yellow', height=1, width=6)
    pin3.grid(row=3, column=2)
    pin4 = Button(top, text='4', font=myfont, command=A4, bg='yellow', height=1, width=6)
    pin4.grid(row=4, column=0)
    pin5 = Button(top, text='5', font=myfont, command=A5, bg='yellow', height=1, width=6)
    pin5.grid(row=4, column=1)
    pin6 = Button(top, text='6', font=myfont, command=A6, bg='yellow', height=1, width=6)
    pin6.grid(row=4, column=2)
    pin7 = Button(top, text='7', font=myfont, command=A7, bg='yellow', height=1, width=6)
    pin7.grid(row=5, column=0)
    pin8 = Button(top, text='8', font=myfont, command=A8, bg='yellow', height=1, width=6)
    pin8.grid(row=5, column=1)
    pin9= Button(top, text='9', font=myfont, command=A9, bg='yellow', height=1, width=6)
    pin9.grid(row=5, column=2)
    pin0= Button(top, text='0', font=myfont, command=A0, bg='yellow', height=1, width=6)
    pin0.grid(row=6, column=1)
    pin1 = Button(top, text='1', font=myfont, command=A1, bg='yellow', height=1, width=6)
    pin1.grid(row=3, column=0)
    pin2 = Button(top, text='2', font=myfont, command=A2, bg='yellow', height=1, width=6)
    pin2.grid(row=3, column=1)
    pin3 = Button(top, text='3', font=myfont, command=A3, bg='yellow', height=1, width=6)
    pin3.grid(row=3, column=2)
    pin4 = Button(top, text='4', font=myfont, command=A4, bg='yellow', height=1, width=6)
    pin4.grid(row=4, column=0)
    pin5 = Button(top, text='5', font=myfont, command=A5, bg='yellow', height=1, width=6)
    pin5.grid(row=4, column=1)
    pin6 = Button(top, text='6', font=myfont, command=A6, bg='yellow', height=1, width=6)
    pin6.grid(row=4, column=2)
    pin7 = Button(top, text='7', font=myfont, command=A7, bg='yellow', height=1, width=6)
    pin7.grid(row=5, column=0)
    pin8 = Button(top, text='8', font=myfont, command=A8, bg='yellow', height=1, width=6)
    pin8.grid(row=5, column=1)
    pin9= Button(top, text='9', font=myfont, command=A9, bg='yellow', height=1, width=6)
    pin9.grid(row=5, column=2)
    pin0= Button(top, text='0', font=myfont, command=A0, bg='yellow', height=1, width=6)
    pin0.grid(row=6, column=1)
    pinDelete = Button(top, text='Delete', font=myfont, command=DeleteBoard, bg = 'purple', height=1, width=6)
    pinDelete.grid(row=6, column=0)
    
    pin1D = Button(top, text='1', font=myfont, command=A1D, bg='blue', height=1, width=6)
    pin1D.grid(row=7, column=0)
    pin2D= Button(top, text='2', font=myfont, command=A2D, bg='blue', height=1, width=6)
    pin2D.grid(row=7, column=1)
    pin3D = Button(top, text='3', font=myfont, command=A3D, bg='blue', height=1, width=6)
    pin3D.grid(row=7, column=2)
    pin4D = Button(top, text='4', font=myfont, command=A4D, bg='blue', height=1, width=6)
    pin4D.grid(row=8, column=0)
    pin5D = Button(top, text='5', font=myfont, command=A5D, bg='blue', height=1, width=6)
    pin5D.grid(row=8, column=1)
    pin6D = Button(top, text='6', font=myfont, command=A6D, bg='blue', height=1, width=6)
    pin6D.grid(row=8, column=2)
    pin7D = Button(top, text='7', font=myfont, command=A7D, bg='blue', height=1, width=6)
    pin7D.grid(row=9, column=0)
    pin8D = Button(top, text='8', font=myfont, command=A8D, bg='blue', height=1, width=6)
    pin8D.grid(row=9, column=1)
    pin9D= Button(top, text='9', font=myfont, command=A9D, bg='blue', height=1, width=6)
    pin9D.grid(row=9, column=2)
    pin0D= Button(top, text='0', font=myfont, command=A0D, bg='blue', height=1, width=6)
    pin0D.grid(row=10, column=1)

def open2():
    top2 = Toplevel()
    top2.title("Scan Menu")
    top2.attributes('-fullscreen', True)
    top2.configure(bg='#ff7700')
    
    def camera():
            if __name__ == '__main__':

                # Load training data into model
                print 'Loading training data...'
                Pinlbl = Label(top2,  text = "Loading Training Data", font=myfont, width=16)
                Pinlbl.grid(row=0,column=3)
                Pinlbl.configure(bg='#ff7700')
                model = cv2.face.EigenFaceRecognizer_create()
                model.read(config.TRAINING_FILE)
                print 'Training data loaded!'
                # Initialize camer and box.
                camera = config.get_camera()
                # Move box to locked position.
                print 'Camera Running'
                Pinlbl = Label(top2, text = "Camera Running", font=myfont, width=16)
                Pinlbl.grid(row=0,column=3)
                Pinlbl.configure(bg='#ff7700')
            
                while True:
                    GPIO.output(LED, GPIO.HIGH)   #Turn off LED

                    # Check for the positive face and unlock if found.
                    image = camera.read()
                    # Convert image to grayscale.
                    image = cv2.cvtColor(image, cv2.COLOR_RGB2GRAY)
                    # Get coordinates of single face in captured image.
                    result = face.detect_single(image)
                            
                    if result is None:
                        print 'Could not detect single face!  Check the image in capture.pgm' \
                         ' to see what was captured and try again with only one face visible.'
                        Pinlbl = Label(top2,  text = "Waiting Detection Face", font=myfont, width=12)
                        Pinlbl.grid(row=0,column=3)
                        Pinlbl.configure(bg='#ff7700')
                
                    else:            
                        x, y, w, h = result
                        # Crop and resize image to face.
                        crop = face.resize(face.crop(image, x, y, w, h))
                        # Test face against model.
                        label, confidence = model.predict(crop)
                        print 'Predicted {0} face with confidence {1} (lower is more confident).'.format(
                            'POSITIVE' if label == config.POSITIVE_LABEL else 'NEGATIVE', 
                            confidence)
                                    
                        config.POSITIVE_THRESHOLD = 5000
                                    
                        if label == config.POSITIVE_LABEL:
                            print 'Recognized face!'
                            Pinlbl = Label(top2,  text = "Recognize Face", font=myfont, width=12)
                            Pinlbl.grid(row=0,column=3)
                            Pinlbl.configure(bg='#ff7700')
                            GPIO.output(Relay, GPIO.HIGH)  #Turn on Relay
                            time.sleep(5)                #Wait 5 Seconds
                            GPIO.output(LED, GPIO.LOW)   #Turn off LED
                            GPIO.output(Relay, GPIO.LOW)   #Turn off Relay
                            break

                        else:
                            print 'Did not recognize face!'
                            Pinlbl = Label(top2,  text = "Did Not Recognize Face", font=myfont, width=16)
                            Pinlbl.grid(row=0,column=3)
                            Pinlbl.configure(bg='#ff7700')
                            GPIO.output(Buzzer, GPIO.HIGH)  #Turn on Relay
                            time.sleep(5)
                            GPIO.output(LED, GPIO.LOW)   #Turn off LED
                            break          

    def Finger():
        continue_reading = True
    
        try:
            f = PyFingerprint('/dev/ttyUSB0', 57600, 0xFFFFFFFF, 0x00000000)

            if ( f.verifyPassword() == False ):
                raise ValueError('The given fingerprint sensor password is wrong!')

        except Exception as e:
            print('The fingerprint sensor could not be initialized!')
            Pinlbl = Label(top2,  text = "Finger Not Deteted", font=myfont, width=16)
            Pinlbl.grid(row=0,column=3)
            Pinlbl.configure(bg='#ff7700')
            print('Exception message: ' + str(e))
            continue_reading = False

            ## Gets some sensor information
            print('Currently used templates: ' + str(f.getTemplateCount()) +'/'+ str(f.getStorageCapacity()))

            ## Tries to search the finger and calculate hash
            try:
                print('Waiting for finger...')
                Pinlbl = Label(top2,  text = "Waiting For Finger", font=myfont, width=16)
                Pinlbl.grid(row=0,column=3)
                Pinlbl.configure(bg='#ff7700')

                ## Wait that finger is read
                while ( f.readImage() == False ):
                     pass

                ## Converts read image to characteristics and stores it in charbuffer 1
                f.convertImage(0x01)

                ## Searchs template
                result = f.searchTemplate()
                print(result)

                positionNumber = result[0]
                accuracyScore = result[1]
        
                lockstatus = SendtoServer("/scan/fingerprint/1",1,2, {'FingerPrint':str(positionNumber)})
                print(lockstatus)
            
                if lockstatus['status'] == 3:
                    Pinlbl = Label(top2,  text = "Access Danied", font=myfont, width=16)
                    Pinlbl.grid(row=0,column=3)
                    Pinlbl.configure(bg='#ff7700')
                    print("Access Denied, YOU SHALL NOT PASS!")
                    print(positionNumber)
                    continue_reading = False
                else:
                    print("Access Granted")
                    Pinlbl = Label(top2,  text = "Access Granted", font=myfont, width=16)
                    Pinlbl.grid(row=0,column=3)
                    Pinlbl.configure(bg='#ff7700')
                    GPIO.output(Relay, GPIO.HIGH)  #Turn on Relay
                    time.sleep(5)                #Wait 5 Seconds
                    GPIO.output(Relay, GPIO.LOW)   #Turn off Relay
                    continue_reading = False          

                ## Loads the found template to charbuffer 1
                f.loadTemplate(positionNumber, 0x01)

                ## Downloads the characteristics of template loaded in charbuffer 1
                characterics = str(f.downloadCharacteristics(0x01)).encode('utf-8')

                ## Hashes characteristics of template
                print('SHA-2 hash of template: ' + hashlib.sha256(characterics).hexdigest())

            except Exception as e:
                print('Operation failed!')
                print('Exception message: ' + str(e))
                continue_reading = False

    def Pin():
        pinCode = code.get()
        print("Pin code: ", pinCode) #Debug
    
        lockstatus = SendtoServer("/scan/pin/1",1,2, {'PIN':pinCode})
        print(lockstatus)
        if lockstatus['status'] == 0:
            Pinlbl = Label(top2,  text = "Access Denied", font=myfont, width=16)
            Pinlbl.grid(row=0,column=3)
            Pinlbl.configure(bg='#ff7700')
            print("Access Denied, YOU SHALL NOT PASS!")
            print(positionNumber)
            continue_reading = False
        else:
            Pinlbl = Label(top2,  text = "Access Granted", font=myfont, width=16)
            Pinlbl.grid(row=0,column=3)
            Pinlbl.configure(bg='#ff7700')
            print("Access Granted")
            GPIO.output(Relay, GPIO.HIGH)  #Turn on Relay
            time.sleep(5)                #Wait 5 Seconds
            GPIO.output(Relay, GPIO.LOW)   #Turn off Relay
            continue_reading = False 
    
    def A1():
        code.insert(END,1)
    def A2():
        code.insert(END,2)
    def A3():
        code.insert(END,3)
    def A4():
        code.insert(END,4)
    def A5():
        code.insert(END,5)
    def A6():
        code.insert(END,6)
    def A7():
        code.insert(END,7)
    def A8():
        code.insert(END,8)
    def A9():
        code.insert(END,9)
    def A0():
        code.insert(END,0)
    def DeleteBoard():
	code.delete(0, END)
    
    Judul = Label(top2,  text = "No. Pin", font=myfont, width=10)
    Judul.grid(row=0,column=1)
    Judul.configure(bg='#ff7700')
    
    code = Entry(top2, font=myfont, show ="*",  width=10)
    code.grid(row=1,column=1)
    
    cameraB = Button(top2, text='Camera', font=myfont, command=camera, bg='green', height=1, width=6)
    cameraB.grid(row=2, column=2)
    FingerB = Button(top2, text='Finger P', font=myfont, command=Finger, bg='blue', height=1, width=6)
    FingerB.grid(row=2, column=1)
    pinB = Button(top2, text='Pin', font=myfont, command=Pin, bg='orange', height=1, width=6)
    pinB.grid(row=2, column=0)
    
    CloseBut = Button(top2, text='Close', font=myfont, command=top2.destroy, bg='red', height=1, width=6)
    CloseBut.grid(row=6, column=2)
    pin0= Button(top2, text='0', font=myfont, command=A0, bg='yellow', height=1, width=6)
    pin0.grid(row=6, column=1)
    pin1 = Button(top2, text='1', font=myfont, command=A1, bg='yellow', height=1, width=6)
    pin1.grid(row=3, column=0)
    pin2 = Button(top2, text='2', font=myfont, command=A2, bg='yellow', height=1, width=6)
    pin2.grid(row=3, column=1)
    pin3 = Button(top2, text='3', font=myfont, command=A3, bg='yellow', height=1, width=6)
    pin3.grid(row=3, column=2)
    pin4 = Button(top2, text='4', font=myfont, command=A4, bg='yellow', height=1, width=6)
    pin4.grid(row=4, column=0)
    pin5 = Button(top2, text='5', font=myfont, command=A5, bg='yellow', height=1, width=6)
    pin5.grid(row=4, column=1)
    pin6 = Button(top2, text='6', font=myfont, command=A6, bg='yellow', height=1, width=6)
    pin6.grid(row=4, column=2)
    pin7 = Button(top2, text='7', font=myfont, command=A7, bg='yellow', height=1, width=6)
    pin7.grid(row=5, column=0)
    pin8 = Button(top2, text='8', font=myfont, command=A8, bg='yellow', height=1, width=6)
    pin8.grid(row=5, column=1)
    pin9= Button(top2, text='9', font=myfont, command=A9, bg='yellow', height=1, width=6)
    pin9.grid(row=5, column=2)
    pin0= Button(top2, text='0', font=myfont, command=A0, bg='yellow', height=1, width=6)
    pin0.grid(row=6, column=1)
    pinDelete = Button(top2, text='Delete', font=myfont, command=DeleteBoard, bg = 'purple', height=1, width=6)
    pinDelete.grid(row=6, column=0)

Pinlbl = Label(win,  text = "Select Our Menu", font=myfont, width=16)
Pinlbl.grid(row=0,column=2)
Pinlbl.configure(bg='#ff7700')

Judul = Label(win,  text = "Scan/In", font=myfont, width=10)
Judul.grid(row=1,column=1)
Judul.configure(bg='#ff7700')
Judul = Label(win,  text = "Register", font=myfont, width=10)
Judul.grid(row=1,column=3)
Judul.configure(bg='#ff7700')

exitbutton = Button(win, text='Exit', font=myfont, command=close, bg='red', height=1, width=6)
exitbutton.grid(row=2, column=2)

pinB = Button(win, text='Register', font=myfont, command=open1, bg='orange', height=1, width=6)
pinB.grid(row=2, column=3)
ScanB = Button(win, text='Scan', font=myfont, command=open2, bg='brown', height=1, width=6)
ScanB.grid(row=2, column=1)

win.protocol("WM_DELETE_WINDOW",close)
win.mainloop()
    
