unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Math;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    Label3: TLabel;
    Edit3: TEdit;
    Label0: TLabel;
    Edit4: TEdit;
    ComboBox4: TComboBox;
    Label4: TLabel;
    Labelp: TLabel;
    CheckBox1: TCheckBox;
    Labelf: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    ComboBox5: TComboBox;
    Label6: TLabel;
    Edit6: TEdit;
    ComboBox6: TComboBox;
    Label7: TLabel;
    Edit7: TEdit;
    ComboBox7: TComboBox;
    procedure verifynum(Sender: TObject; var Key: Char);
    procedure calculate(Sender: TObject);
    procedure verifyint(Sender: TObject; var Key: Char);
    procedure populate(Sender: TObject);
    procedure check(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fill(Sender: TObject);
    procedure show(Sender: TObject);
    procedure editfriction(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  head, headloss, flow, efficiency, power, pipelength, pipediam, C: Extended;
  headunit, flowunit, powerunit, pipelengthunit, pipediamunit: Extended;
implementation

{$R *.DFM}

procedure TForm1.verifynum(Sender: TObject; var Key: Char);
begin
  if Key = ',' then Key := '.';
  If (Key in ['0'..'9', '.']) or (Key = #8) then exit
  else Key := #0;
end;

procedure TForm1.calculate(Sender: TObject);
var head, flow, efficiency, power: Extended;
begin
  show(self);
  if Edit1.Text = '' then head := 0 else head := strtofloat(Edit1.Text);
  if Edit2.Text = '' then flow := 0 else flow := strtofloat(Edit2.Text);
  if Edit3.Text = '' then efficiency := 0 else efficiency := strtofloat(Edit3.Text);
  if Edit5.Text = '' then pipelength := 0 else pipelength := strtofloat(Edit5.Text);
  if Edit6.Text = '' then pipediam := 0 else pipediam := strtofloat(Edit6.Text);
  if Edit7.Text = '' then C := 0 else C := strtofloat(Edit7.Text);
  if ComboBox1.ItemIndex = 0 then headunit := 1; // head is given in meters
  if ComboBox1.ItemIndex = 1 then headunit := 0.3048; // head is goven in feet
  if ComboBox2.ItemIndex = 0 then flowunit := 1; // flow is given in m3/s
  if ComboBox2.ItemIndex = 1 then flowunit := 1/60; // flow is fiven in m3/min
  if ComboBox2.ItemIndex = 2 then flowunit := 1/3600; // flow is fiven in m3/h
  if ComboBox2.ItemIndex = 3 then flowunit := 1/1000; // flow is given in l/s
  if ComboBox2.ItemIndex = 4 then flowunit := 1/60000; // flow is fiven in l/min
  if ComboBox2.ItemIndex = 5 then flowunit := 1/3600000; // flow is fiven in l/h
  if ComboBox2.ItemIndex = 6 then flowunit := 0.0037854118; // flow is given in gall/s
  if ComboBox2.ItemIndex = 7 then flowunit := 0.0037854118/60; // flow is fiven in gall/min
  if ComboBox2.ItemIndex = 8 then flowunit := 0.0037854118/3600; // flow is fiven in gall/h
  if ComboBox4.ItemIndex = 0 then powerunit := 1; // kW
  if ComboBox4.ItemIndex = 1 then powerunit := 24; // kWh/day
  if ComboBox4.ItemIndex = 2 then powerunit := 24*7; // kWh/week
  if ComboBox4.ItemIndex = 3 then powerunit := 24*365; // kWh/year
  if ComboBox5.ItemIndex = 0 then pipelengthunit := 1; // m
  if ComboBox5.ItemIndex = 1 then pipelengthunit := 0.3048; // ft
  if ComboBox6.ItemIndex = 0 then pipediamunit := 0.01; // cm
  if ComboBox6.ItemIndex = 1 then pipediamunit := 0.0254; // in
  if ComboBox7.ItemIndex = 0 then c := 160;
  if ComboBox7.ItemIndex = 1 then c := 160;
  if ComboBox7.ItemIndex = 2 then c := 120;
  if ComboBox7.ItemIndex = 3 then c := 60;
  if ComboBox7.ItemIndex = 4 then c := 130;
  if ComboBox7.ItemIndex = 5 then c := 80;
  if ComboBox7.ItemIndex = 6 then c := 140;
  if ComboBox7.ItemIndex = 7 then c := 100;
  if ComboBox7.ItemIndex = 8 then c := 140;
  if ComboBox7.ItemIndex = 9 then c := 140;
  if ComboBox7.ItemIndex = 10 then c := 150;
  Edit7.Text := floattostr(C);
  if not CheckBox1.Checked then headloss := 0 else
  begin
  if pipelength = 0 then headloss := 0 else
  if pipediam = 0 then headloss := head else
  headloss := 10.67 * 0.10193679 * (pipelength * pipelengthunit) / (pipediam * pipediamunit) * Exp(1.85 * Ln(flow*flowunit)) / Exp(1.85 * Ln(C));
  end;
  head := head - headloss;
  power := 9.81 * head * headunit * flow * flowunit * efficiency / 100;
  Edit4.Text := FloatToStrF(power * powerunit, ffNumber, 8, 2);
end;

procedure TForm1.verifyint(Sender: TObject; var Key: Char);
begin
  If (Key in ['0'..'9']) or (Key = #8) then exit
  else Key := #0;
end;

procedure TForm1.populate(Sender: TObject);
begin
  If Edit1.Text = '' then Edit1.Text := '0';
  If Edit2.Text = '' then Edit2.Text := '0';
  If Edit3.Text = '' then Edit3.Text := '0';
  If Edit5.Text = '' then Edit5.Text := '0';
  If Edit6.Text = '' then Edit6.Text := '0';
  If Edit7.Text = '' then Edit7.Text := '0';
end;

procedure TForm1.check(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if strtoint(Edit3.Text) > 100 then Edit3.Text := '100';
end;

procedure TForm1.fill(Sender: TObject);
begin
  if Edit3.Text = '' then Edit3.Text := '0';
end;

procedure TForm1.show(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin

  Label5.Top := Edit2.Top + Edit2.Height + 14;
  Edit5.Top := Label5.Top - 2;
  ComboBox5.Top := Edit5.Top;

  Label6.Top := Edit5.Top + Edit5.Height + 14;
  Edit6.Top := Label6.Top - 2;
  ComboBox6.Top := Edit6.Top;

  Label7.Top := Edit6.Top + Edit6.Height + 14;
  Edit7.Top := Label7.Top - 2;
  ComboBox7.Top := Edit7.Top;

  Label3.Top := Edit7.Top + Edit7.Height + 14;
  Edit3.Top := Label3.Top - 2;
  Labelp.Top := Label3.Top;

  Label4.Top := Edit3.Top + Edit3.Height + 14;
  Edit4.Top := Label3.Top - 2;
  ComboBox4.Top := Edit4.Top;
  CheckBox1.Top := ComboBox4.Top + ComboBox4.Height + 12;
  Labelf.Top := ComboBox4.Top + ComboBox4.Height + 14;

  Form1.ClientHeight := Labelf.Top + Labelf.Height + 10;
  end else
  begin

  Label1.Top := Label0.Top + Label0.Height + 14;
  Edit1.Top := Label1.Top - 2;
  Combobox1.Top := Edit1.Top;

  Label2.Top := Edit1.Top + Edit1.Height + 14;
  Edit2.Top := Label2.Top - 2;
  Combobox2.Top := Edit2.Top;

  Label3.Top := Edit2.Top + Edit2.Height + 14;
  Edit3.Top := Label3.Top - 2;
  Labelp.Top := Label3.Top;

  Label4.Top := Edit3.Top + Edit3.Height + 14;
  Edit4.Top := Label3.Top - 2;
  ComboBox4.Top := Edit4.Top;
  CheckBox1.Top := ComboBox4.Top + ComboBox4.Height + 12;
  Labelf.Top := ComboBox4.Top + ComboBox4.Height + 14;

  Form1.ClientHeight := Labelf.Top + Labelf.Height + 10;

  Label5.Top := Labelf.Top + Labelf.Height + 14;
  Edit5.Top := Label5.Top - 2;
  ComboBox5.Top := Edit5.Top;

  Label6.Top := Edit5.Top + Edit5.Height + 14;
  Edit6.Top := Label6.Top - 2;
  ComboBox6.Top := Edit6.Top;

  Label7.Top := Edit6.Top + Edit6.Height + 14;
  Edit7.Top := Label7.Top - 2;
  ComboBox7.Top := Edit7.Top;

  end;
end;

procedure TForm1.editfriction(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Edit7.Text = '' then Edit7.Text := '30';
  C := strtofloat(Edit7.Text);
  ComboBox7.ItemIndex := 11;
  if c < 30 then c := 30;
  calculate(self);
end;

end.
