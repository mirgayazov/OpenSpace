unit text_editor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.StdActns, System.Actions, Vcl.ActnList, Vcl.ToolWin, System.ImageList,
  Vcl.ImgList, math,Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    RichEdit1: TRichEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton19: TToolButton;
    ToolButton18: TToolButton;
    ToolButton3: TToolButton;
    ToolButton11: TToolButton;
    ToolButton7: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton8: TToolButton;
    ToolButton15: TToolButton;
    ToolButton20: TToolButton;
    ToolButton17: TToolButton;
    ToolButton16: TToolButton;
    ToolButton10: TToolButton;
    ToolButton14: TToolButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    FontDialog1: TFontDialog;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    N15: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditPaste1: TEditPaste;
    FileSaveAs1: TFileSaveAs;
    DialogFontEdit1: TFontEdit;
    ImageList1: TImageList;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    PopupMenu2: TPopupMenu;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    PopupMenu3: TPopupMenu;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    PopupMenu4: TPopupMenu;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    PopupMenu5: TPopupMenu;
    N38: TMenuItem;
    Label1: TLabel;
    Panel8: TPanel;
    Button3: TButton;
    Button4: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image15: TImage;
    ImageList2: TImageList;
    ImageList12: TImageList;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Label2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
//    procedure Button1Click(Sender: TObject);
//    procedure Button2Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
//    procedure TrackBar1Change(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure RichEdit1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure RichEdit1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button4StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button4EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure Button4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer2Timer(Sender: TObject);
//    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    theme: boolean;
  end;

var
  Form1: TForm1;

implementation
uses video, Open_space, photo_view_, LW9, paint;

{$R *.dfm}

procedure TForm1.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WndParent:= GetDesktopWindow; // �������� ����� �������� �����
end;

procedure RichEdit_MoveTo(RichEdit: TRichEdit; LineNumber, CharNumber: Word);
begin
   RichEdit.SelStart := RichEdit.Perform(EM_LINEINDEX, LineNumber, 0) + CharNumber;
end;

//procedure TForm1.Button1Click(Sender: TObject);
//var Point: TPoint;
//    I:integer;
//begin
//  for I := 1 to 5 do
//  begin
//    doublebuffered:=true;
//    sleep(30);
//    Form1.Height:=Form1.Height+i;
//    Form1.width:=Form1.width+3*i;
//    panel1.Height:=panel1.Height+i-1;
//    panel1.width:=panel1.width+3*i-1;
//  end;
//
//  Point.X := Button1.Left;
//  Point.Y := Button1.Top + Button1.Height;
//
//end;

//procedure TForm1.Button2Click(Sender: TObject);
//var Point: TPoint;
//begin
//  Point.X := Button2.Left;
//  Point.Y := Button2.Top + Button1.Height;
//  Form1.Height:=Form1.Height-10;
//  Form1.width:=Form1.width-30;
//  panel1.Height:=panel1.Height-9;
//  panel1.width:=panel1.width-29;
//end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if RichEdit1.CaretPos.Y>2 then
  begin
    RichEdit_MoveTo(RichEdit1,RichEdit1.CaretPos.Y-1,0);
    Application.ProcessMessages;
   RichEdit1.SetFocus;
  end;
end;

procedure TForm1.Button3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  timer2.Enabled:=true;
end;

procedure TForm1.Button3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  timer2.Enabled:=false;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  timer1.Enabled:=true;
//  RichEdit_MoveTo(RichEdit1,RichEdit1.CaretPos.Y+1,0);
//  Application.ProcessMessages;
//  RichEdit1.SetFocus;
end;



procedure TForm1.Button4EndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  timer1.Enabled:=false;
end;

procedure TForm1.Button4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  timer1.Enabled:=true;
end;

procedure TForm1.Button4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  timer1.Enabled:=false;
end;

procedure TForm1.Button4StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  RichEdit_MoveTo(RichEdit1,RichEdit1.CaretPos.Y+1,0);
  Application.ProcessMessages;
  RichEdit1.SetFocus;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  nt
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  image4.left:=panel1.Width-170;
  image3.left:=panel1.Width-60;
  Form1.Brush.Style := bsClear;
  Form1.BorderStyle := bsNone;
//// ��� ��� ������� ���, �� ����� ��� ���� ��� � ����, ���� � �� �����.
  Form1.TransparentColorValue := clblue;
  Form1.transparentcolor := true;
  Form1.Color := clblue;
//�� ��� �������� ���� �����, ������ ���� �� �������� ����� ����������� ��������
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ReleaseCapture;
 Form1.perform(WM_SysCommand,$F012,0);
end;

procedure TForm1.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  image4.left:=panel1.Width-170;
  image3.left:=panel1.Width-60;
  Form1.width:=Form1.width-10;
  Form1.Height:=ceil(Form1.width*0.6875);
  panel1.width:=panel1.width-10;
  panel1.Height:=ceil(panel1.width*0.5875);
end;

procedure TForm1.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  image4.left:=panel1.Width-170;
  image3.left:=panel1.Width-60;
  Form1.width:=Form1.width+10;
  Form1.Height:=ceil(Form1.width*0.6875);
  panel1.width:=panel1.width+10;
  panel1.Height:=ceil(panel1.width*0.5875);

end;

procedure TForm1.Image15Click(Sender: TObject);
begin
  if (not Assigned(paintform)) then   // �������� ������������� ����� (���� ���, ��
       paintform:=Tpaintform.Create(Self);    // �������� �����)
   paintform.Show; // (��� Form2.ShowModal) ����� �����
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Form1.perform(WM_SysCommand,$F012,0);
end;


procedure TForm1.Image4Click(Sender: TObject);
begin
  Form1.WindowState:=wsMinimized;
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
   if (not Assigned(video_form)) then   // �������� ������������� ����� (���� ���, ��
       video_form:=Tvideo_form.Create(Self);    // �������� �����)
   video_form.Show; // (��� Form2.ShowModal) ����� �����
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
  Application.BringToFront;
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
  if (not Assigned(photo_view)) then   // �������� ������������� ����� (���� ���, ��
       photo_view:=Tphoto_view.Create(Self);    // �������� �����)
   photo_view.Show; // (��� Form2.ShowModal) ����� �����
end;

procedure TForm1.Image8Click(Sender: TObject);
begin
  if (not Assigned(dbform)) then   // �������� ������������� ����� (���� ���, ��
       dbform:=Tdbform.Create(Self);    // �������� �����)
   dbform.Show; // (��� Form2.ShowModal) ����� �����
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Label2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//  if Button = mbLeft then
//    begin
//    ReleaseCapture;
//    SendMessage(Form1.Handle, WM_NCLBUTTONDOWN, Windows.HTLEFT, 0);
//    SendMessage(Form1.Handle, WM_NCLBUTTONDOWN, Windows.HTTOP, 0);
//    end;
end;

procedure TForm1.Label2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if X=Form1.Height div 10 div Form1.Height then
Form1.Cursor:=crSizeWE
else
Form1.Cursor:=crDefault;
if Y=Form1.Width div 10 div Form1.Width then
Form1.Cursor:=crSizeNS;
if X=Form1.Height div 10 div Form1.Height then
Form1.Cursor:=crSizeWE
else
Form1.Cursor:=crDefault;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  RichEdit1.Undo;
end;


procedure TForm1.N20Click(Sender: TObject);
begin
  if FontDialog1.Execute then
                         begin
                           RichEdit1.SelAttributes.Assign(FontDialog1.font);
                           RichEdit1.SetFocus;
                         end;
end;

procedure TForm1.N22Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment:=taleftjustify;
end;

procedure TForm1.N23Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment:= tarightjustify;
end;

procedure TForm1.N24Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment:=tacenter;
end;

procedure TForm1.N2Click(Sender: TObject);
var buttonSelected:integer;
begin
  Form2.WindowState:=wsMinimized;
  if RichEdit1.Lines.Count<>0 then
                              begin
                                buttonSelected := MessageDlg('��������� ���� ����� ��������� ������?',mtConfirmation, mbOKCancel, 0);
                                if buttonSelected=1 then
                                                    begin
                                                      if savedialog1.Execute then richedit1.Lines.SaveToFile(savedialog1.filename);
                                                      if opendialog1.Execute then richedit1.Lines.LoadFromFile(opendialog1.filename);
                                                      if opendialog1.filename <>'' then Form1.Caption:='��������� �������� [ '+ opendialog1.filename+' ]';
                                                    end
                                                    else if buttonSelected=2 then
                                                                             begin
                                                                               if opendialog1.Execute then richedit1.Lines.LoadFromFile(opendialog1.filename);
                                                                               if opendialog1.filename <>'' then Form1.Caption:='��������� �������� [ '+opendialog1.filename+' ]';
                                                                             end;
                              end
                              else begin
                                     if opendialog1.Execute then richedit1.Lines.LoadFromFile(opendialog1.filename);
                                     if opendialog1.filename <>'' then Form1.Caption:='��������� �������� [ '+ opendialog1.filename+' ]';
                                   end;
  Form2.WindowState:=wsNormal;
  Form1.SetFocus;
end;

procedure TForm1.N34Click(Sender: TObject);
var
  buttonSelected : Integer;
begin
  buttonSelected := MessageDlg('�� ������� � ���, ��� ������ �������� ����?'+#10+'��������� �� ����� ���������!',mtWarning , mbOKCancel, 0);
  if buttonSelected = mrOK     then
  begin
    RichEdit1.lines.Clear;
  end;
  if buttonSelected = mrCancel then
  begin
    //to do
  end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  form2.visible:=false;
  if savedialog1.Execute then richedit1.Lines.SaveToFile(savedialog1.filename);
  Form1.Caption:='��������� �������� [ '+savedialog1.filename+' ]';
  form2.visible:=true;
  Form1.SetFocus;
end;

procedure TForm1.N4Click(Sender: TObject);
var buttonSelected:integer;
begin
  if RichEdit1.Lines.Count<>0 then
                              begin
                                buttonSelected := MessageDlg('��������� ��������� ����� �������?',mtConfirmation, mbOKCancel, 0);
                                if buttonSelected=1 then
                                                    begin
                                                      if savedialog1.Execute then richedit1.Lines.SaveToFile(savedialog1.filename);
                                                      Form1.Close;
                                                    end
                                                    else if buttonSelected=2 then Form1.Close;
                              end
                              else Form1.close;
end;


procedure TForm1.N6Click(Sender: TObject);
begin
  if fontdialog1.Execute then
                         begin
                           RichEdit1.SelAttributes.Assign(fontdialog1.Font);
                           RichEdit1.SetFocus;
                         end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  RichEdit1.Lines.Clear;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  MessageDlg('���������:'+#10+'> ��������� ������'+#10+'> ������� 2 �����'+#10+'> ������ 7291-11',mtInformation, [mbOK], 0);
end;

procedure TForm1.Panel3Click(Sender: TObject);
var lowerLeft: TPoint;
begin
    lowerLeft := Point(Panel3.Left+70, Panel3.Top + Panel3.Height+Panel1.Top);
    lowerLeft := ClientToScreen(lowerLeft);
    PopupMenu2.Popup(lowerLeft.X, lowerLeft.Y);
end;

procedure TForm1.Panel4Click(Sender: TObject);
var lowerLeft: TPoint;
begin
  lowerLeft := Point(Panel3.Left+70+Panel3.Width, Panel3.Top +Panel3.Height+Panel1.Top);
  lowerLeft := ClientToScreen(lowerLeft);
  PopupMenu3.Popup(lowerLeft.X, lowerLeft.Y);
end;

procedure TForm1.Panel5Click(Sender: TObject);
begin
  form2.visible:=false;
  if FontDialog1.Execute then
                         begin
                           RichEdit1.SelAttributes.Assign(FontDialog1.font);
                           RichEdit1.SetFocus;
                         end;
  form2.visible:=true;
  Form1.SetFocus;
end;

procedure TForm1.Panel6Click(Sender: TObject);
var lowerLeft: TPoint;
begin
  lowerLeft := Point(Panel3.Left+70+Panel3.Width+Panel4.Width+Panel5.Width, Panel3.Top +Panel3.Height+Panel1.Top);
  lowerLeft := ClientToScreen(lowerLeft);
  PopupMenu4.Popup(lowerLeft.X, lowerLeft.Y);
end;

procedure TForm1.Panel7Click(Sender: TObject);
var lowerLeft: TPoint;
begin
  lowerLeft := Point(Panel3.Left+70+Panel3.Width+Panel4.Width+Panel5.Width+Panel6.Width, Panel3.Top +Panel3.Height+Panel1.Top);
  lowerLeft := ClientToScreen(lowerLeft);
  PopupMenu5.Popup(lowerLeft.X, lowerLeft.Y);
end;

procedure TForm1.RichEdit1MouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  richedit1.ScrollBy(0,10);
end;

procedure TForm1.RichEdit1MouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  richedit1.ScrollBy(0,-10);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  RichEdit_MoveTo(RichEdit1,RichEdit1.CaretPos.Y+1,0);
  Application.ProcessMessages;
  RichEdit1.SetFocus;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if RichEdit1.CaretPos.Y>2 then
  begin
    RichEdit_MoveTo(RichEdit1,RichEdit1.CaretPos.Y-1,0);
    Application.ProcessMessages;
   RichEdit1.SetFocus;
  end;
end;

procedure TForm1.ToolButton10Click(Sender: TObject);
var
  StrCount, i, sstart : integer;
begin
  if theme=false then
                begin
                  RichEdit1.selstart := 0;
                  RichEdit1.sellength:= RichEdit1.GetTextLen;
                  RichEdit1.SelAttributes.color:=clwhite;
                  Form1.Color:=clScrollBar;
                  ToolButton10.ImageIndex:=10;
                  RichEdit1.Color:=clMenuText;
                  RichEdit1.SelLength:=0;
                  //RichEdit1.selStart:=99999;
                  theme:=true;
                end
                else
                begin
                  RichEdit1.selstart := 0;
                  RichEdit1.sellength:= RichEdit1.GetTextLen;
                  RichEdit1.SelAttributes.color:=clblack;
                  Form1.Color:=clWindow;
                  ToolButton10.ImageIndex:=9;
                  RichEdit1.Color:=clWindow;
                  RichEdit1.SelLength:=0;
                  //RichEdit1.selStart:=99999;
                  theme:=false;
                end;
end;

procedure TForm1.ToolButton13Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment:=tarightjustify;
end;

procedure TForm1.ToolButton15Click(Sender: TObject);
begin
  RichEdit1.Lines.Clear;
end;

procedure TForm1.ToolButton17Click(Sender: TObject);
begin
   if FontDialog1.Execute then
                          begin
                            RichEdit1.SelAttributes.Assign(fontdialog1.Font);
                            RichEdit1.SetFocus;
                          end;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
var buttonSelected:integer;
begin
  if RichEdit1.Lines.Count<>0 then
                              begin
                                buttonSelected := MessageDlg('��������� ���� ����� ��������� ������?',mtConfirmation, mbOKCancel, 0);
                                if buttonSelected=1 then
                                                    begin
                                                      if savedialog1.Execute then richedit1.Lines.SaveToFile(savedialog1.filename);
                                                      RichEdit1.Lines.Clear;
                                                    end
                                                    else if buttonSelected=2 then RichEdit1.Lines.Clear;
                              end
                              else RichEdit1.Lines.Clear;
  Form1.Caption:='��������� �������� [ ����� ���� ]';
end;

procedure TForm1.ToolButton21Click(Sender: TObject);
begin
  RichEdit1.Lines.Clear;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment:=taleftjustify;
end;

procedure TForm1.ToolButton7Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment:=taleftjustify;
end;

procedure TForm1.ToolButton9Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment:=tacenter;
end;

//procedure TForm1.TrackBar1Change(Sender: TObject);
//begin
//  if TrackBar1.Position>=50 then
//  begin
//     Form1.Width:=  ceil(Form1.Width*TrackBar1.Position/75);
//     //Form1.height:=  Form1.height+ceil(TrackBar1.Position/3);
//  end
//  else
//  begin
//    Form1.Width:=ceil(Form1.Width*TrackBar1.Position/75);
//   // Form1.height:=Form1.height-ceil(TrackBar1.Position/3);
//  end;
//
//end;

end.
