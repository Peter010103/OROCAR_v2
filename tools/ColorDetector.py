import cv2
import numpy as np

##### CHOOSE MEDIA TYPE #####
# False for image, True for video
cameraFeed = True
frameWidth = 640
frameHeight = 480
frameTime = 100

###### FILE PATHS ######
videopath = 'images/output.mp4'
imagepath = 'images/straight.jpg'

##### Initial Parameter Values #####
initialTrackBarVals = [5,50,100,230,150,220]
 
def empty(a):
    pass

def initializeTrackbars(intialTrackbarVals,wT=640, hT=480):
    cv2.namedWindow("HSV")
    cv2.resizeWindow("HSV",frameWidth,frameHeight)
    cv2.createTrackbar("HUE Min","HSV",initialTrackBarVals[0],179,empty)
    cv2.createTrackbar("HUE Max","HSV",initialTrackBarVals[1],179,empty)
    cv2.createTrackbar("SAT Min","HSV",initialTrackBarVals[2],255,empty)
    cv2.createTrackbar("SAT Max","HSV",initialTrackBarVals[3],255,empty)
    cv2.createTrackbar("VALUE Min","HSV",initialTrackBarVals[4],255,empty)
    cv2.createTrackbar("VALUE Max","HSV",initialTrackBarVals[5],255,empty)
 
initializeTrackbars(initialTrackBarVals)

if cameraFeed:
    cap = cv2.VideoCapture(videopath)
    cap.set(3, frameWidth)
    cap.set(4, frameHeight)

while True:
    if cameraFeed:
        _, img = cap.read()
        if cv2.waitKey(frameTime) & 0xFF == ord('q'):
            break
    else:
        img = cv2.imread(imagepath, cv2.IMREAD_COLOR)
        img = cv2.resize(img,(frameWidth,frameHeight))
    
    imgHsv = cv2.cvtColor(img,cv2.COLOR_BGR2HSV)
 
    h_min = cv2.getTrackbarPos("HUE Min","HSV")
    h_max = cv2.getTrackbarPos("HUE Max", "HSV")
    s_min = cv2.getTrackbarPos("SAT Min", "HSV")
    s_max = cv2.getTrackbarPos("SAT Max", "HSV")
    v_min = cv2.getTrackbarPos("VALUE Min", "HSV")
    v_max = cv2.getTrackbarPos("VALUE Max", "HSV")
 
    lower = np.array([h_min,s_min,v_min])
    upper = np.array([h_max,s_max,v_max])
    mask = cv2.inRange(imgHsv,lower,upper)
    result = cv2.bitwise_and(img,img, mask = mask)
 
    mask = cv2.cvtColor(mask, cv2.COLOR_GRAY2BGR)
    hStack = np.hstack([img,imgHsv,mask,result])

    cv2.imshow('Horizontal Stacking', hStack)
    if cv2.waitKey(1) and 0xFF == ord('q'):
        break
 
cap.release()
cv2.destroyAllWindows()