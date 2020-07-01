import cv2
import numpy as np
import utils

def getLaneCurve(img):
    h ,w, c = img.shape
    points = utils.valTrackbars()

    imgOriginal = img.copy()
    imgThres = utils.thresholding(img)
    imgWarp = utils.warpImg(img, points, w, h)
    imgWarpThres = utils.warpImg(imgThres, points, w, h)
    imgWarpPoints = utils.drawPoints(img, points)
    imgLane = img.copy()

    imgCanny = utils.canny(imgWarp)
    basePoint, imgHist = utils.getHistogram(imgWarpThres, display =True)
    imgSliding, curves, lanes, ploty = utils.sliding_window(imgWarpThres, draw_windows=True)

    curverad = utils.get_curve(imgLane, curves[0], curves[1])
    lane_curve = np.mean([curverad[0], curverad[1]])
    # imgLane = utils.drawLanes(img, curves[0], curves[1], frameWidth, frameHeight, src = points)
    # print(round((lane_curve-84.41)/7.5,2))

    imgStack = utils.stackImages(0.6, ([imgOriginal, imgWarpThres, imgWarpPoints],[imgHist, imgSliding, imgOriginal]))

    # cv2.imshow('Thres', imgThres)
    # cv2.imshow('Warp', imgWarpThres)
    # cv2.imshow('Warp Points', imgWarpPoints)
    # cv2.imshow('Canny', imgCanny)
    # cv2.imshow('Histogram', imgHist)
    # cv2.imshow('Sliding', imgSliding)
    # cv2.imshow('Lane', imgLane)
    cv2.imshow('Stack', imgStack)

    return None

if __name__ == '__main__':
    cameraFeed= True
    frameWidth= 640
    frameHeight = 480
    frameTime = 50 # time of each frame in ms, you can add logic to change this value.

    if cameraFeed:
        # cap = cv2.VideoCapture(0)
        cap = cv2.VideoCapture('images/output.mp4')
        cap.set(3, frameWidth)
        cap.set(4, frameHeight)

    initialTrackBarVals = [30,340,0,390,18,23]
    utils.initializeTrackbars(initialTrackBarVals)
    while True:
        if cameraFeed:
            _, img = cap.read()
            img = cv2.resize(img,(frameWidth,frameHeight))
            if cv2.waitKey(frameTime) & 0xFF == ord('q'):
                break
        else:
            img = cv2.imread('images/curved.jpg', cv2.IMREAD_COLOR)
            img = cv2.resize(img,(frameWidth,frameHeight))
        # img = img[::-1,:,:]
        getLaneCurve(img)
        cv2.waitKey(1)