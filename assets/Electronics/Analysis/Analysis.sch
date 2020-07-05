EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Revised Waveshare Jetracer Board"
Date ""
Rev ""
Comp "Peter Woo"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Driver_Motor:DRV8870DDA U?
U 1 1 5F016141
P 8300 2100
F 0 "U?" H 8300 2581 50  0000 C CNN
F 1 "DRV8870DDA" H 8300 2490 50  0000 C CNN
F 2 "Package_SO:Texas_HTSOP-8-1EP_3.9x4.9mm_P1.27mm_EP2.95x4.9mm_Mask2.4x3.1mm_ThermalVias" H 8400 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/drv8870.pdf" H 8050 2450 50  0001 C CNN
	1    8300 2100
	1    0    0    -1  
$EndComp
$Comp
L Driver_Motor:DRV8870DDA U?
U 1 1 5F0176FA
P 8300 3350
F 0 "U?" H 8300 3831 50  0000 C CNN
F 1 "DRV8870DDA" H 8300 3740 50  0000 C CNN
F 2 "Package_SO:Texas_HTSOP-8-1EP_3.9x4.9mm_P1.27mm_EP2.95x4.9mm_Mask2.4x3.1mm_ThermalVias" H 8400 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/drv8870.pdf" H 8050 3700 50  0001 C CNN
	1    8300 3350
	1    0    0    -1  
$EndComp
$Comp
L Driver_LED:PCA9685PW U?
U 1 1 5F017E60
P 5600 2500
F 0 "U?" V 5500 2450 50  0000 C CNN
F 1 "PCA9685PW" V 5600 2450 50  0000 C CNN
F 2 "Package_SO:TSSOP-28_4.4x9.7mm_P0.65mm" H 5625 1525 50  0001 L CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCA9685.pdf" H 5200 3200 50  0001 C CNN
	1    5600 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Raspberry_Pi_2_3 J?
U 1 1 5F01944C
P 2400 2850
F 0 "J?" H 2700 1400 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 2700 1300 50  0000 C CNN
F 2 "" H 2400 2850 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 2400 2850 50  0001 C CNN
	1    2400 2850
	1    0    0    -1  
$EndComp
$Comp
L Motor:Motor_Servo M?
U 1 1 5F01E014
P 7750 4700
F 0 "M?" H 8082 4765 50  0000 L CNN
F 1 "Motor_Servo" H 8082 4674 50  0000 L CNN
F 2 "" H 7750 4510 50  0001 C CNN
F 3 "http://forums.parallax.com/uploads/attachments/46831/74481.png" H 7750 4510 50  0001 C CNN
	1    7750 4700
	1    0    0    -1  
$EndComp
$Comp
L Motor:Motor_DC M?
U 1 1 5F01F377
P 10050 2000
F 0 "M?" H 10208 1996 50  0000 L CNN
F 1 "Motor_DC" H 10208 1905 50  0000 L CNN
F 2 "" H 10050 1910 50  0001 C CNN
F 3 "~" H 10050 1910 50  0001 C CNN
	1    10050 2000
	1    0    0    -1  
$EndComp
$Comp
L Motor:Motor_DC M?
U 1 1 5F01FF67
P 10050 3250
F 0 "M?" H 10208 3246 50  0000 L CNN
F 1 "Motor_DC" H 10208 3155 50  0000 L CNN
F 2 "" H 10050 3160 50  0001 C CNN
F 3 "~" H 10050 3160 50  0001 C CNN
	1    10050 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F03C23E
P 2200 1250
F 0 "#PWR?" H 2200 1100 50  0001 C CNN
F 1 "+5V" H 2215 1423 50  0000 C CNN
F 2 "" H 2200 1250 50  0001 C CNN
F 3 "" H 2200 1250 50  0001 C CNN
	1    2200 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F03F120
P 2000 4350
F 0 "#PWR?" H 2000 4100 50  0001 C CNN
F 1 "GND" H 2005 4177 50  0000 C CNN
F 2 "" H 2000 4350 50  0001 C CNN
F 3 "" H 2000 4350 50  0001 C CNN
	1    2000 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 4150 2000 4350
Wire Wire Line
	2200 1250 2200 1350
$Comp
L power:+3.3V #PWR?
U 1 1 5F03DC9D
P 2500 1250
F 0 "#PWR?" H 2500 1100 50  0001 C CNN
F 1 "+3.3V" H 2515 1423 50  0000 C CNN
F 2 "" H 2500 1250 50  0001 C CNN
F 3 "" H 2500 1250 50  0001 C CNN
	1    2500 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1250 2500 1550
NoConn ~ 1600 1950
NoConn ~ 1600 2050
NoConn ~ 1600 2250
NoConn ~ 1600 2350
NoConn ~ 1600 2450
NoConn ~ 1600 2650
NoConn ~ 1600 2750
NoConn ~ 1600 2850
NoConn ~ 1600 3050
NoConn ~ 1600 3150
NoConn ~ 1600 3250
NoConn ~ 1600 3350
NoConn ~ 1600 3450
NoConn ~ 1600 3550
NoConn ~ 3200 1950
NoConn ~ 3200 2050
NoConn ~ 3200 2550
NoConn ~ 3200 2650
NoConn ~ 3200 2750
NoConn ~ 3200 2950
NoConn ~ 3200 3050
NoConn ~ 3200 3150
NoConn ~ 3200 3250
NoConn ~ 3200 3350
NoConn ~ 3200 3550
NoConn ~ 3200 3650
NoConn ~ 2600 1550
Wire Wire Line
	2200 1350 2300 1350
Wire Wire Line
	2300 1350 2300 1550
Connection ~ 2200 1350
Wire Wire Line
	2200 1350 2200 1550
Wire Wire Line
	4300 4600 4900 4600
Wire Wire Line
	3200 2350 4300 2350
Connection ~ 4300 2350
Wire Wire Line
	4300 2350 4300 4600
Wire Wire Line
	4900 2700 4750 2700
Wire Wire Line
	4750 2700 4750 2800
Wire Wire Line
	4900 2800 4750 2800
Connection ~ 4750 2800
Wire Wire Line
	4750 2800 4750 2900
Wire Wire Line
	4900 2900 4750 2900
Connection ~ 4750 2900
Wire Wire Line
	4750 2900 4750 3000
Wire Wire Line
	4900 3000 4750 3000
$Comp
L power:GND #PWR?
U 1 1 5F04CD55
P 4500 5000
F 0 "#PWR?" H 4500 4750 50  0001 C CNN
F 1 "GND" H 4505 4827 50  0000 C CNN
F 2 "" H 4500 5000 50  0001 C CNN
F 3 "" H 4500 5000 50  0001 C CNN
	1    4500 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5500 4750 5500
Wire Wire Line
	4750 5500 4750 5600
Wire Wire Line
	4900 5600 4750 5600
Connection ~ 4750 5600
Wire Wire Line
	4750 5600 4750 5700
Wire Wire Line
	4900 5700 4750 5700
Connection ~ 4750 5700
Wire Wire Line
	4750 5700 4750 5800
Wire Wire Line
	4900 5800 4750 5800
Connection ~ 4750 5800
Wire Wire Line
	4750 5800 4750 5900
Wire Wire Line
	4900 5900 4750 5900
Wire Wire Line
	4900 2100 4750 2100
Wire Wire Line
	4750 2100 4750 2700
Connection ~ 4750 2700
Wire Wire Line
	4900 2000 4750 2000
Wire Wire Line
	4750 2000 4750 2100
Connection ~ 4750 2100
Wire Wire Line
	4900 4800 4750 4800
Wire Wire Line
	4750 4800 4750 4900
Connection ~ 4750 5500
Wire Wire Line
	4900 4900 4750 4900
Connection ~ 4750 4900
Wire Wire Line
	4750 4900 4750 5500
Wire Wire Line
	4500 4800 4500 5000
Wire Wire Line
	4750 4800 4500 4800
Connection ~ 4750 4800
Wire Wire Line
	4100 2250 4100 1900
Wire Wire Line
	3200 2250 4100 2250
Connection ~ 4100 2250
Wire Wire Line
	4100 1900 4900 1900
Wire Wire Line
	4900 4700 4100 4700
Wire Wire Line
	4100 4700 4100 2250
$Comp
L power:+3.3V #PWR?
U 1 1 5F0613A7
P 4500 3150
F 0 "#PWR?" H 4500 3000 50  0001 C CNN
F 1 "+3.3V" H 4515 3323 50  0000 C CNN
F 2 "" H 4500 3150 50  0001 C CNN
F 3 "" H 4500 3150 50  0001 C CNN
	1    4500 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3150 4500 3200
Wire Wire Line
	4500 3200 4900 3200
$Comp
L power:+3.3V #PWR?
U 1 1 5F062CF8
P 4500 5950
F 0 "#PWR?" H 4500 5800 50  0001 C CNN
F 1 "+3.3V" H 4515 6123 50  0000 C CNN
F 2 "" H 4500 5950 50  0001 C CNN
F 3 "" H 4500 5950 50  0001 C CNN
	1    4500 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 5950 4500 6000
Wire Wire Line
	4500 6000 4900 6000
$Comp
L Driver_LED:PCA9685PW U?
U 1 1 5F021236
P 5600 5300
F 0 "U?" V 5500 5200 50  0000 C CNN
F 1 "PCA9685PW" V 5600 5200 50  0000 C CNN
F 2 "Package_SO:TSSOP-28_4.4x9.7mm_P0.65mm" H 5625 4325 50  0001 L CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCA9685.pdf" H 5200 6000 50  0001 C CNN
	1    5600 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F065762
P 5600 3600
F 0 "#PWR?" H 5600 3350 50  0001 C CNN
F 1 "GND" H 5605 3427 50  0000 C CNN
F 2 "" H 5600 3600 50  0001 C CNN
F 3 "" H 5600 3600 50  0001 C CNN
	1    5600 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F066458
P 5600 6400
F 0 "#PWR?" H 5600 6150 50  0001 C CNN
F 1 "GND" H 5605 6227 50  0000 C CNN
F 2 "" H 5600 6400 50  0001 C CNN
F 3 "" H 5600 6400 50  0001 C CNN
	1    5600 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5F067E68
P 5600 1250
F 0 "#PWR?" H 5600 1100 50  0001 C CNN
F 1 "+3.3V" H 5615 1423 50  0000 C CNN
F 2 "" H 5600 1250 50  0001 C CNN
F 3 "" H 5600 1250 50  0001 C CNN
	1    5600 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2000 4500 2000
Wire Wire Line
	4500 2000 4500 2200
$Comp
L power:GND #PWR?
U 1 1 5F0554DD
P 4500 2200
F 0 "#PWR?" H 4500 1950 50  0001 C CNN
F 1 "GND" H 4505 2027 50  0000 C CNN
F 2 "" H 4500 2200 50  0001 C CNN
F 3 "" H 4500 2200 50  0001 C CNN
	1    4500 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1800 4300 2350
Wire Wire Line
	4900 1800 4300 1800
Connection ~ 4750 2000
Wire Wire Line
	4900 3100 4750 3100
Wire Wire Line
	4750 3100 4750 3000
Connection ~ 4750 3000
$Comp
L Device:C C?
U 1 1 5F078B7C
P 6000 1350
F 0 "C?" V 6252 1350 50  0000 C CNN
F 1 "100n" V 6161 1350 50  0000 C CNN
F 2 "" H 6038 1200 50  0001 C CNN
F 3 "~" H 6000 1350 50  0001 C CNN
	1    6000 1350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F07DC72
P 6300 1400
F 0 "#PWR?" H 6300 1150 50  0001 C CNN
F 1 "GND" H 6305 1227 50  0000 C CNN
F 2 "" H 6300 1400 50  0001 C CNN
F 3 "" H 6300 1400 50  0001 C CNN
	1    6300 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1250 5600 1350
Wire Wire Line
	5850 1350 5600 1350
Connection ~ 5600 1350
Wire Wire Line
	5600 1350 5600 1500
Wire Wire Line
	6150 1350 6300 1350
Wire Wire Line
	6300 1350 6300 1400
$Comp
L power:+3.3V #PWR?
U 1 1 5F0843A7
P 5600 4050
F 0 "#PWR?" H 5600 3900 50  0001 C CNN
F 1 "+3.3V" H 5615 4223 50  0000 C CNN
F 2 "" H 5600 4050 50  0001 C CNN
F 3 "" H 5600 4050 50  0001 C CNN
	1    5600 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F0843AD
P 6000 4150
F 0 "C?" V 6252 4150 50  0000 C CNN
F 1 "100n" V 6161 4150 50  0000 C CNN
F 2 "" H 6038 4000 50  0001 C CNN
F 3 "~" H 6000 4150 50  0001 C CNN
	1    6000 4150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F0843B3
P 6300 4200
F 0 "#PWR?" H 6300 3950 50  0001 C CNN
F 1 "GND" H 6305 4027 50  0000 C CNN
F 2 "" H 6300 4200 50  0001 C CNN
F 3 "" H 6300 4200 50  0001 C CNN
	1    6300 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 4050 5600 4150
Wire Wire Line
	5850 4150 5600 4150
Connection ~ 5600 4150
Wire Wire Line
	5600 4150 5600 4300
Wire Wire Line
	6150 4150 6300 4150
Wire Wire Line
	6300 4150 6300 4200
NoConn ~ 2100 4150
NoConn ~ 2200 4150
NoConn ~ 2300 4150
NoConn ~ 2400 4150
NoConn ~ 2500 4150
NoConn ~ 2600 4150
NoConn ~ 2700 4150
$Comp
L power:+12V #PWR?
U 1 1 5F090246
P 8300 1550
F 0 "#PWR?" H 8300 1400 50  0001 C CNN
F 1 "+12V" H 8315 1723 50  0000 C CNN
F 2 "" H 8300 1550 50  0001 C CNN
F 3 "" H 8300 1550 50  0001 C CNN
	1    8300 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 1550 8300 1800
$Comp
L power:+12V #PWR?
U 1 1 5F091E89
P 8300 2800
F 0 "#PWR?" H 8300 2650 50  0001 C CNN
F 1 "+12V" H 8315 2973 50  0000 C CNN
F 2 "" H 8300 2800 50  0001 C CNN
F 3 "" H 8300 2800 50  0001 C CNN
	1    8300 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 2800 8300 3050
Wire Wire Line
	6300 2100 7550 2100
Wire Wire Line
	6300 2200 7450 2200
Wire Wire Line
	7450 2200 7450 2000
Wire Wire Line
	7450 2000 7900 2000
Wire Wire Line
	7550 2100 7550 3250
Wire Wire Line
	7550 3250 7900 3250
Connection ~ 7550 2100
Wire Wire Line
	7550 2100 7900 2100
Wire Wire Line
	7450 2200 7450 3350
Wire Wire Line
	7450 3350 7900 3350
Connection ~ 7450 2200
$Comp
L power:+3.3V #PWR?
U 1 1 5F0A50CD
P 7200 1550
F 0 "#PWR?" H 7200 1400 50  0001 C CNN
F 1 "+3.3V" H 7215 1723 50  0000 C CNN
F 2 "" H 7200 1550 50  0001 C CNN
F 3 "" H 7200 1550 50  0001 C CNN
	1    7200 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 2300 7900 2300
Wire Wire Line
	7200 1550 7200 2300
Wire Wire Line
	7200 2300 7200 3550
Wire Wire Line
	7200 3550 7900 3550
Connection ~ 7200 2300
NoConn ~ 6300 1800
NoConn ~ 6300 1900
NoConn ~ 6300 2000
NoConn ~ 6300 2300
NoConn ~ 6300 2400
NoConn ~ 6300 2500
NoConn ~ 6300 2600
NoConn ~ 6300 2700
NoConn ~ 6300 2800
NoConn ~ 6300 2900
NoConn ~ 6300 3000
NoConn ~ 6300 3100
NoConn ~ 6300 3200
NoConn ~ 6300 3300
Wire Wire Line
	8700 2000 9400 2000
Wire Wire Line
	9400 2000 9400 1700
Wire Wire Line
	9400 1700 10050 1700
Wire Wire Line
	10050 1700 10050 1800
Wire Wire Line
	8700 2100 9400 2100
Wire Wire Line
	9400 2100 9400 2400
Wire Wire Line
	9400 2400 10050 2400
Wire Wire Line
	10050 2400 10050 2300
Wire Wire Line
	8700 3250 9400 3250
Wire Wire Line
	9400 3250 9400 2950
Wire Wire Line
	9400 2950 10050 2950
Wire Wire Line
	8700 3350 9400 3350
Wire Wire Line
	9400 3350 9400 3650
Wire Wire Line
	9400 3650 10050 3650
Wire Wire Line
	10050 3050 10050 2950
Wire Wire Line
	10050 3550 10050 3650
$Comp
L power:GND #PWR?
U 1 1 5F0D4BEF
P 8850 3950
F 0 "#PWR?" H 8850 3700 50  0001 C CNN
F 1 "GND" H 8855 3777 50  0000 C CNN
F 2 "" H 8850 3950 50  0001 C CNN
F 3 "" H 8850 3950 50  0001 C CNN
	1    8850 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3750 8300 3850
Wire Wire Line
	8300 3850 8850 3850
Wire Wire Line
	8850 3850 8850 3950
Wire Wire Line
	8700 3550 8850 3550
Wire Wire Line
	8850 3550 8850 3850
Connection ~ 8850 3850
Wire Wire Line
	8300 2500 8300 2550
Wire Wire Line
	8300 2550 8850 2550
Wire Wire Line
	8850 2550 8850 3550
Connection ~ 8850 3550
Wire Wire Line
	8700 2300 8850 2300
Wire Wire Line
	8850 2300 8850 2550
Connection ~ 8850 2550
Connection ~ 10050 5400
Wire Wire Line
	9850 5400 10050 5400
Wire Wire Line
	10050 5000 10050 5400
Wire Wire Line
	9850 5000 10050 5000
Wire Wire Line
	9350 5400 9350 5800
Connection ~ 9350 5400
Wire Wire Line
	9550 5400 9350 5400
Wire Wire Line
	9350 5800 9550 5800
Wire Wire Line
	9350 5000 9350 5400
Wire Wire Line
	9550 5000 9350 5000
$Comp
L Device:C C?
U 1 1 5F0E43DB
P 9700 5000
F 0 "C?" V 9952 5000 50  0000 C CNN
F 1 "100u" V 9861 5000 50  0000 C CNN
F 2 "" H 9738 4850 50  0001 C CNN
F 3 "~" H 9700 5000 50  0001 C CNN
	1    9700 5000
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5F0E1EAC
P 9700 5400
F 0 "C?" V 9952 5400 50  0000 C CNN
F 1 "10u" V 9861 5400 50  0000 C CNN
F 2 "" H 9738 5250 50  0001 C CNN
F 3 "~" H 9700 5400 50  0001 C CNN
	1    9700 5400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5F0DFB64
P 9700 5800
F 0 "C?" V 9952 5800 50  0000 C CNN
F 1 "100n" V 9861 5800 50  0000 C CNN
F 2 "" H 9738 5650 50  0001 C CNN
F 3 "~" H 9700 5800 50  0001 C CNN
	1    9700 5800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10050 5800 9850 5800
Wire Wire Line
	10050 5400 10050 5800
$Comp
L power:+12V #PWR?
U 1 1 5F102AA8
P 9350 4850
F 0 "#PWR?" H 9350 4700 50  0001 C CNN
F 1 "+12V" H 9365 5023 50  0000 C CNN
F 2 "" H 9350 4850 50  0001 C CNN
F 3 "" H 9350 4850 50  0001 C CNN
	1    9350 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 4850 9350 5000
$Comp
L power:GND #PWR?
U 1 1 5F1058B2
P 10050 5900
F 0 "#PWR?" H 10050 5650 50  0001 C CNN
F 1 "GND" H 10055 5727 50  0000 C CNN
F 2 "" H 10050 5900 50  0001 C CNN
F 3 "" H 10050 5900 50  0001 C CNN
	1    10050 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 5800 10050 5900
Connection ~ 9350 5000
Connection ~ 10050 5800
Text Notes 4400 1550 0    50   ~ 10
I2C Address: 0x60
Text Notes 4400 4350 0    50   ~ 10
I2C Address: 0x40
Wire Wire Line
	6300 4600 7450 4600
$Comp
L power:+5V #PWR?
U 1 1 5F1289FD
P 7100 4300
F 0 "#PWR?" H 7100 4150 50  0001 C CNN
F 1 "+5V" H 7115 4473 50  0000 C CNN
F 2 "" H 7100 4300 50  0001 C CNN
F 3 "" H 7100 4300 50  0001 C CNN
	1    7100 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4700 7450 4700
Wire Wire Line
	7100 4300 7100 4700
$Comp
L power:GND #PWR?
U 1 1 5F12EB5D
P 7100 4900
F 0 "#PWR?" H 7100 4650 50  0001 C CNN
F 1 "GND" H 7105 4727 50  0000 C CNN
F 2 "" H 7100 4900 50  0001 C CNN
F 3 "" H 7100 4900 50  0001 C CNN
	1    7100 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4900 7100 4800
Wire Wire Line
	7100 4800 7450 4800
NoConn ~ 6300 4700
NoConn ~ 6300 4800
NoConn ~ 6300 4900
NoConn ~ 6300 5000
NoConn ~ 6300 5100
NoConn ~ 6300 5200
NoConn ~ 6300 5300
NoConn ~ 6300 5400
NoConn ~ 6300 5500
NoConn ~ 6300 5600
NoConn ~ 6300 5700
NoConn ~ 6300 5800
NoConn ~ 6300 5900
NoConn ~ 6300 6000
NoConn ~ 6300 6100
$EndSCHEMATC
