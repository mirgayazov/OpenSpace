unit Open_space;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, mmsystem, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Menus, Vcl.MPlayer;

type
  TForm2 = class(TForm)
    main_image: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image14: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N1: TMenuItem;
    N41: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Timer1: TTimer;
    MediaPlayer1: TMediaPlayer;
    MediaPlayer2: TMediaPlayer;
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure main_imageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure main_imageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure main_imageClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nx,ny:integer;
  end;

var
  Form2: TForm2;

implementation
uses text_editor,photo_view_,video, LW9, paint, about;
{$R *.dfm}

procedure CheckFocus;
begin
  while True do
  begin
    if ((video_form.Focused)or(photo_view.focused)) then
    begin
       ShowMessage('focused');
    end
    else sleep(1000);
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  Comp : TComponent;
begin
  MediaPlayer1.FileName:='C:\Users\79876\Desktop\OpenSpace\Sounds\ss.wav';
  MediaPlayer1.Open;
  MediaPlayer1.Play;
  Form2.Brush.Style := bsClear;
  Form2.BorderStyle := bsNone;
  Form2.TransparentColorValue := clcream;
  Form2.transparentcolor := true;
  Form2.Color := clcream;
end;

procedure TForm2.Image14Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm2.Image1Click(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
  video_form.Show;
end;

procedure TForm2.Image3Click(Sender: TObject);
begin
  photo_view.Show;
end;

procedure TForm2.Image4Click(Sender: TObject);
begin
  DBForm.Show;
end;

procedure TForm2.Image5Click(Sender: TObject);
begin
  PaintForm.Show;
end;

procedure TForm2.Image6Click(Sender: TObject);
begin
  aboutform.ShowModal;
end;

procedure TForm2.Image7Click(Sender: TObject);
var lowerLeft: TPoint;
begin
  lowerLeft := Point(Image7.Left+Image7.Width+20,Image7.Top);
  lowerLeft := ClientToScreen(lowerLeft);
  PopupMenu1.Popup(lowerLeft.X, lowerLeft.Y);
end;

procedure TForm2.main_imageClick(Sender: TObject);
begin
  SetForegroundWindow(FindWindow('TForm2','���������'));
end;

procedure TForm2.main_imageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  nx:=x;ny:=y;
end;

procedure TForm2.main_imageMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssleft in shift then begin
    Form2.Top:= Form2.Top+y-ny;
    Form2.Left:= Form2.Left+x-nx;
  end;
end;

procedure TForm2.N6Click(Sender: TObject);
begin
  MediaPlayer1.Play;
end;

procedure TForm2.N7Click(Sender: TObject);
begin
  MediaPlayer1.stop;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  with video_form do
      begin
        if video_form.active then
        begin
          if mode=play then
           begin
             MediaPlayer1.stop;
           end
           else
           begin
             if (mode=stop) or (mode=paused) then MediaPlayer1.play;
           end;
        end;
      end;
  with Photo_view do
      begin
        if photo_view.active then
        begin
          if play.Caption='�������� ||' then MediaPlayer1.stop
          else if play.Caption='�������� >' then MediaPlayer1.play;
        end;
      end;
end;

end.
