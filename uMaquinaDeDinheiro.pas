unit uMaquinaDeDinheiro;

interface

uses
  System.Classes, System.Math;

Type
IMaquina = interface
    function MontarTroco(Troco : Double) : TList;
  end;

TCedula = (ceNota100, ceNota50, ceNota20, ceNota10, ceNota5, ceNota2,
 ceMoeda100, ceMoeda50, ceMoeda25, ceMoeda10, ceMoeda5, ceMoeda1);

TTroco = class(TInterfacedObject,IMaquina)
  private
  FTipo : TCedula;
  FQuantidade: integer;
  public
  constructor Create(Tipo : TCedula; Quantidade: Integer); overload;
  constructor Create(AOwner: TComponent); overload;
  function GetTipo : TCedula;
  function GetQuantidade : Integer;
  procedure SetQuantidade (Quantidade : integer);
  function MontarTroco(Valor : Double) : TList;
  function toString() : string;

end;

implementation

uses
  System.SysUtils;
var
 List : TList;
{ TTroco }

constructor TTroco.Create(Tipo: TCedula; Quantidade: Integer);
begin
  SetQuantidade(Quantidade);
end;

constructor TTroco.Create(AOwner: TComponent);
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
const Cedula: array[1..12] of Double = (100.00, 50.00, 20.00, 10.00, 5.00, 2.00, 1.00,
                                         0.50, 0.25, 0.10, 0.05, 0.01 );
var Resto : Double;
    i : integer;
    qtde : Int64;
    teste : Double;
    Cedulas : TTroco;
begin
  Resto := Valor;
  i := 1;
  List := TList.Create;
  while Resto > 0 do
  begin
    qtde := Trunc((Resto / Cedula[i]));
    teste := Cedula[i];
    if qtde > 0 then
    begin
      Cedulas := TTroco.Create(TCedula(i), qtde);
      Resto := Resto - Cedula[i] * qtde;
      List.Add(Cedulas);
    end;

    i := i + 1;

  end;
  Result := List;
end;

procedure TTroco.SetQuantidade(Quantidade: integer);
begin
  FQuantidade := Quantidade;
end;

function TTroco.toString: string;
begin
  Result := '' + inttostr(GetQuantidade);
end;

end.
