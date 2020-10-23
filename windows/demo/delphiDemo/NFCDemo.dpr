program NFCDemo;

uses
  Vcl.Forms,
  fmReadCard in 'fmReadCard.pas' {FormReadCard},
  fuIDInfoChild in 'fuIDInfoChild.pas' {fmIDInfoChild},
  duNFCReader in 'duNFCReader.pas',
  duGlob in 'duGlob.pas',
  duType in 'duType.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormReadCard, FormReadCard);
  Application.Run;
end.

