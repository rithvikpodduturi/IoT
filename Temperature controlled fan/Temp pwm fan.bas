'--------------------------------main-------------------------------------------
$regfile = "m16def.dat"
$crystal = 1000000
'-------------------------------lcd---------------------------------------------
'rs=pinb.6,e=pinb.0,db4=pinb.2,db5=pinb.3,db6=pinb.4,db7=pinb.5
Config Lcd = 16 * 2
Config Lcdpin = Pin , Rs = Pinb.0 , E = Pinb.1 , Db4 = Pinb.2 , Db5 = Pinb.3 , Db6 = Pinb.4 , Db7 = Pinb.5

'-------------------------------key board---------------------------------------
Config Kbd = Portc
'Use the following code to disable JTAG
Mcusr = &H80
Mcusr = &H80
'--------------------------------pwm--------------------------------------------
Config Timer1 = Pwm , Pwm = 10 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Down , Prescale = 1
 Start Timer1
 '--------------------------------dim-------------------------------------------
 'a,b  for keyboard, c for chek , d for pwm
 Dim A As Word , B As Word , C As Word , D As Word , Tanzim As Byte , E As Byte
 Dim Lop As Byte
 Dim Dama As Byte , Lm35 As Word , Motor As Word
 '--------------------------------adc-------------------------------------------
 Config Adc = Single , Prescaler = Auto , Reference = Avcc
 Start Adc
 '--------------------------------main------------------------------------------
 Config Pind.4 = Output
 Config Pind.5 = Output
 '------------------------------------------------------------------------------
               A = 0
               B = 0
               Cursor Off
               Cls
               Locate 1 , 5
               Lcd "Hello"
               Wait 2
               Cls

 Main:
                Locate 1 , 1
                Lcd "Intern number    "
                 Locate 2 , 1
                Lcd "                 "
                Compare1a = 1
                Compare1b = 1

Rool:


               A = Getkbd()
               If A = 16 Then Goto Rool

                A = A + 1
               Select Case A :

               Case 1 To 3:

               Case 4:
               Cls
               Lcd "f1"
Goto Rool

               Case 5 To 7 :
               A = A - 1


               Case 8:
               Cls
               Lcd "f2"
 Goto Rool


               Case 9 To 11:
               A = A - 2


               Case 12:
               Cls
               Lcd "f3"
 Goto Rool


               Case 13:
               Cls
               Lcd "start"
               Wait 1
               Goto Lm35

               Case 14:
               A = 0

               Case 15:
               B = 0
               A = 0
               Cls
               Goto Main

               Case 16:
               Cls
               Lcd "f4"
 Goto Rool


               End Select


Tanzim3:
               B = B * 10
               A = A + B
               B = A

               Cls
               Locate 1 , 1
               Lcd B ; "          "
               Locate 2 , 1
               Lcd "push start set"



Lop:
               Lop = Getkbd()
               If Lop <> 16 Then Goto Lop
               Goto Rool

'-------------------------------------------------------------------------------

Lm35:

            Lm35 = Getadc(0)
            Waitms 10
            Lm35 = Lm35 / 2

            A = Getkbd()
            A = A + 1
            If A = 15 Then Goto Stops

            Locate 1 , 1
            Lcd "TEMPERATURE= " ; Lm35 ; "c  "

            If Lm35 =< B Then
            Compare1a = 1
            Compare1b = 1
            Motor = 0
            Locate 2 , 1
            Lcd "Set=" ; B ; "  pwm=" ; Motor ; "             "
            Goto Lm35
            End If


            If Lm35 > B Then
            D = Lm35 - B
            Gosub Motor1
            End If

           Goto Lm35



           Motor1:

            Motor = D * 100
            Motor = Motor + 50

            If Motor > 1022 Then
            Motor = 1023
            Locate 2 , 1
            Lcd "Set=" ; B ; "  pwm=fast                 "
            End If

            If Motor =< 1022 Then
            Locate 2 , 1
            Lcd "Set=" ; B ; "  pwm=" ; Motor ; "             "
            End If

            Compare1a = Motor
            Compare1b = Motor

            Return




Stops:
            A = 0
            B = 0
            Goto Main