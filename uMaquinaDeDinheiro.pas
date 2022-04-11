unit uMaquinaDeDinheiro;

interface

uses
  System.Classes;

Type
IMaquina = interface
    function MontarTroco(Troco : Double) : TList;
  end;
TCedula = (ceNota100, ceNota50, ceNota20, ceNota10, ceNota5, ceNota2,
 ceMoeda100, ceMoeda50, ceMoeda25, ceMoeda10, ceMoeda5, ceMoeda1);

TTroco = class(IMaquina)
  private
  FTipo : TCedula;
  FQuantidade: integer;
  public
  constructor Create(Tipo : TCedula; Quantidade: Integer); override;
  function GetTipo : TCedula;
  function GetQuantidade : Integer;
  procedure SetQuantidade (Quantidade : integer);
  function MontarTroco(Valor : Double) : TList;

end;

implementation

{ TTroco }

constructor TTroco.Create(Tipo: TCedula; Quantidade: Integer);
begin

end;

function TTroco.GetQuantidade: Integer;
begin
  Result := FQuantidade;
end;

function TTroco.GetTipo: TCedula;
begin
  Result := FTipo;
end;

function TTroco.MontarTroco(Valor: Double): TList;
var Resto : Double;
begin

end;

procedure TTroco.SetQuantidade(Quantidade: integer);
begin
  FQuantidade := GetQuantidade() + 1;
end;

end.
