import cv2
import numpy as np
import utils
import time

def getLaneCurve(img):
    imgCopy = img.copy()

    h ,w, c = img.shape
    points = utils.valTrackbars()

    imgThres = utils.thresholding(img)
    # imgWarp = utils.warpImg(img, points, w, h)
    imgWarpThres = utils.warpImg(imgThres, points, w, h)
    imgWarpPoints = utils.drawPoints(imgCopy, points)
    imgLane = img.copy()

    # imgCanny = utils.canny(imgWarp)
    basePoint, imgHist = utils.getHistogram(imgWarpThres, display =True)
    imgSliding, curves, lanes, ploty = utils.sliding_window(imgWarpThres, draw_windows=True)

    curverad = utils.get_curve(imgLane, curves[0], curves[1])
    lane_curve = np.mean([curverad[0], curverad[1]])
    imgLane = utils.drawLanes(img, curves[0], curves[1], frameWidth, frameHeight, src = points)
    # print(round((lane_curve-84.41)/7.5,2))

    imgStack = utils.stackImages(0.6, ([img, imgWarpThres, imgWarpPoints],[imgHist, imgSliding, imgLane]))
    cv2.imshow('Stack', imgStack)

    return cv2.resize(imgStack,(2*frameHeight,frameHeight))

if __name__ == '__main__':
    videoRecord = True
    videoRecordTime = 26
    cameraFeed = True
    frameWidth = 640
    frameHeight = 480
    frameTime = 50 # time of each frame in ms, you can add logic to change this value.
    start = time.time()

    if videoRecord:
        img_array = []
        imgOut = []

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
        
        if videoRecord:
            imgOut = getLaneCurve(img)
            img_array.append(imgOut)

        if time.time() - start > videoRecordTime:
            break
    
    if videoRecord:
        img_array.append(imgOut)
        out = cv2.VideoWriter('output/demo.avi',cv2.VideoWriter_fourcc(*'XVID'), 10, (2*frameHeight, frameHeight))
        for i in range(len(img_array)):
            out.write(img_array[i])
        out.release()