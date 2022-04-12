unit uMaquina;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.ScrollBox, FMX.Memo;

type
  IMaquina = interface
    function MontarTroco(Troco : Double) : TList;
  end;
  TForm2 = class(TForm)
    edtValor: TEdit;
    btnCalcularTroco: TButton;
    Label1: TLabel;
    memTroco: TMemo;
    btnLimpar: TButton;
    procedure edtValorExit(Sender: TObject);
    procedure btnCalcularTrocoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses uMaquinaDeDinheiro;

procedure TForm2.btnCalcularTrocoClick(Sender: TObject);
var
troco : TTroco;
list : TList;
i : integer;
begin

  troco := TTroco.Create;
  list := troco.MontarTroco(StrToFloat(edtValor.Text));
  for i := 0 to list.Count -1 do
  begin
    memTroco.Lines.Add(TTroco(list.Items[i]).toString);
  end;

end;

procedure TForm2.btnLimparClick(Sender: TObject);
begin
  memTroco.Lines.Clear;
end;

procedure TForm2.edtValorExit(Sender: TObject);
begin
  edtValor.Text := FormatFloat('###,###,##0.00', StrToFloat( StringReplace(edtValor.Text,'.','',[])));
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  edtValor.SetFocus;
end;

end.
