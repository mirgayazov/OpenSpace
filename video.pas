unit video;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls, StdCtrls, Buttons,
  DirectShow9, math, ActiveX, Vcl.Imaging.pngimage;

type
  TPlayerMode = (Stop, Play, Paused); // ����� ���������������
  Tvideo_form = class(TForm)
    main_panel: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    ListBox1: TListBox;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Label4: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    TrackBar1: TTrackBar;
    ListBox2: TListBox;
    OpenDialog1: TOpenDialog;
    tim: TTimer;
    Timer2: TTimer;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N2: TMenuItem;
    N1: TMenuItem;
    Panel4: TPanel;
    ProgressBar1: TProgressBar;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Image7: TImage;
    Timer_form: TTimer;
    Label1: TLabel;
    Label6: TLabel;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    procedure Initializ;
    procedure Player;
    procedure AddPlayList;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure timTimer(Sender: TObject);
    procedure ProgressBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1Resize(Sender: TObject);
    procedure Panel1DblClick(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
    procedure ListBox2MouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure ListBox2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    //procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Timer_formTimer(Sender: TObject);
    procedure Close_labelClick(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Image7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image10Click(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  { Private declarations }
  //��������� ��������� ��������� �� ����������
  Procedure WMKeyDown(Var Msg:TWMKeyDown); Message WM_KeyDown;
  public
    { Public declarations }
    nx,ny:integer;
  end;

var
  video_form: Tvideo_form;
  hr: HRESULT = 1; //������ ��������� �������� ����
  pCurrent, pDuration: Double;// ������� ��������� � ������������ ������
  Mode: TPlayerMode; // ����� ���������������
  Rate: Double;// ���������� �������� ���������������
  FullScreen: boolean = false; //��������� �������� � ������������� �����
  i: integer = 0;// ������� ����������� ������
  FileName: string;//��� �����
  xn, yn : integer; //��� �������� ��������� ����
  mouse: tmouse; //���������� ����

  //���������� ��� ���������� � ���������� ������
  pGraphBuilder        : IGraphBuilder         = nil; //��� ����
  pMediaControl        : IMediaControl         = nil; //���������� ������
  pMediaEvent          : IMediaEvent           = nil; //���������� �������
  pVideoWindow         : IVideoWindow          = nil; //������ ���� ��� ������
  pMediaPosition       : IMediaPosition        = nil; //������� ������������
  pBasicAudio          : IBasicAudio           = nil; //���������� ������

implementation
uses text_editor, Open_space, photo_view_, LW9, paint;

{$R *.dfm}

procedure Tvideo_form.Image10Click(Sender: TObject);
begin
   if (not Assigned(Form1)) then   // �������� ������������� ����� (���� ���, ��
       Form1:=TForm1.Create(Self);    // �������� �����)
   Form1.Show; // (��� Form2.ShowModal) ����� �����
end;

procedure Tvideo_form.Image11Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure Tvideo_form.Image12Click(Sender: TObject);
begin
  if (not Assigned(photo_view)) then   // �������� ������������� ����� (���� ���, ��
       photo_view:=Tphoto_view.Create(Self);    // �������� �����)
   photo_view.Show; // (��� Form2.ShowModal) ����� �����
end;

procedure Tvideo_form.Image13Click(Sender: TObject);
begin
  if (not Assigned(dbform)) then   // �������� ������������� ����� (���� ���, ��
       dbform:=Tdbform.Create(self); //self   // �������� �����)
   dbform.Show; // (��� Form2.ShowModal) ����� �����
end;

procedure Tvideo_form.Image14Click(Sender: TObject);
begin
  video_form.Close;
end;

procedure Tvideo_form.Image15Click(Sender: TObject);
begin
  if (not Assigned(paintform)) then   // �������� ������������� ����� (���� ���, ��
       paintform:=Tpaintform.Create(Self);    // �������� �����)
   paintform.Show; // (��� Form2.ShowModal) ����� �����
end;

procedure Tvideo_form.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WndParent:= GetDesktopWindow; // �������� ����� �������� �����
end;

procedure Tvideo_form.Image7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  nx:=x;ny:=y;
end;

procedure Tvideo_form.Image7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssleft in shift then begin
    video_form.Top:= video_form.Top+y-ny;
    video_form.Left:= video_form.Left+x-nx;
  end;
end;

procedure Tvideo_form.Image8Click(Sender: TObject);
begin
  if mode=play then
  begin
   pMediaControl.Stop;
   mode:=Stop;//������������� playmode -> ����
   //������ ��������� ��������� ������������
   pMediaPosition.put_CurrentPosition(0);
  end;
  video_form.Close;
end;

procedure Tvideo_form.Image9Click(Sender: TObject);
begin
  video_form.WindowState:=wsMinimized;
end;

procedure Tvideo_form.Initializ;
//��������� ���������� �����
begin
//����������� ������������ ����������
  if Assigned(pMediaPosition) then pMediaPosition := nil;
  if Assigned(pBasicAudio) then pBasicAudio  := nil;
  if Assigned(pVideoWindow) then pVideoWindow := nil;
  if Assigned(pMediaEvent) then pMediaEvent := nil;
  if Assigned(pMediaControl) then pMediaControl := nil;
  if Assigned(pGraphBuilder) then pGraphBuilder := nil;
//�������� ��������� ���������� �����
  hr := CoCreateInstance(CLSID_FilterGraph, nil, CLSCTX_INPROC_SERVER, IID_IGraphBuilder, pGraphBuilder);
  if hr<>0 then begin
    ShowMessage('�� ������� ������� ����');
    exit;
  end;
//�������� ��������� ����������
  hr := pGraphBuilder.QueryInterface(IID_IMediaControl, pMediaControl);
  if hr<>0 then begin
    ShowMessage('�� ������� �������� ��������� IMediaControl');
    exit;
  end;
//�������� ��������� �������
   hr := pGraphBuilder.QueryInterface(IID_IMediaEvent, pMediaEvent);
   if hr<>0 then begin
    ShowMessage('�� ������� �������� ��������� �������');
    exit;
  end;
//�������� ��������� ���������� ����� ������ �����
  hr := pGraphBuilder.QueryInterface(IID_IVideoWindow, pVideoWindow);
  if hr<>0 then begin
    ShowMessage('�� ������� �������� IVideoWindow');
    exit;
  end;
//�������� ��������� ���������� ������
   hr := pGraphBuilder.QueryInterface(IBasicAudio, pBasicAudio);
  if hr<>0 then begin
    ShowMessage('�� ������� �������� ����� ���������');
    exit;
  end;
//�������� ���������  ���������� �������� ������������
  hr := pGraphBuilder.QueryInterface(IID_IMediaPosition, pMediaPosition);
   if hr<>0 then begin
    ShowMessage('�� ������� �������� ��������� ���������� ��������');
    exit;
  end;
//��������� ���� ��� ������������
  hr := pGraphBuilder.RenderFile(StringToOleStr(PChar(filename)), '');
  if hr<>0 then begin
    ShowMessage('�� ������� ������������ ����');
    exit;
  end;

//����������� ������ � ����� �� ������
   pVideoWindow.Put_Owner(Panel1.Handle);//������������� "���������" ����, � ����� ������ Panel1
   pVideoWindow.Put_WindowStyle(WS_CHILD OR WS_CLIPSIBLINGS);//����� ����
   pVideoWindow.put_MessageDrain(Panel1.Handle);//��������� ��� Panel1 ����� �������� ��������� ����� ����
   pVideoWindow.SetWindowPosition(0,0,Panel1.ClientRect.Right,Panel1.ClientRect.Bottom); //�������
end;


procedure Tvideo_form.Player;
//��������� ������������ �����
begin
if mode<>paused then begin
//��������� ���������� �� ���� ����������� �� PlayList
//���� ���� �� ����������, �� �������
if not FileExists(FileName) then begin ShowMessage('���� �� ����������');exit;end;
//����������� ����� ���������������
Initializ;
end;
//��������� ��������� ������������
pMediaControl.Run;
//�������� �������� ���������������
pMediaPosition.get_Rate(Rate);
//����������� ��������� ����� ��� �������������� �����
video_form.Caption:=ExtractFileName(FileName);
//������������� ����� ��������������� PlayMode - play
mode:=play;
end;


Procedure  Tvideo_form.WMKeyDown(Var Msg:TWMKeyDown);
//����� �� �������������� ������ �� ������ ESC
begin
  if Msg.CharCode=VK_ESCAPE then
  begin
      pVideoWindow.HideCursor(False); //���������� ������
      //���������� ��������, ��������, ������ ���������� GroupBox
      video_form.ListBox2.Visible:=True;
      video_form.Splitter1.Visible:=True;
      //video_form.CheckBox1.Checked:=True;
      video_form.GroupBox1.Visible:=True;
      //������������� �������� ��������� ����
      video_form.BorderStyle:=bsSizeable;
      video_form.windowState:= wsNormal;
      video_form.FormStyle:=fsNormal;
      //������ ������� ���� ������
      pVideoWindow.SetWindowPosition(0,0,Panel1.ClientRect.Right,Panel1.ClientRect.Bottom);
      FullScreen:=False;
end;
  inherited;
end;

//��������� �������� ������ � ��������
procedure Tvideo_form.AddPlayList;
var
 j: Integer;
begin
OpenDialog1.Options:=[ofHideReadOnly,ofAllowMultiSelect,ofEnableSizing];
OpenDialog1.Title  := '�������� ������';
//������ ��� ������
OpenDialog1.Filter := '����� ����������� |*.mp3;*.wma;*.wav;*.vob;*.avi;*.mpg;*.mp4;*.mov;*.mpeg;*.flv;*.wmv;*.qt;|��� �����|*.*';
//��������� ���� PlayList �� ������ �� ���������� ����� ������� ������
//����� ������������� ����� ������ 0 (������ ������� � PlayList)
if listbox2.Count<>0 then i:=ListBox2.ItemIndex else i:=0;
//������ �������� �����
if not OpenDialog1.Execute then exit;
  Begin
   For j:=0 to OpenDialog1.Files.Count -1 do
    Begin
      ListBox2.Items.Add(ExtractFileName(OpenDialog1.Files.Strings[j]));
      ListBox1.Items.Add(OpenDialog1.Files.Strings[j]);
    End;
  End;
     //���������� ��� ����� ������� ������ � ���������
     Filename:=ListBox1.Items.Strings[i];
     //�������� ��� ������ � PlayList
     ListBox1.ItemIndex:=i;
     ListBox2.ItemIndex:=i;
end;


//procedure Tvideo_form.CheckBox1Click(Sender: TObject);
////���������� ��� �������� ��������
//begin
//if video_form.CheckBox1.Checked=True then
//                                      begin
//                                         video_form.ListBox2.Visible:=True;
//                                         video_form.Splitter1.Visible:=True;
//                                      end
//                                else  begin
//                                         video_form.ListBox2.Visible:=False;
//                                         video_form.Splitter1.Visible:=False;
//                                      end;
//end;

procedure Tvideo_form.Close_labelClick(Sender: TObject);
begin
  video_form.Close;
end;

procedure Tvideo_form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if mode=play then
    begin
      pMediaControl.Stop;
      mode:=Stop;//������������� playmode -> ����
      pMediaPosition.put_CurrentPosition(0);
      form2.MediaPlayer1.Play;
    end;
  form2.MediaPlayer1.Play;
end;

procedure Tvideo_form.FormCreate(Sender: TObject);
begin
  video_form.Visible:=false;
  image9.left:=main_panel.Width-170;
  image8.left:=main_panel.Width-60;
  //  main_image.Canvas.Pen.Color:=clBlack;
  //main_image.FrameRect(0,0,Image1.Width,Image1.Height);
  video_form.Brush.Style := bsClear;
  video_form.BorderStyle := bsNone;
// ��� ��� ������� ���, �� ����� ��� ���� ��� � ����, ���� � �� �����.
  video_form.TransparentColorValue := clblue;
  video_form.transparentcolor := true;
  video_form.Color := clblue;
// ��� ��� �������� ���� �����, ������ ���� �� �������� ����� ����������� ��������
  CoInitialize(nil);// ���������������� OLE
end;

procedure Tvideo_form.FormDestroy(Sender: TObject);
begin
  CoUninitialize;// ������������������ OLE
end;

procedure Tvideo_form.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  image9.left:=main_panel.Width-170;
  image8.left:=main_panel.Width-60;
  video_form.width:=video_form.width-10;
  video_form.Height:=ceil(video_form.width*0.6875);
  main_panel.width:=main_panel.width-10;
  main_panel.Height:=ceil(main_panel.width*0.5875);
end;

procedure Tvideo_form.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  image9.left:=main_panel.Width-170;
  image8.left:=main_panel.Width-60;
  video_form.width:=video_form.width+10;
  video_form.Height:=ceil(video_form.width*0.6875);
  main_panel.width:=main_panel.width+10;
  main_panel.Height:=ceil(main_panel.width*0.5875);
end;

procedure Tvideo_form.ListBox2Click(Sender: TObject);
begin
  //������������� ���������� ������� � ���������� ��� ������
  i:=ListBox2.Itemindex;
  ListBox1.Itemindex:=i;
end;

procedure Tvideo_form.ListBox2DblClick(Sender: TObject);
begin
  //�������� ���� �� ��������� ��� ������� ����� ��� ���������������
  i:=ListBox2.Itemindex;
  ListBox1.Itemindex:=i;
  Filename:=ListBox1.Items.Strings[i];
  mode:=stop;
  //�������� ��������� ������������ �����
  player;
end;

//��������� ������ PopupMenu ��� ������� ������ ������� ���� �� ��������� (ListBox)
procedure Tvideo_form.ListBox2MouseActivate(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
var
point : TPoint;
begin
  if (Button = mbRight) then
  // ������ ������ ����
  begin
    point.X := X;
    point.Y := Y;
    i := ListBox2.ItemAtPos(point, true);
    // �������� ������
    ListBox1.ItemIndex:=i;
    ListBox2.ItemIndex:=i;
      if i >= 0 then
    // ���� �������� �� ����� ������
    begin
    // ��������� ����
     PopupMenu1.Popup(ListBox2.ClientOrigin.X + X, ListBox2.ClientOrigin.Y + Y);
    end;
end;
end;

//��������� �������� ������� � ���������
procedure Tvideo_form.N1Click(Sender: TObject);
begin
//������� ���������
ListBox1.Clear;
ListBox2.Clear;
end;

procedure Tvideo_form.N2Click(Sender: TObject);
//�������� ������
begin
ListBox1.DeleteSelected;
ListBox2.DeleteSelected;
end;

procedure Tvideo_form.N3Click(Sender: TObject);
begin
//�������� ��������� �������� ���������
  AddPlayList;
end;

//��������� �������� � ������������� ����� � �������
procedure Tvideo_form.Panel1DblClick(Sender: TObject);
var
Rct: TRect;
begin
if hr <> 0 then exit; //���� ���� �� �������� �������
pVideoWindow.HideCursor(False); //���������� ������
if FullScreen=False then begin
//�������� ��������, �������� � ������ ����������
video_form.ListBox2.Visible:=False;
video_form.Splitter1.Visible:=false;
video_form.GroupBox1.Visible:=false;
//������������� ��������� �����
video_form.BorderStyle:=bsNone; //��� �������
video_form.FormStyle :=fsstayOnTop; //������ ����
video_form.windowState:= wsMaximized;// �� ���� �����
//������������� ����� ����� �� ��� ������ ������
pVideoWindow.SetWindowPosition(0,0,screen.Width,screen.Height);
FullScreen:=True;
end
else begin
// ��������������� �������� ��� ������ �� �������������� ������
//if form1.CheckBox1.Checked=true then  video_form.ListBox2.Visible:=True;
video_form.GroupBox1.Visible:=True;
video_form.Splitter1.Visible:=True;
video_form.BorderStyle:=bsSizeable;
video_form.windowState:= wsNormal;
video_form.FormStyle:=fsNormal;
pVideoWindow.SetWindowPosition(0,0,Panel1.ClientRect.Right,Panel1.ClientRect.Bottom);
FullScreen:=False;
end;
end;

//��������� ����������� ��������� � ������ ���������� ��� ��������� �� ��� ����
procedure Tvideo_form.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//������� ���� ����� �� �������������
if FullScreen<>True then Exit;
//�������� �������� ���� ������ ���� � ���� ������
if (mouse.CursorPos.X<panel1.Width) and (ListBox2.Visible=True) then
begin
video_form.ListBox2.Visible:=False;
video_form.Splitter1.Visible:=False;
end;
//���������� �������� ��� ��������� �� ��� ��������� ����, ���� �� ��� �������
if (mouse.CursorPos.X>=panel1.Width-ListBox2.Width) and (ListBox2.Visible=False) then
begin
//if form1.CheckBox1.Checked=true then
//  begin
//    video_form.ListBox2.Visible:=True;
//    video_form.Splitter1.Visible:=True;
//  end;
end;

//���������� � ������� ���������� �������������
if (mouse.CursorPos.Y<panel1.Height) and (groupbox1.Visible=True) then
begin
groupbox1.Visible:=false;
end;

if (mouse.CursorPos.Y>=panel1.Height-groupbox1.Height) and (groupbox1.Visible=False) then
begin
groupbox1.Visible:=True;
end;
end;

//��������� ��������� ������� ���� ������������ ��� ��������� �������� ������
procedure Tvideo_form.Panel1Resize(Sender: TObject);
begin
 if mode=play then
 begin
 pVideoWindow.SetWindowPosition(0,0,Panel1.ClientRect.Right,Panel1.ClientRect.Bottom);
end;
end;

//��������� ��������� ������� ������������ ��� ��������� ������� ProgressBar (���������)
procedure Tvideo_form.ProgressBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  p: real;
begin
if hr = 0 then  begin
  if ssleft in shift then //���� ������ ����� ������ ����
  begin
    p:=ProgressBar1.Max/ProgressBar1.Width;
    ProgressBar1.Position:=round(x*p);
    pMediaControl.Stop;
    pMediaPosition.put_CurrentPosition(ProgressBar1.Position);
    pMediaControl.Run;
    mode:=play;
  end;
end;
end;

//��������� ���������������
procedure Tvideo_form.SpeedButton1Click(Sender: TObject);
begin
  //��������� ���� ��������������� ��� ���� �� �������������
  //���������� �������� ��������������� � �������
    if mode=play then
    begin
      image1.Tag:=1;
      pMediaPosition.put_Rate(Rate);
      exit;
    end;
    Player;
end;

//��������� �����
procedure Tvideo_form.SpeedButton2Click(Sender: TObject);
begin
 //��������� ���� �� ���������������
 if mode=play then
 begin
   pMediaControl.Pause;
   mode:=paused;//������������� playmode -> �����
 end;
end;

//��������� ���������
procedure Tvideo_form.SpeedButton3Click(Sender: TObject);
begin
//��������� ���� �� ���������������
 if mode=play then
 begin
   pMediaControl.Stop;
   mode:=Stop;//������������� playmode -> ����
   //������ ��������� ��������� ������������
   pMediaPosition.put_CurrentPosition(0);
 end;
end;

//��������� ������������ ���������������
procedure Tvideo_form.SpeedButton4Click(Sender: TObject);
var  pdRate: Double;
begin
if mode=play then
  begin
   if ProgressBar1.Position>=15 then pMediaPosition.put_CurrentPosition(ProgressBar1.Position-15);
  end;
end;

//��������� ����������� ���������������
procedure Tvideo_form.SpeedButton5Click(Sender: TObject);
var  pdRate: Double;
begin
if mode=play then
  begin
    if ProgressBar1.Position+15<=ProgressBar1.Max then pMediaPosition.put_CurrentPosition(ProgressBar1.Position+15);
  end;
end;


procedure Tvideo_form.SpeedButton6Click(Sender: TObject);
begin
  Form2.WindowState:=wsMinimized;
  AddPlayList;
  Form2.WindowState:=wsNormal;
  video_form.SetFocus;
end;


procedure Tvideo_form.timTimer(Sender: TObject);
var
TrackLen, TrackPos: Double;
ValPos: Double;
ValLen: Double;
plVolume:Longint;
db  : integer;
begin
//������� �����
//Panel4.Caption:=TimeToStr(SysUtils.Time);
//��������� ����� ���������������, ���� �� Play �� �������
if hr <> 0 then Exit;
//����� ������������ ������
//��������� ��� ����� ������ � ��������
pMediaPosition.get_Duration(pDuration);
//������ ������������ ��������� ProgressBar
ProgressBar1.Max:=round(pDuration);
//��������� ������� ������ ������ �� ������ ���������������
pMediaPosition.get_CurrentPosition(pCurrent);
//������ ������� ��������� ProgressBar
ProgressBar1.Position:=round(pCurrent);
 //��������������� ���������� ������
//���� ����� ������������ ����� ����� ������ �� �������,
if pCurrent=pDuration then
begin
//�� �������� ��������� ������ �� ���������
if i<ListBox2.Items.Count-1 then
   begin
     inc(i);
     Filename:=ListBox1.Items.Strings[i];
     ListBox1.ItemIndex:=i;
     ListBox2.ItemIndex:=i;
     mode:=stop;
     player;
   end
//���� ���� ���������� - �������
   else exit;
end;

//��������� ���������, ��������� �������� �� -10000 �� 0
//� ��������� ��� ����� ������������� ���� �������� ������� ������������ ������ � ����� �����
//pBasicAudio.put_Volume(TrackBar1.Position*100-10000);

//��� ���� ������� ������������� ���������. ����� ������� ������������� �����
plVolume:= (65535 * TrackBar1.Position) div 100;
//��������� �������������� ������ ���������
db:= trunc(33.22 * 100 * ln((plVolume+1e-6)/65535)/ln(10));
pBasicAudio.put_Volume(db);


//������ ���������� �������
TrackLen:=pDuration;
TrackPos:=pCurrent;
//��������� ������� � ����
ValPos:=TrackPos / (24 * 3600);
ValLen:=TrackLen / (24 * 3600);
//������� ������ � ������� �� ����� � Label1 � Label2
Label2.Caption:=FormatDateTime('hh:mm:ss',ValPos);
Label3.Caption:=FormatDateTime('hh:mm:ss',ValLen);
end;

//��������� ������� ������� � ������������� ������
procedure Tvideo_form.Timer2Timer(Sender: TObject);
begin
if FullScreen<>True then Exit;
//��������� ��������� ������� � ���� �� �� ����������
//�� ������ ��������� ������ ��� �� ���� �����, �� �������� ������ ����� ����������
if ((xn-5)<=mouse.CursorPos.X) and ((yn-5)<=mouse.CursorPos.Y) and ((xn+5)>=mouse.CursorPos.X) and ((yn+5)>=mouse.CursorPos.Y)then
pVideoWindow.HideCursor(true)  else pVideoWindow.HideCursor(False);
//���������� ���������� �������
xn:=mouse.CursorPos.X;
yn:=mouse.CursorPos.Y;
end;

procedure Tvideo_form.Timer_formTimer(Sender: TObject);
begin
  video_form.Visible:=true;
  video_form.AlphaBlendValue:= video_form.AlphaBlendValue+5;
  if video_form.AlphaBlendValue>=250 then
  begin
    timer_form.Destroy;
    //ideo_form.AlphaBlendValue:=0;
    exit;
  end;

end;

end.
