object FormMain: TFormMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'FormMain'
  ClientHeight = 533
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelLeft: TLabel
    Left = 8
    Top = 20
    Width = 23
    Height = 13
    Caption = '&Left:'
    FocusControl = MemoLeft
  end
  object LabelRight1: TLabel
    Left = 231
    Top = 20
    Width = 38
    Height = 13
    Caption = 'Right &1:'
    FocusControl = MemoRight1
  end
  object LabelRight2: TLabel
    Left = 454
    Top = 20
    Width = 38
    Height = 13
    Caption = 'Right &2:'
    FocusControl = MemoRight2
  end
  object LabelMerge: TLabel
    Left = 8
    Top = 314
    Width = 34
    Height = 13
    Caption = '&Merge:'
    FocusControl = MemoMerge
  end
  object LabelDiff1: TLabel
    Left = 231
    Top = 314
    Width = 30
    Height = 13
    Caption = '&Diff 1:'
    FocusControl = MemoDiff1
  end
  object LabelDiff2: TLabel
    Left = 454
    Top = 314
    Width = 30
    Height = 13
    Caption = 'D&iff 2:'
    FocusControl = MemoDiff2
  end
  object MemoLeft: TMemo
    Left = 8
    Top = 39
    Width = 217
    Height = 257
    Lines.Strings = (
      'The text 1 begins here'
      'This is some text 1'
      'Some lines are deleted from text 1'
      'This is some other text 1'
      'This is still text 1'
      'This text 1 will be replaced'
      'The text 1 ends here'
      'The text 2 begins here'
      'This is some text 2'
      'Some lines are deleted from text 2'
      'This is some other text 2'
      'This is still text 2'
      'This text 2 will be replaced'
      'The text 2 ends here')
    TabOrder = 0
    WordWrap = False
  end
  object MemoRight1: TMemo
    Left = 231
    Top = 39
    Width = 217
    Height = 257
    Lines.Strings = (
      'The text 1 begins here'
      'This is some text 1'
      'This is some other text 1'
      'Some lines are added to text 1'
      'This is still text 1'
      'This text 1 is replaced'
      'The text 1 ends here'
      'The text 2 begins here'
      'This is some text 2'
      'Some lines are deleted from text 2'
      'This is some other text 2'
      'This is still text 2'
      'This text 2 will be replaced'
      'The text 2 ends here')
    TabOrder = 1
    WordWrap = False
  end
  object ButtonDiff1: TButton
    Left = 302
    Top = 302
    Width = 75
    Height = 25
    Caption = 'Diff'
    TabOrder = 2
    OnClick = ButtonDiff1Click
  end
  object MemoMerge: TMemo
    Left = 8
    Top = 333
    Width = 217
    Height = 161
    TabOrder = 3
    WordWrap = False
  end
  object ButtonLoadLeft: TButton
    Left = 79
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Load...'
    TabOrder = 4
    OnClick = ButtonLoadLeftClick
  end
  object ButtonLoadRight1: TButton
    Left = 302
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Load...'
    TabOrder = 5
    OnClick = ButtonLoadRight1Click
  end
  object ButtonSaveMerge: TButton
    Left = 79
    Top = 500
    Width = 75
    Height = 25
    Caption = 'Save...'
    TabOrder = 6
    OnClick = ButtonSaveMergeClick
  end
  object ButtonMergeInPlace: TButton
    Left = 150
    Top = 302
    Width = 75
    Height = 25
    Caption = 'Merge in-place'
    TabOrder = 7
    OnClick = ButtonMergeInPlaceClick
  end
  object ButtonMergeOutOfPlace: TButton
    Left = 104
    Top = 302
    Width = 40
    Height = 25
    Caption = 'Merge'
    TabOrder = 8
    OnClick = ButtonMergeOutOfPlaceClick
  end
  object MemoDiff1: TMemo
    Left = 231
    Top = 333
    Width = 217
    Height = 161
    TabOrder = 9
    WordWrap = False
  end
  object ButtonSaveDiff1: TButton
    Left = 302
    Top = 500
    Width = 75
    Height = 25
    Caption = 'Save...'
    TabOrder = 10
    OnClick = ButtonSaveDiff1Click
  end
  object MemoRight2: TMemo
    Left = 454
    Top = 39
    Width = 217
    Height = 257
    Lines.Strings = (
      'The text 1 begins here'
      'This is some text 1'
      'Some lines are deleted from text 1'
      'This is some other text 1'
      'This is still text 1'
      'This text 1 will be replaced'
      'The text 1 ends here'
      'The text 2 begins here'
      'This is some text 2'
      'This is some other text 2'
      'Some lines are added to text 2'
      'This is still text 2'
      'This text 2 is replaced'
      'The text 2 ends here')
    TabOrder = 11
    WordWrap = False
  end
  object ButtonLoadRight2: TButton
    Left = 525
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Load...'
    TabOrder = 12
    OnClick = ButtonLoadRight2Click
  end
  object ButtonDiff2: TButton
    Left = 525
    Top = 302
    Width = 75
    Height = 25
    Caption = 'Diff'
    TabOrder = 13
    OnClick = ButtonDiff2Click
  end
  object MemoDiff2: TMemo
    Left = 454
    Top = 333
    Width = 217
    Height = 161
    TabOrder = 14
    WordWrap = False
  end
  object ButtonSaveDiff2: TButton
    Left = 525
    Top = 500
    Width = 75
    Height = 25
    Caption = 'Save...'
    TabOrder = 15
    OnClick = ButtonSaveDiff2Click
  end
  object ButtonDiffAll: TButton
    Left = 64
    Top = 302
    Width = 34
    Height = 25
    Caption = 'Diff'
    TabOrder = 16
    OnClick = ButtonDiffAllClick
  end
end
