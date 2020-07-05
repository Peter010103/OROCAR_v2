import cv2
import numpy as np

def thresholding(img):
    imgHSV = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    lowerColor = np.array([5,100,150])
    upperColor = np.array([50,230,220])
    maskColor = cv2.inRange(imgHSV, lowerColor, upperColor)

    # imgTHRES = cv2.bitwise_or(maskColor, canny(img))
    imgTHRES = maskColor

    return imgTHRES

def canny(img):
    canny_min = cv2.getTrackbarPos("Canny MIN","Trackbars")
    canny_max = cv2.getTrackbarPos("Canny MAX", "Trackbars")

    imgGRAY = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    imgBLUR = cv2.GaussianBlur(imgGRAY, (15, 15), 0)
    imgCANNY = cv2.Canny(imgBLUR, canny_min, canny_max)

    return imgCANNY

def warpImg(img, points, w, h):
    pts1 = np.float32(points)
    pts2 = np.float32([[0,0],[w,0],[0,h],[w,h]])
    matrix = cv2.getPerspectiveTransform(pts1, pts2)
    imgWARP = cv2.warpPerspective(img, matrix, (w,h))

    return imgWARP

def getHistogram(img, minPercentage = 0.2, display = False, region= 2):
    histValues = np.sum(img, axis=0)
    # print(histValues)
    maxValue = np.max(histValues)
    minValue = minPercentage*maxValue

    indexArray = np.where(histValues >= minValue)
    basePoint = int(np.average(indexArray))
    # print(basePoint)

    if display:
        imgHist = np.zeros((img.shape[0], img.shape[1], 3), np.uint8)
        for x, intensity in enumerate(histValues):
            if intensity > minValue:
                color=(255,0,255)
            else: color=(0,0,255)

            cv2.line(imgHist, (x, img.shape[0]), (x, img.shape[0]-int(intensity//255//region)), color,1)
        cv2.circle(imgHist,(basePoint,img.shape[0]), 20, (0,255,255), cv2.FILLED)
        return basePoint, imgHist

    return basePoint

def get_hist(img):
    hist = np.sum(img[img.shape[0]//2:,:], axis=0)
    return hist

left_a, left_b, left_c = [], [], []
right_a, right_b, right_c = [], [], []

def sliding_window(img, nwindows=5, margin=40, minpix=1, draw_windows=True):
    global left_a, left_b, left_c, right_a, right_b, right_c
    left_fit_ = np.empty(3)
    right_fit_ = np.empty(3)
    out_img = np.dstack((img, img, img)) * 255

    histogram = get_hist(img)

    # find peaks of left and right halves
    midpoint = int(histogram.shape[0] / 2)
    leftx_base = np.argmax(histogram[:midpoint])
    rightx_base = np.argmax(histogram[midpoint:]) + midpoint

    # print(leftx_base)
    # print(rightx_base)
    # print()

    # Set height of windows
    window_height = np.int(img.shape[0] / nwindows)
    
    # Identify the x and y positions of all nonzero pixels in the image
    nonzero = img.nonzero()
    nonzeroy = np.array(nonzero[0])
    nonzerox = np.array(nonzero[1])
    
    # Current positions to be updated for each window
    leftx_current = leftx_base
    rightx_current = rightx_base

    # Create empty lists to receive left and right lane pixel indices
    left_lane_inds = []
    right_lane_inds = []

    # Step through the windows one by one
    for window in range(nwindows):
        # Identify window boundaries in x and y (and right and left)
        win_y_low = img.shape[0] - (window + 1) * window_height
        win_y_high = img.shape[0] - window * window_height
        win_xleft_low = leftx_current - margin
        win_xleft_high = leftx_current + margin
        win_xright_low = rightx_current - margin
        win_xright_high = rightx_current + margin
        
        # Draw the windows on the visualization image
        if draw_windows == True:
            cv2.rectangle(out_img, (win_xleft_low, win_y_low), (win_xleft_high, win_y_high),
                          (100, 255, 255), 1)
            cv2.rectangle(out_img, (win_xright_low, win_y_low), (win_xright_high, win_y_high),
                          (100, 255, 255), 1)
        
        # Identify the nonzero pixels in x and y within the window
        good_left_inds = ((nonzeroy >= win_y_low) & (nonzeroy < win_y_high) &
                          (nonzerox >= win_xleft_low) & (nonzerox < win_xleft_high)).nonzero()[0]
        good_right_inds = ((nonzeroy >= win_y_low) & (nonzeroy < win_y_high) &
                           (nonzerox >= win_xright_low) & (nonzerox < win_xright_high)).nonzero()[0]
        if len(good_left_inds)==0:
            good_left_inds =good_right_inds
        if len(good_right_inds)==0:
            good_right_inds =good_left_inds

        # Append these indices to the lists
        left_lane_inds.append(good_left_inds)
        right_lane_inds.append(good_right_inds)
        
        # If you found > minpix pixels, recenter next window on their mean position
        if len(good_left_inds) > minpix:
            leftx_current = np.int(np.mean(nonzerox[good_left_inds]))
        if len(good_right_inds) > minpix:
            rightx_current = np.int(np.mean(nonzerox[good_right_inds]))

    # Concatenate the arrays of indices
    left_lane_inds = np.concatenate(left_lane_inds)
    right_lane_inds = np.concatenate(right_lane_inds)

    # Extract left and right line pixel positions
    leftx = nonzerox[left_lane_inds]
    lefty = nonzeroy[left_lane_inds]
    rightx = nonzerox[right_lane_inds]
    righty = nonzeroy[right_lane_inds]

    if leftx.size and rightx.size:
        # print('Left: ',leftx.size)
        # print('Right: ', rightx.size)
        # print()
        
        # Fit a second order polynomial to each
        left_fit = np.polyfit(lefty, leftx, 2)
        right_fit = np.polyfit(righty, rightx, 2)

        left_a.append(left_fit[0])
        left_b.append(left_fit[1])
        left_c.append(left_fit[2])

        right_a.append(right_fit[0])
        right_b.append(right_fit[1])
        right_c.append(right_fit[2])

        left_fit_[0] = np.mean(left_a[-10:])
        left_fit_[1] = np.mean(left_b[-10:])
        left_fit_[2] = np.mean(left_c[-10:])

        right_fit_[0] = np.mean(right_a[-10:])
        right_fit_[1] = np.mean(right_b[-10:])
        right_fit_[2] = np.mean(right_c[-10:])

        # Generate x and y values for plotting
        ploty = np.linspace(0, img.shape[0] - 1, img.shape[0])

        left_fitx = left_fit_[0] * ploty ** 2 + left_fit_[1] * ploty + left_fit_[2]
        right_fitx = right_fit_[0] * ploty ** 2 + right_fit_[1] * ploty + right_fit_[2]

        out_img[nonzeroy[left_lane_inds], nonzerox[left_lane_inds]] = [255, 0, 100]
        out_img[nonzeroy[right_lane_inds], nonzerox[right_lane_inds]] = [0, 100, 255]

        return out_img, (left_fitx, right_fitx), (left_fit_, right_fit_), ploty
    else:
        return img,(0,0),(0,0),0

def get_curve(img, leftx, rightx):
    # Create linspace of pixels in y direction
    ploty = np.linspace(0, img.shape[0] - 1, img.shape[0])

    y_eval = np.max(ploty)
    ym_per_pix = 1 / img.shape[0]  # meters per pixel in y dimension
    xm_per_pix = 0.1 / img.shape[1]  # meters per pixel in x dimension

    # Fit new polynomials to x,y in world space
    if type(leftx) != np.ndarray:
        leftx = np.zeros((img.shape[0],))
    if type(rightx) != np.ndarray:
        rightx = np.zeros((img.shape[0],))

    left_fit_cr = np.polyfit(ploty * ym_per_pix, leftx * xm_per_pix, 2)
    right_fit_cr = np.polyfit(ploty * ym_per_pix, rightx * xm_per_pix, 2)

    # Calculate the new radii of curvature (using curvature formula)
    left_curverad = ((1 + (2 * left_fit_cr[0] * y_eval * ym_per_pix + left_fit_cr[1]) ** 2) ** 1.5) / np.absolute(
        2 * left_fit_cr[0])
    right_curverad = ((1 + (2 * right_fit_cr[0] * y_eval * ym_per_pix + right_fit_cr[1]) ** 2) ** 1.5) / np.absolute(
        2 * right_fit_cr[0])

    car_pos = img.shape[1] / 2
    l_fit_x_int = left_fit_cr[0] * img.shape[0] ** 2 + left_fit_cr[1] * img.shape[0] + left_fit_cr[2]
    r_fit_x_int = right_fit_cr[0] * img.shape[0] ** 2 + right_fit_cr[1] * img.shape[0] + right_fit_cr[2]
    lane_center_position = (r_fit_x_int + l_fit_x_int) / 2
    center = (car_pos - lane_center_position) * xm_per_pix / 10
    
    # Now our radius of curvature is in meters

    return (l_fit_x_int, r_fit_x_int, center)

############################## Visual Elements ##############################

def nothing(a):
    pass

def initializeTrackbars(intialTrackbarVals,wT=640, hT=480):
    cv2.namedWindow("Trackbars")
    cv2.resizeWindow("Trackbars", 640, 480)
    cv2.createTrackbar("Width Top", "Trackbars", intialTrackbarVals[0],wT//2, nothing)
    cv2.createTrackbar("Height Top", "Trackbars", intialTrackbarVals[1], hT, nothing)
    cv2.createTrackbar("Width Bottom", "Trackbars", intialTrackbarVals[2],wT//2, nothing)
    cv2.createTrackbar("Height Bottom", "Trackbars", intialTrackbarVals[3], hT, nothing)
    cv2.createTrackbar("Canny MIN", "Trackbars", intialTrackbarVals[4], 255, nothing)
    cv2.createTrackbar("Canny MAX", "Trackbars", intialTrackbarVals[5],255, nothing)

def valTrackbars(wT=640, hT=480):
    widthTop = cv2.getTrackbarPos("Width Top", "Trackbars")
    heightTop = cv2.getTrackbarPos("Height Top", "Trackbars")
    widthBottom = cv2.getTrackbarPos("Width Bottom", "Trackbars")
    heightBottom = cv2.getTrackbarPos("Height Bottom", "Trackbars")
    points = np.float32([(widthTop, heightTop), (wT-widthTop, heightTop),
                      (widthBottom , heightBottom ), (wT-widthBottom, heightBottom)])
    return points

def drawPoints(img, points):
    for x in range(4):
        cv2.circle(img, (points[x][0], points[x][1]), 5, (0,0,255), cv2.FILLED)
        # print(points[x])
    return img

def drawLanes(img, left_fit, right_fit,frameWidth,frameHeight,src):
    ploty = np.linspace(0, img.shape[0] - 1, img.shape[0])
    color_img = np.zeros_like(img)

    if type(left_fit) != np.ndarray:
        left_fit = np.zeros((480,))
        # left_fit = np.linspace(0, img.shape[1])
    if type(right_fit) != np.ndarray:
        right_fit = np.ones((480,))*frameWidth

    # print(left_fit.shape)
    # if left_fit.shape == (480,) and right_fit.shape == (480,):
    left = np.array([np.transpose(np.vstack([left_fit, ploty]))])
    right = np.array([np.flipud(np.transpose(np.vstack([right_fit, ploty])))])
    points = np.hstack((left, right))
    cv2.fillPoly(color_img, np.int_(points), (88, 86, 240))
    
    return color_img

def stackImages(scale,imgArray):
    rows = len(imgArray)
    cols = len(imgArray[0])
    rowsAvailable = isinstance(imgArray[0], list)
    width = imgArray[0][0].shape[1]
    height = imgArray[0][0].shape[0]
    if rowsAvailable:
        for x in range ( 0, rows):
            for y in range(0, cols):
                if imgArray[x][y].shape[:2] == imgArray[0][0].shape [:2]:
                    imgArray[x][y] = cv2.resize(imgArray[x][y], (0, 0), None, scale, scale)
                else:
                    imgArray[x][y] = cv2.resize(imgArray[x][y], (imgArray[0][0].shape[1], imgArray[0][0].shape[0]), None, scale, scale)
                if len(imgArray[x][y].shape) == 2: imgArray[x][y]= cv2.cvtColor( imgArray[x][y], cv2.COLOR_GRAY2BGR)
        imageBlank = np.zeros((height, width, 3), np.uint8)
        hor = [imageBlank]*rows
        hor_con = [imageBlank]*rows
        for x in range(0, rows):
            hor[x] = np.hstack(imgArray[x])
        ver = np.vstack(hor)
    else:
        for x in range(0, rows):
            if imgArray[x].shape[:2] == imgArray[0].shape[:2]:
                imgArray[x] = cv2.resize(imgArray[x], (0, 0), None, scale, scale)
            else:
                imgArray[x] = cv2.resize(imgArray[x], (imgArray[0].shape[1], imgArray[0].shape[0]), None,scale, scale)
            if len(imgArray[x].shape) == 2: imgArray[x] = cv2.cvtColor(imgArray[x], cv2.COLOR_GRAY2BGR)
        hor= np.hstack(imgArray)
        ver = hor
    return ver