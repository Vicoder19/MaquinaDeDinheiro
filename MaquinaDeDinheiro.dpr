program MaquinaDeDinheiro;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMaquina in 'uMaquina.pas' {Form2},
  uMaquinaDeDinheiro in 'uMaquinaDeDinheiro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
