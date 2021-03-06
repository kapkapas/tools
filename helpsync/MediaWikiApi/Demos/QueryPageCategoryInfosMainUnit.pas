unit QueryPageCategoryInfosMainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  MediaWikiUtils,
  MediaWikiApi;

type
  TMainForm = class(TForm)
    MemoResult: TMemo;
    ButtonQueryAsync: TButton;
    ButtonQuerySync: TButton;
    EditMaxCategories: TEdit;
    LabelMaxPages: TLabel;
    EditPage: TEdit;
    LabelPage: TLabel;
    LabelStartCategory: TLabel;
    EditStartCategory: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ButtonQuerySyncClick(Sender: TObject);
    procedure ButtonQueryAsyncClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FMediaWikiApi: TMediaWikiApi;
    FContinueInfo: TMediaWikiContinueInfo;
    procedure MediaWikiAllPageCategoryDone(Sender: TMediaWikiApi; const PageCategoryInfos: TMediaWikiPageCategoryInfos;
      const ContinueInfo: TMediaWikiContinueInfo);
  public
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.ButtonQueryAsyncClick(Sender: TObject);
begin
  MemoResult.Lines.Clear;
  FMediaWikiApi.OnQueryPageCategoryInfoDone := MediaWikiAllPageCategoryDone;
  FMediaWikiApi.QueryInit;
  FMediaWikiApi.QueryPageCategoryInfoAsync(EditPage.Text, False, [], FContinueInfo, StrToInt(EditMaxCategories.Text), '');
  FMediaWikiApi.QueryExecuteAsync;
end;

procedure TMainForm.ButtonQuerySyncClick(Sender: TObject);
var
  PageInfos: TMediaWikiPageCategoryInfos;
  Index: Integer;
begin
  MemoResult.Lines.Clear;
  FMediaWikiApi.OnQueryPageCategoryInfoDone := nil;
  FMediaWikiApi.QueryPageCategoryInfo(EditPage.Text, False, [], PageInfos, FContinueInfo, StrToInt(EditMaxCategories.Text), '');
  for Index := Low(PageInfos) to High(PageInfos) do
  begin
    MemoResult.Lines.Add('page title = ' + PageInfos[Index].CategoryPageBasics.PageTitle);
    MemoResult.Lines.Add('page ID = ' + IntToStr(PageInfos[Index].CategoryPageBasics.PageID));
    MemoResult.Lines.Add('page namespace = ' + IntToStr(PageInfos[Index].CategoryPageBasics.PageNamespace));
    MemoResult.Lines.Add('category title = ' + PageInfos[Index].CategoryTitle);
    MemoResult.Lines.Add('category namespace = ' + IntToStr(PageInfos[Index].CategoryNameSpace));
    MemoResult.Lines.Add('category datetime = ' + DateTimeToStr(PageInfos[Index].CategoryTimeStamp));
    MemoResult.Lines.Add('');
  end;
  EditStartCategory.Text := FContinueInfo.ParameterValue;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  // logout is not required
  //FMediaWikiApi.Logout;
  FMediaWikiApi.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FMediaWikiApi := TMediaWikiApi.Create;
  FMediaWikiApi.HttpCli.URL := 'http://wiki.delphi-jedi.org/w/api.php';
  FMediaWikiApi.HttpCli.Agent := 'MediaWiki JEDI bot';
  FMediaWikiApi.HttpCli.FollowRelocation := False;
  // login is not mandatory
  //FMediaWikiApi.Login()
end;

procedure TMainForm.MediaWikiAllPageCategoryDone(Sender: TMediaWikiApi;
  const PageCategoryInfos: TMediaWikiPageCategoryInfos; const ContinueInfo: TMediaWikiContinueInfo);
var
  Index: Integer;
begin
  for Index := Low(PageCategoryInfos) to High(PageCategoryInfos) do
  begin
    MemoResult.Lines.Add('page title = ' + PageCategoryInfos[Index].CategoryPageBasics.PageTitle);
    MemoResult.Lines.Add('page ID = ' + IntToStr(PageCategoryInfos[Index].CategoryPageBasics.PageID));
    MemoResult.Lines.Add('page namespace = ' + IntToStr(PageCategoryInfos[Index].CategoryPageBasics.PageNamespace));
    MemoResult.Lines.Add('category title = ' + PageCategoryInfos[Index].CategoryTitle);
    MemoResult.Lines.Add('category namespace = ' + IntToStr(PageCategoryInfos[Index].CategoryNameSpace));
    MemoResult.Lines.Add('category datetime = ' + DateTimeToStr(PageCategoryInfos[Index].CategoryTimeStamp));
    MemoResult.Lines.Add('');
  end;
  FContinueInfo := ContinueInfo;
  EditStartCategory.Text := FContinueInfo.ParameterValue;
end;

end.

