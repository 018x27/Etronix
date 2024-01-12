local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Library = {}
function Library:CreateWindow(Title)
	if game.CoreGui:FindFirstChild("Library") then
		game.CoreGui:FindFirstChild("Library"):Destroy()
	end

	local Library = Instance.new("ScreenGui")
	local Main_1 = Instance.new("Frame")
	local UICorner_1 = Instance.new("UICorner")
	local Topbar_1 = Instance.new("Frame")
	local Title_1 = Instance.new("TextLabel")
	local UIPadding_1 = Instance.new("UIPadding")
	local CloseBtn_1 = Instance.new("TextButton")
	local UIPadding_2 = Instance.new("UIPadding")
	local TabsHolder_1 = Instance.new("Frame")
	local Tabs_1 = Instance.new("ScrollingFrame")
	local UIPadding_3 = Instance.new("UIPadding")
	local UIListLayout_1 = Instance.new("UIListLayout")
	local ElementsHolder_1 = Instance.new("Frame")
	local ToggleGui_1 = Instance.new("Frame")
	local UICorner_15 = Instance.new("UICorner")
	local ToggleGuiBtn_1 = Instance.new("TextButton")
	local UIStroke_99 = Instance.new("UIStroke")

	-- OPEN GUI
	local targetPositionOpen = UDim2.new(0.5, 0, 0.5, 0)
	local tweenInfoOpen = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	local tweenOpen = TweenService:Create(Main_1, tweenInfoOpen, { Position = targetPositionOpen })

	-- CLOSE GUI
	local targetPositionClose = UDim2.new(0.5, 0, 2, 0)
	local tweenInfoClose = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	local tweenClose = TweenService:Create(Main_1, tweenInfoClose, { Position = targetPositionClose })

	-- OPEN BTN
	local targetPositionOpenBtn = UDim2.new(0.5, 0,0.07, 0)
	local tweenInfoOpenBtn = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	local tweenOpenBtn = TweenService:Create(ToggleGui_1, tweenInfoOpenBtn, { Position = targetPositionOpenBtn })

	-- CLOSE BTN
	local targetPositionCloseBtn = UDim2.new(0.5, 0, -0.5, 0)
	local tweenInfoCloseBtn = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	local tweenCloseBtn = TweenService:Create(ToggleGui_1, tweenInfoCloseBtn, { Position = targetPositionCloseBtn })

	Library.Name = "Library"
	Library.Parent = game.CoreGui

	Main_1.Name = "Main"
	Main_1.Parent = Library
	Main_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Main_1.BackgroundColor3 = Color3.fromRGB(21,21,21)
	Main_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Main_1.BorderSizePixel = 0
	Main_1.Position = UDim2.new(0.5, 0, 2, 0)
	Main_1.Size = UDim2.new(0, 513,0, 280)

	local gui = Main_1

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	UICorner_1.Parent = Main_1

	Topbar_1.Name = "Topbar"
	Topbar_1.Parent = Main_1
	Topbar_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Topbar_1.BackgroundTransparency = 1
	Topbar_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Topbar_1.BorderSizePixel = 0
	Topbar_1.Size = UDim2.new(0, 513,0, 21)

	Title_1.Name = "Title"
	Title_1.Parent = Topbar_1
	Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Title_1.BackgroundTransparency = 1
	Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Title_1.BorderSizePixel = 0
	Title_1.Size = UDim2.new(0, 433,0, 21)
	Title_1.Font = Enum.Font.Gotham
	Title_1.Text = "Etronix | "..Title
	Title_1.TextColor3 = Color3.fromRGB(233,233,233)
	Title_1.TextSize = 15
	Title_1.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding_1.Parent = Title_1
	UIPadding_1.PaddingLeft = UDim.new(0,6)
	UIPadding_1.PaddingTop = UDim.new(0,3)

	CloseBtn_1.Name = "CloseBtn"
	CloseBtn_1.Parent = Topbar_1
	CloseBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	CloseBtn_1.BackgroundTransparency = 1
	CloseBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
	CloseBtn_1.BorderSizePixel = 0
	CloseBtn_1.Position = UDim2.new(0.959064305, 0,0, 0)
	CloseBtn_1.Size = UDim2.new(0, 21,0, 21)
	CloseBtn_1.Font = Enum.Font.Gotham
	CloseBtn_1.Text = "X"
	CloseBtn_1.TextColor3 = Color3.fromRGB(233,233,233)
	CloseBtn_1.TextSize = 15
	CloseBtn_1.MouseButton1Click:Connect(function()
		tweenClose:Play()
		tweenOpenBtn:Play()
	end)

	UIPadding_2.Parent = CloseBtn_1
	UIPadding_2.PaddingRight = UDim.new(0,3)
	UIPadding_2.PaddingTop = UDim.new(0,3)

	TabsHolder_1.Name = "TabsHolder"
	TabsHolder_1.Parent = Main_1
	TabsHolder_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TabsHolder_1.BackgroundTransparency = 1
	TabsHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
	TabsHolder_1.BorderSizePixel = 0
	TabsHolder_1.Position = UDim2.new(0, 0,0.075000003, 0)
	TabsHolder_1.Size = UDim2.new(0, 124,0, 259)

	Tabs_1.Name = "Tabs"
	Tabs_1.Parent = TabsHolder_1
	Tabs_1.Active = true
	Tabs_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Tabs_1.BackgroundTransparency = 1
	Tabs_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Tabs_1.BorderSizePixel = 0
	Tabs_1.Size = UDim2.new(0, 124,0, 259)
	Tabs_1.ClipsDescendants = true
	Tabs_1.AutomaticCanvasSize = Enum.AutomaticSize.Y
	Tabs_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
	Tabs_1.CanvasPosition = Vector2.new(0, 0)
	Tabs_1.CanvasSize = UDim2.new(0, 0,0.5, 0)
	Tabs_1.ElasticBehavior = Enum.ElasticBehavior.Never
	Tabs_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
	Tabs_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Tabs_1.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
	Tabs_1.ScrollBarImageTransparency = 1
	Tabs_1.ScrollBarThickness = 1
	Tabs_1.ScrollingDirection = Enum.ScrollingDirection.Y
	Tabs_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
	Tabs_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
	Tabs_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

	UIPadding_3.Parent = Tabs_1
	UIPadding_3.PaddingBottom = UDim.new(0,4)
	UIPadding_3.PaddingTop = UDim.new(0,4)

	UIListLayout_1.Parent = Tabs_1
	UIListLayout_1.Padding = UDim.new(0,5)
	UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder

	ElementsHolder_1.Name = "ElementsHolder"
	ElementsHolder_1.Parent = Main_1
	ElementsHolder_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ElementsHolder_1.BackgroundTransparency = 1
	ElementsHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ElementsHolder_1.BorderSizePixel = 0
	ElementsHolder_1.Position = UDim2.new(0.241715401, 0,0.075000003, 0)
	ElementsHolder_1.Size = UDim2.new(0, 389,0, 259)



	ToggleGui_1.Name = "ToggleGui"
	ToggleGui_1.Parent = Library
	ToggleGui_1.AnchorPoint = Vector2.new(0.5, 0.5)
	ToggleGui_1.BackgroundColor3 = Color3.fromRGB(21,21,21)
	ToggleGui_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ToggleGui_1.BorderSizePixel = 0
	ToggleGui_1.Position = UDim2.new(0.5, 0,0.0700000003, 0)
	ToggleGui_1.Size = UDim2.new(0, 25,0, 25)

	UICorner_15.Parent = ToggleGui_1
	UICorner_15.CornerRadius = UDim.new(0,12)

	ToggleGuiBtn_1.Name = "ToggleGuiBtn"
	ToggleGuiBtn_1.Parent = ToggleGui_1
	ToggleGuiBtn_1.AnchorPoint = Vector2.new(0.5, 0.5)
	ToggleGuiBtn_1.BackgroundColor3 = Color3.fromRGB(13,13,13)
	ToggleGuiBtn_1.BackgroundTransparency = 1
	ToggleGuiBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ToggleGuiBtn_1.BorderSizePixel = 0
	ToggleGuiBtn_1.Position = UDim2.new(0.5, 0, 0.5, 0)
	ToggleGuiBtn_1.Size = UDim2.new(0, 25, 0, 25)
	ToggleGuiBtn_1.Text = ""
	ToggleGuiBtn_1.MouseButton1Click:Connect(function()
		tweenCloseBtn:Play()
		tweenOpen:Play()
	end)

	UIStroke_99.Parent = ToggleGui_1
	UIStroke_99.Color = Color3.fromRGB(169, 169, 169)
	UIStroke_99.Thickness = 1
	

	local Tabs = {}
	local first = true
	local currentTab = nil
	local currentTabIcon = nil
	function Tabs:CreateTab(TabName,TabIcon)

		-- Text
		local targetTabColorOn = Color3.fromRGB(233,233,233)
		local targetTabColorOff = Color3.fromRGB(132,132,132)

		local targetTabIconColorOn = Color3.fromRGB(233,233,233)
		local targetTabIconColorOff = Color3.fromRGB(132,132,132)
		
		local TabBtnHolder_1 = Instance.new("Frame")
		local TabBtn_1 = Instance.new("TextButton")
		local UIPadding_4 = Instance.new("UIPadding")
		local TabIcon_1 = Instance.new("ImageLabel")
		local Elements_1 = Instance.new("Frame")
		local UIListLayout_2 = Instance.new("UIListLayout")

		TabBtnHolder_1.Name = "TabBtnHolder"
		TabBtnHolder_1.Parent = Tabs_1
		TabBtnHolder_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		TabBtnHolder_1.BackgroundTransparency = 1
		TabBtnHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
		TabBtnHolder_1.BorderSizePixel = 0
		TabBtnHolder_1.Size = UDim2.new(0, 124,0, 23)

		TabBtn_1.Name = "TabBtn"
		TabBtn_1.Parent = TabBtnHolder_1
		TabBtn_1.Active = true
		TabBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		TabBtn_1.BackgroundTransparency = 1
		TabBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
		TabBtn_1.BorderSizePixel = 0
		TabBtn_1.Size = UDim2.new(0, 124,0, 23)
		TabBtn_1.Font = Enum.Font.Gotham
		TabBtn_1.Text = TabName
		TabBtn_1.TextColor3 = Color3.fromRGB(132,132,132)
		TabBtn_1.TextSize = 13
		TabBtn_1.TextXAlignment = Enum.TextXAlignment.Left

		UIPadding_4.Parent = TabBtn_1
		UIPadding_4.PaddingLeft = UDim.new(0,30)

		TabIcon_1.Name = "TabIcon"
		TabIcon_1.Parent = TabBtnHolder_1
		TabIcon_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		TabIcon_1.BackgroundTransparency = 1
		TabIcon_1.BorderColor3 = Color3.fromRGB(0,0,0)
		TabIcon_1.BorderSizePixel = 0
		TabIcon_1.Position = UDim2.new(0.0540000014, 0,0.0869999975, 0)
		TabIcon_1.Size = UDim2.new(0, 19,0, 19)
		TabIcon_1.Image = "rbxassetid://"..TabIcon
		TabIcon_1.ImageColor3 = Color3.fromRGB(132,132,132)

		Elements_1.Name = "Elements"
		Elements_1.Parent = ElementsHolder_1
		Elements_1.AnchorPoint = Vector2.new(0.5, 0.5)
		Elements_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Elements_1.BackgroundTransparency = 1
		Elements_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Elements_1.BorderSizePixel = 0
		Elements_1.Position = UDim2.new(0.5, 0,0.5, 0)
		Elements_1.Size = UDim2.new(0, 389,0, 259)

		UIListLayout_2.Parent = Elements_1
		UIListLayout_2.Padding = UDim.new(0,1)
		UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

		local tweenInfo = TweenInfo.new(0.2)

		-- Text
		local tweenton = TweenService:Create(TabBtn_1, tweenInfo, {TextColor3 = targetTabColorOn})
		local tweentoff = TweenService:Create(TabBtn_1, tweenInfo, {TextColor3 = targetTabColorOff})
		
		local tweention = TweenService:Create(TabIcon_1, tweenInfo, {ImageColor3 = targetTabIconColorOn})
		local tweentioff = TweenService:Create(TabIcon_1, tweenInfo, {ImageColor3 = targetTabIconColorOff})

		if first then
			first = false
			Elements_1.Visible = true
			currentTab = TabBtn_1 -- Set the first tab as the current tab
			currentTabIcon = TabIcon_1
			tweenton:Play()
			tweention:Play()
		else
			Elements_1.Visible = false
		end

		TabBtn_1.MouseButton1Click:Connect(function()

			if currentTab then
				tweentoff:Play() -- Turn off color for the previous tab
			end
			
			if currentTabIcon then
				tweentioff:Play() -- Turn off color for the previous tab
			end

			tweenton:Play() -- Turn on color for the new tab
			tweention:Play()

			if currentTab and currentTab ~= TabBtn_1 then
				currentTab.TextColor3 = targetTabColorOff
			end
			
			if currentTabIcon and currentTabIcon ~= TabIcon_1 then
				currentTabIcon.ImageColor3 = targetTabIconColorOff
			end

			currentTab = TabBtn_1 -- Update the current tab
			currentTabIcon = TabIcon_1
			for i, v in next, ElementsHolder_1:GetChildren() do
				v.Visible = false
			end

			Elements_1.Visible = true
		end)

		local Sections = {}
		function Sections:Section()

			local Section_1 = Instance.new("ScrollingFrame")
			local UIPadding_7 = Instance.new("UIPadding")
			local UIListLayout_3 = Instance.new("UIListLayout")

			Section_1.Name = "Section"
			Section_1.Parent = Elements_1
			Section_1.AnchorPoint = Vector2.new(0.5, 0.5)
			Section_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Section_1.BackgroundTransparency = 1
			Section_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Section_1.BorderSizePixel = 0
			Section_1.Position = UDim2.new(0.246786639, 0,0.5, 0)
			Section_1.Size = UDim2.new(0, 193,0, 259)
			Section_1.AutomaticCanvasSize = Enum.AutomaticSize.Y
			Section_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
			Section_1.CanvasPosition = Vector2.new(0, 0)
			Section_1.CanvasSize = UDim2.new(0, 0,0.5, 0)
			Section_1.ElasticBehavior = Enum.ElasticBehavior.Never
			Section_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
			Section_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			Section_1.ScrollBarImageTransparency = 1
			Section_1.ScrollBarThickness = 1
			Section_1.ScrollingDirection = Enum.ScrollingDirection.Y
			Section_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
			Section_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
			Section_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

			UIPadding_7.Parent = Section_1
			UIPadding_7.PaddingBottom = UDim.new(0,4)
			UIPadding_7.PaddingLeft = UDim.new(0,4)
			UIPadding_7.PaddingTop = UDim.new(0,4)

			UIListLayout_3.Parent = Section_1
			UIListLayout_3.Padding = UDim.new(0,6)
			UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

			local Elements = {}
			function Elements:CreateSection(SecText)

				local Section_2 = Instance.new("Frame")
				local SectionText_1 = Instance.new("TextLabel")
				local UIPadding_9 = Instance.new("UIPadding")

				Section_2.Name = "Section"
				Section_2.Parent = Section_1
				Section_2.BackgroundColor3 = Color3.fromRGB(78,78,78)
				Section_2.BackgroundTransparency = 1
				Section_2.BorderColor3 = Color3.fromRGB(0,0,0)
				Section_2.BorderSizePixel = 0
				Section_2.Position = UDim2.new(0, 0,0.0996015966, 0)
				Section_2.Size = UDim2.new(0, 185,0, 18)

				SectionText_1.Name = "SectionText"
				SectionText_1.Parent = Section_2
				SectionText_1.Active = true
				SectionText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				SectionText_1.BackgroundTransparency = 1
				SectionText_1.BorderColor3 = Color3.fromRGB(0,0,0)
				SectionText_1.BorderSizePixel = 0
				SectionText_1.Size = UDim2.new(0, 185,0, 18)
				SectionText_1.Font = Enum.Font.Gotham
				SectionText_1.Text = SecText
				SectionText_1.TextColor3 = Color3.fromRGB(132,132,132)
				SectionText_1.TextSize = 12
				SectionText_1.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_9.Parent = SectionText_1
			end

			function Elements:CreateButton(ButText,Callback)

				Callback = Callback or function()
				end

				local targetButtonColorOn = Color3.fromRGB(52,52,52)
				local targetButtonColorOff = Color3.fromRGB(198,198,198)

				local Button_1 = Instance.new("Frame")
				local ButtonBtn_1 = Instance.new("TextButton")
				local UIPadding_6 = Instance.new("UIPadding")
				local ButtonIcon_1 = Instance.new("ImageLabel")
				local UICorner_2 = Instance.new("UICorner")

				Button_1.Name = "Button"
				Button_1.Parent = Section_1
				Button_1.BackgroundColor3 = Color3.fromRGB(30,30,30)
				Button_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Button_1.BorderSizePixel = 0
				Button_1.Size = UDim2.new(0, 185,0, 25)

				ButtonBtn_1.Name = "ButtonBtn"
				ButtonBtn_1.Parent = Button_1
				ButtonBtn_1.Active = true
				ButtonBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ButtonBtn_1.BackgroundTransparency = 1
				ButtonBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ButtonBtn_1.BorderSizePixel = 0
				ButtonBtn_1.Size = UDim2.new(0, 185,0, 25)
				ButtonBtn_1.Font = Enum.Font.Gotham
				ButtonBtn_1.Text = ButText
				ButtonBtn_1.TextColor3 = Color3.fromRGB(198,198,198)
				ButtonBtn_1.TextSize = 13
				ButtonBtn_1.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_6.Parent = ButtonBtn_1
				UIPadding_6.PaddingLeft = UDim.new(0,6)

				ButtonIcon_1.Name = "ButtonIcon"
				ButtonIcon_1.Parent = Button_1
				ButtonIcon_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ButtonIcon_1.BackgroundTransparency = 1
				ButtonIcon_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ButtonIcon_1.BorderSizePixel = 0
				ButtonIcon_1.Position = UDim2.new(0.879999995, 0,0.180000007, 0)
				ButtonIcon_1.Size = UDim2.new(0, 16,0, 16)
				ButtonIcon_1.Image = "rbxassetid://15944883133"
				ButtonIcon_1.ImageColor3 = Color3.fromRGB(198,198,198)

				UICorner_2.Parent = Button_1
				UICorner_2.CornerRadius = UDim.new(0,6)
				local tweenInfo = TweenInfo.new(0.2)

				local tweenbon = TweenService:Create(ButtonBtn_1, tweenInfo, {TextColor3 = targetButtonColorOn})
				local tweenboff = TweenService:Create(ButtonBtn_1, tweenInfo, {TextColor3 = targetButtonColorOff})

				ButtonBtn_1.MouseButton1Click:Connect(function()
					tweenbon:Play()
					wait(0.1)
					tweenboff:Play()
					Callback()
				end)
			end
			function Elements:CreateLabel(LabText)
				local Label_1 = Instance.new("Frame")
				local LabelText_1 = Instance.new("TextLabel")
				local UIPadding_8 = Instance.new("UIPadding")
				local UICorner_3 = Instance.new("UICorner")

				Label_1.Name = "Label"
				Label_1.Parent = Section_1
				Label_1.BackgroundColor3 = Color3.fromRGB(30,30,30)
				Label_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Label_1.BorderSizePixel = 0
				Label_1.Position = UDim2.new(0, 0,0.0996015966, 0)
				Label_1.Size = UDim2.new(0, 185,0, 18)

				LabelText_1.Name = "LabelText"
				LabelText_1.Parent = Label_1
				LabelText_1.Active = true
				LabelText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				LabelText_1.BackgroundTransparency = 1
				LabelText_1.BorderColor3 = Color3.fromRGB(0,0,0)
				LabelText_1.BorderSizePixel = 0
				LabelText_1.Size = UDim2.new(0, 185,0, 18)
				LabelText_1.Font = Enum.Font.Gotham
				LabelText_1.Text = LabText
				LabelText_1.TextColor3 = Color3.fromRGB(132,132,132)
				LabelText_1.TextSize = 12

				UIPadding_8.Parent = LabelText_1
				UIPadding_8.PaddingLeft = UDim.new(0,3)

				UICorner_3.Parent = Label_1
				UICorner_3.CornerRadius = UDim.new(0,6)
			end
			function Elements:CreateToggle(TogText,Callback)

				Callback = Callback or function()
				end

				local toggled = false
				local debounce = false

				local targetToggleColorOn = Color3.fromRGB(164,164,164)
				local targetToggleColorOff = Color3.fromRGB(52,52,52)

				local Toggle_1 = Instance.new("Frame")
				local ToggleBtn_1 = Instance.new("TextButton")
				local UIPadding_10 = Instance.new("UIPadding")
				local UICorner_4 = Instance.new("UICorner")
				local Toggler_1 = Instance.new("Frame")
				local UICorner_5 = Instance.new("UICorner")

				Toggle_1.Name = "Toggle"
				Toggle_1.Parent = Section_1
				Toggle_1.BackgroundColor3 = Color3.fromRGB(30,30,30)
				Toggle_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Toggle_1.BorderSizePixel = 0
				Toggle_1.Size = UDim2.new(0, 185,0, 25)

				ToggleBtn_1.Name = "ToggleBtn"
				ToggleBtn_1.Parent = Toggle_1
				ToggleBtn_1.Active = true
				ToggleBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ToggleBtn_1.BackgroundTransparency = 1
				ToggleBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ToggleBtn_1.BorderSizePixel = 0
				ToggleBtn_1.Size = UDim2.new(0, 185,0, 25)
				ToggleBtn_1.Font = Enum.Font.Gotham
				ToggleBtn_1.Text = TogText
				ToggleBtn_1.TextColor3 = Color3.fromRGB(198,198,198)
				ToggleBtn_1.TextSize = 13
				ToggleBtn_1.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_10.Parent = ToggleBtn_1
				UIPadding_10.PaddingLeft = UDim.new(0,6)

				UICorner_4.Parent = Toggle_1
				UICorner_4.CornerRadius = UDim.new(0,6)

				Toggler_1.Name = "Toggler"
				Toggler_1.Parent = Toggle_1
				Toggler_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
				Toggler_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Toggler_1.BorderSizePixel = 0
				Toggler_1.Position = UDim2.new(0.879999995, 0,0.159999996, 0)
				Toggler_1.Size = UDim2.new(0, 16,0, 16)

				UICorner_5.Parent = Toggler_1
				UICorner_5.CornerRadius = UDim.new(0,6)

				local tweenInfo = TweenInfo.new(0.2)
				local tweentcon = TweenService:Create(Toggler_1, tweenInfo, {BackgroundColor3 = targetToggleColorOn})
				local tweentcoff = TweenService:Create(Toggler_1, tweenInfo, {BackgroundColor3 = targetToggleColorOff})

				ToggleBtn_1.MouseButton1Click:Connect(function()
					if debounce == false then
						if toggled == false then
							debounce = true
							tweentcon:Play()
							debounce = false
							toggled = true
							pcall(Callback, toggled)
						elseif toggled == true then
							debounce = true
							tweentcoff:Play()
							debounce = false
							toggled = false
							pcall(Callback, toggled)
						end
					end
				end)
			end
			function Elements:CreateSlider(SliderText,max,Callback)
				local Slider_1 = Instance.new("Frame")
				local UICorner_8 = Instance.new("UICorner")
				local SliderText_1 = Instance.new("TextLabel")
				local UIPadding_12 = Instance.new("UIPadding")
				local SliderText_2 = Instance.new("TextLabel")
				local UIPadding_13 = Instance.new("UIPadding")
				local SliderHolder_1 = Instance.new("Frame")
				local UICorner_9 = Instance.new("UICorner")
				local SliderBtn_1 = Instance.new("TextButton")
				local SliderInner_1 = Instance.new("Frame")
				local UICorner_10 = Instance.new("UICorner")

				Slider_1.Name = "Slider"
				Slider_1.Parent = Section_1
				Slider_1.BackgroundColor3 = Color3.fromRGB(30,30,30)
				Slider_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Slider_1.BorderSizePixel = 0
				Slider_1.Position = UDim2.new(0, 0,0.561752975, 0)
				Slider_1.Size = UDim2.new(0, 185,0, 41)

				UICorner_8.Parent = Slider_1
				UICorner_8.CornerRadius = UDim.new(0,6)

				SliderText_1.Name = "SliderText"
				SliderText_1.Parent = Slider_1
				SliderText_1.Active = true
				SliderText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				SliderText_1.BackgroundTransparency = 1
				SliderText_1.BorderColor3 = Color3.fromRGB(0,0,0)
				SliderText_1.BorderSizePixel = 0
				SliderText_1.Size = UDim2.new(0, 132,0, 19)
				SliderText_1.Font = Enum.Font.Gotham
				SliderText_1.Text = SliderText
				SliderText_1.TextColor3 = Color3.fromRGB(198,198,198)
				SliderText_1.TextSize = 13
				SliderText_1.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_12.Parent = SliderText_1
				UIPadding_12.PaddingLeft = UDim.new(0,6)
				UIPadding_12.PaddingTop = UDim.new(0,4)

				SliderText_2.Name = "SliderText"
				SliderText_2.Parent = Slider_1
				SliderText_2.Active = true
				SliderText_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
				SliderText_2.BackgroundTransparency = 1
				SliderText_2.BorderColor3 = Color3.fromRGB(0,0,0)
				SliderText_2.BorderSizePixel = 0
				SliderText_2.Position = UDim2.new(0.772973001, 0,0, 0)
				SliderText_2.Size = UDim2.new(0, 42,0, 19)
				SliderText_2.Font = Enum.Font.Gotham
				SliderText_2.Text = "0"
				SliderText_2.TextColor3 = Color3.fromRGB(198,198,198)
				SliderText_2.TextSize = 13
				SliderText_2.TextXAlignment = Enum.TextXAlignment.Right

				UIPadding_13.Parent = SliderText_2
				UIPadding_13.PaddingRight = UDim.new(0,6)
				UIPadding_13.PaddingTop = UDim.new(0,4)

				SliderHolder_1.Name = "SliderHolder"
				SliderHolder_1.Parent = Slider_1
				SliderHolder_1.BackgroundColor3 = Color3.fromRGB(40,40,40)
				SliderHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
				SliderHolder_1.BorderSizePixel = 0
				SliderHolder_1.Position = UDim2.new(0.0378378369, 0,0.609756112, 0)
				SliderHolder_1.Size = UDim2.new(0, 171,0, 6)

				UICorner_9.Parent = SliderHolder_1
				UICorner_9.CornerRadius = UDim.new(0,6)

				SliderBtn_1.Name = "SliderBtn"
				SliderBtn_1.Parent = SliderHolder_1
				SliderBtn_1.BackgroundColor3 = Color3.fromRGB(40,40,40)
				SliderBtn_1.BackgroundTransparency = 1
				SliderBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
				SliderBtn_1.BorderSizePixel = 0
				SliderBtn_1.Size = UDim2.new(0, 171,0, 6)
				SliderBtn_1.Text = ""
				SliderBtn_1.TextColor3 = Color3.fromRGB(27,42,53)
				SliderBtn_1.TextSize = 8

				SliderInner_1.Name = "SliderInner"
				SliderInner_1.Parent = SliderBtn_1
				SliderInner_1.BackgroundColor3 = Color3.fromRGB(85,85,85)
				SliderInner_1.BorderColor3 = Color3.fromRGB(0,0,0)
				SliderInner_1.BorderSizePixel = 0
				SliderInner_1.Size = UDim2.new(0, 83,0, 6)

				UICorner_10.Parent = SliderInner_1
				UICorner_10.CornerRadius = UDim.new(0,6)


				local isDragging = false

				SliderBtn_1.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
						isDragging = true
					end
				end)

				game:GetService("UserInputService").InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
						isDragging = false
					end
				end)

				game:GetService("RunService").RenderStepped:Connect(function()
					if isDragging then
						local mousePosition = game:GetService("UserInputService"):GetMouseLocation()
						local sliderPosition = SliderBtn_1.AbsolutePosition
						local sliderWidth = SliderBtn_1.AbsoluteSize.X
						local fillWidth = math.clamp(mousePosition.X - sliderPosition.X, 0, sliderWidth)
						SliderInner_1.Size = UDim2.new(0, fillWidth, 1, 0)

						-- Calculate and display value label
						local value = fillWidth / sliderWidth
						local minValue = 0
						local maxValue = max
						local displayValue = math.floor(minValue + (maxValue - minValue) * value, 2)
						SliderText_2.Text = tostring(displayValue)
						Callback(displayValue)
					end
				end)

			end
			function Elements:CreateBox(BoxText,Callback)
				local Box_1 = Instance.new("Frame")
				local ToggleBtn_3 = Instance.new("TextLabel")
				local UIPadding_14 = Instance.new("UIPadding")
				local UICorner_11 = Instance.new("UICorner")
				local TextBoxHolder_1 = Instance.new("Frame")
				local UICorner_12 = Instance.new("UICorner")
				local TextBox_1 = Instance.new("TextBox")

				Box_1.Name = "Box"
				Box_1.Parent = Section_1
				Box_1.BackgroundColor3 = Color3.fromRGB(30,30,30)
				Box_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Box_1.BorderSizePixel = 0
				Box_1.Size = UDim2.new(0, 185,0, 25)

				ToggleBtn_3.Name = "ToggleBtn"
				ToggleBtn_3.Parent = Box_1
				ToggleBtn_3.Active = true
				ToggleBtn_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ToggleBtn_3.BackgroundTransparency = 1
				ToggleBtn_3.BorderColor3 = Color3.fromRGB(0,0,0)
				ToggleBtn_3.BorderSizePixel = 0
				ToggleBtn_3.Size = UDim2.new(0, 116,0, 25)
				ToggleBtn_3.Font = Enum.Font.Gotham
				ToggleBtn_3.Text = BoxText
				ToggleBtn_3.TextColor3 = Color3.fromRGB(198,198,198)
				ToggleBtn_3.TextSize = 13
				ToggleBtn_3.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_14.Parent = ToggleBtn_3
				UIPadding_14.PaddingLeft = UDim.new(0,6)

				UICorner_11.Parent = Box_1
				UICorner_11.CornerRadius = UDim.new(0,6)

				TextBoxHolder_1.Name = "TextBoxHolder"
				TextBoxHolder_1.Parent = Box_1
				TextBoxHolder_1.BackgroundColor3 = Color3.fromRGB(52,52,52)
				TextBoxHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
				TextBoxHolder_1.BorderSizePixel = 0
				TextBoxHolder_1.Position = UDim2.new(0.627027035, 0,0.159999996, 0)
				TextBoxHolder_1.Size = UDim2.new(0, 62,0, 16)

				UICorner_12.Parent = TextBoxHolder_1
				UICorner_12.CornerRadius = UDim.new(0,6)

				TextBox_1.Parent = TextBoxHolder_1
				TextBox_1.Active = true
				TextBox_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				TextBox_1.BackgroundTransparency = 1
				TextBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
				TextBox_1.BorderSizePixel = 0
				TextBox_1.CursorPosition = -1
				TextBox_1.Size = UDim2.new(0, 62,0, 16)
				TextBox_1.ClipsDescendants = true
				TextBox_1.Font = Enum.Font.Gotham
				TextBox_1.PlaceholderColor3 = Color3.fromRGB(164,164,164)
				TextBox_1.PlaceholderText = ""
				TextBox_1.Text = ""
				TextBox_1.TextColor3 = Color3.fromRGB(164,164,164)
				TextBox_1.TextSize = 11

				TextBox_1.FocusLost:Connect(function()
					Callback(TextBox_1.Text)
				end)

			end
			return Elements
		end
		return Sections
	end
	return Tabs
end
return Library