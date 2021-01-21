import RPi.GPIO as GPIO
import time

import requests

GPIO.setmode(GPIO.BOARD)

Relay = 37
GPIO.setup(Relay, GPIO.OUT)
GPIO.output(Relay, GPIO.LOW)

GPIO.setmode(GPIO.BOARD)
GPIO.setup(36, GPIO.IN, pull_up_down=GPIO.PUD_DOWN )

# server For API
server = "http://mfdl.primexaviers.com/api"

def SendtoServer(address,device,requestaction, data):
    try:
        if requestaction == 1:
            #GET
            if device==1:
                r = requests.get(url = server+address, params = data)
                return r.json()
            
        elif requestaction == 2:
            if device == 1:
                r = requests.post(url = server + address, data = data)
                return r.json
            
            elif device == 2 :            
                r = requests.post(url = server + address, data = data)
                return r.json      
    except requests.exceptions.RequestException as e:  # This is the correct syntax
        return 0
    
while True:
    lockstatus = SendtoServer("/CheckLock/1",1,1, {'Machine':1})
    if lockstatus != 0:
        if lockstatus['lock_stats'] == 1:
            continue_reading = True
            print("Door Open!")
            GPIO.output(Relay, GPIO.HIGH)  #Turn on Relay
            time.sleep(10)                #Wait 5 Seconds
            GPIO.output(Relay, GPIO.LOW)   #Turn off Relay
        else:
            if GPIO.input(36) == GPIO.HIGH:
                continue_reading = True
                print("Pushed!")
                GPIO.output(Relay, GPIO.HIGH)  #Turn on Relay
                time.sleep(5)                #Wait 5 Seconds
                GPIO.output(Relay, GPIO.LOW)   #Turn off Relay
                        
            elif GPIO.input(36) == GPIO.LOW :
                print(" Not Pushed")
                GPIO.output(Relay, GPIO.LOW)   #Turn off Relay
                
    else:
        if GPIO.input(36) == GPIO.HIGH:
            continue_reading = True
            print("Pushed!")
            GPIO.output(Relay, GPIO.HIGH)  #Turn on Relay
            time.sleep(5)                #Wait 5 Seconds
            GPIO.output(Relay, GPIO.LOW)   #Turn off Relay
                    
        elif GPIO.input(36) == GPIO.LOW :
            print(" Not Pushed")
            GPIO.output(Relay, GPIO.LOW)   #Turn off Relay
    
    time.sleep(0.5)                #Wait 5 Seconds
