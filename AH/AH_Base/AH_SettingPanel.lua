AH_SettingPanel = AH_SettingPanel or {}


function AH_SettingPanel.Init()
	--������
	local frame = Kimochi([[<Frame name="AH_SettingPanel" title="�����������֡�����" />]])
	frame:point("CENTER", 0, 0, "CENTER", 0, 0)
	
	Kimochi(frame, [[<Image w="36" h="36" x="5" image="ui\\image\\uiCommon\\commonpanel.UITex" frame="9" />]])
	
	--Tab������
	Kimochi(frame, [[<Image w="770" h="33" y="50" image="ui\\image\\uiCommon\\activepopularize2.UITex" frame="46" />]]):setType(11)
	
	local pageSet = Kimochi(frame, [[<PageSet w="768" h="462" y="50" />]])
	
	local feedBack = Kimochi(pageSet, [[<Button text="���ⷴ��" x="670" y="4" gold="true" />]])
	feedBack.click = function()
		OpenInternetExplorer("http://weibo.com/nzgeneral")
	end

	local x = 20
	if _G["AH_Helper_Loaded"] then
		local tabBox = Kimochi(frame, string.format([[<TabBox x="%s" w="85" h="30" text="������" group="class" check="true"/>]], x))
		local window = Kimochi(pageSet, [[<Window w="708" h="432" x="35" y="40" />]])
		pageSet:add(window:this(), tabBox:this())
		tabBox.click = function(_check)
			if _check then
				pageSet:active(0)
			end
		end

		Kimochi(window, [[<Label text="�� ��������" />]]):color(255, 255, 0)
		--�Զ�����
		local checkbox_AutoSearch = Kimochi(window, string.format([[<CheckBox text="�����Զ�����" check="%s" y="30" />]], tostring(AH_Helper.bAutoSearch)))
		checkbox_AutoSearch.click = function(arg)
			AH_Helper.bAutoSearch = arg
		end
		
		--Ʒ�ʵȼ�
		local checkbox_QualityLevel = Kimochi(window, string.format([[<CheckBox text="��ʾƷ�ʵȼ�" check="%s" x="180" y="30" />]], tostring(AH_Helper.bShowQualityLevel)))
		checkbox_QualityLevel.click = function(arg)
			AH_Helper.bShowQualityLevel = arg
		end
		
		--������ʿ
		local checkbox_Guard = Kimochi(window, string.format([[<CheckBox text="���ý�����ʿ" check="%s" x="360" y="30" />]], tostring(AH_Helper.bGuard)))
		Kimochi(window, [[<Label text="����" x="492" y="30" w="30" />]])
		local textbox_Multiple = Kimochi(window, string.format([[<TextBox text="%s" x="525" y="30" w="40" />]], AH_Helper.nMultiple)):enable(AH_Helper.bGuard)
		Kimochi(window, [[<Label text="������" x="575" y="30" />]])
		checkbox_Guard.click = function(arg)
			AH_Helper.bGuard = arg
			textbox_Multiple:enable(arg)
		end
		textbox_Multiple.change = function(arg)
			AH_Helper.nMultiple = tonumber(arg)
		end
		
		--ʵʱ���ĵ���ʱ
		local checkbox_RealTime = Kimochi(window, string.format([[<CheckBox text="ʵʱ���ĵ���ʱ" check="%s" y="60"/>]], tostring(AH_Helper.bRealTime)))
		checkbox_RealTime.click = function(arg)
			AH_Helper.bRealTime = arg
		end
		
		--����ʱ��ɫ
		local colorbox_RealTime = Kimochi(window, string.format([[<ColorBox text="����ʱ��ɫ" x="184" y="60" r="%s" g="%s" b="%s" />]], unpack(AH_Helper.tRealTimeColor)))
		colorbox_RealTime.change = function(arg)
			AH_Helper.tRealTimeColor = arg
		end
		
		--��ʾ����������
		local checkbox_BidderName = Kimochi(window, string.format([[<CheckBox text="��ʾ����������" y="90" check="%s" />]], tostring(AH_Helper.bBidderName)))
		checkbox_BidderName.click = function(arg)
			AH_Helper.bBidderName = arg
		end
		
		--��������ɫ
		local colorbox_BidderName = Kimochi(window, string.format([[<ColorBox text="��������ɫ" x="184" y="90" r="%s" g="%s" b="%s" />]], unpack(AH_Helper.tBidderNameColor)))
		colorbox_BidderName.change = function(arg)
			AH_Helper.tBidderNameColor = arg
		end
		
		--��ʷ��¼
		Kimochi(window, [[<Label text="��ʷ��¼����" x="364" y="60" />]])
		Kimochi(window, [[<Label text="��" x="530" y="60" />]])
		local combobox_MaxHistory = Kimochi(window, string.format([[<ComboBox text="%s" w="55" x="470" y="60" />]], AH_Helper.nMaxHistory))
		combobox_MaxHistory.click = function(m)
			table.insert(m,{szOption = "5", fnAction = function() AH_Helper.nMaxHistory = 5 combobox_MaxHistory:text(5) end,})
			table.insert(m,{szOption = "10", fnAction = function() AH_Helper.nMaxHistory = 10 combobox_MaxHistory:text(10) end,})
			table.insert(m,{szOption = "15", fnAction = function() AH_Helper.nMaxHistory = 15 combobox_MaxHistory:text(15) end,})
			table.insert(m,{szOption = "20", fnAction = function() AH_Helper.nMaxHistory = 20 combobox_MaxHistory:text(20) end,})
			PopupMenu(m)
		end
		
		--����ʱ��
		Kimochi(window, [[<Label text="���۱���ʱ��" x="364" y="90" />]])
		Kimochi(window, [[<Label text="Сʱ" x="530" y="90" />]])
		local combobox_SellTime = Kimochi(window, string.format([[<ComboBox text="%s" w="55" x="470" y="90" />]], AH_Helper.szDefaultTime:match("(%d+)")))
		combobox_SellTime.click = function(m)
			table.insert(m,{szOption = "12", fnAction = function() AH_Helper.szDefaultTime = "12Сʱ" combobox_SellTime:text(12) end,})
			table.insert(m,{szOption = "24", fnAction = function() AH_Helper.szDefaultTime = "24Сʱ" combobox_SellTime:text(24) end,})
			table.insert(m,{szOption = "48", fnAction = function() AH_Helper.szDefaultTime = "48Сʱ" combobox_SellTime:text(48) end,})
			PopupMenu(m)
		end
	
		--�����ؼ�
		local checkbox_FilterRecipe = Kimochi(window, string.format([[<CheckBox text="�����Ѷ��ؼ�" check="%s" y="120" />]], tostring(AH_Helper.bFilterRecipe)))
		checkbox_FilterRecipe.click = function(arg)
			AH_Helper.bFilterRecipe = arg
		end
		
		--�����鼮
		local checkbox_FilterBook = Kimochi(window, string.format([[<CheckBox text="�����Ѷ��鼮" check="%s" x="180" y="120" />]], tostring(AH_Helper.bFilterBook)))
		checkbox_FilterBook.click = function(arg)
			AH_Helper.bFilterBook = arg
		end
		
		--�Զ����
		local checkbox_AutoDiscount = Kimochi(window, string.format([[<CheckBox text="�����Զ����" check="%s" x="360" y="120" />]], tostring(AH_Helper.bLowestPrices)))
		local szText = ""
		if AH_Helper.nDefaultPrices == 1 then
			szText = "1ͭ"
		elseif AH_Helper.nDefaultPrices == 1 * 100 then
			szText = "1��"
		elseif AH_Helper.nDefaultPrices == 100 * 100 then
			szText = "1��"
		end
		local combobox_Discount = Kimochi(window, string.format([[<ComboBox text="%s" w="80" x="500" y="120" />]], szText)):enable(AH_Helper.bLowestPrices)
		combobox_Discount.click = function(m)
			table.insert(m,{szOption = "1ͭ", fnAction = function() AH_Helper.nDefaultPrices = 1 combobox_Discount:text("1ͭ") end,})
			table.insert(m,{szOption = "1��", fnAction = function() AH_Helper.nDefaultPrices = 1 * 100 combobox_Discount:text("1��") end,})
			table.insert(m,{szOption = "1��", fnAction = function() AH_Helper.nDefaultPrices = 100 * 100 combobox_Discount:text("1��") end,})
			PopupMenu(m)
		end
		checkbox_AutoDiscount.click = function(arg)
			AH_Helper.bLowestPrices = arg
			combobox_Discount:enable(arg)
		end
		
		
		Kimochi(window, [[<Label text="�� ��ݹ���" y="150" />]]):color(255, 255, 0)
		--���ټ���
		local checkbox_FastSell = Kimochi(window, string.format([[<CheckBox text="���ÿ��ټ���" check="%s" y="180" />]], tostring(AH_Helper.bDBCtrlSell)))
		checkbox_FastSell.click = function(arg)
			AH_Helper.bDBCtrlSell = arg
		end
		Kimochi(window, [[<Label text="����סCTRL��������Ҽ�˫����Ʒ�ĳ��������۽ݣ�" x="140" y="180" />]]):color(180, 180, 180)
		
		--���پ���
		local checkbox_FastBid = Kimochi(window, string.format([[<CheckBox text="���ÿ��پ���" check="%s"  y="210" />]], tostring(AH_Helper.bFastBid)))
		checkbox_FastBid.click = function(arg)
			AH_Helper.bFastBid = arg
		end
		Kimochi(window, [[<Label text="����סSHIFT+CTRL�������������Ʒ�����Կ��ٳ��ۣ�" x="140" y="210" />]]):color(180, 180, 180)
		
		--���ٹ���
		local checkbox_FastBuy = Kimochi(window, string.format([[<CheckBox text="���ÿ��ٹ���" check="%s"  y="240" />]], tostring(AH_Helper.bFastBuy)))
		Kimochi(window, [[<Label text="����סALT+CTRL�������������Ʒ�����Կ��ٹ���" x="140" y="240" />]]):color(180, 180, 180)
		Kimochi(window, [[<Label text="��" w="30" h="28" x="9" y="270" />]])
		local checkbox_DBClickBuyType = Kimochi(window, string.format([[<CheckBox text="�������˫����ʽ" x="30" check="%s"  y="270" />]], tostring(AH_Helper.bDBClickFastBuy))):enable(AH_Helper.bFastBuy)
		checkbox_FastBuy.click = function(arg)
			AH_Helper.bFastBuy = arg
			checkbox_DBClickBuyType:enable(arg)
		end
		checkbox_DBClickBuyType.click = function(arg)
			AH_Helper.bDBClickFastBuy = arg
		end
		
		--����ȡ��
		local checkbox_FastCancel = Kimochi(window, string.format([[<CheckBox text="���ÿ���ȡ��" check="%s" y="300" />]], tostring(AH_Helper.bFastCancel)))
		Kimochi(window, [[<Label text="����סALT+CTRL�������������Ʒ�����Կ���ȡ����" x="140" y="300" />]]):color(180, 180, 180)
		Kimochi(window, [[<Label text="��" w="30" h="28" x="9" y="330" />]])
		local checkbox_DBClickCancelType = Kimochi(window, string.format([[<CheckBox text="�������˫����ʽ" x="30" check="%s"  y="330" />]], tostring(AH_Helper.bDBClickFastCancel))):enable(AH_Helper.bFastCancel)
		checkbox_FastCancel.click = function(arg)
			AH_Helper.bFastCancel = arg
			checkbox_DBClickCancelType:enable(arg)
		end
		checkbox_DBClickCancelType.click = function(arg)
			AH_Helper.bDBClickFastCancel = arg
		end

		x = x + 85
	end

	if _G["AH_MailBank_Loaded"] or _G["AH_Spliter_Loaded"] or _G["AH_Tip_Loaded"] then
		local tabBox = Kimochi(frame, string.format([[<TabBox x="%s" w="85" h="30" text="����" group="class" />]], x))
		local window = Kimochi(pageSet, [[<Window w="708" h="432" x="35" y="40" />]])
		pageSet:add(window:this(), tabBox:this())
		tabBox.click = function(_check)
			if _check then
				pageSet:active(1)
			end
		end
		
		local y = 0
		if _G["AH_MailBank_Loaded"] then
			Kimochi(window, string.format([[<Label text="�� ��������" y="%s" />]], y)):color(255, 255, 0)
			local checkbox_AutoExange = Kimochi(window, string.format([[<CheckBox text="�Զ�������һ�μļ�����" check="%s" y="%s" />]], tostring(AH_MailBank.bAutoExange), y + 30))
			checkbox_AutoExange.click = function(arg)
				AH_MailBank.bAutoExange = arg
			end
			y = y + 60
		end
		
		if _G["AH_Spliter_Loaded"] then
			Kimochi(window, string.format([[<Label text="�� �������" y="%s" />]], y)):color(255, 255, 0)
			local checkbox_SaveHistory = Kimochi(window, string.format([[<CheckBox text="�Զ�����/�����ַ���" check="%s" y="%s" />]], tostring(AH_Spliter.bSaveHistory), y + 30))
			checkbox_SaveHistory.click = function(arg)
				AH_Spliter.bSaveHistory = arg
			end
			Kimochi(window, string.format([[<Label text="���򿪷�ʽ����סALT�������Ʒ��" x="200" y="%s" />]], y + 30)):color(180, 180, 180)
			y = y + 60
		end
		
		if _G["AH_Tip_Loaded"] then
			Kimochi(window, string.format([[<Label text="�� �����ʾ" y="%s" />]], y)):color(255, 255, 0)
			local checkbox_ShowTipEx = Kimochi(window, string.format([[<CheckBox text="�����ʾ��ʾ�����䷽" check="%s" y="%s" />]], tostring(AH_Tip.bShowTipEx), y + 30))
			checkbox_ShowTipEx.click = function(arg)
				AH_Tip.bShowTipEx = arg
			end
			Kimochi(window, string.format([[<Label text="��������ʱ��סALT��SHIFT�������ʾ�䷽��" x="200" y="%s" />]], y + 30)):color(180, 180, 180)
			
			local checkbox_ShowLearned = Kimochi(window, string.format([[<CheckBox text="��ʾ��ѧ�����䷽" check="%s" y="%s" />]], tostring(AH_Tip.bShowLearned), y + 60))
			checkbox_ShowLearned.click = function(arg)
				AH_Tip.bShowLearned = arg
			end
			
			local checkbox_ShowUnlearn = Kimochi(window, string.format([[<CheckBox text="��ʾδѧ�����䷽" check="%s" y="%s" />]], tostring(AH_Tip.bShowUnlearn), y + 90))
			checkbox_ShowUnlearn.click = function(arg)
				AH_Tip.bShowUnlearn = arg
			end
			
			local checkbox_ShowCachePrice = Kimochi(window, string.format([[<CheckBox text="��ʾ�������Ʒ�۸�" check="%s" y="%s" />]], tostring(AH_Tip.bShowCachePrice), y + 120))
			checkbox_ShowCachePrice.click = function(arg)
				AH_Tip.bShowCachePrice = arg
			end
			
		end
	end
	
	return frame
end

AH = AH or {}

function AH.OpenPanel()
	AH_SettingPanel.Init()
end

function AH.ClosePanel()
	local frame = Station.Lookup("Normal/AH_SettingPanel")
	if frame and frame:IsVisible() then
		Wnd.CloseWindow("AH_SettingPanel")
	end
end

function AH.TogglePanel()
	local frame = Station.Lookup("Normal/AH_SettingPanel")
	if not frame then
		AH.OpenPanel()
	else
		Wnd.CloseWindow("AH_SettingPanel")
	end
end

--[[RegisterEvent("LOGIN_GAME", function()
	TraceButton_AppendAddonMenu({{
		szOption = "SettingPanel",
		fnAction = function()
			AH.TogglePanel()
		end,
	}})
end)]]
