VERSION 5.00
Begin VB.Form Form4 
   Caption         =   "���֤"
   ClientHeight    =   5025
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   8700
   LinkTopic       =   "Form3"
   ScaleHeight     =   5025
   ScaleWidth      =   8700
   StartUpPosition =   3  '����ȱʡ
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   6840
      TabIndex        =   0
      Top             =   3720
      Width           =   1215
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type TwoIdInfoStructEx
    arrTwoIdName As String * 30            '���� UNICODE
    arrTwoIdSex As String * 2               '�Ա� UNICODE
    arrTwoIdNation As String * 4            '���� UNICODE
    arrTwoIdBirthday As String * 16         '�������� UNICODE YYYYMMDD
    arrTwoIdAddress As String * 70               'סַ UNICODE
    arrTwoIdNo As String * 36               '���֤���� UNICODE
    arrTwoIdSignedDepartment As String * 30 'ǩ������ UNICODE
    arrTwoIdValidityPeriodBegin As String * 16 '��Ч����ʼ���� UNICODE YYYYMMDD
    arrTwoIdValidityPeriodEnd As String * 16   '��Ч�ڽ�ֹ���� UNICODE YYYYMMDD ��Ч��Ϊ����ʱ�洢�����ڡ�
    
    arrTwoOtherNO As String * 18            'ͨ��֤�����
    arrTwoSignNum As String * 4             'ǩ������
    arrTwoRemark1 As String * 6             'Ԥ����
    arrTwoType As String * 2                '֤�����ͱ�ʶ
    arrTwoRemark2 As String * 6             'Ԥ����
    
    arrTwoIdNewAddress As String * 70       '����סַ UNICODE
    arrReserve As String * 2                '�����ֽ� �ֽڶ�����
    arrTwoIdPhoto As String * 1024          '��Ƭ��Ϣ
    arrTwoIdFingerprint As String * 1024    'ָ����Ϣ
    arrTwoIdPhotoJpeg As String * 4096      '��Ƭ��Ϣ JPEG ��ʽ
    unTwoIdPhotoJpegLength As Long          '��Ƭ��Ϣ���� JPEG��ʽ
End Type

Private Declare Function cardOpenDevice Lib "readCardInfo.dll" (ByVal nouttime As Long, ByVal nDeviceNo As Long) As Long
Private Declare Function cardReadTwoCard Lib "readCardInfo.dll" (ByVal nDeviceHandle As Long, ByVal cardCB As Long, ByVal szFactoryFlag As String, ByVal szServerIp As String, ByVal nServerPort As Long, ByRef cardinfo As TwoIdInfoStructEx, ByVal bTest As Boolean) As Boolean
Private Declare Function cardCloseDevice Lib "readCardInfo.dll" (ByVal nDeviceHandle As Long) As Long
Private Declare Function decodeCardImage Lib "readCardInfo.dll" (ByVal srcimage As String, ByVal outimage As String, outlen As Long) As Boolean
Private Declare Function cardBeep Lib "readCardInfo.dll" (ByVal nDeviceHandle As Long) As Long



Private Sub Command1_Click()
    Dim a As Long, b As Boolean, tmpCardInfo As TwoIdInfoStructEx
    a = cardOpenDevice(2, 0)
    Debug.Print a
    If a > 0 Then
        b = cardReadTwoCard(a, 0, "99ffb2f98a29071107c7a09ad2c6d096", "id.yzfuture.cn", 8848, tmpCardInfo, False)
        Call cardBeep(a)
        Debug.Print "cardReadTwoCard:", b
        Debug.Print StrConv(tmpCardInfo.arrTwoIdName, vbFromUnicode)
        
        'Debug.Print StrConv(tmpCardInfo.arrTwoIdName, vbWide)
        Debug.Print StrConv(tmpCardInfo.arrTwoIdAddress, vbFromUnicode)
        'Debug.Print StrConv(tmpCardInfo.arrTwoIdAddress, vbUnicode)
        Call cardCloseDevice(a)
    Debug.Print "ok"
    End If
End Sub

Private Sub Form_Load()
    'DecodeIP = id.yzfuture.cn
'DecodePort = 8848
'APPKEY=99ffb2f98a29071107c7a09ad2c6d096
End Sub
