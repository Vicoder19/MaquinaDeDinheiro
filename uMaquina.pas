unit uMaquina;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit;

type
  IMaquina = interface
    function MontarTroco(Troco : Double) : TList;
  end;
  TForm2 = class(TForm)
    edtValor: TEdit;
    btnCalcularTroco: TButton;
    Label1: TLabel;
    procedure edtValorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.edtValorExit(Sender: TObject);
begin
  edtValorExit := FormatFloat('###,###,##0.00', StrToFloat( StringReplace(edtValor.Text,'.','',[])));
end;

end.
