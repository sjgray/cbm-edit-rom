( � PET/CBM CRTC REGISTER UTILITY V1 O � ================================ q � (C)STEVE J GRAY, 2025-02-11 w : �
 �"ONE SEC..." � �800:�500 � �--- MENU � �"�EDIT CRTC REGISTERS";P$; � �"UP/DN�=SELECT   LEFT/RIGHT�=ADJUST  X�=EXIT" 8 �"R�=RESTORE REG  F�=FIX ALL L�=LOAD Q�=QUIT+UNDO"; E �""; `! �--- DISPLAY ON SCREEN k" �A�.�N �# �D(A),�(�18�(A�N))N$(A) �$ � R,A:� D,V(A) �% �:�"�� �( �----------------------------- �2 �A$:X�0:�A$�"X"� � �; �A$�"Q"��"":�57371:� +< �A$�"�"�L�0��T$N$(L)U$:L�L�1:�A$T$""N$(L)U$ \F �A$�""�L�N��T$N$(L)U$:L�L�1:�A$T$""N$(L)U$ mP �A$�"�"�X��1 ~Q �A$�"["�X��1 �R �A$�"-"�X��8 �Z �A$�""�X� 1 �[ �A$�"]"�X� 1 �\ �A$�"+"�X� 8 �_ �A$�"L"��500:�20 �` �A$�"F"�200 d �A$�"R"��R,L:�D,D(L):V(L)�D(L):�V(L)"�  "U$ Jn �X�V(L)�(V(L)�X)�255:�V(L)"�  "U$:�R,L:�D,V(L) Rx �50 X� : r� �-- FIX ALL REGISTERS x� : �� �A�0�13:V(A)�D(A):�R,A:�D,V(A):� �� �20 ��: ���-- LOAD REGISTER SET ���"�SELECT SCREEN CRTC REGISTERS ��A�.�M � �(A�65);") ";C$(A):� A�"A�-";K$;"�=LOAD  SPACE�=EDIT  Q�=QUIT U&� A$:�A$�""�550 d0�A$�" "� � {5�A$�"Q"� �"":� �:C��(A$)�65 �D�A�0�13:B�R(C,A):V(A)�B:D(A)�B:�R,A:�D,B:� �N�550 �: � �-- INITIALIZE �!: 
	*� N$(20),R(20,13),C$(20),D(20),V(20) 3	4VR�32768:R�59520:D�R�1:M��1:N�13:L�N M	>T$�"":U$�"� l	CP$�"" �	H�--- READ CRTC VALUES �	R�A�.�N:� D(A),N$(A):V(A)�D(A):� �	\�--- READ REGISTER SETS �	f� X$:� X$�""� � �	pM�M�1:C$(M)�X$:K$��(65�M) 
z�B�0�13:� R(M,B):�:�870 
�: =
��-- CRTC DATA AND DESCRIPTIONS C
�: T
�� 49,H-TOTAL n
�� 40,H-CHRS DISPLAYED �
� 41,H-SYNC POSITION �
� 15,H-SYNC WIDTH �
� 40,V-TOTAL �
$� 05,V-TOTAL ADJUST �
.� 25,V-DISPLAYED �
8� 33,V-SYNC POSITION B� 00,MODE L� 07,CHR HEIGHT ,V� 00,CURSOR START @`� 00,CURSOR END \j� 16,DISPLAY ADDRESS HI xt� 00,DISPLAY ADDRESS LO ~�: ���--- CRTC REGISTER SETS ��: ���  CONFIGURATION NAME    R0 R1 R2 R3 R4  R5 R6 R7 R8 R9 R10 R11 R12 R13 8��  --------------------- -- -- -- -- -- --- -- -- -- -- --- --- --- --- ��� "40/80 TEXT     NA  ",49,40,41,15,40,  3,25,29, 0, 9,  0,  0, 16,  0 ��� "40/80 GRAPHIC  NA  ",49,40,41,15,32,  5,25,33, 0, 7,  0,  0, 16,  0 � "40/80 TEXT     EURO",49,40,41,15,39,  0,25,32, 0, 9,  0,  0, 16,  0 d� "40/80 GRAPHIC  EURO",49,40,41,15,49,  0,25,37, 0, 7,  0,  0, 16,  0 �� "8296D TEXT     EURO",58,40,44, 8,32,  9,25,29, 0, 9,  0,  0, 16,  0 � � "8296D GRAPHIC  EURO",58,40,44, 8,41,  3,25,34, 0, 7,  0,  0, 16,  0 E*� "NTSC               ",63,40,50,18,30,  6,25,28, 0, 7,  0,  0, 16,  0 �4� "NTSC / INVERT VIDEO",63,40,50,18,30,  6,25,28, 0, 7,  0,  0,  0,  0 �>� "PAL                ",63,40,47,20,36,123,25,32, 0, 7,  0,  0, 16,  0 &H� "PAL  / INVERT VIDEO",63,40,47,20,36,123,25,32, 0, 7,  0,  0,  0,  0 qR� "20/40 TEXT     NA  ",49,20,31,15,40,  5,25,33, 0, 9,  0,  0, 16,  0 z\� ""   