unit duType;

interface

uses
  Winapi.Messages, Vcl.Graphics, Winapi.Windows, System.SysUtils;

type
  TMSG_ID = (//
  ///<summary>��־��Ϣ</summary>
    TMSG_ID_SendStr = WM_USER + 1024, // �յ���־��Ϣ

    TMSG_ID_ReadIDCard  //���֤������Ϣ
);


  TMSG_wParam = (//

  ///<summary>����������</summary>
    TMSG_wParam_ReaderProgress,
    ///<summary>�����֤״̬</summary>
    TMSG_wParam_ReadIDCard

);




type
  // Ҫ���ݵ���Ϣ��¼.
  TStr_MSG = record
    MSG: array[0..1023] of AnsiChar; // ��ӡ������
  end;

  pStr_MSG = ^TStr_MSG;

type
  TParam = record
    Path: string;

  end;

implementation

uses
  duGlob;

initialization
  G_Param.Path := ExtractFilePath(ParamStr(0));

finalization

end.

