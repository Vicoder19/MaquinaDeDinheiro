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
  procedure SetTipo(Tipo : TCedula);
  function MontarTroco(Valor : Double) : TList;
  function toString() : string;

end;

implementation

uses
  System.SysUtils, System.Variants;
var
 List : TList;
 const Cedula: array[1..12] of Double = (100.00, 50.00, 20.00, 10.00, 5.00, 2.00, 1.00,
                                         0.50, 0.25, 0.10, 0.05, 0.01 );
{ TTroco }

constructor TTroco.Create(Tipo: TCedula; Quantidade: Integer);
begin
  SetQuantidade(Quantidade);
  SetTipo(Tipo);
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
var Resto : Double;
    i : integer;
    Qtde : Integer;
    Cedulas : TTroco;
begin
  Resto := Valor;
  i := 1;
  List := TList.Create;
  while Resto > 0.01 do
  begin
    Qtde := Trunc(Resto / Cedula[i]);
    if Qtde > 0 then
    begin
      Cedulas := TTroco.Create(TCedula(i), Qtde);
      Resto := RoundTo((Resto - Cedula[i] * Qtde), -2);
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

procedure TTroco.SetTipo(Tipo: TCedula);
begin
  FTipo := Tipo;
end;

function TTroco.toString: string;
begin
  Result := 'Cédula ' + FloatToStr(Cedula[Integer(getTipo)]) + ' --> Quantidade: ' + inttostr(GetQuantidade);
end;

end.
