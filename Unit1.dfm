�
 TFORM1 0�  TPF0TForm1Form1Left?Top�BorderStylebsDialogCaptionHydroCalc v0.1ClientHeight3ClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnShow	calculatePixelsPerInch`
TextHeight TLabelLabel1LeftTop*WidthHeightCaptionHead:  TLabelLabel2LeftTopJWidthHeightCaptionFlow:  TLabelLabel3LeftTopjWidth1HeightCaptionEfficiency:  TLabelLabel0LeftTopWidth� HeightCaptionHydro Power CalculatorFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel4LeftTop� Width(HeightCaptionPower:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabelpLeft� TopjWidth5HeightCaptionpercent [%]  TLabelLabelfLeft� Top� WidthwHeightCaptionConsider losses from pipe  TLabelLabel5LeftTop� Width8HeightCaptionPipe length:  TLabelLabel6LeftTop� WidthEHeightCaptionPipe Diameter:  TLabelLabel7LeftTopWidthJHeightCaptionPipe friction (C):  TEditEdit1Left`Top(WidthPHeightTabOrder Text10OnChange	calculateOnExitpopulate
OnKeyPress	verifynum  TEditEdit2Left`TopHWidthPHeightTabOrderText1OnChange	calculate
OnKeyPress	verifynum  TEditEdit3Left`TophWidthPHeightTabOrderText70OnChange	calculateOnExitfill
OnKeyPress	verifyintOnKeyUpcheck  	TComboBox	ComboBox1Left� Top(Width� Height
ItemHeight	ItemIndex TabOrderText
meters [m]OnChange	calculateItems.Strings
meters [m]	feet [ft]   	TComboBox	ComboBox2Left� TopHWidth� Height
ItemHeight	ItemIndex TabOrderTextcubic meter per second [m3/s]OnChange	calculateItems.Stringscubic meter per second [m3/s]cubic meter per minute [m3/min]cubic meter per hour [m3/h]liters per second [l/s]liters per minute [l/min]liters per hour [l/h]U.S. Gallons per second U.S. Gallons per minuteU.S. Gallons per hour    TEditEdit4Left`Top� WidthPHeightEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold ParentColor	
ParentFontTabOrderText0
OnKeyPress	verifynum  	TComboBox	ComboBox4Left� Top� Width� Height
ItemHeight	ItemIndex TabOrderTextkiloWatts (kW)OnChange	calculateItems.StringskiloWatts (kW)kiloWatt hours per daykiloWatt hours per week kiloWatt hours per year   	TCheckBox	CheckBox1Left� Top� WidthHeightCaption	CheckBox1TabOrderOnClick	calculate  TEditEdit5Left`Top� WidthPHeightTabOrderText10OnChange	calculateOnExitpopulate
OnKeyPress	verifynum  	TComboBox	ComboBox5Left� Top� Width� Height
ItemHeight	ItemIndex TabOrder	Text
meters [m]OnChange	calculateItems.Strings
meters [m]	feet [ft]   TEditEdit6Left`Top� WidthPHeightTabOrder
Text2OnChange	calculateOnExitpopulate
OnKeyPress	verifynum  	TComboBox	ComboBox6Left� Top� Width� Height
ItemHeight	ItemIndex TabOrderTextcentimeter [cm]OnChange	calculateItems.Stringscentimeter [cm]inches [in]   TEditEdit7Left`TopWidthPHeightTabOrderText160OnExitpopulate
OnKeyPress	verifynumOnKeyUpeditfriction  	TComboBox	ComboBox7Left� TopWidth� Height
ItemHeight	ItemIndex TabOrderTextPVC (Polyvinyl Chloride)OnChange	calculateItems.StringsPVC (Polyvinyl Chloride) HDPE (High-Density Polyethylene)Steel Pipe (new and smooth) Steel Pipe (moderately corroded)%Galvanized Iron Pipe (new and smooth)*Galvanized Iron Pipe (moderately corroded)Cast Iron Pipe (new and smooth)$Cast Iron Pipe (moderately corroded)Concrete Pipe (new and smooth)Aluminium PipeCopper PipeUser Defined    