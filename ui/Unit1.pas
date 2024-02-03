unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  UMGame,
  Generics.Collections, Generics.Defaults, Vcl.Imaging.pngimage;
const
  CenterSize = 450;
  CardHeight = 80;
  CardWidth = 50;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image12: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Image27: TImage;
    Image28: TImage;
    Image29: TImage;
    Image30: TImage;
    Image31: TImage;
    Image34: TImage;
    Image32: TImage;
    Image33: TImage;
    Image35: TImage;
    Image36: TImage;
    Image37: TImage;
    Image38: TImage;
    Image39: TImage;
    Image40: TImage;
    Image41: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    MGame: TMGame;
  public
    { Public declarations }
    BoardImg : Array[1..41] of TImage;
    function Scale(A:Word):Word;
    //function ScaleY(A:Word):Word;
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
function TForm1.Scale;
begin
  result := Round(A*ClientHeight/610);
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  MGame.playRound;
  Label1.Caption := MGame.getPlayers.First.getName + ' находится на ' + MGame.getPlayers.First.GetLocation.getName;
  Label2.Caption := MGame.getPlayers.Last.getName + ' находится на ' + MGame.getPlayers.Last.GetLocation.getName;
end;
procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  MGame := TMGame.create;
  BoardImg[1] := Image1;
  BoardImg[2] := Image2;
  BoardImg[3] := Image3;
  BoardImg[4] := Image4;
  BoardImg[5] := Image5;
  BoardImg[6] := Image6;
  BoardImg[7] := Image7;
  BoardImg[8] := Image8;
  BoardImg[9] := Image9;
  BoardImg[10] := Image10;
  BoardImg[11] := Image11;
  BoardImg[12] := Image12;
  BoardImg[13] := Image13;
  BoardImg[14] := Image14;
  BoardImg[15] := Image15;
  BoardImg[16] := Image16;
  BoardImg[17] := Image17;
  BoardImg[18] := Image18;
  BoardImg[19] := Image19;
  BoardImg[20] := Image20;
  BoardImg[21] := Image21;
  BoardImg[22] := Image22;
  BoardImg[23] := Image23;
  BoardImg[24] := Image24;
  BoardImg[25] := Image25;
  BoardImg[26] := Image26;
  BoardImg[27] := Image27;
  BoardImg[28] := Image28;
  BoardImg[29] := Image29;
  BoardImg[30] := Image30;
  BoardImg[31] := Image31;
  BoardImg[32] := Image32;
  BoardImg[33] := Image33;
  BoardImg[34] := Image34;
  BoardImg[35] := Image35;
  BoardImg[36] := Image36;
  BoardImg[37] := Image37;
  BoardImg[38] := Image38;
  BoardImg[39] := Image39;
  BoardImg[40] := Image40;
  BoardImg[41] := Image41;
   for I := 1 to 41 do
    begin
     BoardImg[i].Picture.LoadFromFile('./images/'+IntToStr(i)+'.PNG');
     BoardImg[i].Proportional := False;
     BoardImg[i].Stretch := True;
    end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
  I: Integer;
begin
  BoardImg[22].Left := 0;
  BoardImg[22].Width := Scale(CardHeight);
  BoardImg[23].Left := Scale(CardHeight);
  for I := 22 to 32 do
    begin
      BoardImg[i].Top := 0;
      BoardImg[i].Height:= Scale(CardHeight);
      if i>23 then BoardImg[i].Left := Scale(CardWidth)*(i-23)+BoardImg[23].Left;
      if i>22 then BoardImg[i].Width := Scale(CardWidth);
    end;
  BoardImg[32].Width := Scale(CardHeight);
  for I := 33 to 41 do
    begin
      BoardImg[i].Top := BoardImg[i-1].Top+BoardImg[i-1].Height;
      BoardImg[i].Left := BoardImg[32].Left;
      BoardImg[i].Width := BoardImg[32].Width;
      BoardImg[i].Height := Scale(CardWidth);
    end;
  Image2.Top := Image41.Top + Image41.Height;
  Image2.Left := Image32.Left;
  Image2.Width := Image32.Width;
  Image2.Height := Image32.Height;
  Image1.Top := Image22.Height;
  Image1.Left := Image22.Width;
  Image1.Width := Image32.Left-Image1.Left;
  Image1.Height := Image2.Top-Image1.Top;
  for I := 3 to 12 do
    begin
      BoardImg[i].Top := Image2.Top;
      BoardImg[i].Width := Scale(CardWidth);
      BoardImg[i].Height := Scale(CardHeight);
      BoardImg[i].Left := BoardImg[i-1].Left-BoardImg[i].Width;
    end;
  Image12.Left := 0;
  Image12.Width := Scale(CardHeight);
  for I := 13 to 21 do
    begin
      BoardImg[i].Left := 0;
      BoardImg[i].Width := Scale(CardHeight);
      BoardImg[i].Height := Scale(CardWidth);
      BoardImg[i].Top := BoardImg[i-1].Top - BoardImg[i].Height;
    end;
  //Image1.To
   //CardHeight
end;



end.
