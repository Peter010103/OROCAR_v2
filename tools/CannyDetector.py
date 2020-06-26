import cv2
import numpy as np

def blur(img):
    imgGRAY = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    imgBLUR = cv2.GaussianBlur(imgGRAY, (5, 5), 0)
    return imgBLUR

def empty(a):
    pass

## cameraFeed = True indicates you are using a camera source, if False use test image (change image source below)
cameraFeed = False
frameWidth = 400
frameHeight = 300

if cameraFeed:
    cap = cv2.VideoCapture(0)
    cap.set(3, frameWidth)
    cap.set(4, frameHeight)

cv2.namedWindow("Canny")
cv2.resizeWindow("Canny",640,480)
cv2.createTrackbar("Canny MIN","Canny",0,255,empty)
cv2.createTrackbar("Canny MAX","Canny",255,255,empty)

while(True):
    if cameraFeed:
        _, img = cap.read()
    else:
        img = cv2.imread('images/straight.jpg', cv2.IMREAD_COLOR)
        img = cv2.resize(img,(frameWidth,frameHeight))
    
    imgBlur = blur(img)

    canny_min = cv2.getTrackbarPos("Canny MIN","Canny")
    canny_max = cv2.getTrackbarPos("Canny MAX", "Canny")
    imgCanny = cv2.inRange(blur(img),canny_min,canny_max)

    hStack = np.hstack([imgBlur, imgCanny])
    
    # cv2.imshow('IMAGE',imgCanny)
    # cv2.imshow('CANNY',imgCanny)
    cv2.imshow('Horizontal Stacking', hStack)

    if cv2.waitKey(1) and 0xFF == ord('q'):
        break