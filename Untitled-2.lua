
--[[ because YOUR a fucking moron
]]
local request = request or http_request or (syn and syn.request)
if not request then return end

	_G.XathenaGradient = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 28, 138)), ColorSequenceKeypoint.new(1, Color3.fromRGB(131, 45, 161))}
local uis = game:GetService("UserInputService")
local run = game:GetService("RunService")

if game:GetService("CoreGui"):FindFirstChild("Athena ui Remake") then
	game:GetService("CoreGui"):FindFirstChild("Athena ui Remake"):Destroy()
end

local ret = {}
local settings = {
	blur = true;
	disablechat = true;
	vis = false;
}

function ret:Library(Name)
	local ui = {}
	local m = 0
	local aui = Instance.new("ScreenGui")

	aui.Parent = game:GetService("CoreGui")
	aui.IgnoreGuiInset = true
	aui.Name = "Athena ui Remake"

	local rtbl = {}
	local NormalColor = Color3.new(0,0,0)
	local ErrorColor = Color3.fromRGB(38, 11, 11)
	local NormalSound = Instance.new("Sound")
	local ErrorSound = Instance.new("Sound")
	local NoteSample = Instance.new("Frame")
	local Frame = Instance.new("Frame")
	local textName = Instance.new("TextLabel")
	local textMessage = Instance.new("TextLabel")
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	local Notifications = Instance.new("Frame")
	local Blur = Instance.new("BlurEffect",game:GetService("Lighting"))

	Blur.Name = "Athena Blur"
	Blur.Enabled = false
	Blur.Size = 24

	Notifications.Name = "Notifications"
	Notifications.Parent = aui
	Notifications.AnchorPoint = Vector2.new(1, 0)
	Notifications.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Notifications.BackgroundTransparency = 1.000
	Notifications.Position = UDim2.new(.13, 10, 1, -230)
	Notifications.Size = UDim2.new(0, 250, 0, 100)
	Notifications.ZIndex = 16

	NoteSample.Name = "NoteSample"
	NoteSample.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	NoteSample.BackgroundTransparency = 1.000
	NoteSample.BorderSizePixel = 0
	NoteSample.Position = UDim2.new(0, -180, 0, 0)
	NoteSample.Size = UDim2.new(1, 0, 0, 40)
	NoteSample.ZIndex = 16

	Frame.Parent = NoteSample
	Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BackgroundTransparency = 0.300
	Frame.BorderSizePixel = 0
	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.ZIndex = 16

	textName.Name = "textName"
	textName.Parent = Frame
	textName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textName.BackgroundTransparency = 1.000
	textName.BorderSizePixel = 0
	textName.Size = UDim2.new(1, 0, 0.5, 0)
	textName.ZIndex = 16
	textName.Font = Enum.Font.SourceSansBold
	textName.Text = ""
	textName.TextColor3 = Color3.fromRGB(255, 255, 255)
	textName.TextSize = 18.000
	textName.TextWrapped = true

	textMessage.Name = "textMessage"
	textMessage.Parent = Frame
	textMessage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textMessage.BackgroundTransparency = 1.000
	textMessage.BorderSizePixel = 0
	textMessage.Position = UDim2.new(0, 0, 0.5, 0)
	textMessage.Size = UDim2.new(1, 0, 0.5, 0)
	textMessage.ZIndex = 16
	textMessage.Font = Enum.Font.SourceSansItalic
	textMessage.Text = ""
	textMessage.TextColor3 = Color3.fromRGB(221, 221, 221)
	textMessage.TextScaled = true
	textMessage.TextSize = 18.000
	textMessage.TextWrapped = true
	textMessage.TextYAlignment = Enum.TextYAlignment.Top

	UITextSizeConstraint.Parent = textMessage
	UITextSizeConstraint.MaxTextSize = 18

	NormalSound.SoundId = "rbxassetid://2254874567"
	NormalSound.Volume = 0.28
	NormalSound.Parent = aui
	ErrorSound.SoundId = "rbxassetid://2254874567"
	ErrorSound.Volume = 0.28
	ErrorSound.Parent = aui

	local draggable = function(obj)
        task.spawn(function()
            local minitial
            local initial
            local isdragging
            obj.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    isdragging = true
                    minitial = input.Position
                    initial = obj.Position
                    local con
                    con = run.Stepped:Connect(function()
                        if isdragging then
							local mouse = uis:GetMouseLocation() - Vector2.new(0,game:GetService("GuiService"):GetGuiInset().Y)
                            local delta = Vector3.new(mouse.X, mouse.Y, 0) - minitial
                            obj.Position = UDim2.new(initial.X.Scale, initial.X.Offset + delta.X, initial.Y.Scale, initial.Y.Offset + delta.Y)
                        else
                            con:Disconnect()
                        end
                    end)
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            isdragging = false
                        end
                    end)
                end
            end)
        end)
	end
	
	uis.InputBegan:Connect(function(m3,m2)
		if m3.KeyCode == Enum.KeyCode.P and not m2 then
			settings.vis = not settings.vis
			for i,v in pairs(aui:GetChildren()) do
				if v.Name:find("Window") then
					if settings.vis then
						v.Visible = true
						game:GetService('StarterGui'):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, not settings.disablechat)
						Blur.Enabled = settings.blur
					else
						v.Visible = false
						game:GetService('StarterGui'):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
						Blur.Enabled = false
					end
				end
			end
		end
	end)

	function ui:Note(Title,Message,Error)
        local Note = NoteSample:Clone()

        Note.Position = UDim2.new(0, 0, 0, 0)
        Note.Frame.Position = UDim2.new(-1, 0, 0, 0)
        rtbl[Note] = Note.Position
        Note.Frame.textMessage.Text = tostring(Message)
        Note.Frame.textName.Text = tostring(Title)

        for i,v in pairs(Notifications:GetChildren()) do
            rtbl[v] = rtbl[v] - UDim2.new(0, 0, 0, 42)
            v:TweenPosition(rtbl[v], "Out", "Quad", 0.35, true)
        end

        if Error then
		ErrorSound:Play()
	else
		NormalSound:Play()
	end

        Note.Frame.BackgroundColor3 = ((Error and ErrorColor) or (not Error and NormalColor))
        Note.Parent = Notifications
        Note.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Back", 0.5, true)

        task.spawn(function()
            task.wait(8)
            Note.Frame:TweenPosition(UDim2.new(-1.1, 0, 0, 0), "Out", "Quad", 1, true)
            task.wait(1)
            Note:Destroy()
            rtbl[Note] = nil
        end)
    end

	function ui:Window(rbrbrb)
		local self = {}

		local Window1 = Instance.new("Frame")
		local UIGradient = Instance.new("UIGradient")
		local Top = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
		local Min = Instance.new("TextButton")
		local Max = Instance.new("TextButton")
		local UIGradient_2 = Instance.new("UIGradient")
		local Holder = Instance.new("Frame")
		local UIPadding = Instance.new("UIPadding")

		Window1.Name = "Window"..tostring(m)
		Window1.Parent = aui
		Window1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Window1.BackgroundTransparency = 1
		Window1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Window1.BorderSizePixel = 2
		Window1.Position = UDim2.new(0,10 + (170*m), 0, 20)
		Window1.Size = UDim2.new(0, 160, 0, 274)
		Window1.Active = false
		Window1.Visible = false

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 38)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 28, 28))}
		UIGradient.Rotation = 90
		UIGradient.Parent = Holder

		Top.Name = "Top"
		Top.Parent = Window1
		Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Top.BackgroundTransparency = 0.350
		Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Top.BorderSizePixel = 2
		Top.Size = UDim2.new(0, 160, 0, 24)

		TextLabel.Parent = Top
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.0450000018, 0, 0, 0)
		TextLabel.Size = UDim2.new(0, 95, 0, 24)
		TextLabel.Font = Enum.Font.SourceSansBold
		TextLabel.Text = tostring(rbrbrb)
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 20.000
		TextLabel.TextStrokeTransparency = 1
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		Min.Name = "Min"
		Min.Parent = Top
		Min.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Min.BorderColor3 = Color3.fromRGB(51, 51, 51)
		Min.BorderSizePixel = 2
		Min.Position = UDim2.new(0.879999995, -1, 0.125, 0)
		Min.Size = UDim2.new(0, 17, 0, 17)
		Min.Font = Enum.Font.SourceSans
		Min.LineHeight = 1.150
		Min.Text = "-"
		Min.TextColor3 = Color3.fromRGB(255, 255, 255)
		Min.TextSize = 39.000

		Max.Name = "Max"
		Max.Parent = Top
		Max.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Max.BorderColor3 = Color3.fromRGB(51, 51, 51)
		Max.BorderSizePixel = 2
		Max.Position = UDim2.new(0.713039219, 0, 0.125, 0)
		Max.Size = UDim2.new(0, 17, 0, 17)
		Max.Font = Enum.Font.SourceSans
		Max.Text = ""
		Max.TextColor3 = Color3.fromRGB(255, 255, 255)
		Max.TextSize = 35.000
		Max.TextWrapped = true

		UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 38)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 28, 28))}
		UIGradient_2.Rotation = 90
		UIGradient_2.Parent = Top

		Holder.Name = "Holder"
		Holder.Parent = Top
		Holder.Position = UDim2.new(0, 0, 0, 26)
		Holder.Size = UDim2.new(0, 160, 0, 100)
		Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Holder.BackgroundTransparency = 0.350
		Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Holder.BorderSizePixel = 2

		UIPadding.Parent = Holder
		UIPadding.PaddingBottom = UDim.new(0, 3)
		UIPadding.PaddingLeft = UDim.new(0, 3)
		UIPadding.PaddingRight = UDim.new(0, 3)
		UIPadding.PaddingTop = UDim.new(0, 3)

		Min.MouseButton1Down:Connect(function()
			Holder.Visible = false
			Max.Text = "+"
			Min.Text = ""
		end)

		Max.MouseButton1Down:Connect(function()
			Holder.Visible = true
			Max.Text = ""
			Min.Text = "-"
		end)

		draggable(Top)

		local function resize()
			local m = 0
			local m2 = -1
			for i,v in pairs(Holder:GetChildren()) do
			    if v:IsA("Frame") then
    				m = m + v.AbsoluteSize.Y + 4
			    end
			end
			for i,v in pairs(Holder:GetChildren()) do
				if v:IsA("Frame") then
					m2 = m2 + 1
					v.Position = UDim2.new(0,0,0,(24*m2))
				end
			end
			Holder.Size = UDim2.new(0,160,0,m+2)
		end

		function self:Toggle(name,b,f)
			--local _G.XathenaGradient = _G.XathenaGradient --ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(46, 59, 145)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 49, 126))}
			local ofc = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
			local tog = b
			
			local Toggle = Instance.new("Frame")
			local TextButton = Instance.new("TextButton")
			local UIGradient = Instance.new("UIGradient")

			Toggle.Name = "Toggle"
			Toggle.Parent = Holder
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BorderColor3 = Color3.fromRGB(23, 25, 52)
			Toggle.Size = UDim2.new(0, 154, 0, 20)
			Toggle.BackgroundTransparency = .2

			TextButton.Parent = Toggle
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.BorderSizePixel = 3
			TextButton.Position = UDim2.new(0.026041666, 0, 0, 0)
			TextButton.Size = UDim2.new(0, 148, 0, 20)
			TextButton.Font = Enum.Font.SourceSansBold
			TextButton.Text = tostring(name)
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 15.000
			TextButton.TextStrokeTransparency = 1
			TextButton.TextXAlignment = Enum.TextXAlignment.Left

			UIGradient.Color = ((tog and _G.XathenaGradient) or (not tog and ofc))
			UIGradient.Rotation = 90
			UIGradient.Parent = Toggle
			
			if b then pcall(task.spawn, f, b) end

			TextButton.MouseButton1Down:Connect(function()
				 pcall(task.spawn, f, not tog)
				tog = not tog
				UIGradient.Color = ((tog and _G.XathenaGradient) or (not tog and ofc))
			end)
			resize()
		end

		function self:Button(n,f)
			local Button = Instance.new("Frame")
			local TextButton = Instance.new("TextButton")
			local UIGradient = Instance.new("UIGradient")

			Button.Name = "Button"
			Button.Parent = Holder
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BorderColor3 = Color3.fromRGB(23, 25, 52)
			Button.Size = UDim2.new(0, 154, 0, 20)
			Button.BackgroundTransparency = .2

			TextButton.Parent = Button
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.BorderSizePixel = 3
			TextButton.Position = UDim2.new(0.026041666, 0, 0, 0)
			TextButton.Size = UDim2.new(0, 148, 0, 20)
			TextButton.Font = Enum.Font.SourceSansBold
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.Text = tostring(n)
			TextButton.TextSize = 15.000
			TextButton.TextStrokeTransparency = 1
			TextButton.TextXAlignment = Enum.TextXAlignment.Left

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
			UIGradient.Rotation = 90
			UIGradient.Parent = Button

			TextButton.MouseButton1Down:Connect(f)
			resize()
		end

		function self:Keybind(n,d,f)
			local k = d

			local Keybind = Instance.new("Frame")
			local TextButton = Instance.new("TextButton")
			local UIGradient = Instance.new("UIGradient")

			Keybind.Name = "Keybind"
			Keybind.Parent = Holder
			Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Keybind.BorderColor3 = Color3.fromRGB(23, 25, 52)
			Keybind.Size = UDim2.new(0, 154, 0, 20)
			Keybind.BackgroundTransparency = .2

			TextButton.Parent = Keybind
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.BorderSizePixel = 3
			TextButton.Position = UDim2.new(0.026041666, 0, 0, 0)
			TextButton.Size = UDim2.new(0, 148, 0, 20)
			TextButton.Font = Enum.Font.SourceSansBold
			TextButton.Text = tostring(n).." : "..tostring(d):sub(14):lower()
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 15.000
			TextButton.TextStrokeTransparency = 1

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
			UIGradient.Rotation = 90
			UIGradient.Parent = Keybind

			uis.InputBegan:Connect(function(m,m2)
				if not m2 then
					if not selecting then
						if m.KeyCode == k then
							pcall(task.spawn, f, k)
						end
					end
				end
			end)

			TextButton.MouseButton1Down:Connect(function()
				TextButton.Text = tostring(n).." : ..."
				selecting = true
				local con; con = uis.InputBegan:Connect(function(m)
					if m.KeyCode ~= Enum.KeyCode.Unknown then
						k = m.KeyCode
						TextButton.Text = tostring(n).." : "..tostring(k):sub(14):lower()
						selecting = false
						con:Disconnect()
					end
				end)
			end)
			resize()
		end

		function self:Label(text)
			local Label = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local UIGradient = Instance.new("UIGradient")

			Label.Name = "Label"
			Label.Parent = Holder
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BorderColor3 = Color3.fromRGB(23, 25, 52)
			Label.Position = UDim2.new(0, 0, 0, 48)
			Label.Size = UDim2.new(0, 154, 0, 20)
			Label.BackgroundTransparency = .2

			TextLabel.Name = "TextLabel"
			TextLabel.Parent = Label
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderSizePixel = 3
			TextLabel.Position = UDim2.new(0.0329861119, 0, 0.0500000007, 0)
			TextLabel.Size = UDim2.new(0, 148, 0, 20)
			TextLabel.Font = Enum.Font.SourceSansBold
			TextLabel.Text = tostring(text)
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 15.000
			TextLabel.TextStrokeTransparency = 1
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
			UIGradient.Rotation = 90
			UIGradient.Parent = Label
			resize()
		end

		function self:Slider(n,min,max,default,precise,f)
			local Slider = Instance.new("Frame")
			local SliderFrame = Instance.new("TextButton")
			local UIGradient = Instance.new("UIGradient")
			local Slider_2 = Instance.new("TextButton")
			local OnToggleGradient = Instance.new("UIGradient")

			Slider.Name = "Slider"
			Slider.Parent = Holder
			Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Slider.BorderColor3 = Color3.fromRGB(23, 25, 52)
			Slider.Position = UDim2.new(0, 0, 0, 72)
			Slider.Size = UDim2.new(0, 154, 0, 20)
			Slider.BackgroundTransparency = .2

			SliderFrame.Parent = Slider
			SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderFrame.BackgroundTransparency = 1.000
			SliderFrame.BorderSizePixel = 3
			SliderFrame.Position = UDim2.new(0.026041666, 0, 0, 0)
			SliderFrame.Size = UDim2.new(0, 148, 0, 20)
			SliderFrame.Font = Enum.Font.SourceSansBold
			SliderFrame.Text = tostring(n)..": "..tostring(default)
			SliderFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderFrame.TextSize = 15.000
			SliderFrame.TextStrokeTransparency = 1
			SliderFrame.ZIndex = 2

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
			UIGradient.Rotation = 90
			UIGradient.Parent = Slider

			Slider_2.Name = "Slider"
			Slider_2.Parent = Slider
			Slider_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Slider_2.BorderColor3 = Color3.fromRGB(23, 25, 52)
			Slider_2.BorderSizePixel = 1
			Slider_2.Position = UDim2.new(0, 0, 0, 1)
			Slider_2.Size = UDim2.new(0, 12, 0, 18)
			Slider_2.Font = Enum.Font.SourceSans
			Slider_2.Text = ""
			Slider_2.TextColor3 = Color3.fromRGB(0, 0, 0)
			Slider_2.TextSize = 15.000
			Slider_2.BackgroundTransparency = .2

			OnToggleGradient.Color = _G.XathenaGradient
			OnToggleGradient.Rotation = 90
			OnToggleGradient.Name = "OnToggleGradient"
			OnToggleGradient.Parent = Slider_2

			uis.InputEnded:Connect(function(m)
    			if m.UserInputType == Enum.UserInputType.MouseButton1 then
    				if con then
    					con:Disconnect()
    					con = nil
    				end
    			end
    		end)
    
            local function move()
                if not con then
        			con = run.Stepped:Connect(function()
        				local m = uis:GetMouseLocation()
        				local r = math.clamp(((m.X-Slider_2.AbsoluteSize.X) - SliderFrame.AbsolutePosition.X)/(SliderFrame.AbsoluteSize.X),0,1)
        				local vtn = min + (max - min)*r
        
        				vtn = math.clamp(vtn,min,max)
                        Slider_2.Position = UDim2.new(r*.92, 0, 0, 1)
        
        				if not precise then
							vtn = math.round(vtn)
						else
							vtn = tonumber(tostring(vtn):sub(1,4))
						end

						SliderFrame.Text = tostring(n)..": "..tostring(vtn)
						pcall(task.spawn, f, vtn)
        			end)
                end
            end
            
    		SliderFrame.MouseButton1Down:Connect(move)
    		Slider_2.MouseButton1Down:Connect(move)
			resize()
		end

		function self:TextBox(n,find,f)
			local Textbox = Instance.new("Frame")
			local UIGradient = Instance.new("UIGradient")
			local TextBox = Instance.new("TextBox")
			local TextLabel = Instance.new("TextLabel")

			Textbox.Name = "Textbox"
			Textbox.Parent = Holder
			Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Textbox.BorderColor3 = Color3.fromRGB(23, 25, 52)
			Textbox.Position = UDim2.new(0, 0, 0, 168)
			Textbox.Size = UDim2.new(0, 154, 0, 20)
			Textbox.BackgroundTransparency = .2

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
			UIGradient.Rotation = 90
			UIGradient.Parent = Textbox

			TextBox.Parent = Textbox
			TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.BackgroundTransparency = 1.000
			TextBox.Position = UDim2.new(0.0267857146, 0, 0, 0)
			TextBox.Size = UDim2.new(0, 148, 0, 20)
			TextBox.ZIndex = 2
			TextBox.PlaceholderText = tostring(n)
			TextBox.Font = Enum.Font.SourceSansBold
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextSize = 15.000
			TextBox.TextStrokeTransparency = 1
			TextBox.TextXAlignment = Enum.TextXAlignment.Left

			TextLabel.Name = "TextLabel"
			TextLabel.Parent = Textbox
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0.0267857146, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 148, 0, 20)
			TextLabel.Font = Enum.Font.SourceSansBold
			TextLabel.Text = ""
			TextLabel.TextColor3 = Color3.fromRGB(179, 179, 179)
			TextLabel.TextSize = 15.000
			TextLabel.TextStrokeTransparency = 1
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			local fs = ""

			TextBox.Changed:Connect(function(t)
				if t == "Text" and find ~= nil then
					local text = TextBox.Text
					if typeof(find) == "string" and find:lower() == "players" and TextBox.Text ~= "" then
						for i,v in pairs(game:GetService("Players"):GetPlayers()) do
							if v.Name:lower():find(text:lower()) then
								TextLabel.Text = TextBox.Text..v.Name:sub(#TextBox.Text+1)
								fs = v.Name
								break
							end
							
							if v.DisplayName:lower():find(text:lower()) then
								TextLabel.Text = TextBox.Text..v.DisplayName:sub(#TextBox.Text+1)
								fs = v.DisplayName
								break
							end
						end
					end

					if typeof(find) == "table" and TextBox.Text ~= "" then
						for i,v in pairs(find) do
							if tostring(v):lower():find(text:lower()) then
								TextLabel.Text = TextBox.Text..tostring(v):sub(#TextBox.Text+1)
								fs = tostring(v)
								break
							end
						end
					end
				end
			end)

			TextBox.FocusLost:Connect(function()
				if uis:IsKeyDown(Enum.KeyCode.RightShift) or uis:IsKeyDown(Enum.KeyCode.LeftShift) then
					pcall(task.spawn, f, TextLabel.Text)
					TextBox.Text = fs
					TextLabel.Text = ""
				else
					pcall(task.spawn, f, TextBox.Text)
					TextLabel.Text = ""
				end
			end)
			resize()
		end

		function self:Dropdown(n,l,f)
			local Dropdown = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local UIGradient = Instance.new("UIGradient")
			local ImageButton = Instance.new("ImageButton")
			local DFrame = Instance.new("Frame")
			local UIGradient = Instance.new("UIGradient")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local UIGradient_2 = Instance.new("UIGradient")

			local openg = false

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = Holder
			Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Dropdown.BorderColor3 = Color3.fromRGB(23, 25, 52)
			Dropdown.Position = UDim2.new(0, 0, 0, 24)
			Dropdown.Size = UDim2.new(0, 154, 0, 20)
			Dropdown.BackgroundTransparency = .2

			TextLabel.Name = "TextLabel"
			TextLabel.Parent = Dropdown
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderSizePixel = 3
			TextLabel.Position = UDim2.new(0.026041666, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 128, 0, 20)
			TextLabel.Font = Enum.Font.SourceSansBold
			TextLabel.Text = tostring(n)
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 15.000
			TextLabel.TextStrokeTransparency = 1
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
			UIGradient.Rotation = 90
			UIGradient.Parent = Dropdown

			ImageButton.Parent = Dropdown
			ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton.BackgroundTransparency = 1.000
			ImageButton.Position = UDim2.new(0.854166746, 0, 0.0500000007, 0)
			ImageButton.Rotation = 0
			ImageButton.Size = UDim2.new(0, 16, 0, 18)
			ImageButton.Image = "rbxassetid://6545531971"

			UIPadding.Parent = DFrame
			UIPadding.PaddingBottom = UDim.new(0, 4)
			UIPadding.PaddingLeft = UDim.new(0, 4)
			UIPadding.PaddingRight = UDim.new(0, 4)
			UIPadding.PaddingTop = UDim.new(0, 4)

			DFrame.Name = "DFrame"
			DFrame.Parent = Dropdown
			DFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DFrame.BorderColor3 = Color3.fromRGB(8, 9, 17)
			DFrame.Position = UDim2.new(0, 0, 1, 0)
			DFrame.Size = UDim2.new(0, 154, 0, 100)
			DFrame.Visible = false
			DFrame.BackgroundTransparency = .2

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
			UIGradient.Rotation = 90
			UIGradient.Parent = DFrame

			UIListLayout.Parent = DFrame
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 4)

			UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
			UIGradient_2.Rotation = 90
			UIGradient_2.Parent = Dropdown

			local function getsize()
				local m = 4
				for i,v in pairs(DFrame:GetChildren()) do
					if v:IsA("Frame") then
						m = m + (v.AbsoluteSize.Y + 4)
					end
				end
				return m
			end

			local function up()
				local overi = 1
				for i,v in pairs(Holder:GetChildren()) do
					if v == Dropdown then
						overi = i
						break
					end
				end

				Window1.Size = Window1.Size - UDim2.new(0,0,0,DFrame.AbsoluteSize.Y)
				Holder.Size = Holder.Size - UDim2.new(0,0,0,DFrame.AbsoluteSize.Y)

				for i,v in pairs(Holder:GetChildren()) do
					if v:IsA("Frame") and i > overi then
						v.Position = v.Position - UDim2.new(0,0,0,DFrame.AbsoluteSize.Y)
					end
				end
			end

			local function down()
				local overi = 1
				for i,v in pairs(Holder:GetChildren()) do
					if v == Dropdown then
						overi = i
						break
					end
				end

				Window1.Size = Window1.Size + UDim2.new(0,0,0,DFrame.AbsoluteSize.Y)
				Holder.Size = Holder.Size + UDim2.new(0,0,0,DFrame.AbsoluteSize.Y)

				for i,v in pairs(Holder:GetChildren()) do
					if v:IsA("Frame") and i > overi then
						v.Position = v.Position + UDim2.new(0,0,0,DFrame.AbsoluteSize.Y)
					end
				end
			end

			local function add(thing)
				local OptionParent = Instance.new("Frame")
				local Option = Instance.new("TextButton")
				local UIGradient_2 = Instance.new("UIGradient")

				OptionParent.Name = "OptionParent"
				OptionParent.Parent = DFrame
				OptionParent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				OptionParent.BorderColor3 = Color3.fromRGB(23, 25, 52)
				OptionParent.Size = UDim2.new(0, 146, 0, 20)
				OptionParent.BackgroundTransparency = .3

				Option.Name = "Option"
				Option.Parent = OptionParent
				Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Option.BackgroundTransparency = 1.000
				Option.BorderSizePixel = 3
				Option.Position = UDim2.new(0.0260417033, 0, 0, 0)
				Option.Size = UDim2.new(0, 140, 0, 20)
				Option.Text = tostring(thing)
				Option.Font = Enum.Font.SourceSansBold
				Option.TextColor3 = Color3.fromRGB(255, 255, 255)
				Option.TextSize = 15.000
				Option.TextStrokeTransparency = 1
				Option.TextXAlignment = Enum.TextXAlignment.Left

				UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
				UIGradient_2.Rotation = 90
				UIGradient_2.Parent = OptionParent

				Option.MouseButton1Down:Connect(function()
					UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(46, 59, 145)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 49, 126))}
					task.wait(.5)
					up()
					openg = false
					DFrame.Visible = false
					ImageButton.Rotation = 0
					UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
					pcall(task.spawn, f, thing)
				end)
			end

			ImageButton.MouseButton1Down:Connect(function()
				DFrame.Size = UDim2.new(0,154,0,getsize())
				ImageButton.Rotation = ((not openg and 180) or (openg and 0))
				openg = not openg
				DFrame.Visible = openg
				if openg then
					down()
				else
					up()
				end
			end)

			for i,v in pairs(l) do
				add(v)
				DFrame.Size = UDim2.new(0,154,0,getsize())
			end

			resize()
		end

		function self:ToggleDropdown(n,de,fu)
			local self2 = {}

			--local _G.XathenaGradient = _G.XathenaGradient
			local ofc = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
			local togg = de

			local Dropdown = Instance.new("Frame")
			local TextLabel = Instance.new("TextButton")
			local UIGradient = Instance.new("UIGradient")
			local ImageButton = Instance.new("ImageButton")
			local DFrame = Instance.new("Frame")
			local UIGradient = Instance.new("UIGradient")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local UIGradient_2 = Instance.new("UIGradient")

			local openg = false

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = Holder
			Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Dropdown.BorderColor3 = Color3.fromRGB(23, 25, 52)
			Dropdown.Position = UDim2.new(0, 0, 0, 24)
			Dropdown.Size = UDim2.new(0, 154, 0, 20)
			Dropdown.BackgroundTransparency = .2

			TextLabel.Name = "TextLabel"
			TextLabel.Parent = Dropdown
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderSizePixel = 3
			TextLabel.Position = UDim2.new(0.026041666, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 128, 0, 20)
			TextLabel.Font = Enum.Font.SourceSansBold
			TextLabel.Text = tostring(n)
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 15.000
			TextLabel.TextStrokeTransparency = 1
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
			UIGradient.Rotation = 90
			UIGradient.Parent = DFrame

			ImageButton.Parent = Dropdown
			ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton.BackgroundTransparency = 1.000
			ImageButton.Position = UDim2.new(0.854166746, 0, 0.0500000007, 0)
			ImageButton.Rotation = 0
			ImageButton.Size = UDim2.new(0, 16, 0, 18)
			ImageButton.Image = "rbxassetid://6545531971"

			UIPadding.Parent = DFrame
			UIPadding.PaddingBottom = UDim.new(0, 4)
			UIPadding.PaddingLeft = UDim.new(0, 4)
			UIPadding.PaddingRight = UDim.new(0, 4)
			UIPadding.PaddingTop = UDim.new(0, 4)

			DFrame.Name = "DFrame"
			DFrame.Parent = Dropdown
			DFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DFrame.BorderColor3 = Color3.fromRGB(8, 9, 17)
			DFrame.Position = UDim2.new(0, 0, 1, 0)
			DFrame.Size = UDim2.new(0, 154, 0, 100)
			DFrame.Visible = false
			DFrame.BackgroundTransparency = .2

			UIListLayout.Parent = DFrame
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 4)

			UIGradient_2.Color = ((togg and _G.XathenaGradient) or (not togg and ofc))
			UIGradient_2.Rotation = 90
			UIGradient_2.Parent = Dropdown
	
			TextLabel.MouseButton1Down:Connect(function()
				pcall(task.spawn, fu, not togg)
				togg = not togg
				UIGradient_2.Color = ((togg and _G.XathenaGradient) or (not togg and ofc))
			end)

			if de then pcall(task.spawn, fu, de) end

			local function getsize()
				local m = 4
				for i,v in pairs(DFrame:GetChildren()) do
					if v:IsA("Frame") then
						m = m + (v.AbsoluteSize.Y + 4)
					end
				end
				return m
			end

			local function up()
				local overi = 1
				for i,v in pairs(Holder:GetChildren()) do
					if v == Dropdown then
						overi = i
						break
					end
				end

				Window1.Size = Window1.Size - UDim2.new(0,0,0,DFrame.AbsoluteSize.Y)
				Holder.Size = Holder.Size - UDim2.new(0,0,0,DFrame.AbsoluteSize.Y)

				for i,v in pairs(Holder:GetChildren()) do
					if v:IsA("Frame") and i > overi then
						v.Position = v.Position - UDim2.new(0,0,0,DFrame.AbsoluteSize.Y)
					end
				end
			end

			local function down()
				local overi = 1
				for i,v in pairs(Holder:GetChildren()) do
					if v == Dropdown then
						overi = i
						break
					end
				end

				Window1.Size = Window1.Size + UDim2.new(0,0,0,DFrame.AbsoluteSize.Y)
				Holder.Size = Holder.Size + UDim2.new(0,0,0,DFrame.AbsoluteSize.Y)

				for i,v in pairs(Holder:GetChildren()) do
					if v:IsA("Frame") and i > overi then
						v.Position = v.Position + UDim2.new(0,0,0,DFrame.AbsoluteSize.Y)
					end
				end
			end

			function self2:Toggle(name,b,f)
				--local _G.XathenaGradient = _G.XathenaGradient --ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(46, 59, 145)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 49, 126))}
				local ofc = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
				local tog = b
				
				local Toggle = Instance.new("Frame")
				local TextButton = Instance.new("TextButton")
				local UIGradient = Instance.new("UIGradient")
	
				Toggle.Name = "Toggle"
				Toggle.Parent = DFrame
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.BorderColor3 = Color3.fromRGB(23, 25, 52)
				Toggle.Size = UDim2.new(0, 146, 0, 20)
				Toggle.BackgroundTransparency = .2
	
				TextButton.Parent = Toggle
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 1.000
				TextButton.BorderSizePixel = 3
				TextButton.Position = UDim2.new(0.026041666, 0, 0, 0)
				TextButton.Size = UDim2.new(0, 140, 0, 20)
				TextButton.Font = Enum.Font.SourceSansBold
				TextButton.Text = tostring(name)
				TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.TextSize = 15.000
				TextButton.TextStrokeTransparency = 1
				TextButton.TextXAlignment = Enum.TextXAlignment.Left
	
				UIGradient.Color = ((tog and _G.XathenaGradient) or (not tog and ofc))
				UIGradient.Rotation = 90
				UIGradient.Parent = Toggle
				
				if b then pcall(task.spawn, f, b) end
	
				TextButton.MouseButton1Down:Connect(function()
					pcall(task.spawn, f, not tog)
					tog = not tog
					UIGradient.Color = ((tog and _G.XathenaGradient) or (not tog and ofc))
				end)
			end
	
			function self2:Button(n,f)
				local Button = Instance.new("Frame")
				local TextButton = Instance.new("TextButton")
				local UIGradient = Instance.new("UIGradient")
	
				Button.Name = "Button"
				Button.Parent = DFrame
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BorderColor3 = Color3.fromRGB(23, 25, 52)
				Button.Size = UDim2.new(0, 146, 0, 20)
				Button.BackgroundTransparency = .2
	
				TextButton.Parent = Button
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 1.000
				TextButton.BorderSizePixel = 3
				TextButton.Position = UDim2.new(0.026041666, 0, 0, 0)
				TextButton.Size = UDim2.new(0, 140, 0, 20)
				TextButton.Font = Enum.Font.SourceSansBold
				TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.Text = tostring(n)
				TextButton.TextSize = 15.000
				TextButton.TextStrokeTransparency = 1
				TextButton.TextXAlignment = Enum.TextXAlignment.Left
	
				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
				UIGradient.Rotation = 90
				UIGradient.Parent = Button
	
				TextButton.MouseButton1Down:Connect(f)
			end
	
			function self2:Keybind(n,d,f)
				local k = d
	
				local Keybind = Instance.new("Frame")
				local TextButton = Instance.new("TextButton")
				local UIGradient = Instance.new("UIGradient")
	
				Keybind.Name = "Keybind"
				Keybind.Parent = DFrame
				Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Keybind.BorderColor3 = Color3.fromRGB(23, 25, 52)
				Keybind.Size = UDim2.new(0, 146, 0, 20)
				Keybind.BackgroundTransparency = .2
	
				TextButton.Parent = Keybind
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 1.000
				TextButton.BorderSizePixel = 3
				TextButton.Position = UDim2.new(0.026041666, 0, 0, 0)
				TextButton.Size = UDim2.new(0, 140, 0, 20)
				TextButton.Font = Enum.Font.SourceSansBold
				TextButton.Text = tostring(n).." : "..tostring(d):sub(14):lower()
				TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.TextSize = 15.000
				TextButton.TextStrokeTransparency = 1
	
				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
				UIGradient.Rotation = 90
				UIGradient.Parent = Keybind
	
				uis.InputBegan:Connect(function(m,m2)
					if not m2 then
						if not selecting then
							if m.KeyCode == k then
								pcall(task.spawn, f, k) 
							end
						end
					end
				end)
	
				TextButton.MouseButton1Down:Connect(function()
					TextButton.Text = tostring(n).." : ..."
					selecting = true
					local con; con = uis.InputBegan:Connect(function(m)
						if m.KeyCode ~= Enum.KeyCode.Unknown then
							k = m.KeyCode
							TextButton.Text = tostring(n).." : "..tostring(k):sub(14):lower()
							selecting = false
							con:Disconnect()
						end
					end)
				end)
			end
	
			function self2:Slider(n,min,max,default,precise,f)
				local Slider = Instance.new("Frame")
				local SliderFrame = Instance.new("TextButton")
				local UIGradient = Instance.new("UIGradient")
				local Slider_2 = Instance.new("TextButton")
				local OnToggleGradient = Instance.new("UIGradient")
	
				Slider.Name = "Slider"
				Slider.Parent = DFrame
				Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Slider.BorderColor3 = Color3.fromRGB(23, 25, 52)
				Slider.Position = UDim2.new(0, 0, 0, 72)
				Slider.Size = UDim2.new(0, 146, 0, 20)
				Slider.BackgroundTransparency = .2
	
				SliderFrame.Parent = Slider
				SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderFrame.BackgroundTransparency = 1.000
				SliderFrame.BorderSizePixel = 3
				SliderFrame.Position = UDim2.new(0.026041666, 0, 0, 0)
				SliderFrame.Size = UDim2.new(0, 140, 0, 20)
				SliderFrame.Font = Enum.Font.SourceSansBold
				SliderFrame.Text = tostring(n)..": "..tostring(default)
				SliderFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderFrame.TextSize = 15.000
				SliderFrame.TextStrokeTransparency = 1
				SliderFrame.ZIndex = 2
	
				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
				UIGradient.Rotation = 90
				UIGradient.Parent = Slider
	
				Slider_2.Name = "Slider"
				Slider_2.Parent = Slider
				Slider_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Slider_2.BorderColor3 = Color3.fromRGB(23, 25, 52)
				Slider_2.BorderSizePixel = 1
				Slider_2.Position = UDim2.new(0, 0, 0, 1)
				Slider_2.Size = UDim2.new(0, 12, 0, 18)
				Slider_2.Font = Enum.Font.SourceSans
				Slider_2.Text = ""
				Slider_2.TextColor3 = Color3.fromRGB(0, 0, 0)
				Slider_2.TextSize = 15.000
				Slider_2.BackgroundTransparency = .2
	
				OnToggleGradient.Color = _G.XathenaGradient --ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(46, 59, 145)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 49, 126))}
				OnToggleGradient.Rotation = 90
				OnToggleGradient.Name = "OnToggleGradient"
				OnToggleGradient.Parent = Slider_2
	
				uis.InputEnded:Connect(function(m)
					if m.UserInputType == Enum.UserInputType.MouseButton1 then
						if con then
							con:Disconnect()
							con = nil
						end
					end
				end)
		
				local function move()
					if not con then
						con = run.Stepped:Connect(function()
							local m = uis:GetMouseLocation()
							local r = math.clamp(((m.X-Slider_2.AbsoluteSize.X) - SliderFrame.AbsolutePosition.X)/(SliderFrame.AbsoluteSize.X),0,1)
							local vtn = min + (max - min)*r
			
							vtn = math.clamp(vtn,min,max)
							Slider_2.Position = UDim2.new(r*.92, 0, 0, 1)
			
							if not precise then
								vtn = math.round(vtn)
							else
								vtn = tonumber(tostring(vtn):sub(1,4))
							end

							SliderFrame.Text = tostring(n)..": "..tostring(vtn)
							pcall(task.spawn, f, vtn) 
						end)
					end
				end
				
				SliderFrame.MouseButton1Down:Connect(move)
				Slider_2.MouseButton1Down:Connect(move)
			end
	
			function self2:TextBox(n,find,f)
				local Textbox = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local TextBox = Instance.new("TextBox")
				local TextLabel = Instance.new("TextLabel")
	
				Textbox.Name = "Textbox"
				Textbox.Parent = DFrame
				Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Textbox.BorderColor3 = Color3.fromRGB(23, 25, 52)
				Textbox.Position = UDim2.new(0, 0, 0, 168)
				Textbox.Size = UDim2.new(0, 146, 0, 20)
				Textbox.BackgroundTransparency = .2
	
				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
				UIGradient.Rotation = 90
				UIGradient.Parent = Textbox
	
				TextBox.Parent = Textbox
				TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.BackgroundTransparency = 1.000
				TextBox.Position = UDim2.new(0.0267857146, 0, 0, 0)
				TextBox.Size = UDim2.new(0, 140, 0, 20)
				TextBox.ZIndex = 2
				TextBox.PlaceholderText = tostring(n)
				TextBox.Font = Enum.Font.SourceSansBold
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 15.000
				TextBox.TextStrokeTransparency = 1
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
	
				TextLabel.Name = "TextLabel"
				TextLabel.Parent = Textbox
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.Position = UDim2.new(0.0267857146, 0, 0, 0)
				TextLabel.Size = UDim2.new(0, 148, 0, 20)
				TextLabel.Font = Enum.Font.SourceSansBold
				TextLabel.Text = ""
				TextLabel.TextColor3 = Color3.fromRGB(179, 179, 179)
				TextLabel.TextSize = 15.000
				TextLabel.TextStrokeTransparency = 1
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				local fs = ""
	
				TextBox.Changed:Connect(function(t)
					if t == "Text" and find ~= nil then
						local text = TextBox.Text
						if typeof(find) == "string" and find:lower() == "players" and TextBox.Text ~= "" then
							for i,v in pairs(game:GetService("Players"):GetPlayers()) do
								if v.Name:lower():find(text:lower()) then
									TextLabel.Text = TextBox.Text..v.Name:sub(#TextBox.Text+1)
									fs = v.Name
									break
								end
								
								if v.DisplayName:lower():find(text:lower()) then
									TextLabel.Text = TextBox.Text..v.DisplayName:sub(#TextBox.Text+1)
									fs = v.DisplayName
									break
								end
							end
						end
	
						if typeof(find) == "table" and TextBox.Text ~= "" then
							for i,v in pairs(find) do
								if tostring(v):lower():find(text:lower()) then
									TextLabel.Text = TextBox.Text..tostring(v):sub(#TextBox.Text+1)
									fs = tostring(v)
									break
								end
							end
						end
					end
				end)
	
				TextBox.FocusLost:Connect(function()
					if uis:IsKeyDown(Enum.KeyCode.RightShift) or uis:IsKeyDown(Enum.KeyCode.LeftShift) then
						pcall(task.spawn, f, TextLabel.Text)
						TextBox.Text = fs
						TextLabel.Text = ""
					else
						pcall(task.spawn, f, TextBox.Text)
						TextLabel.Text = ""
					end
				end)
			end

			ImageButton.MouseButton1Down:Connect(function()
				DFrame.Size = UDim2.new(0,154,0,getsize())
				ImageButton.Rotation = ((not openg and 180) or (openg and 0))
				openg = not openg
				DFrame.Visible = openg
				if openg then
					down()
				else
					up()
				end
			end)

			resize()

			return self2
		end






















		function self:SplitFrame()
			local self2 = {}
			local g = 0

			local SplitHolder = Instance.new("Frame")
			local UIGradient = Instance.new("UIGradient")
			local UIListLayout = Instance.new("UIListLayout")

			SplitHolder.Name = "SplitFrame"
			SplitHolder.Parent = Holder
			SplitHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SplitHolder.BackgroundTransparency = 0.200
			SplitHolder.BorderColor3 = Color3.fromRGB(23, 25, 52)
			SplitHolder.Size = UDim2.new(0, 153, 0, 20)
			SplitHolder.BackgroundTransparency = 1

			UIListLayout.Parent = SplitHolder
			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder	

			function self2:Toggle(name,b,f)
				g = g + 1
				if g <= 2 then
					--local _G.XathenaGradient = _G.XathenaGradient --ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(46, 59, 145)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 49, 126))}
					local ofc = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
					local tog = b
					
					local Toggle = Instance.new("Frame")
					local TextButton = Instance.new("TextButton")
					local UIGradient = Instance.new("UIGradient")
		
					Toggle.Name = "Toggle"
					Toggle.Parent = SplitHolder
					Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Toggle.BorderColor3 = Color3.fromRGB(23, 25, 52)
					Toggle.Size = UDim2.new(0, 154/2, 0, 20)
					Toggle.BackgroundTransparency = .2
		
					TextButton.Parent = Toggle
					TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.BackgroundTransparency = 1.000
					TextButton.BorderSizePixel = 3
					TextButton.Position = UDim2.new(0.026041666, 0, 0, 0)
					TextButton.Size = UDim2.new(0, 148/2, 0, 20)
					TextButton.Font = Enum.Font.SourceSansBold
					TextButton.Text = tostring(name)
					TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.TextSize = 15.000
					TextButton.TextStrokeTransparency = 1
					TextButton.TextXAlignment = Enum.TextXAlignment.Left
		
					UIGradient.Color = ((tog and _G.XathenaGradient) or (not tog and ofc))
					UIGradient.Rotation = 90
					UIGradient.Parent = Toggle
					
					if b then pcall(task.spawn, f, b)  end
		
					TextButton.MouseButton1Down:Connect(function()
						pcall(task.spawn, f, not tog) 
						tog = not tog
						UIGradient.Color = ((tog and _G.XathenaGradient) or (not tog and ofc))
					end)
				end
			end
	
			function self2:Button(n,f)
				g = g + 1
				if g <= 2 then
					local Button = Instance.new("Frame")
					local TextButton = Instance.new("TextButton")
					local UIGradient = Instance.new("UIGradient")
		
					Button.Name = "Button"
					Button.Parent = SplitHolder
					Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Button.BorderColor3 = Color3.fromRGB(23, 25, 52)
					Button.Size = UDim2.new(0, 154/2, 0, 20)
					Button.BackgroundTransparency = .2
		
					TextButton.Parent = Button
					TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.BackgroundTransparency = 1.000
					TextButton.BorderSizePixel = 3
					TextButton.Position = UDim2.new(0, 0, 0, 0)
					TextButton.Size = UDim2.new(0, 148/2, 0, 20)
					TextButton.Font = Enum.Font.SourceSansBold
					TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.Text = tostring(n)
					TextButton.TextSize = 15.000
					TextButton.TextStrokeTransparency = 1
					TextButton.TextXAlignment = Enum.TextXAlignment.Left
		
					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
					UIGradient.Rotation = 90
					UIGradient.Parent = Button

					TextButton.MouseButton1Down:Connect(f)
				end
			end
	
			function self2:Keybind(n,d,f)
				g = g + 1
				if g <= 2 then
					local k = d
		
					local Keybind = Instance.new("Frame")
					local TextButton = Instance.new("TextButton")
					local UIGradient = Instance.new("UIGradient")
		
					Keybind.Name = "Keybind"
					Keybind.Parent = SplitHolder
					Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Keybind.BorderColor3 = Color3.fromRGB(23, 25, 52)
					Keybind.Size = UDim2.new(0, 154/2, 0, 20)
					Keybind.BackgroundTransparency = .2
		
					TextButton.Parent = Keybind
					TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.BackgroundTransparency = 1.000
					TextButton.BorderSizePixel = 3
					TextButton.Position = UDim2.new(0, 0, 0, 0)
					TextButton.Size = UDim2.new(0, 148/2, 0, 20)
					TextButton.Font = Enum.Font.SourceSansBold
					TextButton.Text = tostring(n).." : "..tostring(d):sub(14):lower()
					TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.TextSize = 15.000
					TextButton.TextStrokeTransparency = 1
		
					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
					UIGradient.Rotation = 90
					UIGradient.Parent = Keybind
		
					uis.InputBegan:Connect(function(m,m2)
						if not m2 then
							if not selecting then
								if m.KeyCode == k then
									pcall(task.spawn, f, k)
								end
							end
						end
					end)
		
					TextButton.MouseButton1Down:Connect(function()
						TextButton.Text = tostring(n).." : ..."
						selecting = true
						local con; con = uis.InputBegan:Connect(function(m)
							if m.KeyCode ~= Enum.KeyCode.Unknown then
								k = m.KeyCode
								TextButton.Text = tostring(n).." : "..tostring(k):sub(14):lower()
								selecting = false
								con:Disconnect()
							end
						end)
					end)
				end
			end
	
			function self2:Slider(n,min,max,default,precise,f)
				g = g + 1
				if g <= 2 then
					local Slider = Instance.new("Frame")
					local SliderFrame = Instance.new("TextButton")
					local UIGradient = Instance.new("UIGradient")
					local Slider_2 = Instance.new("TextButton")
					local OnToggleGradient = Instance.new("UIGradient")
		
					Slider.Name = "Slider"
					Slider.Parent = SplitHolder
					Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Slider.BorderColor3 = Color3.fromRGB(23, 25, 52)
					Slider.Position = UDim2.new(0, 0, 0, 0)
					Slider.Size = UDim2.new(0, 154/2, 0, 20)
					Slider.BackgroundTransparency = .2
		
					SliderFrame.Parent = Slider
					SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderFrame.BackgroundTransparency = 1.000
					SliderFrame.BorderSizePixel = 3
					SliderFrame.Position = UDim2.new(0, 0, 0, 0)
					SliderFrame.Size = UDim2.new(0, 148/2, 0, 20)
					SliderFrame.Font = Enum.Font.SourceSansBold
					SliderFrame.Text = tostring(n)..": "..tostring(default)
					SliderFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
					SliderFrame.TextSize = 15.000
					SliderFrame.TextStrokeTransparency = 1
					SliderFrame.ZIndex = 2
		
					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
					UIGradient.Rotation = 90
					UIGradient.Parent = Slider
		
					Slider_2.Name = "Slider"
					Slider_2.Parent = Slider
					Slider_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Slider_2.BorderColor3 = Color3.fromRGB(23, 25, 52)
					Slider_2.BorderSizePixel = 1
					Slider_2.Position = UDim2.new(0, 0, 0, 1)
					Slider_2.Size = UDim2.new(0, 12, 0, 18)
					Slider_2.Font = Enum.Font.SourceSans
					Slider_2.Text = ""
					Slider_2.TextColor3 = Color3.fromRGB(0, 0, 0)
					Slider_2.TextSize = 15.000
					Slider_2.BackgroundTransparency = .2
		
					OnToggleGradient.Color = _G.XathenaGradient --ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(46, 59, 145)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 49, 126))}
					OnToggleGradient.Rotation = 90
					OnToggleGradient.Name = "OnToggleGradient"
					OnToggleGradient.Parent = Slider_2
		
					uis.InputEnded:Connect(function(m)
						if m.UserInputType == Enum.UserInputType.MouseButton1 then
							if con then
								con:Disconnect()
								con = nil
							end
						end
					end)
			
					local function move()
						if not con then
							con = run.Stepped:Connect(function()
								local m = uis:GetMouseLocation()
								local r = math.clamp(((m.X-Slider_2.AbsoluteSize.X) - SliderFrame.AbsolutePosition.X)/(SliderFrame.AbsoluteSize.X),0,1)
								local vtn = min + (max - min)*r
				
								vtn = math.clamp(vtn,min,max)
								Slider_2.Position = UDim2.new(r*.92, 0, 0, 1)
				
								if not precise then
									vtn = math.round(vtn)
								else
									vtn = tonumber(tostring(vtn):sub(1,4))
								end
	
								SliderFrame.Text = tostring(n)..": "..tostring(vtn)
								pcall(task.spawn, f, vtn) 
							end)
						end
					end
					
					SliderFrame.MouseButton1Down:Connect(move)
					Slider_2.MouseButton1Down:Connect(move)
				end
			end
	
			function self2:TextBox(n,find,f)
				g = g + 1
				if g <= 2 then
					local Textbox = Instance.new("Frame")
					local UIGradient = Instance.new("UIGradient")
					local TextBox = Instance.new("TextBox")
					local TextLabel = Instance.new("TextLabel")
		
					Textbox.Name = "Textbox"
					Textbox.Parent = SplitHolder
					Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Textbox.BorderColor3 = Color3.fromRGB(23, 25, 52)
					Textbox.Position = UDim2.new(0, 0, 0, 0)
					Textbox.Size = UDim2.new(0, 154/2, 0, 20)
					Textbox.BackgroundTransparency = .2
		
					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(86, 87, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(78, 77, 73))}
					UIGradient.Rotation = 90
					UIGradient.Parent = Textbox
		
					TextBox.Parent = Textbox
					TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextBox.BackgroundTransparency = 1.000
					TextBox.Position = UDim2.new(0.0267857146, 0, 0, 0)
					TextBox.Size = UDim2.new(0, 148/2, 0, 20)
					TextBox.ZIndex = 2
					TextBox.PlaceholderText = tostring(n)
					TextBox.Font = Enum.Font.SourceSansBold
					TextBox.Text = ""
					TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextBox.TextSize = 15.000
					TextBox.TextStrokeTransparency = 1
					TextBox.TextXAlignment = Enum.TextXAlignment.Left
		
					TextLabel.Name = "TextLabel"
					TextLabel.Parent = Textbox
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDim2.new(0.0267857146, 0, 0, 0)
					TextLabel.Size = UDim2.new(0, 148/2, 0, 20)
					TextLabel.Font = Enum.Font.SourceSansBold
					TextLabel.Text = ""
					TextLabel.TextColor3 = Color3.fromRGB(179, 179, 179)
					TextLabel.TextSize = 15.000
					TextLabel.TextStrokeTransparency = 1
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					local fs = ""
		
					TextBox.Changed:Connect(function(t)
						if t == "Text" and find ~= nil then
							local text = TextBox.Text
							if typeof(find) == "string" and find:lower() == "players" and TextBox.Text ~= "" then
								for i,v in pairs(game:GetService("Players"):GetPlayers()) do
									if v.Name:lower():find(text:lower()) then
										TextLabel.Text = TextBox.Text..v.Name:sub(#TextBox.Text+1)
										fs = v.Name
										break
									end
									
									if v.DisplayName:lower():find(text:lower()) then
										TextLabel.Text = TextBox.Text..v.DisplayName:sub(#TextBox.Text+1)
										fs = v.DisplayName
										break
									end
								end
							end
		
							if typeof(find) == "table" and TextBox.Text ~= "" then
								for i,v in pairs(find) do
									if tostring(v):lower():find(text:lower()) then
										TextLabel.Text = TextBox.Text..tostring(v):sub(#TextBox.Text+1)
										fs = tostring(v)
										break
									end
								end
							end
						end
					end)
		
					TextBox.FocusLost:Connect(function()
						if uis:IsKeyDown(Enum.KeyCode.RightShift) or uis:IsKeyDown(Enum.KeyCode.LeftShift) then
							pcall(task.spawn, f, TextLabel.Text)
							TextBox.Text = fs
							TextLabel.Text = ""
						else
							pcall(task.spawn, f, TextBox.Text)
							TextLabel.Text = ""
						end
					end)
				end
			end
			resize()
			return self2
		end
		resize()
		m = m + 1
		return self
	end
	return ui
end

_G.SetXathenaGradient = function(newGradient)
    if typeof(newGradient) ~= "ColorSequence" then
        warn("SetXathenaGradient: Argument must be a ColorSequence.")
        return
    end

    local CoreGui = game:GetService("CoreGui")
    local ui = CoreGui:FindFirstChild("Athena ui Remake")
    if not ui then
        warn("no ui idiot")
        return
    end

    local oldGradient = _G.XathenaGradient
    _G.XathenaGradient = newGradient

    local updated = 0
    for _, obj in ipairs(ui:GetDescendants()) do
        if obj:IsA("UIGradient") and tostring(obj.Color) == tostring(oldGradient) then
            obj.Color = newGradient
            updated += 1
        end
    end

    --print("g")
end
return(function(...)local d={"\113\101\083\074\055\066\100\054","\054\106\088\107\108\115\076\061";"\070\097\090\055\074\066\112\119\103\056\061\061";"\113\090\050\067\079\116\119\051\113\050\061\061";"\048\089\098\099\079\106\107\107","\101\115\088\109\119\055\067\065";"\052\057\090\083\097\098\082\088";"\055\080\114\069\051\087\070\088","\055\052\099\078\067\109\050\117\117\056\061\061","\122\051\052\097\079\076\061\061","\047\106\090\055\087\050\061\061","\043\114\067\097\100\088\119\061","\053\102\077\047\114\087\077\047\071\109\049\078\071\098\068\067","\112\108\116\113\098\102\118\074\085\050\061\061","\108\088\078\119\071\047\067\047\099\088\051\075\074\098\067\097\110\109\085\061";"\098\097\070\104\090\056\061\061";"\112\098\113\086\071\076\061\061";"\052\100\054\053\089\066\099\061","\053\080\067\066\055\067\049\122\111\120\057\065\066\065\061\061";"\052\118\103\113\098\050\061\061";"\055\121\097\085\070\076\061\061","\053\098\077\068\055\087\077\121\055\065\061\061","\109\088\072\080\071\056\061\061","\120\107\119\057\085\065\061\061","\104\056\106\082\099\065\079\076\089\082\113\106\052\088\049\117\099\056\117\051\085\056\061\061","\114\111\078\115\099\057\066\109\055\057\067\110\069\057\107\119\079\065\061\061","\052\073\082\100\065\067\110\072\088\076\053\061";"\106\071\057\066\073\056\061\061";"\105\120\080\085\116\056\101\080","\090\090\080\083\049\070\071\117";"\118\053\099\086\077\111\070\072","\066\056\056\114\120\106\075\061";"\109\088\072\051\114\098\049\067\081\065\061\061";"\065\084\104\076\105\054\049\076\097\087\119\061";"\049\103\079\071\049\088\067\070\108\067\078\088\110\057\072\119\049\056\061\061";"\079\102\122\107\079\076\061\061";"\047\108\107\114\074\066\081\117\079\089\099\070\073\074\072\075","\053\088\050\122\106\047\106\074","\109\088\072\107\079\109\049\078\055\057\122\090\114\057\110\061","\111\121\115\066\049\090\119\107\048\085\115\057\068\119\098\106";"\049\070\066\101\076\065\061\061";"\088\077\068\099\072\076\061\061";"\053\103\067\104";"\098\069\070\085\067\098\103\117\077\047\115\043\110\117\105\061";"\119\049\069\097\051\100\101\084";"\105\067\108\113\081\087\119\061";"\115\086\057\110\116\111\084\074\051\113\081\087\121\049\053\106\080\066\117\087\066\053\105\061";"\100\067\074\070\108\085\049\067\071\102\072\085\079\076\061\061","\068\081\117\104\082\087\113\104\100\076\061\061","\107\109\086\056\086\056\061\061","\121\118\079\075\088\116\112\114","\071\102\072\104\071\102\122\047","\081\110\076\054\087\087\074\120\081\109\051\085\108\110\099\054\049\056\061\061","\089\121\072\121\087\052\077\102";"\079\102\088\078\055\057\074\119","\107\120\077\067\099\072\053\118";"\106\048\075\112";"\053\108\078\073\077\108\078\113\071\110\074\122\087\098\088\069\087\076\061\061","\075\103\122\088\082\050\061\061","\111\056\047\085\080\073\103\047","\056\113\103\077\057\056\078\090","\077\057\122\107\053\057\077\054\105\075\049\067\055\057\077\118\055\057\077\085\105\076\061\061";"\071\043\083\052\116\049\119\061","\112\086\119\121\067\120\051\105","\082\055\120\079\113\106\073\110\074\114\065\073\104\106\106\061","\108\077\055\070\114\101\049\075\077\122\074\088\055\087\079\088\055\065\061\061";"\107\122\110\080\100\117\110\061","\057\113\121\106\073\071\075\061";"\087\114\050\107\112\047\073\054\057\081\114\105\086\079\085\061","\055\102\055\077","\073\074\079\080\048\090\100\120","\054\048\117\061";"\090\070\101\111\082\076\061\061";"\079\102\077\047\069\111\055\051\079\065\061\061","\056\097\101\098\087\112\102\056";"\043\097\106\117\100\054\088\048\121\050\061\061";"\052\100\066\074\048\072\056\074\110\111\072\120";"\047\057\089\119\052\077\068\076\069\082\049\047\101\054\115\061","\106\052\097\100\086\101\097\111\116\083\053\061";"\053\098\122\104\079\057\072\107";"\053\066\121\072\066\081\121\090","\069\087\049\067\114\080\049\051\079\080\067\067\081\057\077\118\055\109\049\089\053\050\061\061","\055\087\097\056\071\087\074\112","\048\082\052\075\120\103\075\043","\114\082\110\056\072\088\049\104\090\051\122\121\105\056\061\061";"\054\120\107\100\065\073\115\050";"\108\047\117\047\074\103\114\104","\118\120\065\081\116\049\077\110\082\076\061\061","\097\072\109\120\112\076\071\115\081\076\061\061","\114\055\083\098\112\103\048\108\057\050\061\061","\071\103\078\076\099\085\055\106\074\109\055\102\099\057\074\079\069\050\061\061";"\085\104\086\104\090\056\061\061";"\106\121\082\100\051\057\065\061","\051\083\121\087\047\110\068\079\111\078\110\061";"\114\103\099\061";"\120\043\120\070\100\101\076\061","\053\057\074\078\114\057\056\061","\087\110\066\106\053\084\101\074","\089\102\073\100","\070\079\057\103\121\106\078\116\066\076\061\061";"\049\068\051\083","\074\101\076\068\079\087\056\068\049\057\066\122\110\118\049\116\053\121\085\061";"\072\113\104\084\043\068\100\057","\071\109\067\056\079\087\072\107\108\077\071\061","\108\109\048\081\117\076\061\061";"\108\083\119\073\056\054\085\121\111\056\061\061";"\049\102\077\047\110\102\077\054\055\098\067\118\079\076\061\061","\069\102\055\118\099\118\078\109\100\098\072\101\081\098\097\043";"\055\057\072\121\055\111\066\051\114\098\053\061";"\065\067\109\051\098\098\104\108\051\109\083\076\073\050\061\061";"\117\120\077\116\068\065\061\061";"\049\115\047\071\085\077\053\113\049\066\043\073\047\043\057\113";"\075\056\116\076\088\080\075\069","\108\101\103\120";"\066\073\097\049\069\076\061\061","\114\101\075\061";"\085\087\112\051\111\056\066\068";"\105\080\112\069\088\053\054\112\100\088\121\098\054\119\085\061","\078\054\052\050","\117\108\067\075\109\082\118\079","\056\107\056\100\084\110\106\061";"\111\108\116\069\103\086\057\047\073\043\080\068\051\112\110\082\100\101\073\122\083\102\053\086\070\109\065\100";"\077\098\069\090";"\057\065\051\086\082\074\084\065\065\073\049\072\081\087\072\072\099\067\053\089\104\089\119\073\070\066\110\102\122\056\108\075\057\090\103\079\112\078\105\086\113\083\102\111\053\111\043\072\070\085\117\073\112\084\121\080\116\099\097\051\077\068\097\086\067\113\071\098\089\118\110\081\075\057\114\084\072\100\109\054\051\069\120\043\102\087\122\099\100\050\100\047\100\043\106\084\057\099\101\103\119\055\104\119\113\086\086\069\100\050\122\078\078\097\106\088\077\077\086\052\107\115\072\077\079\082\104\106\086\107\116\107\109\102\056\043\113\057\071\072\072\108\078\043\056\098\053\118\075\100\047\075\120\070\103\075\048\119\105\110\087\050\061\061";"\069\056\075\086\108\065\061\061","\077\122\051\109\100\075\088\084\108\101\078\068\108\088\119\047\114\102\076\061";"\120\081\105\072\077\086\074\053","\073\065\061\061";"\080\076\081\081\104\121\081\086";"";"\090\114\112\100\074\102\089\047","\101\078\048\075\105\107\065\069","\077\057\072\113\081\085\066\078\053\067\055\105\049\057\051\049\087\050\061\061";"\114\111\084\087\053\047\107\077\077\103\066\047\087\108\079\116";"\053\053\086\111\048\065\085\079";"\070\118\083\111\081\085\086\109","\113\052\102\117\104\076\061\061","\108\085\051\119\074\088\084\057\074\067\067\073\087\111\066\090\079\109\076\061";"\056\065\061\061","\103\115\114\115\120\077\050\061";"\079\098\068\089\114\103\105\061";"\071\080\067\047\079\076\061\061";"\071\108\056\043\053\107\076\061";"\079\109\066\054\114\103\105\061";"\053\056\061\061";"\101\089\070\073\077\076\061\061","\114\101\105\061","\072\090\106\106\056\072\114\047\052\050\061\061","\049\085\097\056\108\080\065\088\108\110\049\085\071\108\077\121\100\087\099\061";"\099\066\109\113\051\073\099\061","\087\048\089\107\050\101\099\110\114\079\122\057\043\101\057\067\074\066\101\054\110\076\114\065\081\084\054\079\100\056\061\061","\097\118\077\085\105\055\071\086","\079\079\111\107\086\050\061\061","\055\088\099\099","\079\111\097\050\121\065\061\061","\056\080\110\087\088\069\052\110","\098\104\081\043\120\065\061\061";"\079\103\074\088\071\050\061\061";"\114\057\077\104","\069\111\049\047\053\122\072\054\079\109\122\088\079\109\074\047";"\047\067\087\066\113\099\053\084\103\118\109\077\074\117\076\061";"\100\067\074\070\108\085\077\104\071\102\072\085\079\076\061\061";"\109\088\072\115\079\087\106\061","\076\053\089\071\050\090\047\061","\077\056\061\061","\053\103\049\054\069\087\097\080","\071\102\078\078\053\050\061\061";"\076\081\103\120\050\079\050\077","\055\057\122\090\114\057\110\061";"\050\070\078\077\110\070\099\107\119\049\087\082\053\100\080\102\114\082\067\048\067\101\112\106\103\089\078\113\121\050\061\061";"\055\057\072\104\055\087\088\090\079\109\105\061","\076\108\055\049\099\087\071\056\087\087\117\047\114\118\085\102";"\078\076\061\061";"\113\050\061\061","\114\087\122\047\069\065\061\061","\074\085\067\102\100\067\085\056\087\110\055\116\049\047\072\057\069\050\061\061","\050\067\099\101\103\116\078\122\071\056\061\061","\074\098\049\066\076\047\079\097\053\085\067\099\108\102\072\113\049\103\071\061";"\071\110\099\106\099\087\088\073\071\108\084\078\108\080\051\047";"\085\079\052\070\104\065\061\061";"\113\109\087\117\068\085\120\081\088\113\056\061","\053\098\077\107\114\103\079\067","\098\119\074\115\113\050\106\061","\088\051\078\122\079\114\069\083\108\111\054\084\109\075\057\065","\099\103\066\119\076\085\079\110\087\075\051\057\074\075\119\061","\112\050\080\086\113\097\047\061";"\081\084\066\053\085\100\113\072"}for D,k in ipairs({{307706+-307705,-566321+566508};{-1014030-(-1014031);-584229-(-584381)},{388033-387880,-306019-(-306206)}})do while k[385503+-385502]<k[-65503-(-65505)]do d[k[-375914-(-375915)]],d[k[-746758+746760]],k[-128649+128650],k[-377554-(-377556)]=d[k[214631-214629]],d[k[-121687-(-121688)]],k[-957290-(-957291)]+(395107-395106),k[760906-760904]-(-467758-(-467759))end end local function D(D)return d[D+(-623481+630750)]end do local D=math.floor local k=type local N=string.char local E={G=823539+-823515;["\048"]=42417-42355;p=-413149-(-413192);H=424485-424424,["\050"]=868011-867979,E=-342465+342491,f=-679132-(-679186);l=245206-245187;R=-83867-(-83930),V=-301015-(-301074),r=259072-259045,T=698989-698988,a=180546+-180489,d=-1047634+1047652;K=-353464-(-353468),y=-195233-(-195284),b=-5861+5899;W=-970876+970898,O=821696+-821671,F=-1020932+1020947,["\055"]=-266674-(-266703);["\056"]=-340003+340051;L=820591+-820575;["\057"]=723118+-723112,u=194529+-194469;M=-106996-(-107017);t=-315288+315290,["\051"]=-1039484+1039525,m=-607452-(-607475);S=633391-633360,g=731397-731342;X=600153-600100,c=-310570+310582;s=-501832-(-501876);P=893837-893798;["\043"]=511534-511524,["\053"]=782451+-782423;B=-888814-(-888823);o=732609+-732602;n=-1023128-(-1023148);C=-600130+600167;["\047"]=687782+-687730,U=-28367-(-28403),i=551874-551866;q=-787118-(-787132);["\049"]=961217-961200,J=461670+-461657,Q=-391163+391193;v=595908-595873,I=-802599-(-802657),e=-755337-(-755340),h=-588492+588538,["\052"]=-756828-(-756870),D=822077-822028;x=639015-639004,Y=485560+-485513,A=-886326-(-886326);j=-285139-(-285195),["\054"]=-573200+573250;w=1017821+-1017781,k=-149074-(-149119),Z=-92384+92418,N=-248888-(-248921);z=-760009-(-760014)}local J=string.len local Q=d local t=string.sub local R=table.insert local B=table.concat for d=-628314-(-628315),#Q,677433+-677432 do local S=Q[d]if k(S)=="\115\116\114\105\110\103"then local k=J(S)local c={}local v=-52925-(-52926)local A=-998927+998927 local u=422238+-422238 while v<=k do local d=t(S,v,v)local J=E[d]if J then A=A+J*(1029015+-1028951)^((550228+-550225)-u)u=u+(496071+-496070)if u==518601-518597 then u=17664+-17664 local d=D(A/(-661653-(-727189)))local k=D((A%(897798-832262))/(338815-338559))local E=A%(689664-689408)R(c,N(d,k,E))A=-760632-(-760632)end elseif d=="\061"then R(c,N(D(A/(69963-4427))))if v>=k or t(S,v+(630832-630831),v+(-365036-(-365037)))~="\061"then R(c,N(D((A%(-57973-(-123509)))/(-553627+553883))))end break end v=v+(-612741+612742)end Q[d]=B(c)end end end return(function(d,N,E,J,Q,t,R,f,e,v,S,I,M,g,c,Z,u,k,B,A,K,m)K,g,m,e,S,I,v,A,M,c,B,f,k,Z,u=function(d,D)local N=A(D)local E=function(E,J,Q)return k(d,{E;J,Q},D,N)end return E end,function(d,D)local N=A(D)local E=function(E,J,Q,t)return k(d,{E;J;Q,t},D,N)end return E end,function(d,D)local N=A(D)local E=function(E)return k(d,{E},D,N)end return E end,function(d,D)local N=A(D)local E=function()return k(d,{},D,N)end return E end,{},function(d,D)local N=A(D)local E=function(E,J)return k(d,{E,J},D,N)end return E end,-784516-(-784516),function(d)for D=-637173-(-637174),#d,130010-130009 do S[d[D]]=S[d[D]]+(1002868+-1002867)end if E then local k=E(true)local N=Q(k)N[D(-294187+287103)],N[D(831596+-838690)],N[D(-474664+467523)]=d,u,function()return 2985684-(-282409)end return k else return J({},{[D(862826+-869920)]=u,[D(-1002849+995765)]=d,[D(170354+-177495)]=function()return 3908824-640731 end})end end,function(d,D)local N=A(D)local E=function(...)return k(d,{...},D,N)end return E end,function()v=(-347533-(-347534))+v S[v]=455406-455405 return v end,{},function(d)S[d]=S[d]-(746666-746665)if 968055-968055==S[d]then S[d],B[d]=nil,nil end end,function(k,E,J,Q)local G,Ef,x,H,r,A,z,v,Df,h,S,i,s,V,F,L,df,C,Nf,T,Qf,Jf,U,M,j,tf,n,b,W,O,u,y,l,kf,P,q,p,R,Y,o,a,w,X while k do if k<896910+7776633 then if k<4002932-438 then if k<-843633+3032308 then if k<1694873-696334 then if k<-730737+1249591 then if k<-319194-(-760252)then if k<1160681-802553 then if k<570477-407834 then v=D(924439+-931673)R=120076+2093749 A=146103+15323056 S=v^A k=R-S S=k R=D(427244-434363)k=R/S R={k}k=d[D(134583+-141834)]else v=k u=D(-772810+765580)A=d[u]k=A and 6962783-690845 or 316802+12098195 S=A end else F=D(-653360-(-646153))k=913277+9625913 C=Z(5194942-(-702500),{V;u;v,p;s})b=d[F]F=b(C)end else if k<473860-1356 then B[v]=R k=-785922+14676763 else G=nil Y=nil u=nil k=629561+365876 end end else if k<1454926-627822 then if k<-28914-(-754300)then o=D(-383660+376521)T=B[J[794597+-794595]]p=B[J[-150080-(-150083)]]b=-415918+1566188018567 H=p(o,b)i=T[H]O=i k=6649082-(-47020)else v=B[J[-534950-(-534953)]]A=917598+-917597 S=v~=A k=S and 905923+11471242 or 2147560-699694 end else if k<-931238+1869295 then P=B[v]k=P and 853918+4043194 or-20099+488463 R=P else R={v}k=d[D(-462303-(-455212))]end end end else if k<1753057-209136 then if k<955686-(-488481)then if k<210973-(-994454)then if k<699518+480201 then A=D(2075-9210)v=d[A]A=D(-13841+6719)S=v[A]k=d[D(71586-78711)]A=B[J[441381-441380]]v={S(A)}R={N(v)}else S=A k=u k=A and 10135440-(-21728)or 636949+7360958 end else Jf=D(141122+-148351)C=D(-961378-(-954243))F=d[C]a=B[u]l=D(850167+-857421)r=27468570068190-70375 n=B[v]kf=17721925799779-(-643289)q=D(-237068+229951)y=n(q,r)C=a[y]Df=23268166256569-941414 b=F[C]Qf=10915749432528-784629 C=B[s]y=B[u]q=B[v]df=28327315763394-(-1032900)r=q(l,df)df=D(496825-504080)k=-247755+16302822 n=y[r]q=B[u]r=B[v]l=r(df,Df)y=q[l]r=B[u]Df=D(-157008+149767)l=B[v]df=l(Df,kf)l=D(-630410-(-623215))q=r[df]r=d[l]kf=B[u]Nf=B[v]Ef=Nf(Jf,Qf)Df=kf[Ef]Ef=-213860+16203508572381 df=H[Df]l=r(df)df=B[u]Df=B[v]Nf=D(-359315-(-352131))kf=Df(Nf,Ef)r=df[kf]df=true a={[n]=y;[q]=l,[r]=df}F=b(C,a)end else if k<475248-(-980499)then A=916245-916090 v=B[J[-930834-(-930837)]]k=595033+217505 S=v*A v=-424863+425120 R=S%v B[J[469602-469599]]=R else k=true k=2865947-(-186751)end end else if k<894979+723482 then if k<2267846-673910 then k=d[D(-934706+927493)]R={}else n=D(466811-473967)F=B[u]C=B[v]y=17145510430296-(-579800)l=501921+10852372572956 r=D(-597816-(-590576))Df=21881679421177-(-100564)a=C(n,y)C=D(-96202-(-88995))b=F[a]F=c()Jf=22772273765827-652375 B[F]=b kf=3333000901546-(-512614)a=g(12781904-236121,{F})b=d[C]C=b(a)a=D(35722+-42857)df=D(585714+-592821)C=d[a]Nf=-632855+26469599434812 n=B[u]y=B[v]k=13145736-1043670 q=y(r,l)Ef=D(142339-149475)a=n[q]b=C[a]a=B[s]q=B[u]r=B[v]l=r(df,Df)y=q[l]Df=D(-261528-(-254303))r=B[u]l=B[v]df=l(Df,kf)q=r[df]kf=D(438471-445707)l=B[u]df=B[v]Df=df(kf,Nf)r=l[Df]l=B[F]F=f(F)Df=B[u]kf=B[v]Nf=kf(Ef,Jf)df=Df[Nf]Df=true n={[y]=q;[r]=l,[df]=Df}C=b(a,n)end else if k<-821976+2892881 then R=P k=L k=781419-313055 else W=s k=F k=10067974-(-839639)end end end end else if k<110343+3354541 then if k<-529527+3476261 then if k<1408411-(-940731)then if k<982100+1336709 then if k<551016+1720873 then M=-279816+279818 u=830-829 v=B[J[715527+-715526]]A=v(u,M)v=-137795+137796 S=A==v k=S and 3599859-(-571865)or 5940014-(-84061)R=S else k=6934385-160395 i=D(-492435+485214)X=d[i]R=X end else k=-462652+9531617 j=-932597-(-932597)b=#H o=b==j end else if k<936700+1945220 then v=B[J[512581+-512579]]A=-77260+77513 S=v*A v=818267+21371861691012 R=S+v S=35184371846341-(-242491)v=225746+-225745 k=R%S B[J[997484-997482]]=k S=B[J[160949+-160946]]k=710359+737507 R=S~=v else k=163149+832288 end end else if k<607682+2453340 then if k<2122401-(-911600)then k={}B[J[-23697-(-23699)]]=k G=355052+-354797 M=-388263+35184372477095 R=B[J[603688-603685]]u=R R=v%M B[J[768492-768488]]=R Y=v%G O=D(-273061-(-265923))G=684362+-684360 M=Y+G B[J[-965731+965736]]=M G=d[O]O=D(-77234+70089)Y=G[O]G=Y(S)X=G Y=D(481544-488718)i=-1041897+1041898 k=-644906+6201728 O=683938+-683937 A[v]=Y T=i Y=83970-83857 i=-774776+774776 p=T<i i=O-T else k=m(3636823-(-682756),{u})z={k()}R={N(z)}k=d[D(-929244-(-922048))]end else if k<-194280+3294737 then F=k n=D(-814416+807148)l=D(-843804-(-836643))df=-42085+801323689434 a=d[n]y=B[u]q=B[v]r=q(l,df)n=y[r]C=a[n]k=C and 6071270-190019 or-400090+16569867 b=C else b=529346+6415916267497 o=D(-78969+71793)T=B[J[-100045-(-100047)]]k=183229+9123661 p=B[J[-85673+85676]]H=p(o,b)i=T[H]O=i end end end else if k<-415376+4218704 then if k<276499+3221578 then if k<-823396+4301553 then k=14610750-(-815852)a=-800781+800782 L=C[a]P=L else o=-873745+12996777143477 X=D(605499+-612760)k=12454788-684622 H=D(478756+-485883)O=d[X]i=B[J[-868219-(-868220)]]T=B[J[344558+-344556]]p=T(H,o)X=i[p]G=O[X]O=G()M=O end else if k<384138+3395795 then z=T==p U=z k=431114+9314164 else kf=34537434235060-197090 F=B[u]y=1003493+18109374714123 C=B[v]r=D(-627396+620219)n=D(-355955+348716)a=C(n,y)b=F[a]C=D(-776251+769044)F=c()df=D(-810356+803259)B[F]=b a=m(835264-524456,{u,v;F})b=d[C]Jf=-634736+22893385570580 C=b(a)a=D(705882+-713017)C=d[a]n=B[u]y=B[v]l=27917346881881-(-684399)q=y(r,l)Nf=29467379273112-(-1042433)a=n[q]b=C[a]a=B[s]q=B[u]Df=-11761+28309279695215 r=B[v]l=r(df,Df)y=q[l]Df=D(328397-335555)Ef=D(-433688+426540)r=B[u]l=B[v]df=l(Df,kf)q=r[df]kf=D(208980+-216163)l=B[u]df=B[v]Df=df(kf,Nf)r=l[Df]l=B[F]Df=B[u]kf=B[v]F=f(F)Nf=kf(Ef,Jf)df=Df[Nf]Df=false n={[y]=q;[r]=l,[df]=Df}C=b(a,n)k=-832268+9819097 end end else if k<4322586-450595 then if k<160095+3665985 then H=D(1022749+-1029884)p=d[H]H=D(144839+-152060)T=p[H]k=16757965-986526 X=T else k=16221830-519290 end else if k<4027848-112696 then X=176719-176464 v=A k=B[J[173231-173230]]O=129841+-129841 G=k(O,X)S[v]=G k=8134662-454799 v=nil else S=D(25532+-32692)k=d[S]v=B[J[197112+-197104]]A=445483+-445483 S=k(v,A)k=15470242-772025 end end end end end else if k<5325035-(-949767)then if k<5180923-(-106409)then if k<5067890-483580 then if k<4768021-418994 then if k<857057+3392198 then if k<492525+3562209 then R={}k=d[D(884154-891282)]else k=R and-511230+9862904 or 4407335-(-227858)end else k=12461609-851074 end else if k<5262548-801219 then k=M and 937032+7674824 or 13957176-(-105149)else b=y k=q k=-870101+11267404 end end else if k<4729140-(-172505)then if k<-27089+4838166 then k=B[J[-512400-(-512407)]]k=k and-908947+4896830 or 14822563-124346 else y=-663186-(-663187)n=C[y]y=false a=n==y P=a L=k k=a and 15949905-141413 or 396720+1241410 end else if k<-303376+5458623 then b=c()H=nil o={}s=D(1042799+-1049883)B[b]=o j=Z(11034580-(-452654),{b;X;i,M})o=c()W={}V=c()M=f(M)Y=nil B[o]=j Y=true G=nil j={}T=nil O=nil T=true A=nil w=D(-1134+-5970)B[V]=j j=d[w]O=true F=B[V]a=nil C=D(907287-914552)M=true x={[s]=F,[C]=a}w=j(W,x)j=I(11943252-637300,{V,b,p,X,i,o})p=f(p)X=f(X)B[u]=w x=890593310730-(-280980)i=f(i)W=D(-266975+259832)o=f(o)A=true V=f(V)X=true H=D(590592+-597860)G=true B[v]=j s=-637904+32652694959925 b=f(b)i=true p=d[H]b=B[u]j=B[v]V=j(W,x)H=D(-716905-(-709708))o=b[V]H=p[H]H=H(p,o)p=c()B[p]=H o=D(726989+-734257)H=d[o]j=B[u]x=D(-1002587+995473)o=D(761194-768391)V=B[v]W=V(x,s)b=j[W]F=D(-214273+207074)o=H[o]o=o(H,b)x=D(-570955-(-563720))j=B[u]V=B[v]s=58722+22864943580213 W=V(x,s)b=j[W]H=o[b]V=D(-114678-(-107469))j=d[V]W=B[u]x=B[v]C=12795268690823-973889 s=x(F,C)V=W[s]F=D(-62998-(-55741))b=j[V]W=B[u]C=10572171665305-(-275362)x=B[v]s=x(F,C)V=W[s]x=D(316525-323620)j=b(V)V=k W=d[x]k=W and 8761625-56155 or 525027+10580272 b=W else F=k a=D(-1025055-(-1017794))C=d[a]k=C and-763649+12262944 or 987445+1178996 s=C end end end else if k<6784153-902212 then if k<5324051-(-379363)then if k<5348851-(-105159)then k=7199870-(-6214)else H=not p i=i+T O=i<=X O=H and O H=i>=X H=p and H O=H or O H=12204411-(-528198)k=O and H O=1289953-812846 k=k or O end else if k<5459391-(-411039)then Y=R O=D(783113+-790248)G=D(-827930-(-820801))R=d[G]G=D(-101224-(-94000))k=R[G]G=c()B[G]=k R=d[O]p=D(123112-130247)O=D(298541-305793)k=R[O]T=d[p]i=k X=T O=k k=T and-352900+4156382 or 727598+15043841 else Df=886957+11373494701059 l=383169343297-618127 k=F r=D(825708-832817)a=D(-414198-(-407063))C=d[a]kf=-123564+33403887034222 n=B[u]Ef=791443+10776882757639 y=B[v]k=754146+12739809 q=y(r,l)a=n[q]F=C[a]a=B[s]q=B[u]r=B[v]df=D(344264-351527)l=r(df,Df)Df=D(480082-487234)y=q[l]r=B[u]l=B[v]Nf=-802611+33171110476681 df=l(Df,kf)q=r[df]l=B[u]kf=D(526331+-533589)df=B[v]Df=df(kf,Nf)Nf=D(156769+-163885)r=l[Df]df=B[u]Df=B[v]kf=Df(Nf,Ef)l=df[kf]df=false n={[y]=q,[r]=b,[l]=df}b=nil C=F(a,n)end end else if k<5143768-(-872013)then if k<5932005-6169 then k=B[J[757453+-757452]]A=B[J[-956824+956826]]G=345893+3093139619451 u=B[J[174521+-174518]]i=3894463622495-9802 Y=D(-447576+440371)M=u(Y,G)G=D(704470-711604)v=A[M]O=22971772773779-900042 u=B[J[-909096+909098]]M=B[J[-803322-(-803325)]]Y=M(G,O)A=u[Y]M=B[J[-1046416-(-1046418)]]X=25521+30577360196589 O=D(223861-231105)Y=B[J[-415360-(-415363)]]G=Y(O,X)u=M[G]Y=B[J[153788+-153786]]X=D(864998+-872201)G=B[J[-214914+214917]]T=218857+157084690784 O=G(X,i)M=Y[O]S={[v]=A,[u]=M}O=1937569360233-(-743965)R=k(S)k=B[J[-939350-(-939354)]]u=B[J[224649+-224647]]S=R G=D(-156890-(-149789))M=B[J[-249867+249870]]Y=M(G,O)R=D(-984140-(-976884))A=u[Y]R=k[R]v=S[A]R=R(k,v)A=D(303351+-310486)v=R O=30960528305114-(-658551)R=d[A]u=B[J[-236096+236098]]M=B[J[47581+-47578]]G=D(-303694-(-296428))Y=M(G,O)i=214108+15267958986601 X=D(947278+-954367)A=u[Y]k=R[A]A=B[J[-803181+803186]]p=28947265755517-(-777002)Y=B[J[172242-172240]]G=B[J[587646+-587643]]O=G(X,i)U=26044842019738-(-730054)M=Y[O]i=D(690935-698139)G=B[J[740818-740816]]O=B[J[565049-565046]]X=O(i,T)Y=G[X]O=B[J[-164459-(-164461)]]X=B[J[-563883-(-563886)]]T=D(-53738+46620)i=X(T,p)X=k G=O[i]p=B[J[724104-724102]]b=D(-302361-(-295241))H=B[J[54262+-54259]]o=H(b,U)T=p[o]i=v[T]O=i k=i and 12858982-(-351619)or 12416160-(-986696)else z=B[v]k=z and 906697+2682656 or 10482850-737572 U=z end else if k<6471470-442764 then v=B[J[-48102-(-48104)]]A=B[J[-834481-(-834484)]]S=v==A R=S k=4962279-790555 else k=367387+12047610 u=D(319264-326494)A=d[u]u=A()S=u end end end end else if k<-189289+7867376 then if k<871915+5962341 then if k<-570204+7340920 then if k<7725910-1005406 then if k<906775+5508443 then A=B[J[790125+-790119]]k=13638110-137444 v=A==S R=v else H=D(804152+-811385)i=B[J[-125267-(-125269)]]T=B[J[-551737+551740]]o=2295453061276-(-652176)p=T(H,o)k=X X=i[p]i=false u={[M]=Y,[G]=O;[X]=i}R=k(A,u)A=D(765762+-772897)G=D(-1027290+1020072)R=d[A]u=B[J[-52911+52913]]O=-962436+30721772693349 M=B[J[1026572-1026569]]i=5460651853501-638159 Y=M(G,O)A=u[Y]k=R[A]V=-289563+20260823306229 X=D(-712503-(-705314))A=B[J[-383932-(-383937)]]Y=B[J[-302409-(-302411)]]G=B[J[-899253-(-899256)]]O=G(X,i)T=495688+4233023321963 M=Y[O]i=D(-676583-(-669480))G=B[J[-482116+482118]]j=D(-410156-(-402929))p=734171+26497927855192 z=-708429+20728611124481 O=B[J[862690-862687]]X=O(i,T)T=D(844648+-851859)Y=G[X]O=B[J[-399885-(-399887)]]U=D(-957692+950482)X=B[J[532032-532029]]i=X(T,p)G=O[i]i=D(746095+-753290)X=d[i]H=B[J[270867-270865]]o=B[J[-673476-(-673479)]]b=o(U,z)p=H[b]T=v[p]i=X(T)b=D(-643473+636241)p=B[J[-924755-(-924757)]]H=B[J[-737674+737677]]U=-837769+4390109581445 o=H(b,U)H=D(780041-787236)T=p[o]p=d[H]U=B[J[-685971-(-685973)]]z=B[J[262680-262677]]h=z(j,V)b=U[h]o=v[b]H=p(o)o=11589080696630-(-363998)X=T..H O=i..X i=B[J[692479-692477]]H=D(482330+-489536)b=D(-343898+336808)T=B[J[-455310+455313]]p=T(H,o)X=i[p]i=true u={[M]=Y,[G]=O;[X]=i}G=D(-287023+279780)R=k(A,u)A=D(-363545-(-356410))R=d[A]u=B[J[-1003921+1003923]]M=B[J[-854905-(-854908)]]U=15101815381191-(-933553)O=596715+22656568774219 Y=M(G,O)i=3722646548858-666293 X=D(766893+-774017)p=84413+31531840417694 T=-64932+15446328039868 A=u[Y]k=R[A]A=B[J[596245-596240]]Y=B[J[195957+-195955]]G=B[J[-921717+921720]]O=G(X,i)M=Y[O]i=D(689155-696238)G=B[J[-260894-(-260896)]]O=B[J[-526251+526254]]X=O(i,T)Y=G[X]O=B[J[735590+-735588]]T=D(260427+-267532)X=B[J[-477835-(-477838)]]i=X(T,p)X=k G=O[i]p=B[J[-839510-(-839512)]]H=B[J[-389876+389879]]o=H(b,U)T=p[o]i=v[T]O=i k=i and-457985+8960842 or-160690+8148622 end else k=13159804-(-301273)end else if k<7147054-368051 then H=D(-65942-(-58735))X=c()B[X]=R k=B[G]i=-621843-(-621846)T=801434-801369 R=k(i,T)i=c()B[i]=R k=-1011311+1011311 T=k k=-626293-(-626293)p=k o=I(-203831+213854,{})R=d[H]H={R(o)}k={N(H)}R=48998+-48996 H=k k=H[R]R=D(-201416-(-194283))o=k k=d[R]h=D(-312273-(-305078))b=B[A]z=d[h]h=z(o)z=D(-969295-(-962182))U=b(h,z)b={U()}R=k(N(b))b=c()B[b]=R R=1026986-1026985 U=B[i]z=U U=-1028397+1028398 h=U U=-538524+538524 j=h<U U=R-h k=-567529+10277959 else R=D(-662494+655272)k=d[R]R=k()B[J[-713751-(-713752)]]=R k=4817122-786803 end end else if k<1028276+6559609 then if k<6516574-(-665428)then k=a and 3558400-(-268224)or 249076+15453464 else k=true k=k and-311833+15478738 or-315980+1887147 end else if k<1027092+6640698 then R=D(-949062+941902)S=D(244689+-251931)k=d[R]R=k(S)k=d[D(-284689+277518)]R={}else Y=D(-824971-(-817755))A=B[J[906346+-906344]]u=B[J[740316-740313]]G=17798999595964-(-33956)M=u(Y,G)v=A[M]R=v k=-489800+12160867 end end end else if k<7211242-(-725080)then if k<90504+7643065 then if k<759163+6949774 then G=not Y A=A+M v=A<=u v=G and v G=A>=u G=Y and G v=G or v G=4221700-319988 k=v and G v=13814988-116674 k=k or v else B[J[812993+-812990]]=R k=d[D(130789+-138035)]R={}end else if k<6894711-(-915118)then H=D(-530543-(-523328))o=899142+24883299644669 Y=k X=D(310983+-318244)O=d[X]i=B[J[-680270-(-680271)]]T=B[J[-485435-(-485437)]]p=T(H,o)X=i[p]G=O[X]k=G and 2520466-(-960522)or 12531187-761021 M=G else n=D(562981-570167)F=B[u]C=B[v]y=99631+7792875194621 Jf=-68210+7805087176868 a=C(n,y)b=F[a]C=D(678941+-686148)F=c()B[F]=b b=d[C]a=K(747030+8623949,{V,u,v,F})l=20834172059336-(-42781)r=D(283746+-290933)C=b(a)df=D(630597-637748)a=D(261043-268178)Ef=D(770964+-778136)C=d[a]n=B[u]Df=730553+21107778961580 Nf=31686544268087-(-908908)y=B[v]q=y(r,l)a=n[q]b=C[a]a=B[s]q=B[u]r=B[v]l=r(df,Df)kf=34944510420396-(-219620)y=q[l]r=B[u]Df=D(954874-962068)l=B[v]df=l(Df,kf)q=r[df]kf=D(-74560+67396)l=B[u]df=B[v]Df=df(kf,Nf)r=l[Df]l=B[F]Df=B[u]kf=B[v]k=-1007460+16465718 F=f(F)Nf=kf(Ef,Jf)df=Df[Nf]Df=false n={[y]=q,[r]=l;[df]=Df}C=b(a,n)end end else if k<8195718-(-270299)then if k<265883+7729463 then T=B[J[44833-44831]]o=D(62440-69605)p=B[J[-672531-(-672534)]]k=8171879-(-330978)b=536687+12428481947180 H=p(o,b)i=T[H]O=i else u=B[J[173544-173543]]G=D(582496-589694)M=B[J[618565+-618563]]O=25793182868886-276140 Y=M(G,O)A=u[Y]S=A k=933226+9223942 end else if k<-926803+9529157 then i=B[J[-545036+545038]]H=D(457021-464212)k=X o=4575801147473-(-313345)T=B[J[-294637+294640]]S=nil p=T(H,o)X=i[p]i=true u={[M]=Y;[G]=O,[X]=i}R=k(A,u)v=nil R={}k=d[D(-922419+915293)]else r=-957171+8744252386010 df=1550033211187-461922 C=D(511379+-518514)F=d[C]q=D(591189-598442)a=B[u]Df=-826484+29768478184090 n=B[v]Ef=22492470081381-(-455044)k=-680531+14742856 y=n(q,r)C=a[y]b=F[C]C=B[s]l=D(95145+-102338)y=B[u]q=B[v]r=q(l,df)n=y[r]df=D(554937-562201)q=B[u]r=B[v]l=r(df,Df)kf=8439813946285-584787 Df=D(998810+-1005925)y=q[l]r=B[u]l=B[v]df=l(Df,kf)q=r[df]df=B[u]Df=B[v]Nf=D(958090+-965316)kf=Df(Nf,Ef)Nf=D(262890-270002)l=df[kf]r=H[l]df=B[u]Df=B[v]Ef=1007472+29111464269188 kf=Df(Nf,Ef)l=df[kf]df=true a={[n]=y,[q]=r,[l]=df}F=b(C,a)end end end end end end else if k<-917651+13045060 then if k<201727+10338566 then if k<-459745+10117779 then if k<9630159-347062 then if k<8492905-(-556150)then if k<9378642-416159 then if k<8006605-(-799389)then k=V V=c()B[V]=b W=B[V]b=not W k=b and 541872+12188518 or 418980+15702990 else i=B[J[236551+-236549]]T=B[J[821094+-821091]]H=D(-575324-(-568236))o=899547+19875538545228 k=X p=T(H,o)X=i[p]i=true u={[M]=Y;[G]=O,[X]=i}X=D(-180670-(-173577))R=k(A,u)O=16021207634014-(-724166)A=D(-33027+25892)R=d[A]G=D(-411519+404351)u=B[J[-133601+133603]]M=B[J[-724871-(-724874)]]Y=M(G,O)A=u[Y]k=R[A]A=B[J[601767+-601762]]Y=B[J[331905+-331903]]G=B[J[724232+-724229]]i=22437658243644-854380 O=G(X,i)T=445983+1511645017248 M=Y[O]G=B[J[-933669+933671]]i=D(3430+-10526)O=B[J[-315755-(-315758)]]X=O(i,T)Y=G[X]b=D(494623-501723)O=B[J[-689818-(-689820)]]X=B[J[469236-469233]]T=D(-129792+122693)p=143802+16098281417614 i=X(T,p)X=k G=O[i]p=B[J[60024+-60022]]U=38558+32356080804924 H=B[J[-612492-(-612495)]]o=H(b,U)T=p[o]i=v[T]k=i and 1041507+8265383 or 3490482-284108 O=i end else k=G and 7279590-(-588336)or 15361246-(-97012)end else if k<10033165-891889 then b=-688780+688781 j=#H o=A(b,j)k=14438260-613503 b=Y(H,o)j=B[p]W=655920+-655919 w=b-W o=nil V=G(w)j[b]=V b=nil else L=B[v]k=L and-473544+3943516 or-566251+15992853 P=L end end else if k<9798337-435926 then if k<9567026-249736 then o=33897280561959-(-629377)k=X i=B[J[1017380+-1017378]]T=B[J[867187+-867184]]H=D(-745513-(-738263))b=D(-462102-(-454917))p=T(H,o)X=i[p]i=true u={[M]=Y,[G]=O;[X]=i}G=D(66674-73875)R=k(A,u)O=-99577+18005880956345 i=-935622+27523697424598 A=D(321499+-328634)R=d[A]u=B[J[-522695+522697]]M=B[J[-795277+795280]]T=33657420102632-360112 U=907310+144410601493 Y=M(G,O)X=D(35027-42174)A=u[Y]p=14508053505001-(-423546)k=R[A]A=B[J[-339639+339644]]Y=B[J[-933049+933051]]G=B[J[-30168+30171]]O=G(X,i)i=D(676554-683735)M=Y[O]G=B[J[362554+-362552]]O=B[J[-936194-(-936197)]]X=O(i,T)Y=G[X]O=B[J[865184+-865182]]T=D(770065-777219)X=B[J[-476010+476013]]i=X(T,p)G=O[i]X=k p=B[J[457448+-457446]]H=B[J[533552+-533549]]o=H(b,U)T=p[o]i=v[T]k=i and 7359823-663721 or 1362452-727521 O=i else u=D(928155+-935350)R=D(-288251+281118)k=d[R]O=D(-530367+523160)X=e(288824+10810869,{})S=B[J[-413744+413748]]A=d[u]G=d[O]O={G(X)}Y={N(O)}G=-627829+627831 M=Y[G]u=A(M)A=D(-152059-(-144946))v=S(u,A)S={v()}R=k(N(S))S=R v=B[J[-684989-(-684994)]]k=v and 658192+5617114 or 13053550-(-447116)R=v end else if k<-556115+10132488 then k=B[J[499534+-499533]]i=-449501+9918423903719 A=B[J[-898340-(-898342)]]u=B[J[-257759-(-257762)]]G=-376110+16775479122865 Y=D(725991-733181)M=u(Y,G)v=A[M]O=257274+16820477850014 G=D(704565+-711747)u=B[J[524497-524495]]M=B[J[-202485+202488]]Y=M(G,O)A=u[Y]M=B[J[-861025+861027]]Y=B[J[508389+-508386]]O=D(-556923+549813)X=924849+77072262002 G=Y(O,X)u=M[G]X=D(-724104+716954)Y=B[J[-953240+953242]]G=B[J[-429763-(-429766)]]O=G(X,i)M=Y[O]S={[v]=A;[u]=M}R=k(S)u=B[J[62205+-62203]]S=R M=B[J[119840-119837]]O=980341+4904270353270 G=D(672750-679995)Y=M(G,O)A=u[Y]v=S[A]R=v k=v and 11409338-(-261729)or-1037242+8705113 else k=true B[J[-762470-(-762471)]]=k R={}k=d[D(766219+-773397)]end end end else if k<9037151-(-992931)then if k<-926869+10711471 then if k<10027262-313831 then if k<9054511-(-652387)then b=b+V W=not w o=b<=j o=W and o W=b>=j W=w and W o=W or o W=14727733-411422 k=o and W o=125413+2201076 k=k or o else V=not j U=U+h R=U<=z R=V and R V=U>=z V=j and V R=V or R V=10143938-(-220296)k=R and V R=-742469+6744898 k=k or R end else B[v]=U k=B[v]k=k and 808122+12925040 or 918988+591365 end else if k<10384040-507250 then k=d[D(-290105+282939)]R={}else v=c()S=E k=true B[v]=k A=D(-275571+268433)u=c()R=d[A]A=D(12705-19954)k=R[A]A=c()B[A]=k k=Z(-258551+7926308,{})B[u]=k G=D(517276-524483)M=c()k=false O=I(986179+8636619,{M})B[M]=k Y=d[G]G=Y(O)R=G k=G and 10151415-(-438150)or-14855+5755461 end end else if k<10778443-407601 then if k<-1009576+11254785 then k=v k=26551+7685870 R=S else x=134287+-134032 q=-1031589-(-1031589)V=c()B[V]=U w=D(481027+-488156)F=691750-691749 R=d[w]w=D(715251-722475)k=R[w]w=-84032-(-84033)W=374771+-374671 R=k(w,W)w=c()B[w]=R W=-219229-(-219229)k=B[G]R=k(W,x)C=211449+-211447 W=c()x=-607498+607499 B[W]=R k=B[G]s=B[w]R=k(x,s)x=c()B[x]=R R=B[G]r=161311-151311 s=R(F,C)R=-15276+15277 k=s==R a=D(-667679-(-660484))s=c()B[s]=k C=D(-241700-(-234570))L=d[a]R=D(-35337-(-28224))n=B[G]y={n(q,r)}k=D(-620364+613218)a=L(N(y))k=o[k]L=D(393222+-400352)P=a..L F=C..P k=k(o,R,F)C=D(298999-306206)F=c()P=g(-413560+2629797,{G;V,i;A,v;b,s;F,w;x;W;X})B[F]=k R=d[C]C={R(P)}k={N(C)}C=k k=B[s]k=k and-447784+1352541 or 10066887-860419 end else if k<243841+10216443 then k=n k=b and 6268236-(-460708)or-694819+7700812 else C=D(-487676+480541)Nf=33815667210915-(-197343)r=20763995826517-869265 df=32304022208187-263161 l=D(361959+-369065)F=d[C]a=B[u]n=B[v]q=D(-107835-(-100724))y=n(q,r)C=a[y]Jf=D(565778+-572998)kf=8017280454918-197233 b=F[C]Df=-566730+20597010402113 C=B[s]y=B[u]q=B[v]r=q(l,df)n=y[r]q=B[u]df=D(-887908-(-880696))r=B[v]l=r(df,Df)y=q[l]r=B[u]Df=D(-885525+878317)l=B[v]df=l(Df,kf)q=r[df]l=B[u]kf=D(209497-216584)df=B[v]Df=df(kf,Nf)r=l[Df]l=false Df=D(516700+-523821)a={[n]=y,[q]=j;[r]=l}F=b(C,a)y=D(-314133-(-307025))r=D(783869-790955)q=1510920109339-817756 Qf=713361+32570907875502 C=B[u]kf=5047211497043-(-602843)a=B[v]n=a(y,q)Ef=23194868869685-(-983035)F=C[n]l=5188989814910-818958 n=B[u]y=B[v]q=y(r,l)C=nil a=n[q]r=B[u]l=B[v]df=l(Df,kf)kf=D(-413476+406323)q=r[df]l=B[u]df=B[v]Nf=223828240551-(-137153)Df=df(kf,Nf)Nf=D(791323-798463)r=l[Df]df=B[u]Df=B[v]kf=Df(Nf,Ef)l=df[kf]df=17436112-689480 kf=B[u]Nf=B[v]Ef=Nf(Jf,Qf)Df=kf[Ef]kf=B[s]y={[q]=r;[l]=df,[Df]=kf}n={y}b={[F]=C;[a]=n}F=c()n=e(11720887-(-424103),{V,u,v;W,x;p;F})B[F]=b C=D(995559-1002766)b=d[C]y={b(n)}C=y[-965725+965726]a=y[-951309-(-951311)]n=k k=C and 122279+10433422 or 406033+9991270 b=C end end end end else if k<11846656-380547 then if k<10318217-(-784595)then if k<9760119-(-962766)then if k<-1046621+11662837 then if k<-792941+11377261 then y=a q=k k=a and 13001304-(-316467)or-234278+4718319 else k=6471672-731066 Y=B[M]R=Y end else k=true k=k and 4869359-(-542706)or-115421+3168119 end else if k<10786291-(-282824)then k=x b=W k=7898413-(-807057)else R=4109258-(-784798)v=D(-501381-(-494299))A=-965567+3733734 S=v^A k=R-S R=D(-110966-(-103766))S=k k=R/S R={k}k=d[D(-283138+275936)]end end else if k<11673797-448870 then if k<-557334+11737532 then x=k F=D(860043-867187)s=d[F]k=s and-49408+10957021 or-912951+6128143 W=s else r=567979+19889860344194 C=D(-135319+128184)F=d[C]a=B[u]df=26896562543392-(-431564)l=D(-487184+479922)n=B[v]q=D(852162+-859385)y=n(q,r)C=a[y]b=F[C]C=B[s]Nf=D(-840613+833446)y=B[u]q=B[v]Df=2219893662010-941361 kf=7683807112004-236874 r=q(l,df)df=D(-593214+586091)n=y[r]k=5414949-1004369 q=B[u]r=B[v]l=r(df,Df)Df=D(581817+-588902)Ef=1003942+3034046018526 y=q[l]r=B[u]l=B[v]df=l(Df,kf)q=r[df]df=B[u]Df=B[v]kf=Df(Nf,Ef)Ef=15312504116099-702377 l=df[kf]r=H[l]df=B[u]Df=B[v]Nf=D(-532886-(-525717))kf=Df(Nf,Ef)l=df[kf]df=true a={[n]=y,[q]=r;[l]=df}F=b(C,a)end else if k<10833455-(-525200)then S=E[543228-543227]v=E[46244+-46242]k=B[J[874712+-874711]]A=k k=A[v]k=k and 3120413-182401 or 3081961-52747 else h=D(-486168-(-478973))k=d[h]V=D(-954165+946977)j=d[V]h=k(j)k=D(898560-905717)d[k]=h k=12988764-1034952 end end end else if k<12729246-1047271 then if k<-929168+12482000 then if k<815823+10675030 then S=B[J[-823749-(-823750)]]R=#S S=-789284+789284 k=R==S k=k and 1795389-(-627461)or 834127-(-174593)else n=D(615321-622582)l=D(-505570+498356)df=19253716268157-(-306824)a=d[n]y=B[u]k=492262+1674179 q=B[v]r=q(l,df)n=y[r]C=a[n]s=C end else if k<11360786-(-292151)then k=true k=k and 14348537-(-967670)or 10178536-386941 else S=nil B[J[-331196-(-331200)]]=R k=d[D(388258+-395496)]R={}end end else if k<-12407+11924809 then if k<11850966-12960 then k=Y A=M k=853311-(-332376)else Nf=B[u]tf=26452324653878-(-595175)Qf=D(900315-907534)Ef=B[v]k=-402144+14636108 Jf=Ef(Qf,tf)kf=Nf[Jf]Df=a[kf]kf=-96339+96543 df=Df==kf r=df end else if k<12136027-113493 then k=7204439-(-1645)else k=X and 555397+2535347 or-609508+14103463 end end end end end else if k<130391+13630765 then if k<837310+12400162 then if k<11983613-(-727969)then if k<-300127+12708750 then if k<12074893-(-258409)then if k<601649+11544001 then i=32715320587983-490317 k=B[J[-897534-(-897535)]]A=B[J[1031201+-1031199]]Y=D(-626012+618765)u=B[J[522688-522685]]G=-215597+33881248335822 M=u(Y,G)v=A[M]O=D(-235502-(-228285))A=B[J[730333+-730329]]M=B[J[-425238+425240]]Y=B[J[789230+-789227]]X=2518551964740-272304 T=782482+263062835176 G=Y(O,X)u=M[G]X=D(829641-836820)Y=B[J[985584-985582]]o=28252720123601-383853 G=B[J[220264+-220261]]O=G(X,i)M=Y[O]H=4814006045728-639839 G=B[J[-991780+991782]]O=B[J[362754+-362751]]i=D(-137053+129825)p=D(-599656-(-592389))X=O(i,T)Y=G[X]X=B[J[132237+-132235]]i=B[J[483837+-483834]]T=i(p,H)H=D(-726976-(-719884))O=X[T]i=B[J[-705701-(-705703)]]T=B[J[888007-888004]]p=T(H,o)X=i[p]o=D(-488121-(-480929))T=B[J[848906-848904]]p=B[J[-224168-(-224171)]]b=5723714808315-(-24686)H=p(o,b)i=T[H]T=B[J[-40586+40591]]H=9047028752613-(-470927)p=D(106880+-114029)G={[O]=X,[i]=T}X=B[J[-677038+677040]]i=B[J[305335-305332]]T=i(p,H)O=X[T]i=D(-53906-(-46764))X=B[J[-370021-(-370027)]]T=B[J[-429161-(-429168)]]i=X[i]i=i(X,T)S={[v]=A;[u]=M,[Y]=G;[O]=i}R={k(S)}k=d[D(-322223+315121)]R={N(R)}else A=f(A)X=f(X)p=nil i=f(i)u=f(u)b=f(b)b=-311663+311919 A=nil T=nil M=f(M)O=nil H=nil o=nil Y=nil v=f(v)u=c()j=b v=nil B[u]=v Y=D(-111026-(-103897))G=f(G)v=c()B[v]=A H={}O=D(679783-686918)M=d[Y]p=c()X=D(825472+-832610)Y=D(-759565-(-752402))A=M[Y]o=613457+-613456 M=c()G=D(646462+-653591)B[M]=A Y=d[G]G=D(-285561+278337)A=Y[G]G=d[O]O=D(165940-173062)Y=G[O]T={}O=d[X]X=D(-50046+42909)G=O[X]X=c()O=613069-613069 i=c()B[X]=O O=968953-968951 B[i]=O O={}B[p]=T T=-772680+772680 b=-891456+891457 V=b b=1019881+-1019881 w=V<b b=o-V k=9169038-(-534356)end else v=B[J[249784-249781]]A=1041403-1041371 T=-125540+125553 S=v%A u=B[J[-261438+261442]]G=B[J[768880-768878]]X=-596465+596467 o=B[J[-695731+695734]]H=o-S o=-357030-(-357062)p=H/o i=T-p O=X^i Y=G/O M=u(Y)O=361197-361196 u=4295986560-1019264 A=M%u M=106177-106175 u=M^S v=A/u u=B[J[960920+-960916]]G=v%O O=773270+4294194026 Y=G*O M=u(Y)u=B[J[-1007836+1007840]]Y=u(v)A=M+Y M=-713298-(-778834)G=-902825+968361 u=A%M X=435634+-435378 Y=A-u S=nil M=Y/G v=nil G=-588395+588651 Y=u%G O=u-Y G=O/X X=616927+-616671 O=M%X i=M-O A=nil T=-39148-(-39404)X=i/T M=nil u=nil i={Y,G,O,X}X=nil Y=nil B[J[-1039630+1039631]]=i O=nil G=nil k=-921234+1929954 end else if k<12328245-(-171391)then k=v R=S k=S and 8105490-393069 or 768605+15597271 else R=D(310249-317471)k=d[R]k=k and 7268273-456053 or 3080785-(-949534)end end else if k<11973512-(-849066)then if k<12829073-96509 then k=d[D(-39941+32786)]R={}else h=D(-799325-(-792187))O=i z=d[h]h=D(-458997+451835)U=z[h]z=U(S,O)U=B[J[-630542+630548]]h=U()b=z+h o=b+Y b=-233801+234057 H=o%b b=A[v]h=-51862-(-51863)O=nil Y=H z=Y+h k=5195559-(-361263)U=u[z]o=b..U A[v]=o end else if k<13417297-250307 then j=D(-77007-(-69850))k=d[j]j=D(-632163+624975)d[j]=k k=-530201+12484013 else k=X o=18646194949436-(-21678)H=D(690872+-698131)i=B[J[832626-832624]]T=B[J[543270+-543267]]p=T(H,o)T=-82835+11379170515013 X=i[p]i=true u={[M]=Y,[G]=O,[X]=i}b=D(-433603-(-426430))R=k(A,u)A=D(-205187+198052)X=D(-435820+428589)R=d[A]p=32166525938514-(-675632)G=D(-788751-(-781576))U=8228332256617-(-807310)u=B[J[-992752-(-992754)]]O=3857246041891-(-872417)M=B[J[490949+-490946]]i=-941454+8875272072626 Y=M(G,O)A=u[Y]k=R[A]A=B[J[380503-380498]]Y=B[J[-763383-(-763385)]]G=B[J[-970162+970165]]O=G(X,i)i=D(702767+-710015)M=Y[O]G=B[J[683453-683451]]O=B[J[-211252-(-211255)]]X=O(i,T)Y=G[X]O=B[J[35743+-35741]]T=D(1046491+-1053728)X=B[J[169875-169872]]i=X(T,p)G=O[i]X=k p=B[J[458434-458432]]H=B[J[-878232+878235]]o=H(b,U)T=p[o]i=v[T]k=i and 9471089-534307 or 14183894-467301 O=i end end end else if k<946706+12552510 then if k<12852121-(-590338)then if k<-729832+14126992 then Nf=B[u]Ef=B[v]tf=45342+19566276178553 l=k Qf=D(559971-567069)Jf=Ef(Qf,tf)kf=Nf[Jf]Df=a[kf]kf=-101763+101963 df=Df==kf k=df and 293131+13940833 or 713159+11149030 r=df else o=D(-195345-(-188186))T=B[J[476993+-476991]]p=B[J[-422945+422948]]b=985851+18266459641406 H=p(o,b)i=T[H]O=i k=12834988-(-375613)end else if k<13316684-(-151269)then v=f(v)x=f(x)G=nil j=nil i=nil o=nil M=nil C=nil F=f(F)p=f(p)A=nil O=nil R={}k=d[D(-444361+437191)]W=f(W)u=f(u)T=nil H=nil Y=nil V=f(V)a=nil s=f(s)X=nil else k=O and-282815+4085956 or 9660866-674037 end end else if k<688768+13011815 then if k<14212514-619872 then k=3600718-(-1034475)S=nil B[J[357768-357763]]=R else k=B[J[673941+-673931]]v=B[J[860713+-860702]]S[k]=v k=B[J[-236551-(-236563)]]v={k(S)}k=d[D(-428065+420933)]R={N(v)}end else if k<327249+13402027 then o=D(-876540-(-869409))T=B[J[-23774-(-23776)]]b=5662179514841-872333 p=B[J[-935245-(-935248)]]H=p(o,b)i=T[H]O=i k=9787677-850895 else k=589851+11560200 end end end end else if k<598906+14840199 then if k<400390+14250964 then if k<14873544-706428 then if k<14039051-107780 then if k<14160489-331745 then b=#H j=-574120-(-574120)o=b==j k=o and 4328105-(-628378)or 8863313-(-205652)else C=nil s=f(s)x=f(x)w=f(w)W=f(W)V=f(V)k=-367205+10077635 F=f(F)end else k=Y and 69409+1371074 or 684678+15370389 end else if k<15167501-904828 then k=l k=-716759+5200800 y=r else o=b W=o k=-684328+10387722 H[o]=W o=nil end end else if k<15790566-530652 then if k<14093508-(-684569)then A=B[J[-244099-(-244108)]]u=A k={}S=k v=10565-10564 A=-117675-(-117676)M=A A=447328+-447328 Y=M<A A=v-M k=-781821+8461684 else j=728256+-728250 h=65338+-65337 k=B[G]z=k(h,j)k=D(-160762+153605)d[k]=z j=D(-883778+876621)h=d[j]j=907839-907837 k=h>j k=k and 12490392-1048326 or 12682687-(-364429)end else if k<-19324+15427147 then R=D(-922919+915762)k=d[R]S=D(-450829-(-443641))R=d[S]S=D(235969+-243157)d[S]=k S=D(433791-440948)k=11454827-(-155708)d[S]=R S=B[J[-210528-(-210529)]]v=S()else B[v]=P q=325817+-325816 y=B[x]n=y+q a=C[n]L=T+a a=-581685+581941 k=L%a n=B[W]T=k k=13455635-(-435206)a=p+n n=-704586+704842 L=a%n p=L end end end else if k<229703+15806370 then if k<14730764-(-1031778)then if k<15704084-153505 then k=T and 1142321-710172 or 11347260-808070 else k=14347406-886329 end else if k<16016862-220961 then R=X k=i k=X and 5741748-(-1032242)or-310486+2587971 else y=-152550+152552 n=C[y]y=B[F]a=n==y P=a k=-145085+1783215 end end else if k<463098+15674859 then if k<631625+15469174 then k=i and 2517473-920446 or-379917+12481983 else C=-777088+32787941709604 W=B[u]F=D(979342-986522)x=B[v]a=659792+34587759406490 s=x(F,C)b=W[s]W=c()B[W]=b x=B[u]s=B[v]C=D(831725+-838899)F=s(C,a)b=x[F]x=c()k=A and 896660+10310114 or 4096544-(-314036)B[x]=b s=c()b={}B[s]=b end else if k<-187122+16535525 then a=B[u]k=6817667-936416 r=553949+14150169781728 n=B[v]q=D(154633-161893)y=n(q,r)C=a[y]b=C else Y=D(-109499-(-102238))u=k v=k M=d[Y]k=M and-332910+8072757 or 1111384-(-74303)A=M end end end end end end end end k=#Q return N(R)end,function(d,D)local N=A(D)local E=function(E,J,Q,t,R)return k(d,{E;J,Q,t;R},D,N)end return E end,function(d)local D,k=-896662+896663,d[83159-83158]while k do S[k],D=S[k]-(-137881+137882),(1018531-1018530)+D if-898736+898736==S[k]then S[k],B[k]=nil,nil end k=d[D]end end return(M(8895977-(-1017172),{}))(N(R))end)(getfenv and getfenv()or _ENV,unpack or table[D(177122+-184343)],newproxy,setmetatable,getmetatable,select,{...})end)(...)
return(function(...)local d={"\089\081\085\082\098\049\122\055\107\111\119\048\087\105\061\061";"\068\071\074\078\113\106\109\111\120\085\118\082\066\056\068\055","\104\119\083\054\054\069\117\084\113\083\117\082\110\104\043\107","\054\053\117\112\099\110\109\071\068\108\122\104\054\051\087\119\054\111\116\061","\110\111\108\084\066\053\074\107\104\084\080\052\121\104\074\108\109\111\089\061";"\113\082\121\078\088\119\101\116\109\073\090\061";"\049\053\117\122\115\083\108\116\053\108\098\061","\099\081\116\109\119\116\098\119\113\075\071\061","\113\051\117\115\056\103\107\083\113\118\061\061";"\112\116\088\056\099\069\108\066","\106\080\065\066\121\106\105\061";"\113\071\043\117\106\083\087\108\104\083\117\103\103\085\043\117\109\105\061\061","\114\047\116\067\098\077\061\061";"\105\057\121\076\104\113\118\043\070\052\105\121\110\100\102\114\112\100\097\102\101\081\118\061","\114\069\109\079\106\053\109\043\054\119\108\109\099\056\066\108\104\118\061\061";"\120\088\073\122\106\077\061\061","\103\051\083\080\054\071\118\070\073\110\087\109\068\069\053\071\110\120\098\061","\083\116\079\052\080\048\056\054\110\076\066\122\049\078\097\050\073\104\109\122\084\088\080\119\120\086\114\074\055\098\061\061","\068\076\049\043\081\107\054\070";"\103\119\057\086\103\119\043\071","\078\115\086\071","\099\119\110\071\121\120\110\071\103\069\117\074\103\085\082\083","\081\079\090\066\106\072\104\075\097\111\097\054\111\079\074\088\049\079\101\057","\117\113\089\120\086\051\116\086\079\065\106\081\105\055\109\077";"\084\103\055\086\121\067\109\086\067\088\113\061";"\098\075\072\118\084\113\054\116\088\076\088\056","\121\111\110\086";"\086\113\065\076\057\103\113\061";"\110\119\043\122\068\081\066\047\099\053\109\116\114\120\082\053","\065\090\088\074\108\056\098\074","\055\082\047\109\051\066\105\106\047\088\089\103";"\098\108\117\084\099\120\122\079\117\119\043\102\066\043\083\109\106\111\071\061";"\049\117\122\066\109\053\056\077";"\110\088\109\101\079\077\061\061","\110\119\083\084\121\053\066\065\121\056\087\047\065\112\068\055\110\102\052\061","\117\085\083\107\066\110\109\083\099\056\066\083\099\105\061\061","\121\120\043\071\103\119\105\061","\099\100\076\056","\117\112\080\085\121\069\087\043\106\119\043\075\121\120\070\119","\067\067\089\049\051\051\122\114","\089\076\114\098\047\119\048\054";"\068\111\057\050\068\112\087\122\121\085\099\061";"\078\112\074\081\110\116\106\083\113\121\047\078\075\098\061\061","\102\117\111\101\115\085\100\107\112\075\057\105\082\098\061\061";"\112\054\101\121\072\098\053\072\087\098\061\061","\112\111\106\101\085\048\102\097\077\111\051\083","\067\115\109\098\073\105\086\070\074\077\108\119";"\050\053\047\079\076\097\115\071","\085\113\114\078\078\106\069\104\115\077\061\061";"\066\090\057\054\085\110\067\111","\121\106\075\089\054\083\109\081\066\083\066\113\073\081\089\119\073\077\061\061";"\052\051\089\068\115\053\077\104\082\105\061\061";"\054\067\087\068\066\081\078\109\118\119\089\079\047\089\105\049\053\103\082\105\075\087\104\082\048\079\072\089\118\100\108\085\052\047\105\056\089\107\083\084\119\043\098\043\098\069\085\098\086\054\052\088\065\077\073\100\052\072\082\090\087\048\074\114\053\075\055\068\068\056\114\119\087\073\074\051\043\088\105\077\097\113\116\122\067\054\087\089\086\070\104\102\084\122\074\108\119\068\087\057\065\109\055\078\067\077\066\087";"\065\110\043\047\066\119\068\079\121\085\116\118\109\069\110\098","\113\118\073\081\079\098\061\061","\085\077\076\050\087\103\053\061","\078\073\098\077\056\105\061\061","\097\052\054\119\107\050\103\103";"\097\078\119\050\069\117\076\099","\099\049\052\054\117\089\075\066\081\080\117\067\099\097\109\065\070\111\097\057\051\077\061\061","\067\076\099\081\077\110\083\110\048\083\109\106\115\077\061\061","\065\111\074\082\104\111\074\089\120\069\122\081\054\050\083\117\106\056\116\061","\070\067\090\067\116\106\052\074\106\105\061\061";"\099\102\117\107\114\120\075\056";"\054\102\087\104\066\102\113\118\117\112\117\117\099\120\066\052\104\053\118\061";"\121\084\081\061","\054\069\109\080";"\101\081\114\065\074\067\068\099\072\121\048\108";"\102\109\052\079","\072\083\086\121\074\069\119\048\106\110\102\075";"\087\049\077\054\084\108\085\048\054\111\051\085\043\119\118\061","\073\081\117\108\073\085\068\101\113\108\080\117\110\053\043\082\068\077\061\061";"\068\043\080\088\113\050\109\051\104\119\108\043\066\110\110\072";"\068\054\085\074\079\112\122\075\105\053\115\116";"\077\116\104\105\116\098\070\061";"\047\074\117\057";"\103\114\101\090\065\088\120\099\100\117\099\061","\107\086\057\112\050\114\110\071","\065\105\061\061","\114\071\081\075\065\069\116\082\098\104\109\100\103\102\043\111\104\071\105\061";"\098\056\087\083\103\120\115\100\121\119\083\086\068\112\113\061";"\117\114\117\081\114\115\104\049\080\079\086\112\110\118\061\061","\121\120\043\071\114\077\061\061","\068\119\057\107\114\102\109\118\103\120\109\083","\066\071\052\108\068\083\052\070\073\051\066\065\120\069\043\120","\076\122\116\050\073\118\061\061";"\073\110\110\114\117\069\087\109\054\051\083\081\103\110\080\070";"\102\079\097\107\047\084\102\052\105\072\075\069\105\077\061\061";"\077\113\120\057\066\067\068\102";"\102\098\102\112\049\077\061\061";"\066\119\108\074\068\111\109\116","\117\119\110\071\106\119\110\107\068\085\083\051\066\098\061\061";"\109\098\104\049\088\119\088\108\102\081\087\089\109\057\105\048\072\101\083\111\073\117\071\061","\106\111\082\074\073\098\061\061","\121\051\080\082\117\084\068\055\054\106\083\086\068\102\116\075\066\105\061\061";"\117\085\083\086\066\081\066\122\099\056\109\071\098\119\074\122\121\111\098\061";"\104\083\119\122\110\085\088\047","\121\112\110\120","\117\119\110\071\117\111\110\050\103\119\110\086\066\111\043\086\068\112\113\061";"\075\073\112\049\057\118\061\061","\090\112\115\085\066\113\071\090\055\108\084\111\057\050\048\121\099\105\088\117\055\090\090\081\085\070\097\080\052\119\070\061","\055\070\053\066\073\108\104\082\068\112\076\055\121\120\101\065\071\084\048\109\104\055\070\061","\068\083\122\120\106\106\082\076\099\119\043\122\068\106\103\070\114\118\061\061","\099\116\110\087\120\104\114\089\071\054\054\049","\081\099\068\081\051\056\071\048\089\057\089\061";"\052\082\072\111\067\089\086\066\066\047\081\061";"\118\084\078\119\068\087\084\065\070\113\117\098\047\101\050\083\097\067\122\109\076\043\098\061","\075\074\110\056\068\077\061\061";"\048\076\084\098\067\072\113\061","\085\109\099\076\048\077\061\061","\054\112\117\071\099\081\068\083\068\077\061\061";"\083\050\052\084\083\120\067\111";"\106\050\080\075\098\071\082\076\109\104\066\122\065\120\087\114\099\077\061\061";"\114\071\068\079\113\051\105\118\110\043\103\108\109\069\110\051\054\105\061\061";"\114\078\122\070\111\052\104\069";"\117\099\122\099\097\047\098\085";"\106\106\074\075\109\069\074\085\109\081\109\119\114\069\043\074\110\120\116\061","\112\072\078\073\099\101\043\067";"\066\082\089\052\107\113\103\086\119\107\111\116\098\047\048\118\112\118\054\114\118\077\061\061";"\099\080\103\070\081\088\098\084\047\102\098\061","\098\098\043\097\051\086\122\081\068\098\090\107\043\120\122\118\078\071\072\104\113\074\071\069\043\089\080\052\097\056\122\110";"\075\082\077\078\076\103\099\072\072\082\053\089\047\074\080\055\099\077\061\061";"\071\087\049\049\112\113\054\070\102\120\099\090\055\104\075\119";"\076\065\119\052\068\047\077\105\069\082\110\057";"\084\112\052\113\112\105\061\061";"\056\056\085\080\075\114\119\110\112\105\061\061","\109\072\109\104\073\069\070\118\081\053\103\061";"\090\078\078\097\103\050\050\081\116\077\061\061";"\111\107\100\122\053\105\061\061";"\073\106\122\084\120\085\083\100\066\104\068\069\113\056\109\071\065\077\061\061";"\099\104\051\111\057\118\122\070\067\075\067\072","\098\102\087\083\103\069\117\083","\114\097\111\090\073\118\061\061";"\054\053\066\115\066\119\109\101\110\083\083\088\106\051\109\119";"\104\056\043\056\054\111\115\055\104\120\074\084\066\106\103\108\066\053\090\061","\117\112\098\070\065\084\110\053\114\083\068\106\103\120\103\070\099\083\113\061";"\116\085\105\054\078\112\082\089","\073\104\043\100\106\084\074\066\099\053\089\050\066\085\057\065","\068\111\057\086\068\120\108\088\066\069\052\061";"\084\075\102\090\108\071\117\087\121\120\121\080\118\077\061\061";"\053\089\065\111\114\098\061\061";"\113\069\066\085\068\083\110\106\073\111\090\107\114\108\066\070\110\098\061\061","\111\119\069\106\054\065\085\112","\054\102\122\076\106\085\110\117\117\084\083\066\121\111\071\108\114\106\118\061","\110\119\115\079\117\050\080\069\066\119\057\085\113\050\117\070\120\105\061\061";"\121\053\043\113\110\043\083\118\099\120\108\116\117\104\109\116\120\056\103\061","\078\085\086\111\106\117\057\088\078\098\061\061","\075\051\104\078\085\109\103\048\050\118\080\116\107\067\052\061","\110\106\117\122\121\104\052\061","\099\085\043\053\065\110\117\081\114\084\109\117\073\084\087\055\068\118\061\061","\072\051\082\110\076\100\055\116","\070\047\110\085\084\104\075\047\111\069\116\061";"\043\111\047\083\053\082\120\120\115\118\107\103\114\076\084\119\115\074\097\043\074\108\050\119";"\099\111\066\051\054\084\080\085\104\083\083\118\114\050\083\081\068\105\061\061","\066\051\087\076\068\084\080\104\113\102\066\104\099\106\057\052";"\110\073\079\085\052\098\061\061";"\119\074\074\043\069\070\072\050\083\074\083\118\106\105\061\061";"\084\080\106\121\075\119\105\110","\050\083\054\084\043\098\061\061";"\069\108\057\089\066\120\070\061";"\119\099\119\116\051\120\070\071\050\049\113\068\055\113\049\077","\085\088\076\053\082\072\116\118\078\084\088\072\116\098\061\061";"\070\048\105\052\111\104\090\061";"\066\119\043\115\066\098\061\061";"\070\108\080\065\048\114\051\074\122\121\051\103";"\121\053\117\082\082\043\076\121";"\074\075\121\073\120\080\110\071\086\065\115\075\074\073\084\088\089\067\074\114\076\070\048\120\108\121\122\112\078\077\061\061";"\114\090\051\078\089\043\069\103\087\098\061\061","\114\043\106\071\104\069\117\082\054\083\116\107\117\081\057\109","\050\048\082\078\069\077\090\052\116\105\061\061","\107\117\122\070\120\122\110\055";"\052\118\109\054\097\077\061\061";"\113\111\108\072\106\084\083\047\106\085\110\047\113\112\080\074","\114\069\109\085\114\120\082\083","\065\111\066\052\068\050\080\110\110\104\080\107\103\056\087\114","\075\098\115\068\047\110\085\069\122\098\061\061","\117\073\115\120\049\098\061\061","\067\050\048\070\106\111\070\114\114\090\100\114\071\108\053\056\120\082\083\067\077\065\113\061";"\118\103\121\119\083\051\122\089\099\048\103\061";"\066\069\087\107\121\102\052\061","\078\089\101\074\071\106\100\053\103\100\122\099\083\118\104\072\083\066\120\103\075\111\117\057\102\057\070\057\118\111\121\111";"\085\097\073\072\114\098\061\061";"\080\043\085\076\083\098\061\061","\117\087\083\090\073\075\043\079","\104\102\080\081\087\072\053\061","\077\084\054\081\097\106\119\101\121\113\103\061";"\066\102\109\108\103\105\061\061","\114\118\084\072\089\122\089\118","\110\053\075\107\114\053\081\075\099\071\115\072\113\108\122\116","\077\049\066\106\067\112\068\068\086\098\114\111\067\122\089\074\065\075\089\077\081\054\089\061";"\073\049\086\076\085\056\067\054\105\119\054\106\103\111\070\061";"\121\084\052\061","\110\112\068\083\066\120\075\087\121\085\066\047";"\113\083\050\082\111\065\050\074","\053\110\083\120\100\053\068\075\071\056\106\061","\086\055\107\080\105\103\099\078\047\050\116\061","\087\090\090\090\049\049\080\115","\103\097\070\051\100\082\082\104\104\105\061\061";"\068\111\043\050\114\118\061\061","\112\049\116\114\088\113\057\051\088\102\082\051\088\079\085\065\119\117\071\061","\119\088\104\073\050\121\105\065";"\117\111\110\050\068\112\087\047\073\098\061\061","\052\118\061\061";"\066\120\082\114\066\111\110\080\099\104\080\100\120\053\052\082\114\077\061\061";"\103\056\083\071\066\098\061\061","\043\097\114\070\078\099\051\070\086\083\116\061";"\047\056\106\117\111\081\104\057\083\085\066\090\080\122\071\050\049\051\090\061","\073\109\102\075\110\069\122\048\087\067\118\066";"\066\085\101\053\054\083\049\122\076\069\053\061","\073\109\076\111\043\105\061\061";"\050\108\047\078\098\111\122\122","\106\069\074\069\110\051\066\080\054\051\110\102\104\053\122\117\110\108\098\061","\115\043\083\056\076\119\076\074\053\048\081\111\112\075\052\117\066\111\090\056\103\118\061\061","\089\101\080\075\097\048\121\049\057\098\073\122\090\102\104\109\075\079\085\043\050\120\048\072\118\069\117\112","\066\117\103\122\079\088\072\047\051\043\083\065\081\104\052\061";"\051\080\118\114\073\082\072\106\086\090\079\098\119\076\098\061";"\056\118\074\121\102\066\043\100\079\099\050\102\080\098\061\061";"\120\083\043\069\054\083\087\083\099\050\043\107\110\119\066\116";"\054\119\083\051\114\118\061\061";"\107\080\076\066\070\066\103\121\069\121\121\116\122\081\049\056\116\076\077\061";"\050\107\102\097\119\107\076\043\106\082\076\083\067\118\066\099\080\084\110\082\117\108\070\116\077\079\043\074\043\097\116\061","\113\110\087\071\068\108\117\081\113\085\117\115\110\043\110\120","\050\089\070\114\070\118\067\112\107\074\075\049","\109\084\110\117\098\119\116\075\103\106\082\102\054\085\110\109\110\098\061\061","\117\120\075\108\121\098\061\061";"\066\106\117\055\099\110\110\084\113\056\080\110\109\071\110\043","\099\106\082\051\066\120\075\065\106\102\068\081\073\084\109\120";"\102\122\110\069";"\107\115\084\114\114\075\114\122\074\109\073\108","\078\047\072\090\067\067\068\109";"\110\111\043\115\099\111\110\107\052\081\117\083\068\111\110\051\068\111\110\053\052\098\061\061";"\080\077\071\048\116\081\102\109\075\049\099\106\070\043\113\061";"\118\079\081\115\089\081\080\055\098\121\083\117\047\098\061\061","\099\111\043\122\099\056\113\061","\071\051\087\083\114\122\103\051\068\075\097\056";"\068\052\068\111\048\077\061\061","\051\051\108\049\089\051\113\115\119\086\079\074\081\118\061\061","\069\108\057\115\066\069\117\074\068\111\043\088\121\111\106\061";"\116\053\050\070";"\066\085\082\047\121\102\052\061";"\104\085\083\047\121\102\117\103\113\111\115\079\068\112\074\050","\115\047\104\079\109\075\116\113\117\098\118\061";"\069\071\099\061";"\088\076\051\097\101\089\086\065\081\065\069\103\108\119\090\085\083\068\086\072\066\053\089\061";"\079\121\055\068\065\102\070\054","\107\050\079\118\088\101\073\043\050\069\081\061","\051\122\099\108\103\077\061\061";"\114\081\057\052\106\085\117\085\121\119\109\109\066\119\082\087";"\109\071\122\072\110\085\116\108\066\053\057\113\113\053\057\118";"\121\102\113\108\110\071\043\109\104\119\082\069\114\053\066\055\098\118\061\061","\109\055\084\088\055\098\075\112\098\108\100\069\087\052\071\071\098\077\061\061";"\068\069\116\071\103\106\115\065\103\069\110\112\110\050\110\089\104\053\113\061","\100\047\111\072\050\106\116\069\110\098\048\049\066\080\082\113\115\097\108\053\113\088\113\061";"\051\051\051\057\077\114\090\061","\121\111\057\102\066\069\052\061";"\080\083\079\054\089\068\106\114","\056\082\111\082\050\073\054\057\116\076\071\061","\116\121\072\057\118\115\065\073\083\113\067\120\117\053\050\110","\114\085\066\102\066\104\083\070\103\069\068\101\066\108\099\102\109\077\061\061";"\073\113\082\076\072\080\118\097\105\113\099\086","\068\051\043\084\099\119\066\120\114\110\066\080\054\069\106\082","\082\082\107\118\107\099\074\100\107\087\076\067\080\105\061\061","\113\071\071\108\117\108\122\113\113\081\075\098\073\106\117\087","\106\104\087\089\054\111\083\110\121\053\090\070\073\120\110\082\114\105\061\061","\114\056\066\053\120\051\043\047\120\051\099\118\109\085\115\115";"\068\051\066\110\106\098\061\061";"\109\119\102\083\098\105\061\061";"\051\057\072\068\075\077\061\061";"\106\119\066\120\066\112\113\075\109\043\053\082\117\083\074\075\073\105\061\061";"\099\069\068\072\099\110\117\109\106\069\109\103\113\108\074\107\065\098\061\061";"\111\049\112\078\084\082\112\084";"\088\109\051\069\077\105\061\061";"\087\101\085\069\057\102\116\061","\099\112\087\122\121\056\098\061";"\068\084\080\102\068\120\115\084\073\056\074\051\073\056\074\083\099\105\061\061";"\100\105\056\113\079\057\116\088\112\114\105\061","\106\104\077\082\068\106\066\055\103\050\083\078\114\110\098\119\106\118\061\061";"\054\047\081\101\087\103\110\117\116\119\076\085","\113\053\057\053\117\110\116\118\098\119\075\085\120\077\061\061","\111\109\070\102\074\047\113\077\071\049\057\101\113\119\089\087\122\090\089\090\104\121\085\121";"\071\077\078\069\075\114\067\105\056\097\057\097";"\114\111\075\120\106\043\074\075\109\043\066\118\068\071\074\043\106\077\061\061","\099\110\043\075\056\116\077\105\086\086\047\101\106\105\116\112\087\080\113\117\107\066\107\077\108\108\084\074\069\067\085\110\101\056\077\067\079\049\052\061","\101\108\080\047\050\120\053\080\066\090\077\061","\078\121\087\055\049\105\061\061","\067\043\088\072\117\077\061\061","\055\119\072\048\084\101\107\053\111\112\102\081\084\099\099\061";"\104\106\118\075\117\069\117\066\117\081\082\053\066\053\082\111\098\098\061\061","\049\066\073\068\072\119\107\083\066\047\113\061","\077\118\097\116\076\115\105\061","\106\068\108\067\119\066\121\120";"\109\111\083\065\103\110\074\075\109\083\068\110\109\112\110\043\106\105\061\061";"\117\085\083\086\066\081\066\122\099\056\109\071\098\119\074\122\121\111\117\078\066\053\109\089\103\069\109\050";"\103\117\052\118","\117\119\110\071\106\111\083\119\121\102\098\061";"\114\081\109\081\098\104\080\066\103\102\066\081\068\083\110\118\117\053\116\061","\105\043\111\107\104\100\050\072\100\077\061\061","\119\077\065\076\076\114\052\085\117\087\120\054\119\082\078\084\114\118\049\083";"\099\102\080\083\103\120\115\083\099\105\061\061","\089\057\102\110\088\102\101\074";"\084\104\116\121","\068\122\074\085\056\054\068\109\114\105\089\061";"\099\102\110\088";"\068\082\079\106\081\071\105\061";"\054\111\082\055\068\050\117\101\098\106\057\065\109\069\098\118\120\098\061\061";"\117\073\048\070","\121\111\074\055\098\085\118\075\054\083\110\108\110\112\106\107";"\102\118\103\067\107\109\112\100\047\105\061\061","\075\110\057\103\120\089\116\061";"\049\113\052\072\088\098\061\061","\089\053\101\077\120\113\071\061","\048\075\122\072\076\077\061\061","\099\085\043\086\066\111\057\115","\043\121\055\054\118\078\078\084";"\102\111\076\113\110\065\088\079\107\119\070\061";"\069\048\077\082\120\112\065\055\082\086\105\061","\066\119\110\071\103\102\110\050\068\111\057\115\103\069\109\050\066\069\098\061";"\110\099\120\071\081\055\104\052","\106\108\106\043\051\065\074\079\065\081\110\065\068\098\061\061";"\071\084\109\055\107\100\070\080\112\119\098\079\086\112\077\087\043\056\101\087","\086\101\110\048\104\078\116\120\113\098\079\083\084\114\081\074\080\077\117\081";"\048\048\116\099\090\073\079\074\100\074\071\061";"\114\086\108\090\051\078\113\061";"\047\077\061\061","\121\069\074\055\114\110\074\075\103\120\083\050\120\056\080\119\065\104\099\061";"\103\112\083\054\047\098\061\061";"\065\088\105\083\066\079\116\122\065\105\061\061","\067\115\066\069\100\108\050\122\110\118\061\061";"\084\089\106\114\109\118\103\061","\102\065\109\048\110\103\074\073\119\090\099\117\110\110\087\048";"\097\047\104\074\082\120\047\053\071\075\072\107\109\055\115\111","\104\111\078\081\113\102\112\083\101\074\115\082\117\106\103\068\110\071\077\043\099\072\099\072\119\112\082\076\089\113\084\057\106\085\082\078","\110\082\050\099\069\120\051\097\116\111\112\102\073\105\061\061";"\110\089\065\080\086\119\051\118\084\068\098\061","\098\108\052\050\121\053\083\072\121\053\113\118\066\043\087\106\109\051\077\061","\099\069\102\099\073\043\055\072\116\089\067\080\116\070\047\054","\072\085\083\110\086\049\069\070\121\118\050\100\054\057\118\061";"\054\106\098\048\082\118\075\111\121\089\052\085";"\066\050\068\116\109\053\043\122\106\083\103\061";"\109\119\108\119\054\069\110\056\109\110\066\106\106\071\118\075\073\077\061\061","\090\121\118\079\108\111\055\118\116\114\076\105\105\090\105\061","\109\106\087\075\066\081\122\112\117\083\087\056\117\053\083\112\121\071\098\061";"\068\082\088\114\067\119\084\115\073\078\114\118\112\083\109\090";"\081\082\103\070\072\098\107\102\056\113\086\116\083\099\121\111\106\113\104\072","\104\098\074\121\122\074\086\108\110\051\053\061";"\067\089\050\103\114\120\104\102\121\043\088\069\101\105\061\061","\121\097\109\051\066\049\047\055\113\077\061\061";"\099\102\080\089\114\069\098\061","\114\069\080\074\114\069\087\050";"\099\082\116\054\066\054\106\049\053\101\051\053\089\077\061\061","\117\112\074\053\104\084\074\074\099\106\053\082\104\043\066\081";"\102\120\088\102","\074\076\053\079\108\108\088\071\052\120\100\088","\074\074\047\076\108\043\071\061","\117\071\074\051\066\111\106\108\106\053\082\070\065\120\108\082\121\118\061\061","\109\083\087\113\065\106\110\107\121\108\087\051\103\051\110\101\114\071\089\061";"\084\122\087\047\052\072\080\111\050\098\061\061","\117\111\117\071\106\102\066\081\098\053\083\116\106\120\103\082\103\118\061\061";"\073\106\100\077","\098\119\074\074\121\085\068\083\106\102\117\074\068\111\106\061","\048\053\099\056","\076\108\116\080\116\106\105\102\098\102\108\087\083\118\061\061";"\110\112\117\069\104\056\053\102\117\108\110\047\121\085\070\050\110\118\061\061";"\113\074\113\065";"\108\090\070\078","\086\122\067\080\053\073\113\061";"\102\068\070\111\088\072\076\116\115\067\105\074";"\099\111\109\074\121\111\118\061";"\083\114\079\074\081\112\109\106\074\074\109\108\121\106\052\081\119\066\081\086\070\098\061\061";"\073\105\051\043\117\056\121\112","\043\107\111\047\051\086\073\086\068\082\083\105\088\050\071\105\071\088\097\081\103\069\113\084\078\068\121\100\121\077\061\061";"\085\043\057\121\068\099\071\082";"\098\119\057\086\121\085\110\051\068\077\061\061","\070\087\055\084\051\117\120\118\065\073\075\104\051\080\117\068\081\078\079\107\074\069\089\061";"\103\110\086\109","\078\105\069\102\054\077\061\061";"\103\119\074\074\099\105\061\061";"\068\102\087\122\068\111\110\085\114\120\082\083";"\081\077\112\121\107\120\043\069\079\111\089\061","\080\078\048\112\105\116\054\073\047\043\076\070\047\074\099\099\106\106\076\055\098\105\061\061","\080\055\067\072\119\084\089\120","\114\083\080\101\104\053\115\084\120\111\082\047\066\104\074\071";"\055\050\122\048\072\098\077\111\088\111\088\057\085\048\101\113";"\110\085\110\051\068\111\057\107\113\118\061\061","\122\067\054\057","\087\089\078\100\068\098\061\061";"\110\052\113\055\080\075\098\110\108\107\053\113","\078\105\054\109\109\107\067\075","\120\121\070\109\102\109\119\073";"\122\077\086\106\054\106\079\076","\099\102\087\110\098\050\043\111\114\071\090\107\098\071\068\109";"\066\084\074\051\104\056\105\070\117\084\087\053\066\069\083\083";"\087\110\055\116\117\122\070\061","\068\111\043\088\121\111\106\061";"\067\083\078\053\101\054\079\051\109\114\081\061";"\066\043\050\050","\084\111\047\122\047\054\119\071\053\080\114\067\077\115\120\047\113\120\078\108\112\047\090\061","\067\048\077\072\056\047\109\073\113\050\105\061";"\068\120\075\118\103\120\109\101","\115\119\107\100\048\070\113\061","\083\080\086\121\089\048\090\097\043\081\097\082\079\047\097\109";"\050\052\057\111\070\108\099\110\054\082\053\061","\118\057\116\118\120\104\049\103\083\116\114\113\105\055\050\049\105\105\061\061","\057\116\106\068\102\077\061\061","\069\108\057\122\121\085\117\083\073\077\061\061";"\109\056\103\102\065\111\043\081\103\053\117\122\066\111\057\103","\106\119\110\086\066\081\043\050\073\120\075\051","\104\119\079\088\087\077\077\114\080\097\119\113\067\102\114\075\055\086\052\088\113\070\087\088\107\074\071\100\075\083\081\048\086\116\080\075\078\077\114\105\077\100\087\048\080\079\121\054\056\111\056\069\074\115\105\116\052\085\116\114\068\054\082\106\053\077\110\053\055\049\048\115\057\076\073\075\057\051\100\085\082\090\077\061","\051\077\074\083\083\103\109\082\122\115\115\043","\116\114\051\075\072\072\052\078\090\107\086\080","\054\120\075\050\068\111\043\086\103\119\106\061";"\065\070\078\100\115\118\061\061","","\076\083\102\097\104\104\120\053\122\120\086\102";"\079\118\122\090\047\106\099\075\069\056\055\114\079\105\122\048\121\073\111\113\086\084\047\051\078\075\089\072\065\055\056\085\110\075\070\119\070\067\106\061";"\054\119\068\106\073\104\074\111\104\102\110\074\065\112\110\050\106\077\061\061","\114\121\114\055\087\087\090\101\080\098\117\098\116\117\121\076\104\099\050\119","\079\109\088\106\107\098\061\061";"\121\074\081\107\107\101\052\114\109\066\077\061","\075\101\108\101\083\113\089\061","\104\051\110\113\099\071\108\082\106\083\110\117\054\051\110\043\106\077\061\061","\109\053\083\088\106\111\115\052\121\110\083\100\054\056\080\122\054\077\061\061","\117\119\110\071\106\111\082\074\073\120\110\107\099\118\061\061";"\068\055\066\047\083\067\114\090\074\050\113\061";"\104\119\117\053\054\120\074\098\098\104\080\074\104\102\109\074\117\081\103\061";"\110\119\043\122\068\077\061\061";"\099\085\110\115\121\102\066\083","\121\111\082\080\121\085\109\080\117\119\068\111\103\085\113\070\114\105\061\061","\098\057\097\067\107\054\104\118\079\077\061\061","\054\111\117\117\121\043\080\083\106\106\109\050\103\110\105\082","\106\111\083\119\121\102\117\106\121\118\061\061","\069\108\057\056\103\118\061\061","\105\103\048\068\090\115\083\105","\112\056\080\054\065\101\109\048\105\111\053\061","\054\081\121\101\122\076\074\080\090\078\070\061"}local function B(B)return d[B+(310323+-248082)]end for B,t in ipairs({{-49915-(-49916);-238098+238533},{578894-578893,-141895-(-142156)};{-771812-(-772074);121590-121155}})do while t[-860761+860762]<t[852074+-852072]do d[t[-787419-(-787420)]],d[t[951629+-951627]],t[2990-2989],t[519102+-519100]=d[t[625813-625811]],d[t[-259933+259934]],t[65946+-65945]+(-924209+924210),t[-492339+492341]-(634379+-634378)end end do local B=math.floor local t=d local U=string.len local u={A=457892-457878;["\051"]=-848290+848325,B=-802632-(-802657),M=-85152-(-85152),r=-684395+684421,D=859579-859550;c=-687565+687593,s=-305405-(-305450),["\048"]=-959306+959369;z=-837814-(-837855);F=397933-397877;K=-885312+885369,W=270971-270962;q=-404922-(-404934),l=634557-634504,n=552201+-552180;U=-526462-(-526500),["\054"]=-408768-(-408786);p=-379537-(-379544);["\047"]=185542+-185495,["\050"]=-777726+777777;T=-648130-(-648133),w=-928106-(-928160),Z=829984-829924;N=151943+-151928,k=57111+-57061,u=-206673+206690;P=-924765+924766,H=-946091-(-946149),["\055"]=767859+-767817,m=364921+-364908,f=715051+-714996,o=558417+-558411;h=-895063-(-895082),v=-498403+498451,O=46587+-46585;e=431920+-431877;Y=267358-267314,V=802721+-802675;["\043"]=965930-965925,b=743464-743448,d=-665509-(-665519);x=379339-379317;g=-73780+73804;R=-578483+578532;t=-100367-(-100407),S=-1031960+1031997,y=184078-184051,E=295253+-295230;L=566227+-566216,["\056"]=457021+-456982;J=16537-16504;I=806725+-806695,Q=-401663+401667;X=-300901-(-300935),C=629809-629778;a=-285700-(-285762),["\049"]=479744-479685,["\053"]=439541-439505;["\057"]=1030842+-1030781;i=958539+-958507;G=-776147-(-776199),j=-73379+73399;["\052"]=-389075-(-389083)}local m=string.sub local o=table.concat local e=table.insert local h=string.char local j=type for d=128158-128157,#t,617388+-617387 do local S=t[d]if j(S)=="\115\116\114\105\110\103"then local j=U(S)local x={}local g=895294-895293 local c=-1033272+1033272 local O=-610897+610897 while g<=j do local d=m(S,g,g)local t=u[d]if t then c=c+t*(-466061+466125)^((915611+-915608)-O)O=O+(-663912-(-663913))if O==-579465-(-579469)then O=-262622-(-262622)local d=B(c/(971892-906356))local t=B((c%(714367-648831))/(-120046+120302))local U=c%(-766294-(-766550))e(x,h(d,t,U))c=-939311-(-939311)end elseif d=="\061"then e(x,h(B(c/(283533+-217997))))if g>=j or m(S,g+(-923988-(-923989)),g+(392997-392996))~="\061"then e(x,h(B((c%(-578683-(-644219)))/(364911+-364655))))end break end g=g+(-782729-(-782730))end t[d]=o(x)end end end return(function(d,U,u,m,o,e,h,O,x,Z,K,S,Q,M,f,b,V,D,j,g,I,E,c,t)b,c,M,I,j,D,x,K,Q,V,E,Z,f,t,S,O,g=function(d)S[d]=S[d]-(-335208-(-335209))if 227905-227905==S[d]then S[d],j[d]=nil,nil end end,function(d)for B=-361932-(-361933),#d,-182737-(-182738)do S[d[B]]=(983588-983587)+S[d[B]]end if u then local t=u(true)local U=o(t)U[B(893093-955103)],U[B(-1047623+985640)],U[B(795313-857133)]=d,O,function()return 511400-(-171386)end return t else return m({},{[B(619227+-681210)]=O,[B(-899741+837731)]=d;[B(308288+-370108)]=function()return 55863-(-626923)end})end end,function(d,B)local U=c(B)local u=function(u,m,o,e,h,j,S,x,g)return t(d,{u;m,o;e,h,j;S,x;g},B,U)end return u end,function(d,B)local U=c(B)local u=function(u)return t(d,{u},B,U)end return u end,{},function(d,B)local U=c(B)local u=function(u,m,o,e,h,j)return t(d,{u,m;o;e,h,j},B,U)end return u end,function()g=g+(117878+-117877)S[g]=841687+-841686 return g end,function(d,B)local U=c(B)local u=function(u,m,o,e)return t(d,{u;m,o,e},B,U)end return u end,function(d,B)local U=c(B)local u=function(u,m)return t(d,{u;m},B,U)end return u end,function(d,B)local U=c(B)local u=function(u,m,o)return t(d,{u,m,o},B,U)end return u end,function(d,B)local U=c(B)local u=function(...)return t(d,{...},B,U)end return u end,function(d,B)local U=c(B)local u=function()return t(d,{},B,U)end return u end,function(d,B)local U=c(B)local u=function(u,m,o,e,h)return t(d,{u,m,o;e,h},B,U)end return u end,function(t,u,m,o)local z,W,Y,w,n,q,A,d3,L,N,y,U3,X,O,S,T,a,r,G,J,g,v,c,k,s,i,C,H,t3,h,P,R,p,l,E,B3,F while t do if t<334439+8435466 then if t<4866387-311442 then if t<3003159-851809 then if t<68368-(-1016795)then if t<-502125+1186530 then if t<-236517+459043 then if t<413070+-333793 then if t<-622954-(-657634)then if t<-652676-(-683844)then S=u[-573323+573324]T=B(-360101-(-298248))h=-859534-(-859536)H=468907+18972246719191 t=S[h]g=t c=j[m[595723-595722]]O=j[m[-17795-(-17797)]]E=O(T,H)h=c[E]O=not g t=S[h]c=t t=O and-391521+6652794 or 6340186-(-902646)h=O else z=j[m[75754-75753]]P=j[m[-281548+281550]]i=B(-234081-(-171985))G=33381360353458-(-932870)C=P(i,G)F=z[C]G=-815630+30261475813657 H=O[F]i=B(-1029476+967667)z=j[m[-378853-(-378854)]]P=j[m[-360737+360739]]C=P(i,G)F=z[C]T=H[F]E=not T t=3660013-(-832675)h=E end else h={}t=d[B(-756301+694150)]S=nil end else if t<47220+171370 then T=B(-803585-(-741519))t=d[T]z=j[m[207384+-207381]]P={t(z)}H=P[-733977+733979]F=P[-563360-(-563363)]T=P[1000949-1000948]t=727297+12340576 else h=j[P]A=B(-64836-(-2628))d3=j[m[830424+-830423]]N=131795+21462544671799 v=j[m[692254+-692252]]y=v(A,N)N=-320436+4325383383954 L=d3[y]t=h[L]h=B(189666+-251708)h=t[h]h=h(t,a)h=116885+-116884 L=358781+-358778 t=s(X,h,L)h=-694668-(-694669)L=19450+-19447 t=s(l,h,L)A=B(-154760+92943)p=413505+22312089622868 L=613656+-613653 h=926358-926357 t=s(W,h,L)L=-17048-(-17078)h=-360717-(-360741)t=s(r,h,L)L=-306262-(-306280)h=690851+-690842 t=s(q,h,L)h=46733+-46729 L=267620+-267612 t=s(J,h,L)L=B(-68700+6484)h=d[L]d3=j[m[-204140+204141]]v=j[m[495383-495381]]y=v(A,N)N=B(-256778+194724)L=d3[y]t=h[L]L=I(-669368+10051881,{R,m[1033515-1033514],m[-426827+426829]})h=t(L)v=j[m[897943+-897942]]L=B(-690603-(-628481))y=j[m[-929400-(-929402)]]A=y(N,p)L=H[L]d3=v[A]L=L(H,d3)h=L t=L and 7389315-216364 or 4999231-(-632757)end end else if t<1663029-1038013 then if t<-70654+538852 then if t<50390+172429 then c=B(281948-344164)h={}H=B(935597+-997543)F=30708630408016-(-486539)g=d[c]O=j[m[-387698+387700]]E=j[m[185890+-185887]]T=E(H,F)c=O[T]t=g[c]c=-224486-(-224496)g=t(c)S=nil g=B(-892402+830206)t=j[m[-649928-(-649932)]]g=t[g]g=g(t)t=d[B(46071+-108034)]else O=not c h=O t=10203656-499574 end else t=h and 7766443-1041785 or 15303799-539302 end else if t<969273-326119 then P=B(-876733-(-814753))O=g H=j[m[-246569+246570]]F=j[m[154267+-154265]]t=B(554144+-616057)t=E[t]C=-169122+21878464134253 z=F(P,C)T=H[z]t=t(E,T)t=t and-506787+592543 or 385313-(-419558)else N=688173+-688171 A=L[N]N=j[w]y=A==N t=-170953+6379555 d3=y end end end else if t<-629938+1601356 then if t<1118469-226343 then if t<304297-(-575086)then if t<1148578-274220 then t=-922110+2482460 E=nil O=nil else T=B(704405+-766409)i=3971443856136-281551 E=u[-125383+125388]C=-94775+28444005688820 c=u[272073+-272070]S=u[-1017276+1017277]P=B(-1012232+950111)h=d[T]O=u[-338049-(-338053)]H=j[m[589526+-589525]]g=u[254166+-254164]F=j[m[510083-510081]]z=F(P,C)C=-211756+14665951024601 T=H[z]t=h[T]H=j[m[195785-195784]]P=B(431880-493875)F=j[m[322355-322353]]z=F(P,C)T=H[z]h=t(T)z=B(-533520+471666)C=B(85855-148019)P=93811450579-(-1006936)T=h h=j[m[-170334-(-170335)]]H=j[m[-574771-(-574773)]]F=H(z,P)t=h[F]F=j[m[-115563-(-115564)]]z=j[m[-165334-(-165336)]]P=z(C,i)z=B(690243-752457)H=F[P]h=H..S T[t]=h h=j[m[396260-396259]]H=j[m[-844427+844429]]P=23766240602090-(-328529)F=H(z,P)t=h[F]z=B(273475-335445)P=-831605+29959994631924 h=O T[t]=h h=j[m[-1003307+1003308]]H=j[m[-525495+525497]]F=H(z,P)t=h[F]h=g T[t]=h z=B(57773-119620)h=j[m[-217854-(-217855)]]P=95+19317199446724 H=j[m[919501+-919499]]F=H(z,P)t=h[F]P=18993588066249-(-510659)h=c T[t]=h h=j[m[925008-925007]]H=j[m[12719+-12717]]z=B(-1094393-(-1032463))F=H(z,P)t=h[F]h=j[m[590987-590984]]T[t]=h h=j[m[141620-141619]]z=B(307035+-368893)P=-366539+5004577923301 H=j[m[-8023+8025]]F=H(z,P)t=h[F]h=E T[t]=h h={T}t=d[B(420907-483070)]end else H=not T c=c+E g=c<=O g=H and g H=c>=O H=T and H g=H or g H=150232+12588196 t=g and H g=395369+11975512 t=t or g end else if t<1086990-161938 then g=j[m[-498369-(-498370)]]S=u[305760+-305759]T=14984069151719-(-728922)c=j[m[-1032692-(-1032694)]]E=B(255710-317584)O=c(E,T)h=g[O]t=S[h]g=t h=B(-483577+421761)F=86055+3279064593871 H=B(677336-739415)t=d[h]h=B(-714243+652355)O=j[m[555945+-555944]]h=t[h]E=j[m[-770010-(-770012)]]T=E(H,F)c=O[T]h=h(t,c)c=h H=510411+30578770144724 h=j[m[901674-901673]]O=j[m[-962360-(-962362)]]T=B(-556627+494700)E=O(T,H)H=B(-312290+250472)t=h[E]F=11934252785409-(-259764)O=t h=j[m[-512365+512366]]E=j[m[249142+-249140]]T=E(H,F)t=h[T]E=t T=B(440037-501843)h=d[T]T=h(E)t=not T t=t and 15779677-365759 or 270844+16089620 else t=40839+5413180 j[g]=h end end else if t<338751+707959 then if t<1757731-782540 then t=d[B(572262+-634416)]h={}else H=-89639-(-89640)F=-56889+56989 z=F F=-58739+58740 P=F F=-687444-(-687444)C=P<F t=7917950-893151 F=H-P end else if t<-763370+1818387 then E=B(735468-797349)S=u[-388547+388548]h=B(96468-158534)t=d[h]E=S[E]O={E(S)}E={t(U(O))}h=E[-13892+13893]c=E[-520636-(-520639)]O=h t=6351038-(-328505)g=E[712553+-712551]else h=-257047+257049 F=B(784013+-845829)H=d[F]P=j[m[851842-851841]]C=j[m[754545+-754543]]F=B(777207-839095)G=B(809471+-871399)F=H[F]Y=-603588+17743981712906 i=C(G,Y)z=P[i]F=F(H,z)i=B(-998894+936841)H=B(-1053319-(-991435))H=F[H]H=H(F,g)G=-411078+33890334786411 z=j[m[-142316+142317]]P=j[m[592038-592036]]C=P(i,G)F=z[C]T=H[F]C=B(372885+-434905)i=-255081+5155327241673 F=j[m[486426-486425]]z=j[m[1024953-1024951]]P=z(C,i)H=F[P]E=T[H]H=j[m[391589+-391588]]P=B(-8926-53043)F=j[m[-971796+971798]]i=B(-833448-(-771638))C=9991+17090320807951 z=F(P,C)T=H[z]O=E[T]H=B(-551784+489968)T=d[H]z=j[m[-550329+550330]]G=198108371052-514064 P=j[m[-79194-(-79196)]]C=P(i,G)H=B(142186+-204074)i=-218903+19929855130455 F=z[C]H=T[H]H=H(T,F)T=B(-470579+408695)T=H[T]T=T(H,c)S=nil C=B(-508757-(-446627))c=nil F=j[m[-299809+299810]]z=j[m[901273+-901271]]P=z(C,i)H=F[P]E=T[H]t={h,O,E}g=nil h=B(91581-153397)O=t t=d[h]h=B(-624237+562349)P=-631731+27875014612583 z=B(200236+-262398)T=j[m[353202+-353201]]H=j[m[-533651-(-533653)]]F=H(z,P)E=T[F]h=t[h]z=B(847354+-909585)P=-671279+35071615385082 h=h(t,E)t=B(-865991-(-804040))T=j[m[205079-205078]]H=j[m[-962503+962505]]F=H(z,P)P=338709+29781485406999 E=T[F]t=h[t]z=B(-489701+427606)t=t(h,E)T=j[m[26870-26869]]H=j[m[892140-892138]]F=H(z,P)h=B(-798867-(-736916))E=T[F]T=B(545165+-607181)h=t[h]h=h(t,E)E=d[T]T={E(O)}t=B(590848+-652792)O=nil t=h[t]t=t(h,U(T))h={}t=d[B(185561-247699)]end end end end else if t<2138463-460955 then if t<38820+1351572 then if t<213435-(-1044210)then if t<153822+1044447 then if t<571152-(-604176)then G=B(88210-150231)i=d[G]G=B(-246835+184819)C=i[G]z=C t=6217046-(-498813)else t=-894917+9620692 a=#G R=-1038215-(-1038215)Y=a==R end else t=13413508-(-148119)end else if t<1917347-583974 then t=false h={t}t=d[B(416539-478529)]else h={}S=nil g=nil t=d[B(-862156+800227)]end end else if t<-39257+1595744 then if t<303685+1126743 then S=nil t=d[B(1028451+-1090287)]c=nil g=nil h={}else t=h and 652326+9016660 or 13948184-113019 end else if t<994288+609117 then g,E=c(S,g)t=g and 1430445-795442 or 969918+13655703 else t=-112690+3885230 end end end else if t<863401+959922 then if t<867470-(-894846)then if t<2039470-325570 then if t<761420-(-941572)then z=20518873652274-(-2336)c=j[S]E=j[m[-973664-(-973665)]]T=j[m[203938-203936]]F=B(-264190-(-202188))H=T(F,z)O=E[H]g=c==O h=g t=-873495+13135363 else S=u[-308611+308612]H=19892504258099-(-884220)h=j[m[470635-470634]]c=j[m[-439341-(-439343)]]O=j[m[-236733+236736]]T=B(-85021+22884)E=O(T,H)g=c[E]t=h[g]g=t t=g and 16304112-727331 or-769800+2530375 end else t=d[B(405571-467759)]S=nil g=nil h={}end else if t<2511987-726976 then c=11720575-41295 g=B(884363+-946245)h=6882915-(-443440)S=g^c t=h-S h=B(-979679-(-917543))S=t t=h/S h={t}t=d[B(-706972-(-644973))]else t=137760+5940577 H=j[m[925438+-925435]]i=B(870686+-932878)z=j[m[-135157+135158]]G=342163+28707956210597 P=j[m[1017293-1017291]]C=P(i,G)F=z[C]T=H[F]z=j[m[648961+-648960]]i=B(504960-567006)P=j[m[-30852-(-30854)]]H=B(586349+-648233)G=713088+10202360475918 C=P(i,G)H=T[H]F=z[C]H=H(T,F)h=H end end else if t<-53806+1996750 then if t<984361-(-852787)then S=B(-647755+585539)h=d[S]g=j[m[275967+-275966]]E=B(157264-219293)T=-737845+15924766924588 c=j[m[888580-888578]]P=-95366+10269705094964 O=c(E,T)S=g[O]z=B(750011+-812155)E=B(271514+-333411)t=h[S]O=d[E]T=j[m[-427706+427707]]H=j[m[546039+-546037]]F=H(z,P)E=T[F]c=O[E]O=c()E=j[m[1017893-1017890]]T=j[m[-772472-(-772476)]]c=E-T g=O*c c=j[m[403397-403393]]S=g+c h=t(S)h=B(427420-489306)t=j[m[-1101-(-1106)]]h=t[h]h=h(t)t=-731744+13265206 else H=x()G=Z(-1013113+4273052,{T;H})i=B(-813028+750981)j[H]=F H=b(H)t=d[i]i=t(G)t=872904+6151895 end else if t<2897208-848575 then y=B(286461+-348399)W=x()q=-2834+3089 j[W]=k r=B(769675+-831572)J=-411249+411349 h=d[r]r=B(-941783+879681)w=337080+-337079 t=h[r]r=-971093+971094 n=736183+-726183 h=t(r,J)r=x()j[r]=h J=-127668-(-127668)L=-861749+861751 t=j[H]h=t(J,q)J=x()q=715206-715205 j[J]=h t=j[H]s=j[r]h=t(q,s)q=x()j[q]=h h=j[H]p=484273-484273 s=h(w,L)h=-3244+3245 t=s==h s=x()L=B(906476+-968377)j[s]=t t=B(57448-119676)v=d[y]A=j[H]h=B(-1022563+960475)N={A(p,n)}y=v(U(N))v=B(-896800-(-834899))d3=y..v t=Y[t]w=L..d3 t=t(Y,h,w)L=B(-869984-(-807937))w=x()d3=V(-732505+14952245,{H,W,P,c;g;a,s,w,r,q;J,z})j[w]=t h=d[L]L={h(d3)}t={U(L)}L=t t=j[s]t=t and-550976+3520928 or 8740776-257067 else t=j[m[1033695-1033694]]S=j[m[209066-209064]]h=t(S)t=d[B(110330-172248)]h={}end end end end end else if t<818447+2540218 then if t<-702218+3394397 then if t<-738219+3199609 then if t<3129682-794564 then if t<2217799-(-99844)then if t<2329787-80082 then O=not c t=12492208-(-302647)h=O else h={}t=d[B(469087-531063)]end else i=17546613405109-366027 C=B(-772087-(-710153))F=j[m[548611-548610]]z=j[m[-800496+800498]]P=z(C,i)H=F[P]T=O[H]t=14152153-1037524 E=not T h=E end else if t<924433+1522885 then g=j[m[154241+-154239]]t=922652+14303497 c=j[m[622760-622757]]S=g==c h=S else c=j[m[-34809-(-34810)]]E=j[m[-692499+692501]]t=16109385-346677 T=j[m[-722583-(-722586)]]z=14365773009110-636597 F=B(-371623-(-309717))H=T(F,z)O=E[H]g=c[O]c=B(555942+-618064)z=14710768496126-(-11460)E=j[m[825620+-825618]]c=g[c]T=j[m[116064-116061]]F=B(-457661-(-395535))H=T(F,z)O=E[H]c=c(g,O)h=c end end else if t<2351771-(-286087)then if t<1778355-(-718140)then if t<1594200-(-897345)then h={}t=d[B(898150+-960214)]else z=-792850+792852 C=-71807-(-71820)g=j[m[213121+-213118]]c=823927+-823895 S=g%c O=j[m[308965-308961]]H=j[m[-591793-(-591795)]]Y=j[m[-52207-(-52210)]]G=Y-S Y=503191-503159 i=G/Y P=C-i F=z^P T=H/F E=O(T)O=96162+4294871134 c=E%O F=-244555+244556 E=323299-323297 O=E^S g=c/O O=j[m[-281977-(-281981)]]H=g%F F=4294342696-(-624600)T=H*F E=O(T)O=j[m[894351-894347]]T=O(g)c=E+T E=-1028052+1093588 H=499362-433826 z=217097+-216841 O=c%E T=c-O E=T/H c=nil H=-349687-(-349943)T=O%H F=O-T H=F/z C=486844-486588 g=nil z=969288+-969032 F=E%z P=E-F z=P/C t=728027+8092751 P={T;H;F;z}H=nil j[m[-113466+113467]]=P F=nil S=nil z=nil T=nil O=nil E=nil end else h={}t=true j[m[405077-405076]]=t t=d[B(-802584-(-740699))]end else if t<-660839+3311138 then t=j[m[891307+-891306]]h=B(463607-525558)S=u[-192171-(-192172)]c=j[m[739553-739551]]O=j[m[-902205+902208]]T=B(-66933+5114)H=142523419889-(-275281)E=O(T,H)g=c[E]H=-480359+32911405158468 h=t[h]T=B(902821+-964903)h=h(t,g)c=j[m[-536624+536626]]t=B(-217338-(-155454))t=h[t]O=j[m[-743291-(-743294)]]E=O(T,H)g=c[E]t=t(h,g)g=x()j[g]=t t=j[g]t=t and 1033131+12470977 or-773307+4590843 else S=nil t=d[B(-506163-(-444325))]h={}end end end else if t<571652+2690049 then if t<421810+2540623 then if t<2262728-(-580416)then if t<2597508-(-116303)then t=d[B(-693135-(-630989))]h={}else S=B(106815+-169050)t=d[S]g=j[m[-83477-(-83485)]]c=-75755+75755 S=t(g,c)t=789289+8780635 end else t=j[H]i=B(-217585-(-155742))z=j[m[11377+-11376]]G=27178888788293-214997 P=j[m[-402896-(-402898)]]C=P(i,G)h=z[C]z=F t[h]=z t=663061+7179749 end else if t<117347+3019294 then d3=j[g]t=d3 and 11043273-898287 or 626561-(-323584)h=d3 else h=B(-145020+83076)t=j[m[248502-248501]]h=t[h]S=j[m[24948+-24946]]h=h(t,S)h={}t=d[B(-294760+232594)]end end else if t<103284+3188865 then if t<3875454-606268 then G=not i P=P+C F=P<=z F=G and F G=P>=z G=i and G F=G or F G=11311689-627473 t=F and G F=13222137-(-585408)t=t or F else c,T=O(g,c)t=c and 17154936-475786 or 1051372-(-213052)end else if t<3762104-431347 then O=not c h=O t=4902484-(-716330)else E=O z=j[m[-1039281-(-1039283)]]G=22386967586501-(-852467)P=j[m[-1007691+1007694]]i=B(-274044+211939)C=P(i,G)F=z[C]H=T[F]F=B(520824+-582984)z=-624260+624261 F=H[F]F=F(H)P=#S H=B(-1021953-(-959841))H=F[H]H=H(F,z,P)h=H==S t=h and-865223+15178433 or 16147191-605989 end end end end else if t<4085819-226731 then if t<-936770+4570789 then if t<188183+3408205 then if t<309155+3160743 then if t<3818898-397700 then c=B(160935+-222851)E=x()O=x()t=true S=u g=x()j[g]=t F=Z(1044832+1453472,{E})h=d[c]c=B(-970959+909070)t=h[c]c=x()H=B(-507934-(-445887))j[c]=t t=Q(256131+12636477,{})j[O]=t t=false j[E]=t T=d[H]H=T(F)t=H and 5486426-268615 or 13986864-168000 h=H else T=9734244101877-56641 h=j[m[863608+-863607]]c=j[m[-236985+236987]]E=B(-105242+43206)O=c(E,T)t=h[O]h=false g[t]=h t=8341121-(-241156)end else c=j[m[-698961-(-698967)]]t=15147224-(-627434)g=c==S h=g end else if t<3980247-367067 then h={g}t=d[B(403670+-465873)]else t=6385948-(-303735)end end else if t<4230949-472093 then if t<3037862-(-680508)then S=u[-628631+628632]H=132149+31410619692269 h=-27391+27393 T=B(383966-446097)t=S[h]g=t c=j[m[-384124-(-384125)]]O=j[m[-471343+471345]]E=O(T,H)O=not g h=c[E]t=S[h]c=t t=O and 966291+-383954 or 7135444-642931 h=O else t=d[B(367929-429795)]h={}end else if t<4498669-687844 then t=true t=t and 7042664-345031 or 5078142-175559 else g=b(g)h={}S=nil t=d[B(706580-768495)]end end end else if t<-964281+5117395 then if t<3506469-(-546079)then if t<4202862-254580 then if t<4401694-525579 then t=d[B(192553+-254501)]h={}else h={}t=d[B(839597+-901630)]end else h=B(-1048561+986495)t=d[h]c=j[m[773257-773256]]O={t(c)}h=O[-1021240+1021241]c=h S=O[603601-603599]t=11343978-384427 g=O[736911+-736908]end else if t<3638540-(-461479)then S=x()F=B(-920503+858378)g=x()j[S]=u[507416+-507415]c=x()j[g]=u[-868916-(-868918)]j[c]=u[219020-219017]O=B(599720-661936)h=d[O]z=-620314+26882913085440 E=j[m[-158509-(-158510)]]T=j[m[-952297-(-952299)]]H=T(F,z)O=E[H]t=h[O]O=V(9983609-(-445743),{m[-230442-(-230443)],m[-700366-(-700368)],c;g;S})S=b(S)g=b(g)h=t(O)t=d[B(57304+-119154)]c=b(c)h={}else X=366199+6816588854767 z=F i=B(-634623+572619)C=d[i]G=j[m[-656049+656050]]Y=j[m[1042336-1042334]]k=B(-606157-(-544117))a=Y(k,X)X=-875819+19311331639371 i=G[a]t=C[i]G=j[m[814678+-814677]]Y=j[m[-547646+547648]]k=B(-468119-(-406013))a=Y(k,X)i=G[a]C=t(i)i=j[m[-915842+915843]]G=j[m[455329-455327]]k=-1002318+30816215155547 a=B(844417+-906546)Y=G(a,k)t=i[Y]i=P C[t]=i i=j[m[-270943+270944]]G=j[m[-74705+74707]]P=nil a=B(610438-672424)k=149358+30841496940715 Y=G(a,k)t=i[Y]a=B(640634-702448)i=j[m[-842934-(-842938)]]k=18854492867884-(-660767)C[t]=i z=nil i=j[m[-452007-(-452008)]]G=j[m[146249-146247]]Y=G(a,k)t=i[Y]i=E C[t]=i t=-151601+13219474 C=nil end end else if t<605801+3920230 then if t<504015+3940182 then h=nil t=d[B(22198-84183)]h={h}else t=h and 3190093-(-673020)or-473355+8693041 end else if t<-92757+4639874 then t=-139070-(-943941)else c=j[m[-807542-(-807543)]]F=B(74328-136334)E=j[m[783409-783407]]S=u[-156985-(-156986)]T=j[m[-406620-(-406623)]]z=260239+13941994676429 H=T(F,z)O=E[H]g=c[O]t=g and 6767298-483839 or-742998+14314118 h=g end end end end end end else if t<-758477+7450595 then if t<6548660-540121 then if t<939993+4432834 then if t<4410938-(-503287)then if t<4875452-125021 then if t<96465+4566114 then if t<3765427-(-819099)then h=-796215-(-796219)t={h}h=B(-724513-(-662697))c=nil O=t t=d[h]T=j[m[1046329-1046328]]z=B(664506+-726731)P=4521187840765-(-554300)h=B(441402+-503290)H=j[m[48169-48167]]h=t[h]F=H(z,P)E=T[F]h=h(t,E)t=B(-816318-(-754367))t=h[t]g=nil P=-39903+15908543314126 T=j[m[66930-66929]]H=j[m[363510-363508]]z=B(641247-703406)F=H(z,P)E=T[F]t=t(h,E)h=B(-195003-(-133052))z=B(-835356+773262)P=27316324950144-683728 T=j[m[-665765+665766]]H=j[m[431542-431540]]h=t[h]F=H(z,P)E=T[F]T=B(-568217+506201)S=nil h=h(t,E)t=B(996458+-1058402)E=d[T]t=h[t]T={E(O)}t=t(h,U(T))O=nil h={}t=d[B(886692+-948744)]else t=d[B(-231021-(-169053))]h={}end else t=6705676-26133 T=nil E=nil end else if t<-119068+4970658 then z=B(722391+-784570)O=j[m[-300491-(-300494)]]P=15547146684505-60434 T=j[m[-677833-(-677834)]]H=j[m[-291720+291722]]F=H(z,P)E=T[F]h=O[E]t=g~=h t=t and 12278479-(-842905)or 658423+3897274 else t=d[B(695639+-757446)]h={}end end else if t<4800238-(-384915)then if t<-219017+5351521 then if t<150297+4787099 then h=166818+-166816 S=u[318475-318474]T=B(1037702+-1099657)H=956054+13719510614622 t=S[h]c=j[m[198743+-198742]]g=t O=j[m[926936+-926934]]E=O(T,H)h=c[E]t=S[h]c=t O=not g h=O t=O and 15190294-(-482125)or 11392635-244937 else t=4120218-513666 end else E=E+T F=not H h=E<=O h=F and h F=E>=O F=H and F h=F or h F=8257520-(-787494)t=h and F h=15631948-(-472213)t=t or h end else if t<4880267-(-360306)then T=j[E]h=T t=-756637+14575501 else h=B(122992-185215)S=B(-760112-(-698198))t=d[h]h=d[S]S=B(-687017+625103)d[S]=t S=B(-1016686+954463)t=-665275+12048903 d[S]=h S=j[m[564156+-564155]]g=S()end end end else if t<-105023+5735420 then if t<6209868-644349 then if t<6142871-612334 then if t<-133014+5587700 then w=b(w)r=b(r)s=b(s)W=b(W)q=b(q)L=nil t=7100894-(-586752)J=b(J)else h=B(713807-775691)t=j[m[-745439-(-745443)]]h=t[h]h=h(t,c)O=h E=not O h=E t=E and 672796+12441833 or 600952+1731706 end else h={}S=nil t=d[B(-356951-(-295121))]g=nil end else if t<-519403+6129622 then h={}t=d[B(-94467+32560)]else t=h and 15320607-807296 or 6680+7006430 end end else if t<-610811+6395636 then if t<848968+4814668 then v=B(-662619-(-600615))p=B(-947507+885331)t=599705+6573246 d3=d[v]y=j[m[687655-687654]]n=-373414+30022755363138 A=j[m[-295360+295362]]N=A(p,n)p=B(928664+-990606)v=y[N]L=d3[v]n=-134473+16372605512465 y=j[m[715474-715473]]A=j[m[-635749-(-635751)]]N=A(p,n)v=y[N]d3=L(v,H)h=d3 else t=true t=13495927-(-946476)end else if t<5214672-(-635903)then h=B(-385127-(-323243))t=j[m[-848740-(-848744)]]h=t[h]h=h(t,c)O=h E=not O t=E and 882618+3610070 or 849320+-816339 h=E else g=j[m[-528792+528794]]c=-405141+405262 S=g*c g=5996235700831-(-249992)h=S+g S=-700314+35184372789146 t=h%S g=-869454+869455 j[m[-613213+613215]]=t S=j[m[158241+-158238]]h=S~=g t=294295+9629668 end end end end else if t<6862099-608225 then if t<-857356+7066711 then if t<-50972+6165583 then if t<5286450-(-818692)then if t<97234+5969861 then O=g t=j[m[968230-968228]]Y=B(-155650+93526)H=j[m[766713-766710]]O=nil a=27787027266782-608851 P=B(-911854-(-849957))z=d[P]C=j[m[-817981-(-817985)]]i=j[m[78911+-78906]]G=i(Y,a)P=C[G]F=z[P]P=-236247-(-236248)i=j[m[652911-652908]]C=#i z=F(P,C)T=H[z]t[E]=T E=nil t=122292+10837259 else T=h h=E t=E and 912186+7414011 or 16530+1504060 end else h=B(655085+-716926)t=d[h]O=B(-83020-(-21082))z=Q(16980538-358167,{})S=j[m[-687076+687080]]F=B(-169704+107657)c=d[O]H=d[F]F={H(z)}T={U(F)}H=714898-714896 E=T[H]O=c(E)c=B(241624-303712)g=S(O,c)S={g()}h=t(U(S))g=j[m[950940-950935]]S=h h=g t=g and-586641+4094611 or-383203+16157861 end else if t<-661951+6824095 then i=974270+28261451240874 h=j[m[57749-57745]]F=j[m[-857786-(-857787)]]z=j[m[-150086+150088]]C=B(503016+-565059)P=z(C,i)H=F[P]T=O[H]E=h(T)t=not E t=t and 7120514-62690 or-587584+8956669 else t=v t=-183599+1133744 h=d3 end end else if t<6321071-80793 then if t<-942719+7172043 then t=d[B(701009+-763136)]h={}else h={}t=d[B(-928225+866075)]end else if t<6805403-558381 then z=B(-237226-(-175058))O=j[m[-352782+352785]]T=j[m[358085+-358084]]H=j[m[-917192+917194]]P=716727+19418351809435 F=H(z,P)E=T[F]h=O[E]t=g~=h t=t and 3727368-(-154119)or 957481+15809834 else P=z G=B(37986-99990)i=d[G]Y=j[m[402051-402050]]l=81029+30639139748662 a=j[m[-534498-(-534500)]]X=B(380340-442449)k=a(X,l)G=Y[k]X=B(-168572+106480)t=i[G]l=-828095+27025016116199 Y=j[m[-826001-(-826002)]]a=j[m[486586+-486584]]k=a(X,l)G=Y[k]P=nil k=B(-703510-(-641277))X=-644905+22168034082683 i=t(G)G=j[m[-933662+933663]]Y=j[m[-923919+923921]]a=Y(k,X)t=G[a]G=C k=B(-797026+734968)X=6947235332627-(-68240)i[t]=G G=j[m[-1000041+1000042]]Y=j[m[74673-74671]]a=Y(k,X)t=G[a]G=j[m[-601386-(-601390)]]i[t]=G C=nil k=B(-70088-(-8141))G=j[m[783868+-783867]]X=28268507111838-(-856525)Y=j[m[189248-189246]]a=Y(k,X)t=G[a]G=T i[t]=G i=nil t=-546214+11331289 end end end else if t<914315+5613434 then if t<7336932-962117 then if t<7220849-911648 then if t<392295+5890487 then t=h and 477336+2003711 or-314422+7475619 else c=j[m[509187+-509186]]z=939679+16237458900714 t=-926445+14497565 F=B(203975+-266182)E=j[m[247745+-247743]]T=j[m[398186-398183]]H=T(F,z)z=-746541+32134556016288 F=B(-67090+5117)O=E[H]g=c[O]c=B(-413425+351303)E=j[m[344056+-344054]]T=j[m[894475+-894472]]H=T(F,z)O=E[H]c=g[c]c=c(g,O)h=c end else t=Y()h=j[P]N=7072015937480-(-793877)d3=j[m[414345-414344]]v=j[m[-745218-(-745220)]]A=B(234469-296470)y=v(A,N)L=d3[y]t=h[L]t=t and 15746649-(-107475)or-812134+1034585 end else if t<5597672-(-890292)then t=j[m[-909545-(-909551)]]h=t(F)z=h P=not z t=P and 13728679-321575 or 10810309-(-210741)h=P else t=-676026+1258363 O=not c h=O end end else if t<-478046+7149334 then if t<7423762-767777 then Y=B(122806-184895)C=j[m[-894893-(-894894)]]a=13803726208712-796077 i=j[m[1041041+-1041039]]G=i(Y,a)Y=B(-1106964-(-1045103))P=C[G]z=T[P]a=-924507+21621937849007 t=13335202-(-872189)C=j[m[-196204+196205]]i=j[m[-598203-(-598205)]]G=i(Y,a)P=C[G]F=z~=P H=F else T=B(13224+-75105)h=B(-502733-(-440552))S=u[-681212-(-681213)]t=d[h]O=j[m[73358-73357]]T=O[T]E={T(O)}O={t(U(E))}t=13002116-357732 h=O[-146530-(-146531)]g=O[-486434+486436]c=O[-229754-(-229757)]O=h end else if t<831433+5853755 then c,T=O(g,c)t=c and-765570+16131371 or-183192-(-242388)else t=true t=t and 520552+14617506 or 7077355-(-622884)end end end end end else if t<32180+7667873 then if t<7479576-316367 then if t<-825146+7837732 then if t<500848+6220618 then if t<6359117-(-352671)then if t<6867206-165249 then l=1043986+-1043985 t=j[H]R=148956+-148950 X=t(l,R)t=B(-54017-8206)d[t]=X R=B(-30783-31440)l=d[R]R=-840724+840726 t=l>R t=t and 9328168-668403 or-659565+16765445 else h={}t=d[B(87738-149894)]end else t=P t=z and-794378+13899812 or 330180+9502671 h=z end else if t<-646766+7457718 then h={}t=d[B(146993+-209068)]else P=13453739756808-111760 O=j[m[134588+-134585]]T=j[m[58469+-58468]]z=B(-72957+10719)H=j[m[-176640-(-176642)]]F=H(z,P)E=T[F]h=O[E]t=g~=h t=t and 10108446-504949 or 1655013-597370 end end else if t<176471+6866426 then if t<6531890-(-501077)then if t<-321421+7340675 then O=j[m[828755-828752]]P=34727534436905-(-433410)T=j[m[-43973-(-43974)]]z=B(798746+-860895)H=j[m[397018-397016]]F=H(z,P)E=T[F]h=O[E]t=g~=h t=t and-742999+6977779 or 7795223-(-522002)else F=F+P i=not C H=F<=z H=i and H i=F>=z i=C and i H=i or H i=2539539-699759 t=H and i H=847873+9031341 t=t or H end else O=not c h=O t=293204+6891396 end else if t<462623+6603411 then t=d[B(-863146-(-801304))]h={}else O=j[m[-345960+345963]]T=j[m[-997909+997910]]P=332920+18468410035488 z=B(-872329+810406)H=j[m[45050-45048]]F=H(z,P)E=T[F]h=O[E]t=g~=h t=t and 6054096-(-156088)or 4630623-(-895451)end end end else if t<7370810-121787 then if t<711327+6528888 then if t<6714310-(-485293)then if t<241267+6941489 then p=-230161+24507198615461 L=x()j[L]=h t=j[L]d3=j[m[903351+-903350]]v=j[m[700118-700116]]A=B(183286-245176)N=628526+23255447098143 y=v(A,N)h=d3[y]N=B(-1039066-(-977001))B3=19697984791985-688605 v=j[m[-315578-(-315579)]]y=j[m[-533422-(-533424)]]A=y(N,p)d3=v[A]n=138003+30062920113052 t[h]=d3 p=-642372+3124469764850 t=j[L]d3=j[m[113318-113317]]N=-358901+13720968876778 t3=20925883492635-(-81141)v=j[m[211064-211062]]A=B(-882183+820321)y=v(A,N)h=d3[y]d3=H t[h]=d3 d3=j[m[374074-374073]]A=B(-905971+843872)v=j[m[920769-920767]]N=18974427565101-436650 y=v(A,N)h=d3[y]N=B(618554+-680693)v=j[m[-4236+4237]]y=j[m[-630836+630838]]A=y(N,p)p=B(-536513+474293)d3=v[A]y=j[m[-667967-(-667968)]]A=j[m[228749+-228747]]N=A(p,n)v=y[N]n=B(-379561+317658)A=j[m[-453354+453355]]N=j[m[670508+-670506]]p=N(n,B3)y=A[p]N=j[m[-64244+64245]]p=j[m[-556089+556091]]B3=B(-784109+722009)n=p(B3,t3)U3=6165608002315-731092 A=N[n]p=j[m[-862340+862341]]t3=B(687811+-749980)n=j[m[-915599-(-915601)]]B3=n(t3,U3)N=p[B3]B3=-120787+10465969826524 t={h;d3;v;y;A,N}d3=x()v=x()j[d3]=t n=B(861084+-923099)y=B(215634-277850)t=V(4914272-867471,{d3,L;i,m[-757948-(-757949)];m[-275103-(-275105)]})d3=b(d3)j[v]=t h=d[y]A=j[m[952893+-952892]]N=j[m[961888-961886]]p=N(n,B3)y=A[p]t=h[y]y=K(14739186-362156,{v,m[-312350+312351];m[302985+-302983]})v=b(v)h=t(y)B3=8145122407244-(-924548)L=b(L)y=B(-211101-(-148885))h=d[y]n=B(292871+-354893)A=j[m[-855198+855199]]N=j[m[-671682-(-671684)]]p=N(n,B3)y=A[p]t=h[y]y=K(-903266+4528104,{m[502505-502504];m[-20216-(-20218)],w;i})h=t(y)t=13397789-(-380930)else t=h and 11758480-(-446622)or 6621426-(-270373)end else h={}t=d[B(668008+-730002)]end else if t<6672595-(-571033)then O=not c h=O t=-36497+6297770 else t=j[m[831437-831436]]g=u[-1040453+1040455]S=u[-243166+243167]c=t t=c[g]t=t and-379552+5461321 or 8511237-(-977953)end end else if t<6791380-(-549092)then if t<-310863+7596663 then P=941730-941726 z=F>=P t=604252+14792129 h=z else S=u[-754640+754641]h=-837743-(-837745)H=23072941402522-819106 t=S[h]c=j[m[368886+-368885]]T=B(487286+-549492)O=j[m[-332435+332437]]E=O(T,H)g=t O=not g h=c[E]t=S[h]h=O c=t t=O and 11452571-403605 or 17000904-865193 end else if t<7097134-(-482760)then t=660571+2627943 T=nil E=nil else k=k+l W=not R h=k<=X h=W and h W=k>=X W=R and W h=W or h W=553546+1455919 t=h and W h=-27780+9973099 t=t or h end end end end else if t<8661535-203694 then if t<-542213+8764144 then if t<-647399+8488199 then if t<-832218+8670882 then if t<7259083-(-443935)then t=d[B(-659431-(-597620))]h={}else C=B(-1107519-(-1045615))i=-1042532+33732158662079 h=B(1030057+-1092155)H=B(-964092+902088)t=d[h]h=t(E)T=h h=d[H]F=j[m[903339+-903338]]z=j[m[-355179+355181]]P=z(C,i)X=16763905308023-(-420103)H=F[P]t=h[H]C=B(-459367-(-397263))F=j[m[164921+-164920]]k=B(18336+-80315)z=j[m[-767506-(-767508)]]i=14841697522003-(-690604)P=z(C,i)H=F[P]h=t(H)H=x()j[H]=h t=j[H]C=B(-994546+932713)F=j[m[911075-911074]]i=14880672772576-595663 z=j[m[-157197-(-157199)]]P=z(C,i)h=F[P]i=B(367951-429835)F=T t[h]=F h=B(448440+-510281)t=d[h]C=j[m[-860189+860192]]i=C[i]i=i(C,g)G=j[m[522787-522786]]Y=j[m[-402526+402528]]a=Y(k,X)k=21373462806654-891294 C=G[a]a=B(-1051716-(-989531))P=i[C]i=j[m[770364+-770363]]G=j[m[608245+-608243]]Y=G(a,k)a=5625597141617-(-370634)C=i[Y]z=P[C]C=j[m[-566000+566001]]Y=B(310211+-372372)i=j[m[-855750+855752]]G=i(Y,a)P=C[G]F=z[P]h=t(F)F=h t=F and 352830+6904429 or 15549249-152868 h=F end else h={}t=d[B(795244+-857418)]end else if t<7852284-(-277427)then i=B(400912-462852)F=nil G=409050+17929480446659 t=j[H]z=j[m[375044+-375043]]P=j[m[729320+-729318]]C=P(i,G)h=z[C]z=false i=B(-448558+386597)G=24796467689747-(-62471)t[h]=z Y=991888+25939110841502 T=nil t=j[H]z=j[m[782278-782277]]P=j[m[351259+-351257]]C=P(i,G)h=z[C]z=c G=B(902812-964954)t[h]=z h=j[H]P=j[m[-718434+718435]]C=j[m[-552032+552034]]i=C(G,Y)z=P[i]t=h[z]h=B(-1082770-(-1020728))h=t[h]z=Z(77696+15591067,{H})h=h(t,z)h=B(-457543+395657)t=j[H]h=t[h]h=h(t)t=12807405-(-28565)H=b(H)else t=j[m[-622477+622482]]z=j[m[-498501-(-498502)]]i=B(845442-907265)G=-677631+8293843265045 P=j[m[465440-465438]]C=P(i,G)F=z[C]H=O[F]z=j[m[676678-676677]]P=j[m[-678054-(-678056)]]i=B(-494465+432420)G=14143133675118-(-518987)C=P(i,G)F=z[C]T=H[F]i=14969607411168-(-623962)S=nil F=j[m[428864-428863]]C=B(-599139+537078)z=j[m[664695-664693]]c=nil P=z(C,i)O=nil H=F[P]E=T[H]g=nil h=t(E)t=d[B(446530+-508364)]h={}end end else if t<8902555-580680 then if t<8326102-45816 then t=j[m[115376+-115375]]E=B(-885473+823473)g=j[m[-1037195-(-1037197)]]T=24985383364288-620878 c=j[m[951773-951770]]O=c(E,T)h=B(578978-640986)h=t[h]S=g[O]h=h(t,S)h={}t=d[B(138167+-200240)]else R=7009677125064-530696 L=20850688212643-235702 t=j[m[-635591-(-635595)]]X=171059+6275971985207 O=-20118+20128 h=t(O)E=-812852+812872 O=h P=349599+6287337846224 t=j[m[-639481-(-639485)]]h=t(E)E=h h=B(-884276-(-822104))v=24963733209556-988268 z=B(800077+-862031)t=d[h]T=j[m[-585237-(-585238)]]H=j[m[995376+-995374]]i=2767442413248-(-982600)F=H(z,P)G=614631+28719958971222 Y=13221289243862-(-631606)h=T[F]T=E t[h]=T h=B(486073+-547889)C=18146600016314-(-411464)t=d[h]H=j[m[781962-781961]]F=j[m[-242686-(-242688)]]P=B(922191-984108)z=F(P,C)h=B(-516878-(-454990))T=H[z]h=t[h]h=h(t,T)T=h h=B(950635-1012451)t=d[h]h=B(761818-823706)F=j[m[213136+-213135]]z=j[m[-99191-(-99193)]]C=B(-230118-(-168105))P=z(C,i)H=F[P]h=t[h]h=h(t,H)H=h h=B(-451999+390183)i=B(-592796-(-530639))t=d[h]W=-420281+10711810506037 z=j[m[-454625+454626]]P=j[m[688362-688360]]h=B(716235+-778123)h=t[h]C=P(i,G)F=z[C]h=h(t,F)l=188628+7718715206966 F=x()j[F]=h G=B(827639-889671)h=B(290835-352651)t=d[h]P=j[m[-207464-(-207465)]]C=j[m[-845033+845035]]i=C(G,Y)z=P[i]h=B(89809+-151697)h=t[h]h=h(t,z)z=x()Y=546097020020-523126 j[z]=h a=B(415841+-478075)P=j[m[228407+-228406]]C=j[m[-860888-(-860890)]]G=B(-147226+85027)i=C(G,Y)G=B(601705+-663564)h=P[i]t=T[h]Y=158330+11492467518061 P=x()j[P]=t h=j[m[-435224+435225]]k=1243493491989-811730 C=j[m[443598+-443596]]i=C(G,Y)t=h[i]C=x()j[C]=t w=-597127+27908655484746 i=j[m[-620536-(-620537)]]G=j[m[92045+-92043]]Y=G(a,k)h=i[Y]k=B(-670844+608650)G=j[m[117040-117039]]Y=j[m[930246-930244]]a=Y(k,X)i=G[a]Y=j[m[345067+-345066]]a=j[m[451134-451132]]X=B(-263546+201667)k=a(X,l)G=Y[k]J=727760+19866943539539 a=j[m[-746826-(-746827)]]l=B(-1027973+966011)k=j[m[-69407+69409]]X=k(l,R)Y=a[X]k=j[m[558540+-558539]]X=j[m[-640516+640518]]R=B(-372708-(-310625))l=X(R,W)r=9100290039768-(-78005)a=k[l]X=j[m[790404+-790403]]l=j[m[-649583-(-649585)]]W=B(905310+-967511)R=l(W,r)W=-356889+29866181699692 k=X[R]t={h;i,G;Y,a,k}R=B(299938+-361919)i=x()a=B(708798+-770988)j[i]=t Y=d[a]k=j[m[-172858-(-172859)]]X=j[m[-847961-(-847963)]]l=X(R,W)a=k[l]r=1020827+30411718730678 W=B(960225-1022199)l=B(-476322-(-414236))R=393763+15345755478470 G=Y[a]a=j[m[-202139+202140]]k=j[m[185335-185333]]X=k(l,R)k=B(865110-927300)Y=a[X]h=G[Y]a=d[k]X=j[m[512637-512636]]l=j[m[451338+-451336]]s=-472895+11278415104962 R=l(W,r)k=X[R]R=B(-1105350-(-1043247))Y=a[k]k=j[m[-659626+659627]]X=j[m[-135456+135458]]W=195803+10228955665856 l=X(R,W)N=B(-674892-(-612864))a=k[l]X=B(-26463-35727)G=Y[a]k=d[X]l=j[m[528753-528752]]q=2360908249738-226879 R=j[m[919634-919632]]r=B(-720067+658207)W=R(r,J)X=l[W]a=k[X]X=j[m[423687+-423686]]r=698981+11135890221532 l=j[m[-983981+983983]]W=B(-677780+615633)R=l(W,r)l=B(381414-443604)k=X[R]Y=a[k]X=d[l]R=j[m[-670132+670133]]W=j[m[-700377-(-700379)]]J=B(-740340-(-678227))r=W(J,q)l=R[r]J=-809994+2923272954203 k=X[l]r=B(22547+-84596)l=j[m[-68818+68819]]R=j[m[371519-371517]]W=R(r,J)q=B(711009+-773102)R=B(-666703+604513)X=l[W]a=k[X]l=d[R]W=j[m[-290285-(-290286)]]r=j[m[-462130-(-462132)]]J=r(q,s)R=W[J]X=l[R]R=j[m[-580203+580204]]W=j[m[-177962+177964]]J=B(-560569-(-498519))d3=-724601+6463916513850 q=561628+87940050508 r=W(J,q)s=B(449943-511939)W=B(360618-422808)l=R[r]k=X[l]R=d[W]r=j[m[917149+-917148]]J=j[m[712889-712887]]q=J(s,w)s=14627165265729-(-670554)W=r[q]l=R[W]q=B(369648+-431630)W=j[m[-687063+687064]]r=j[m[-994771-(-994773)]]w=-100616+7453426308758 J=r(q,s)R=W[J]X=l[R]t={h;G,Y,a;k;X}G=x()j[G]=t J=B(865674+-927511)t=I(13828387-473487,{m[-508778+508779];m[385644-385642];G;C})Y=t t=D(-1039241+2089107,{m[-337875+337876];m[375972-375970];G,C})r=273163+3999771335739 a=t t=M(1887237-1008078,{m[635922-635921],m[-440614-(-440616)];z})X=j[m[1039338-1039337]]l=j[m[551039+-551037]]k=t W=B(-236341+174143)q=-622965+30129480120387 R=l(W,r)h=X[R]R=j[m[131251+-131250]]W=j[m[1027247-1027245]]X=false r=W(J,q)q=B(-135958-(-74037))l=R[r]R=-793432-(-793438)p=265222+26352259179497 s=176639+6923043592856 W=481148-481147 J=-206634+7365485802639 t=k(h,X,l,R,W)l=j[m[101198-101197]]r=B(196864+-258704)X=t R=j[m[-254470+254472]]W=R(r,J)h=l[W]W=j[m[-475367-(-475368)]]l=false r=j[m[-173625-(-173627)]]J=r(q,s)r=-450660-(-450661)R=W[J]W=828945-828939 t=k(h,l,R,W,r)l=t q=-629023+6223522653297 J=B(37469-99538)R=j[m[467127-467126]]W=j[m[-478380+478382]]s=B(-534499+472560)y=672310+23832139491619 r=W(J,q)h=R[r]r=j[m[582155-582154]]R=false J=j[m[-272392-(-272394)]]q=J(s,w)w=B(-388489-(-326262))J=759659-759658 W=r[q]r=782449-782445 q=B(-169201+107048)t=k(h,R,W,r,J)R=x()j[R]=t s=34831698782584-125469 W=j[m[501340+-501339]]r=j[m[-142812+142814]]J=r(q,s)h=W[J]W=false J=j[m[-572413-(-572414)]]q=j[m[-244885-(-244887)]]s=q(w,L)r=J[s]q=961655+-961654 s=B(-712712+650584)w=-22138+29331890195412 J=-556320-(-556324)t=k(h,W,r,J,q)r=j[m[-709258-(-709259)]]J=j[m[397512-397510]]W=t q=J(s,w)h=r[q]r=false q=j[m[-761378+761379]]s=j[m[467227-467225]]L=B(787114+-849005)w=s(L,d3)J=q[w]s=-1024132-(-1024133)d3=B(153463-215684)q=212681+-212677 t=k(h,r,J,q,s)L=-1002642+4977647637919 w=B(438219-500414)J=j[m[-446760-(-446761)]]q=j[m[273761-273759]]s=q(w,L)h=J[s]s=j[m[-1024240+1024241]]r=t w=j[m[-154911+154913]]L=w(d3,v)q=s[L]w=-340496-(-340497)d3=50310+2121040723797 s=895891+-895885 v=B(581863+-643964)J=false t=k(h,J,q,s,w)L=B(-290385+228493)J=t q=j[m[957039-957038]]s=j[m[452241-452239]]w=s(L,d3)h=q[w]q=false w=j[m[-1004466+1004467]]L=j[m[833513-833511]]d3=L(v,y)s=w[d3]w=19903+-19898 L=-541908+541914 t=k(h,q,s,w,L)d3=B(-964383-(-902211))q=t t=V(4758073-694265,{m[356720-356719],m[-150752+150754]})s=t w=x()t=K(12814180-(-919323),{m[-462767+462768],m[933309-933307],P;F})j[w]=t L=d[d3]v=j[m[505257+-505256]]y=j[m[-328273-(-328275)]]A=y(N,p)d3=v[A]h=L[d3]d3=j[m[898102-898101]]v=j[m[-96515+96517]]A=B(-958078+896251)N=13697134484472-(-949490)y=v(A,N)L=d3[y]t=h~=L t=t and 6963796-631311 or 14712976-934257 end else if t<9069809-715070 then t=2455731-935141 h=T else F=B(-8902-53330)z=40150+31809940806918 E=j[m[-392199-(-392200)]]T=j[m[637395-637393]]H=T(F,z)h=E[H]t=S[h]h=B(495117-557060)H=j[m[228296-228295]]F=j[m[-930850-(-930852)]]P=B(-958617-(-896587))E=t h=E[h]C=-149740+8472344631381 z=F(P,C)T=H[z]h=h(E,T)t=not h t=t and 12368998-(-267038)or 9592368-(-239345)end end end else if t<8697032-106048 then if t<8445372-(-126165)then if t<-421706+8917533 then if t<8477020-(-6787)then v=j[g]t=v and 11156098-(-632954)or-772453+15336638 d3=v else h=B(243994+-306060)t=d[h]S=u[-558951-(-558952)]O=j[m[-116353-(-116354)]]E={t(O)}h=E[-790726-(-790727)]O=h g=E[234806-234804]t=-765180+11245611 c=E[988762-988759]end else S=j[m[-48004+48005]]h=#S S=-85532-(-85532)t=h==S t=t and 378862+5602524 or 9836955-1016177 end else if t<7555655-(-1026800)then S=nil t=d[B(-545734+483569)]g=nil h={}else t=d[B(331778-393967)]h={}end end else if t<8813541-126988 then if t<-278799+8948854 then W=B(863353+-925267)l=B(625048-686986)t=d[l]R=d[W]l=t(R)t=B(484669+-546892)d[t]=l t=-147136+13218130 else g=b(g)t=d[B(-128910-(-66830))]h={}S=nil end else if t<81680+8646634 then R=#G a=-913351-(-913352)Y=c(a,R)a=T(G,Y)Y=nil J=207292-207291 R=j[i]t=13217894-73673 r=a-J W=H(r)R[a]=W a=nil else t=true h={t}t=d[B(947528+-1009428)]end end end end end end end else if t<-768576+14032504 then if t<599807+10559190 then if t<10279107-261172 then if t<177906+9537534 then if t<-255904+9712061 then if t<819237+8179287 then if t<9171198-300218 then if t<885505+7896875 then h=B(-322247-(-260239))t=j[m[15873+-15872]]S=j[m[-683091+683093]]h=t[h]h=h(t,S)h={}t=d[B(937840+-1000051)]else c=B(218241-280262)t=d[B(533257+-595202)]g=d[c]c=B(573948+-635936)S=g[c]c=j[m[-310214+310215]]g={S(c)}h={U(g)}end else F=143369+21558957864750 H=B(-185391-(-123365))c=B(-284094+222073)g=d[c]O=j[m[-879385-(-879387)]]h={}E=j[m[183785+-183782]]T=E(H,F)c=O[T]t=g[c]c=j[m[895771+-895770]]g=t(c,S)t=d[B(-451037-(-389028))]S=nil end else if t<10305376-944813 then G=B(849914-911797)Y=1704108705482-(-719951)z=B(-935321-(-873424))F=E h=d[z]P=j[m[-480175+480176]]C=j[m[-96226-(-96228)]]i=C(G,Y)z=P[i]F=nil t=h[z]z=-846931-(-846932)P=#g h=t(z,P)z=h h=B(-1046037+983925)h=g[h]h=h(g,z,z)t=c..h c=t z=nil t=4452651-(-706941)else h=j[m[963502-963501]]g=j[m[-319965+319967]]E=B(631279+-693497)T=7606110554432-(-492693)c=j[m[-500688+500691]]O=c(E,T)S=g[O]t=h[S]h=B(207242+-269231)h=t[h]h=h(t)h=B(1000059+-1061945)t=j[m[774435+-774434]]h=t[h]h=h(t)h={}t=d[B(-505988+443898)]end end else if t<-715422+10345976 then if t<9182290-(-414569)then if t<-579341+10089362 then E=35184371111402-(-977430)t={}j[m[770209+-770207]]=t h=j[m[-634813+634816]]O=h F=B(951627+-1013543)h=g%E j[m[896323+-896319]]=h H=340830-340575 T=g%H H=84182+-84180 t=3301471-37970 E=T+H j[m[-827205+827210]]=E H=d[F]F=B(-94271-(-32318))T=H[F]H=T(S)T=B(-525512+463510)c[g]=T T=-375681-(-375847)F=-215934+215935 z=H P=659671+-659670 C=P P=270204+-270204 i=C<P P=F-C else t={}S=t c=j[m[-150647+150656]]g=-613728+613729 O=c c=398466-398465 E=c c=-733697-(-733697)t=820802-(-59974)T=E<c c=g-E end else h={}t=d[B(237259+-299237)]end else if t<108490+9560612 then h=j[m[-411811+411812]]H=j[m[-498496+498498]]z=B(610741+-672856)P=452328+19373462797397 F=H(z,P)G=954388+8365281705763 t=h[F]Y=B(107325+-169376)z=j[m[-878611+878612]]i=B(-999744-(-937794))P=j[m[509829+-509827]]C=P(i,G)F=z[C]H=E[F]P=B(-676971+614940)z=d[P]C=j[m[-559479+559480]]a=25083033559527-177223 i=j[m[346163+-346161]]G=i(Y,a)P=C[G]C=-137009+137009 i=972298-972298 F=z[P]P=-156338-(-156340)z=F(P,C,i)h=H+z T[t]=h t=13304031-(-531134)else t=h and 483602+13536496 or 5482348-696305 end end end else if t<10576825-679299 then if t<295331+9536419 then if t<8995837-(-801254)then if t<-330123+10119279 then h=j[m[132170+-132165]]z=x()t=h[H]j[z]=t t=j[z]t=t and 10526530-424272 or 59244+7780297 else t=d[B(119545-181390)]h={}end else T=j[m[608525+-608524]]z=B(-416567-(-354355))t=B(-1062476-(-1000409))P=6774215979725-435835 H=j[m[230481+-230479]]F=H(z,P)t=E[t]h=T[F]t=t(E,h)i=B(811288-873219)T=x()j[T]=t F=-326279-(-326281)H=729221-729220 h=j[T]t=h[H]H=73893-73891 h=B(-343416-(-281304))h=t[h]h=h(t,H)t=B(115653+-177813)t=h[t]t=t(h)h=j[T]H=t t=h[F]G=562915+3697584910294 z=j[m[-857848-(-857849)]]F=t P=j[m[-492632+492634]]C=P(i,G)h=z[C]t=H==h t=t and-254013+10019489 or 5457021-(-987996)end else if t<9090466-(-743570)then P=B(341425-403441)z=d[P]h=z t=-314221+13419655 else t=9644565-(-765316)end end else if t<277739+9672342 then if t<-875750+10811578 then t=400135+14747380 g=j[m[-258945-(-258948)]]c=-435116+435353 S=g*c g=472828-472571 h=S%g j[m[619550-619547]]=h else X=j[g]k=X t=X and-156706+13035908 or 491287+14805736 end else if t<-77772+10046884 then h=B(896834+-958881)c=I(14832093-(-717454),{g,m[905750+-905748],m[502245+-502242]})t=d[h]h=t(c)t=-514058+9189689 else O=B(-854575-(-792353))F=B(-670527-(-608568))G=9689986588087-(-259049)t=j[m[-556142+556143]]S=j[m[24365+-24363]]c=d[O]E=j[m[59137+-59134]]T=j[m[-715708+715712]]z=3176897795241-773858 H=T(F,z)O=E[H]g=c[O]Y=772271+8154542884390 O=-498414+498415 F=B(607622+-669812)H=d[F]z=j[m[563371-563368]]P=j[m[-544718-(-544722)]]i=B(428532-490715)C=P(i,G)i=30835701546129-967803 F=z[C]h=B(153583-215431)T=H[F]F=j[m[800523+-800520]]C=B(867534+-929385)z=j[m[803637-803633]]P=z(C,i)G=B(828450+-890521)H=F[P]z=B(467331-529521)E=T[H]F=d[z]P=j[m[251098+-251095]]C=j[m[649209+-649205]]i=C(G,Y)z=P[i]H=F[z]G=34653718313618-(-754806)z=j[m[221803+-221800]]i=B(-1022292-(-960236))h=t[h]P=j[m[-726267-(-726271)]]C=P(i,G)F=z[C]T=H[F]z=-951575+32956742304009 F=B(524541+-586507)c=g(O,E,T)E=j[m[-208798-(-208801)]]T=j[m[875199-875195]]H=T(F,z)O=E[H]E=1024901-1024900 g={[O]=E}E=B(-808984+746798)h=h(t,S,c,g)S=h t=B(-488857+426971)t=S[t]t=t(S)T=31986682978447-(-858527)g=j[m[849278+-849275]]c=j[m[-532463-(-532467)]]O=c(E,T)h=g[O]t=S[h]h=B(-522634-(-460645))h=t[h]h=h(t)t=j[m[149359-149354]]h=B(684376+-746589)h=t[h]S=nil h=h(t)h={}t=d[B(-386633-(-324668))]end end end end else if t<-113181+10796185 then if t<9471022-(-943164)then if t<10630169-412940 then if t<-306028+10426536 then if t<1016528+9055373 then S=u[-20569+20570]E=B(672318+-734254)g=j[m[-735770+735771]]c=j[m[700557-700555]]T=-275395+35007629390704 O=c(E,T)h=g[O]t=S[h]g=t t=not g t=t and 4075585-(-540511)or-302336+15567788 else G=B(687386+-749559)Y=21977911111640-(-915490)t=j[T]P=j[m[-386185-(-386186)]]C=j[m[-838422+838424]]i=C(G,Y)h=P[i]P=c t[h]=P P=K(-717701+12040910,{z;T})h=B(-839875-(-777828))t=d[h]h=t(P)t=26448+7813093 end else v=t N=-125166+125167 A=L[N]N=false y=A==N d3=y t=y and 904025+-222442 or 1025250+5183352 end else if t<11352872-1000824 then h=B(860538+-922585)c=Q(309424+8472622,{g,S})t=d[h]h=t(c)t=349316+15529818 else t=-971410+13615794 E=nil T=b(T)end end else if t<437745+10018607 then if t<10212125-(-221891)then t=12735599-202137 else t=d[B(179481+-241538)]h={}end else if t<954129+9572497 then c,T=O(g,c)t=c and 12223409-(-868313)or-480907+9389526 else O,T=g(c,O)t=O and 3209062-(-131273)or 4278845-1023 end end end else if t<10554000-(-453970)then if t<10776708-(-46877)then if t<860662+9871812 then if t<-888394+11577735 then F=P l=B(608701-670617)X=d[l]l=B(-48110+-14100)k=X[l]X=k(S,F)k=j[m[212166+-212160]]l=k()a=X+l F=nil Y=a+T a=-885206+885462 G=Y%a T=G l=488621-488620 a=c[g]t=492911+2770590 X=T+l k=O[X]Y=a..k c[g]=Y else g=u[-873427-(-873429)]c=g h=B(-146695-(-84535))t=j[m[-72445+72446]]S=u[-211652-(-211653)]h=S[h]h=h(S)S=nil g=nil t[h]=c t=d[B(-431832+369699)]h={}end else z,C=H(F,z)t=z and 5907978-(-339714)or 14122748-(-136697)end else if t<-953401+11909180 then E=j[m[-941143-(-941144)]]F=B(-299771-(-237694))T=j[m[-149457+149459]]z=33313558523698-520858 H=T(F,z)G=20825677175881-(-543128)h=E[H]t=O[h]T=j[m[902973+-902972]]z=B(665411+-727331)i=B(-311808-(-249993))P=-761155+33452481010204 H=j[m[-404799-(-404801)]]h=B(-92907-(-31023))F=H(z,P)h=t[h]E=T[F]h=h(t,E)H=j[m[-20198+20201]]E=h z=j[m[-546385-(-546386)]]P=j[m[372727-372725]]C=P(i,G)F=z[C]T=H[F]h=T t=T and 1022933+783757 or 5443943-(-634394)else g,E=c(S,g)t=g and-668578+6686703 or 99634+874199 end end else if t<11588875-531515 then if t<10645703-(-376078)then t=13882520-475416 C=j[m[126568-126561]]P=z~=C h=P else t=h and 9857050-61763 or 15108563-(-579367)end else if t<-256126+11407707 then t=901284+14771135 O=not c h=O else H=B(522459-584451)t=B(-661573-(-599413))g=B(753191-815257)S=u[883402-883401]t=S[t]t=t(S)h=d[g]E=j[m[302746-302745]]H=E[H]T={H(E)}S=t E={h(U(T))}O=E[683429+-683426]c=E[630415-630413]g=E[-303247+303248]t=-483533+11164913 end end end end end else if t<544764+11841338 then if t<730599+11243867 then if t<172520+11179232 then if t<10293644-(-1025116)then if t<-1031189+12272759 then if t<12181404-971295 then h=455335-455333 i=-100624+29335380508268 S=u[-580427+580428]t=S[h]T=B(558167+-620386)c=j[m[-305908+305909]]H=-516602+14377274833952 C=B(-343984+281802)O=j[m[33986+-33984]]E=O(T,H)h=c[E]g=t t=S[h]c=t g=nil t=j[m[701696-701693]]F=j[m[687994-687993]]z=j[m[-178279-(-178281)]]P=z(C,i)H=F[P]i=24642507110781-(-488278)C=B(930964+-992793)T=c[H]h=B(-15413+-46783)F=j[m[178284-178283]]z=j[m[148618+-148616]]P=z(C,i)H=F[P]E=T[H]h=t[h]H=j[m[-471695+471696]]C=24521442289193-440719 F=j[m[635193+-635191]]P=B(-603876+541924)z=F(P,C)T=H[z]c=nil S=nil O=E[T]h=h(t,O)t=d[B(263405-325331)]h={}else t=d[B(-492860+430750)]h={}end else E=B(-947159-(-884969))z=B(860177-922348)O=d[E]T=j[m[-533375-(-533377)]]H=j[m[-821824-(-821827)]]P=-491037+10144168022160 F=H(z,P)E=T[F]c=O[E]E=j[m[656906-656904]]t=B(-587830-(-525775))T=j[m[995035+-995032]]z=455524+20190302040405 F=B(314987-377226)H=T(F,z)t=g[t]O=E[H]h=c[O]t=t(g,h)t=1784679-451029 end else if t<538344+10787122 then t=j[m[-838361+838362]]S=j[m[53371+-53369]]h=t(S)t=d[B(893921-956029)]h={}else T=B(77370+-139198)h=-695584+695586 S=u[40093-40092]t=S[h]g=t c=j[m[-1035009+1035010]]O=j[m[237558-237556]]H=-713391+29306065377277 E=O(T,H)h=c[E]t=S[h]O=not g h=O c=t t=O and 12089556-(-705299)or-451617+2652275 end end else if t<10471022-(-1038843)then if t<-294306+11768045 then if t<11719949-328229 then t=true t=t and 5018550-(-263429)or-1031225+12261877 else T=B(-371837-(-310021))C=397522+4435837531967 P=B(-435978+373910)E=d[T]H=j[m[-29908+29909]]F=j[m[-12458+12460]]z=F(P,C)T=H[z]O=E[T]z=B(188363-250563)T=j[m[-452494+452495]]H=j[m[-577666-(-577668)]]P=-593972+1381575299767 F=H(z,P)S=nil E=T[F]h=O[E]E=j[m[586390+-586389]]z=927198+22856503804853 c=nil T=j[m[-556559+556561]]F=B(988085+-1050240)H=T(F,z)O=E[H]t=h[O]h=B(32356+-94340)h=t[h]h=h(t)g=nil t=d[B(693611-755504)]h={}end else h=324377+-324375 S=u[112057+-112056]T=B(-723563-(-661688))t=S[h]C=1492146618153-1047667 c=j[m[-385910+385911]]g=t H=381912+34530711415543 O=j[m[350309-350307]]E=O(T,H)h=c[E]t=S[h]c=t c=nil t=j[m[-778917-(-778920)]]h=B(683513+-745397)E=B(506110-568226)P=B(-647127+585194)h=t[h]O=d[E]h=h(t,O)O=h t=nil h=j[m[-198092-(-198096)]]E=t H=j[m[-1023837-(-1023838)]]F=j[m[66820-66818]]z=F(P,C)T=H[z]t=h[T]h=B(801720+-863840)h=t[h]i=B(116904-179084)h=h(t)E=h t=j[m[-1024487+1024491]]G=-1034904+14774528959863 z=j[m[-534393-(-534394)]]P=j[m[755239+-755237]]C=P(i,G)F=z[C]C=B(-685835-(-623963))H=O[F]z=B(259976-322096)T=B(-249543-(-187559))T=t[T]z=H[z]F={z(H)}H=B(-396119+333903)i=955243+10784692207667 O=nil T=T(t,U(F))T=d[H]F=j[m[-457687-(-457688)]]S=nil z=j[m[-758224-(-758226)]]P=z(C,i)H=F[P]h={}t=T[H]i=843442+34873506013373 T=t()C=B(-707232-(-645419))T=1005055-1005053 F=j[m[729514-729513]]G=269275+9851630564880 z=j[m[232334-232332]]P=z(C,i)H=F[P]z=-97535-(-97543)i=B(184865+-247102)F=-19891-(-19895)t={T,H;[F]=z}H=B(257745-319561)T=t t=d[H]z=j[m[899463+-899462]]P=j[m[-488264+488266]]C=P(i,G)F=z[C]H=B(-393107+331219)H=t[H]H=H(t,F)G=-493478+19078536260186 z=j[m[392680-392679]]i=B(115504+-177708)P=j[m[982201-982199]]g=nil C=P(i,G)F=z[C]i=B(257943+-319853)t=B(-763839+701888)G=-719179+13832269681268 t=H[t]t=t(H,F)H=B(-759178+697227)z=j[m[877279-877278]]P=j[m[-838102-(-838104)]]C=P(i,G)H=t[H]F=z[C]z=B(-234003-(-171987))H=H(t,F)F=d[z]i=B(-484666-(-422741))t=B(-143252+81308)z={F(T)}t=H[t]t=t(H,U(z))F=B(631691-693907)H=d[F]z=j[m[694371+-694370]]G=24821239608637-739351 P=j[m[96416+-96414]]C=P(i,G)F=z[C]t=H[F]i=B(181070+-243075)H=t()G=29010274907575-49395 H=j[m[-1015718-(-1015722)]]z=j[m[-180295-(-180296)]]T=nil P=j[m[-802352-(-802354)]]C=P(i,G)F=z[C]t=H[F]H=B(-478522-(-416538))H=t[H]H=H(t,E)t=d[B(-318995-(-256876))]E=nil end else if t<12256381-614204 then h={}t=d[B(944001-1005994)]else y=294013-294012 v=L[y]t=375587+14188598 d3=v end end end else if t<11621413-(-542153)then if t<11534411-(-578217)then if t<11921593-(-146285)then if t<10963523-(-1024458)then F=B(952602+-1014414)O=B(951980+-1013796)z=561761+2946418569979 c=d[O]S=u[-42788+42789]E=j[m[-661272-(-661273)]]T=j[m[-1026059-(-1026061)]]H=T(F,z)F=350853+18216119862941 O=E[H]H=B(-352569-(-290491))g=c[O]O=j[m[-466104-(-466105)]]E=j[m[-917730+917732]]T=E(H,F)c=O[T]h=g[c]T=B(253062+-315196)c=j[m[-506140-(-506141)]]H=6531764487467-784714 O=j[m[-468438-(-468440)]]E=O(T,H)g=c[E]H=-592661+25929298016831 t=h[g]c=j[m[-908254+908255]]T=B(313896+-375931)O=j[m[998908+-998906]]E=O(T,H)h=B(-546088+484204)h=t[h]g=c[E]h=h(t,g)g=h t=g and 405739+13596576 or 5064762-(-478064)else Y={}a=x()j[a]=Y R=Q(8115841-(-392467),{a,z,P,E})E=b(E)c=nil L=B(-63055+878)Y=x()r=B(-56049-5909)W=x()j[Y]=R F=nil J={}s=B(638872-700882)R={}y=nil j[W]=R R=d[r]w=j[W]q={[s]=w,[L]=y}r=R(J,q)j[g]=r H=nil T=nil R=D(-288122+7531956,{W,a;i,z,P,Y})W=b(W)P=b(P)C=nil P=B(551739+-613856)j[O]=R G=nil w=272697+10729448 a=b(a)a=-457894+8671700888 E=B(-1097791-(-1035975))z=b(z)c=d[E]H=j[g]Y=b(Y)F=j[O]C=22268836910672-781775 E=B(877652-939540)z=F(P,C)i=b(i)T=H[z]E=c[E]E=E(c,T)i=206229+22982878086201 T=B(596522-658338)s=8671886072-644536 c=x()G=-455413+27383235192004 j[c]=E E=d[T]L=518082+22643954925934 F=j[g]T=B(306613-368501)T=E[T]q=9174310116-673785 z=j[O]C=B(106230-168337)P=z(C,i)J=8671872373-796823 H=F[P]T=T(E,H)E=x()j[E]=T H=B(880494+-942310)Y=850732+20675995675248 i=B(67618+-129496)T=d[H]H=B(360128+-422016)z=j[g]H=T[H]P=j[O]C=P(i,G)F=z[C]H=H(T,F)T=x()j[T]=H W=7045161007-(-14009)F=j[E]P=j[g]C=j[O]G=B(514875-577099)i=C(G,Y)h={}R=9201266141-(-504489)C=9201316853-(-453777)z=P[i]H=F[z]z=-316144+8350475880 i=754530+8349324007 F=x()j[F]=H G=8670827299-(-370553)P=885140+5099893794 Y=8349478057-(-637335)t=d[B(-478687-(-416712))]H={z,P,C,i;G,Y,a,R;W,J,q;s,w}P=171503+8349988233 G=8350368013-289476 J=-693630+7045868646 s=9174637409-1001078 a=8671057273-(-184263)W=-874931+9202645561 R=-526980+8671769974 i=236726+9201533904 w=815736+10186409 z=x()Y=774550+8349340842 j[z]=H C=5101569169-790235 q=-966690+8672042240 H={P,C;i,G;Y,a,R,W;J,q,s;w}a=D(-663667+15563033,{g,O})P=D(9279587-787325,{z,g,O})C={}i=x()j[i]=C w=B(-431848+370024)C=x()Y=I(16294429-365882,{g;O;c})G=f(-866120+12017757,{E;g,O})j[C]=G G=x()j[G]=Y Y=x()j[Y]=a J=j[g]q=j[O]a=f(254352+10443825,{i})s=q(w,L)W=J[s]J=Q(13258884-(-255444),{g,O,i})R=a(W,J)J=j[g]L=15946144086172-(-926821)w=B(-533526-(-471646))q=j[O]s=q(w,L)W=J[s]w=B(343671-405819)L=1637896819271-315213 J=f(1265075-(-438434),{F;g;O})R=a(W,J)J=j[g]q=j[O]s=q(w,L)L=25525934595590-225176 P=nil w=B(-998929+936699)W=J[s]J=V(11978853-(-170229),{F;g,O})R=a(W,J)J=j[g]q=j[O]s=q(w,L)W=J[s]J=K(4955820-401314,{F;g,O})R=a(W,J)w=B(344145-405967)J=j[g]L=36657+19447299626030 q=j[O]s=q(w,L)w=B(-375384-(-313303))W=J[s]J=Q(12235769-253806,{g;O})R=a(W,J)L=-36360+27207760265093 J=j[g]q=j[O]H=nil s=q(w,L)W=J[s]w=B(-1081837-(-1019774))J=f(15522721-(-712894),{g,O})R=a(W,J)L=10737406058595-216284 J=j[g]q=j[O]s=q(w,L)W=J[s]J=V(6297156-(-1008465),{g;O;F,E,G})w=B(-1041251-(-979287))R=a(W,J)L=9931738226201-(-865271)J=j[g]q=j[O]s=q(w,L)L=-823416+14341311638158 W=J[s]J=V(11767752-571459,{g;O,F})R=a(W,J)J=j[g]q=j[O]w=B(-60263-1659)s=q(w,L)W=J[s]J=K(71588+847412,{g,O;E})R=a(W,J)J=j[g]w=B(471270+-533354)q=j[O]L=26885959608181-161422 s=q(w,L)W=J[s]L=-195612+28209543475052 J=K(849117+10635203,{g;O,E;F})w=B(-1108087-(-1046216))R=a(W,J)J=j[g]q=j[O]s=q(w,L)W=J[s]J=V(851726+-828104,{g;O,F;E})w=B(740556-802527)L=952997701140-828505 R=a(W,J)J=j[g]q=j[O]s=q(w,L)L=-541347+28131886003662 W=J[s]w=B(1044106+-1106178)J=V(6539991-(-122775),{T,g,O;F})R=a(W,J)J=j[g]q=j[O]s=q(w,L)W=J[s]J=V(12211247-128369,{g,O,F})R=a(W,J)y=30489082509798-(-458127)J=j[g]L=250394+11769177391950 w=B(-526871-(-464995))q=j[O]s=q(w,L)W=J[s]w=B(-100163-(-38078))L=32533959162419-(-950522)J=K(609689+4304739,{g;O,F})R=a(W,J)J=j[g]q=j[O]T=b(T)s=q(w,L)W=J[s]J=V(147642+11182964,{g;O,F})R=a(W,J)J=j[g]q=j[O]L=812033+5729874830955 w=B(-720510+658616)s=q(w,L)W=J[s]J=I(818831+2876582,{g;O;F})w=B(-212868-(-151036))R=a(W,J)J=j[g]L=-259917+4633946046394 q=j[O]s=q(w,L)W=J[s]J=V(942480+14233718,{g,O,F})R=a(W,J)J=j[g]w=B(613858-676063)q=j[O]L=-183584+18240700165709 s=q(w,L)w=B(743560-805678)L=600309+3348750703906 W=J[s]J=K(208195+2440157,{c,g;O})R=a(W,J)J=j[g]q=j[O]s=q(w,L)W=J[s]J=I(12192504-24800,{c;g,O})R=a(W,J)J=j[g]G=b(G)q=j[O]w=B(-538372+476163)L=-295008+8937750466721 s=q(w,L)W=J[s]J=K(655529+13735812,{g;O,F,Y})R=a(W,J)R=x()W=f(341247+15677572,{z})j[R]=W z=b(z)W=j[c]L=B(821522-883409)a=nil q=j[g]c=b(c)Y=b(Y)s=j[O]w=s(L,y)J=q[w]q=I(63486+9984253,{g;O;E,R,i,C,F})W[J]=q R=b(R)g=b(g)i=b(i)O=b(O)C=b(C)E=b(E)F=b(F)end else h=-442889+442891 S=u[-26653+26654]t=S[h]g=t H=7951221600027-(-941915)T=B(-53393-8836)c=j[m[886880+-886879]]O=j[m[885088-885086]]E=O(T,H)h=c[E]O=not g t=S[h]c=t t=O and 946026+6238574 or-188583+7226624 h=O end else if t<12022840-(-123666)then c=O(g,c)t=c and 906598+13456749 or 1667289-(-996716)else S=u[-295634-(-295635)]z=234140686429-563184 c=j[m[977727-977726]]F=B(434989+-497037)E=j[m[972405+-972403]]T=j[m[-796036+796039]]H=T(F,z)O=E[H]g=c[O]t=g and 2155431-(-294729)or 16070870-308162 h=g end end else if t<12213538-(-13751)then if t<346115+11850654 then t=j[m[141260-141259]]T=B(-107402-(-45545))c=j[m[-615819+615821]]H=21790523303578-(-49417)O=j[m[-290220+290223]]E=O(T,H)T=B(213812-275731)h=B(-495380-(-433429))g=c[E]h=t[h]H=14092305742157-(-696405)h=h(t,g)S=u[1030983-1030982]t=B(-1022738+960854)c=j[m[468153-468151]]O=j[m[-360089+360092]]t=h[t]E=O(T,H)g=c[E]t=t(h,g)g=x()j[g]=t t=j[g]t=t and 9323317-(-636601)or-583794+9259425 else h={}t=d[B(-819504+757658)]end else if t<1027399+11269267 then t=h and 2736111-27171 or-232843+13697383 else t=j[m[-619729-(-619739)]]g=j[m[111909+-111898]]S[t]=g t=j[m[-554545-(-554557)]]g={t(S)}t=d[B(271987+-333812)]h={U(g)}end end end end else if t<13964072-901068 then if t<13312303-560885 then if t<12780244-90967 then if t<13309707-671983 then if t<-1009933+13545190 then t=true t=t and-596012+2428157 or 198629+15019080 else t=d[B(-638490-(-576467))]h={}end else c,T=O(g,c)t=c and-54498+14543665 or-780332-(-1002958)end else if t<12044072-(-656212)then h={}t=d[B(965393+-1027586)]else t=j[m[500777+-500776]]g=c z=-469470-(-469725)F=-204187-(-204187)H=t(F,z)t=1666352-785576 S[g]=H g=nil end end else if t<13734489-872719 then if t<13010192-199527 then t=h and 7551725-841753 or 16235051-(-179056)else h={}S=nil g=nil O=nil t=d[B(509567+-571444)]c=nil E=nil end else if t<729764+12157797 then X=C==i k=X t=15838485-541462 else S=B(-773882-(-711698))h=B(-648855-(-586620))t=d[h]h=t(S)h={}t=d[B(924424+-986291)]end end end else if t<-132980+13244684 then if t<13116044-23154 then if t<13255629-172008 then if t<-15157+13085451 then F,P=T(H,F)t=F and 854354+3246983 or 5210899-674774 else t=-136923+3909463 end else E=c t=T==S t=t and 4504280-775239 or 14043103-(-912203)end else if t<13726250-627643 then O=626509-626508 h=-576722-(-576727)i=B(-554210-(-492123))G=135251+22432621254779 H=B(997196+-1059012)T=d[H]H=B(442172+-504060)z=j[m[-390426+390427]]P=j[m[-529230-(-529232)]]C=P(i,G)H=T[H]F=z[C]C=B(-861178+799211)H=H(T,F)T=B(-1079021-(-1017137))T=H[T]T=T(H,c)F=j[m[623349+-623348]]i=-727490+30259062280396 z=j[m[-33450+33452]]P=z(C,i)H=F[P]E=T[H]t={h;O,E}h=B(-531533+469717)O=t z=B(-499433+437392)t=d[h]T=j[m[612226+-612225]]P=32963024920586-(-285675)H=j[m[990900+-990898]]F=H(z,P)S=nil h=B(-14752+-47136)h=t[h]E=T[F]h=h(t,E)T=j[m[878157+-878156]]z=B(150490+-212660)H=j[m[228750-228748]]t=B(658493+-720444)t=h[t]P=17956879339706-(-839663)c=nil F=H(z,P)z=B(390645+-452602)P=-1039942+23206575949948 E=T[F]t=t(h,E)T=j[m[249417-249416]]H=j[m[-998391+998393]]F=H(z,P)h=B(403148+-465099)g=nil E=T[F]h=t[h]T=B(39139-101155)h=h(t,E)E=d[T]T={E(O)}t=B(474237-536181)O=nil t=h[t]t=t(h,U(T))t=d[B(-96691+34632)]h={}else C=625554+-625489 Y=Z(2603996-839683,{})z=x()j[z]=h P=-716345-(-716348)t=j[H]h=t(P,C)P=x()t=971840-971840 G=B(85809-147856)C=t j[P]=h t=303649+-303649 l=B(-1027616+965678)h=d[G]i=t G={h(Y)}t={U(G)}G=t h=-998274+998276 t=G[h]Y=t h=B(568058+-629899)t=d[h]a=j[c]X=d[l]l=X(Y)X=B(504919-567007)k=a(l,X)a={k()}h=t(U(a))a=x()j[a]=h h=441151-441150 k=j[P]X=k k=734680+-734679 l=k k=-757275-(-757275)R=l<k k=h-l t=7032496-(-655150)end end else if t<12480034-(-641335)then if t<-178877+13298030 then t=h and 695206+11994978 or-227500+11180612 else h=j[m[-819603-(-819608)]]P=x()t=h[H]j[P]=t t=j[P]t=t and 429592+13553291 or 14253500-660687 end else if t<452005+12682876 then h={}t=d[B(204959-266867)]else a=#G R=-783032-(-783032)Y=a==R t=Y and 11220608-(-778544)or 835287+7890488 end end end end end end else if t<15204283-281977 then if t<13616484-(-385532)then if t<13841404-199766 then if t<12769261-(-785825)then if t<14230726-763187 then if t<152153+13261814 then if t<12745957-(-642327)then O=B(186674+-248570)h=B(-511047-(-448981))t=d[h]E=B(-39222+-22659)c=d[O]E=c[E]O={E(c)}c={t(U(O))}t=719723+840627 g=c[138749-138746]S=c[-385161-(-385163)]h=c[312704-312703]c=h else t=h and 6376380-809338 or 14060981-939613 end else h=B(116237+-178188)H=31836967878968-526159 t=j[m[-599036-(-599039)]]c=j[m[102726+-102725]]T=B(341460-403416)O=j[m[463356-463354]]E=O(T,H)g=c[E]T=B(580079+-642016)H=540450+12116664325864 h=t[h]h=h(t,g)c=j[m[-977867-(-977868)]]O=j[m[897172+-897170]]E=O(T,H)t=B(609351+-671235)t=h[t]g=c[E]t=t(h,g)g=x()j[g]=t t=j[g]t=t and 703590+9568138 or 8078384-(-510751)end else if t<13094609-(-416968)then h=B(-269965+207918)c=Z(8795084-526859,{g,m[64671+-64669],m[-907292-(-907295)]})t=d[h]h=t(c)t=-138322+3955858 else H=7188534320780-(-93831)T=B(379797-441932)h=B(-414796+352655)t=d[h]c=j[m[83149+-83148]]O=j[m[431121+-431119]]S=u[241556+-241555]E=O(T,H)g=c[E]h=t(g)h=B(-1106658-(-1044477))t=d[h]O=j[m[939149-939146]]E={t(O)}t=11214290-(-914009)g=E[966453+-966451]c=E[1046436-1046433]h=E[-949397+949398]O=h end end else if t<13023510-(-599044)then if t<12758077-(-834510)then if t<681724+12885664 then P=b(P)C=nil i=nil Y=nil T=nil a=b(a)F=nil P=x()H=b(H)g=b(g)c=b(c)H=B(-1020297+958400)E=b(E)T=B(657489+-719386)Y=792914-792913 g=nil z=b(z)c=nil O=b(O)G=nil O=x()j[O]=g g=x()j[g]=c E=d[T]T=B(756848+-819023)c=E[T]E=x()j[E]=c T=d[H]i=x()F=B(665757+-727778)z=B(405063-466979)H=B(251459+-313561)c=T[H]H=d[F]F=B(16816-78804)T=H[F]C={}F=d[z]z=B(252673+-314711)H=F[z]F=-670258-(-670258)z=x()G={}j[z]=F F=-417396+417398 j[P]=F a=643231-642975 t=-746029+15361181 j[i]=C F={}C=26414-26414 R=a a=-962461-(-962462)W=a a=328504+-328504 r=W<a a=Y-W else O=B(-324534-(-262693))c=d[O]T=505546-505543 E=S[T]O=c(E)c=-886853-(-886953)g=h t=g and 15524111-(-950252)or 746267+674468 h=O or c c=h end else F=nil O=nil T=b(T)H=nil h={}S=nil z=nil g=nil P=b(P)t=d[B(-360730-(-298539))]c=nil E=nil end else if t<-721140+14346601 then H=B(130310-192376)t=d[H]P=j[m[-359713+359716]]C={t(P)}z=C[91461-91458]t=10866916-81841 F=C[661666-661664]H=C[-376613+376614]else t=true t=t and-413100+2046221 or-783172+15225575 end end end else if t<373085+13443139 then if t<14809975-1034602 then if t<12685712-(-1044513)then if t<-1002131+14730669 then t=d[B(292283-354406)]h={}else t=j[m[-450145+450152]]t=t and 3364981-628148 or 9690296-120372 end else g=B(1028585+-1090589)Y=8766493316514-(-997968)S=u[-62621+62622]h=d[g]c=j[m[-161710+161711]]H=22337679463888-(-742097)T=B(627070+-688981)O=j[m[-150458-(-150460)]]E=O(T,H)g=c[E]H=7765409578213-208581 t=h[g]T=B(-613843-(-551931))c=j[m[283003-283002]]O=j[m[-96469-(-96471)]]E=O(T,H)g=c[E]h=t(g)H=-218572+32437738655949 g=x()j[g]=h t=j[g]c=j[m[-1030780+1030781]]O=j[m[543225+-543223]]T=B(658182+-720397)E=O(T,H)h=c[E]c=true t[h]=c F=B(939974+-1001986)T=B(-238964+176950)t=j[g]c=j[m[-497258+497259]]H=29284916135929-529077 O=j[m[-373880-(-373882)]]E=O(T,H)G=B(258019+-320044)h=c[E]H=849544256650-(-976129)c=false t[h]=c t=j[g]T=B(403134+-464955)z=-394265+25697372320471 c=j[m[916526-916525]]O=j[m[-941527-(-941529)]]E=O(T,H)h=c[E]E=j[m[819384-819383]]T=j[m[-453296-(-453298)]]H=T(F,z)O=E[H]T=B(-644593+582655)E=d[T]z=B(614950+-676847)F=d[z]P=j[m[245034-245033]]C=j[m[9473+-9471]]i=C(G,Y)z=P[i]H=F[z]P=-815530+825529 z=-89411+90411 F={H(z,P)}P=29668815613401-112610 T=E(U(F))c=O..T z=B(-759869+698020)H=943358276548-586253 t[h]=c T=B(217588-279490)t=j[g]c=j[m[-888039-(-888040)]]O=j[m[1032875-1032873]]E=O(T,H)h=c[E]c=j[m[-538766+538769]]T=j[m[588356-588355]]H=j[m[-790779+790781]]O=B(-1059945-(-997994))O=c[O]F=H(z,P)C=964481+16341950752312 E=T[F]F=32532735578033-332932 O=O(c,E)c=B(235603-297607)t[h]=O h=d[c]H=B(-949119-(-887100))O=j[m[682539+-682538]]E=j[m[-640314+640316]]T=E(H,F)H=B(-733871-(-671693))P=B(947573+-1009687)c=O[T]t=h[c]O=j[m[1030294-1030293]]E=j[m[-249149-(-249151)]]F=-259766+30903351766764 T=E(H,F)c=O[T]F=897463+13801641944931 h=t(c)c=x()H=B(315966-377774)j[c]=h t=j[c]O=j[m[-965277+965278]]E=j[m[-201063-(-201065)]]T=E(H,F)h=O[T]T=B(716199+-778030)E=d[T]H=j[m[-682933-(-682934)]]F=j[m[-934818-(-934820)]]z=F(P,C)T=H[z]F=-628995-(-628996)P=B(678960+-741147)z=359621-359621 H=857275+-857275 O=E[T]T=813739+-813738 E=O(T,H,F,z)t[h]=E t=j[c]O=j[m[82312+-82311]]E=j[m[-936320+936322]]F=286196+723556672348 H=B(483857+-546015)T=E(H,F)h=O[T]T=B(-196020-(-134189))E=d[T]H=j[m[1010771-1010770]]C=17801413967502-(-483795)F=j[m[-689011-(-689013)]]z=F(P,C)T=H[z]O=E[T]F=290405+-290405 T=-389087+389087 H=-308050+308050 z=866080+-866080 E=O(T,H,F,z)H=B(483429-545473)t[h]=E t=j[c]F=-725839+11287059851222 O=j[m[433846-433845]]E=j[m[527537+-527535]]T=E(H,F)h=O[T]H=B(1030033+-1091906)O=714046-714045 F=8089043190191-635641 t[h]=O t=j[c]O=j[m[693189-693188]]E=j[m[-674459+674461]]T=E(H,F)h=O[T]O=638925+-638925 F=24724457888133-(-332660)t[h]=O t=j[c]O=j[m[90599+-90598]]E=j[m[-633+635]]H=B(-212775+150870)T=E(H,F)h=O[T]O=S t[h]=O z=59193+24371784729883 t=j[c]F=-1026541+17510582176199 O=j[m[460814+-460813]]H=B(-238028-(-175931))E=j[m[645545-645543]]T=E(H,F)H=B(1028599+-1090531)h=O[T]O=-795192-(-795202)F=15542468403990-(-358703)t[h]=O t=j[c]O=j[m[-239839+239840]]E=j[m[-385361+385363]]T=E(H,F)F=B(201479-263403)h=O[T]O=j[g]t[h]=O O=B(-557878+495662)h=d[O]E=j[m[40890-40889]]S=nil T=j[m[749885+-749883]]H=T(F,z)O=E[H]t=h[O]E=Z(-618491+10595314,{m[-805178-(-805182)],c;m[585689+-585688],m[179319-179317],g})g=b(g)c=b(c)O=.2 h=t(O,E)h={}t=d[B(-113974-(-52079))]end else if t<103000+13701841 then g=nil P=b(P)X=nil z=b(z)Y=nil s=nil c=nil r=nil k=nil J=nil t=d[B(549608+-611848)]G=b(G)q=nil W=nil T=nil l=nil F=b(F)a=nil S=nil h={}i=b(i)R=b(R)C=b(C)H=nil E=nil O=nil w=b(w)else T=nil t=3918972-312420 H=nil O=nil end end else if t<13118578-(-791255)then if t<407308+13411792 then T=h H=B(-184208+122311)h=d[H]H=B(191804-253906)F=B(665473-727494)i=B(-880684-(-818663))t=h[H]H=x()j[H]=t h=d[F]F=B(-444208-(-382248))t=h[F]P=t F=t C=d[i]t=C and-92352+1261960 or 1034493+5681366 z=C else c=nil O=nil h={}g=nil E=nil S=nil T=nil t=d[B(585615+-647450)]end else if t<14885503-901839 then X=8022968341813-(-194914)a=28236759899163-(-448321)k=B(772784+-834781)t=j[T]Y=B(671794-734030)C=j[m[458722-458721]]i=j[m[779720+-779718]]G=i(Y,a)h=C[G]C=c t[h]=C t=j[T]h=749111-749109 G=j[m[-740548+740549]]Y=j[m[-206366+206368]]a=Y(k,X)i=G[a]C=z[i]t[h]=C h=B(-977745-(-915698))t=d[h]C=V(1751196-(-329069),{P;T})h=t(C)t=12731309-(-861504)else h={}t=d[B(-367248-(-305271))]end end end end else if t<14049342-(-329152)then if t<856612+13378969 then if t<-435117+14602335 then if t<13157603-(-888643)then if t<13740018-(-276695)then h=j[m[-777984+777985]]c=j[m[-89618-(-89620)]]E=B(1042992+-1105062)T=10414982942631-97462 O=c(E,T)t=h[O]h=true g[t]=h t=479318+5063508 else h={}t=d[B(621700+-683845)]end else G=-585744+13396850641006 t=j[H]i=B(-103445+41580)z=j[m[-53348+53349]]P=j[m[11135+-11133]]C=P(i,G)h=z[C]z=824693.5-824693 t[h]=z t=-277911+8120721 end else if t<15089203-877512 then t=H and 14521375-896934 or-957321+5644662 else O=-992008+992009 g=j[m[802955+-802954]]E=905088+-905086 c=g(O,E)g=-320358-(-320359)S=c==g h=S t=S and 379519+14846630 or 3258658-889145 end end else if t<14886734-545474 then if t<14244973-(-24230)then t=772078+3915263 else h={T}t=d[B(-836537+774311)]end else if t<-853689+15221910 then G=32039861402029-180070 T=B(214651-276792)i=B(-754546+692455)E=c t=d[T]z=j[m[790693+-790692]]P=j[m[-838494-(-838496)]]C=P(i,G)F=z[C]H=F..E T=t(H)E=nil t=-322514+12450813 else t=-535441+16874093 end end end else if t<13909142-(-666805)then if t<256941+14250877 then if t<158111+14320126 then if t<13395897-(-1006022)then H=490552+24024907362171 h=1030926+-1030924 S=u[-723012+723013]t=S[h]g=t c=j[m[257015+-257014]]T=B(-70223-(-8251))O=j[m[-1005634-(-1005636)]]E=O(T,H)h=c[E]t=S[h]c=t O=not g t=O and 878330+4740484 or 2781372-(-511111)h=O else t=Z(958324+15370640,{O})X={t()}h={U(X)}t=d[B(596201-658353)]end else G=-989932+29738745581828 t=x()E=c H=B(793310+-855223)j[t]=T T=t t=j[T]z=j[m[509515+-509513]]i=B(-102012-(-40103))P=j[m[-305607+305610]]H=t[H]C=P(i,G)F=z[C]H=H(t,F)t=H and 127261+905283 or 769476+9640405 end else if t<15115846-571252 then t=d[B(847227+-909071)]h={}else p=933951+-933950 j[g]=d3 N=j[q]A=N+p y=L[A]v=C+y y=-304975-(-305231)t=v%y A=j[J]C=t y=i+A A=472239+-471983 t=894558+4559461 v=y%A i=v end end else if t<14030664-(-682165)then if t<107635+14510480 then J=not r a=a+W Y=a<=R Y=J and Y J=a>=R J=r and J Y=J or Y J=17167164-732998 t=Y and J Y=-327714+1522740 t=t or Y else t=d[B(-625373-(-563176))]h={}end else if t<-948488+15812031 then O=j[m[796091-796088]]P=516968+5766183397141 T=j[m[-681199+681200]]z=B(-305088+243218)H=j[m[884217+-884215]]F=H(z,P)E=T[F]h=O[E]t=g~=h t=t and 6488856-(-750137)or 11760016-294992 else O=B(-996652-(-934645))h=j[m[-596074-(-596075)]]E=33379516943843-790828 T=221996+14116461770369 g=j[m[963839+-963837]]c=g(O,E)t=h[c]E=B(528117+-590119)S=u[196482+-196481]h=j[m[290272-290271]]g=t c=j[m[-251167-(-251169)]]O=c(E,T)E=627943+-627942 t=h[O]h=-644434-(-644435)O=S T=E c=t E=1023329+-1023329 t=153315+5006277 H=T<E E=h-T end end end end end else if t<14984633-(-781271)then if t<16404514-1007892 then if t<10695+15212709 then if t<15748566-593679 then if t<424171+14719756 then if t<14751893-(-204483)then T=nil t=-539667+11020098 E=nil else S=B(229368+-291584)h=d[S]g=j[m[-451513+451514]]T=-263703+34837754758517 E=B(-742092+680253)z=26853084451077-(-1007571)c=j[m[-5035+5037]]O=c(E,T)S=g[O]t=h[S]O=B(926078-987975)F=B(-20111+-41757)c=d[O]P=17835111209848-1030919 E=j[m[-99907-(-99908)]]T=j[m[28646+-28644]]H=T(F,z)O=E[H]g=c[O]O=606316-606281 E=1005016+-1004616 c=g(O,E)g=892663-892563 S=c/g E=B(302960-364857)h=t(S)t=j[m[-498790+498793]]g=j[m[-280908-(-280912)]]O=d[E]z=B(266826+-328853)T=j[m[958114-958113]]H=j[m[99168-99166]]F=H(z,P)E=T[F]c=O[E]H=j[m[576419-576415]]E=493901-493900 T=#H O=c(E,T)S=g[O]h=t(S)t=5991193-(-698490)end else c=-572414-(-572415)g=j[m[290905-290902]]S=g~=c t=S and-671424+3164133 or 9178435-(-745528)end else if t<58965+15118218 then h=-907704-(-907706)S=u[-933643-(-933644)]H=21311430140436-506705 t=S[h]c=j[m[201577+-201576]]g=t O=j[m[-483393+483395]]T=B(754540-816531)E=O(T,H)h=c[E]O=not g t=S[h]h=O c=t t=O and-750077+10454159 or 554292+-300422 else h={}t=d[B(750929+-812916)]end end else if t<15504528-169917 then if t<759162+14516053 then if t<110668+15116293 then t=h and-1003555+7117703 or-716641+14445438 else c=j[m[-361621-(-361622)]]H=17304457205704-63566 O=j[m[-304431-(-304433)]]T=B(-515569+453714)E=O(T,H)h=c[E]t=g[h]h=B(103206+-165090)c=t t=j[m[-636659-(-636662)]]h=t[h]h=h(t,c)O=h t=not O t=t and 650672+9785736 or 6308118-184182 end else j[g]=k t=j[g]t=t and 809195-(-447445)or 5769754-97844 end else if t<16137475-757831 then Y=695631+1919179548206 P=j[m[-396018-(-396019)]]C=j[m[-796956-(-796958)]]F=B(387754-449667)E=c G=B(-756243-(-694226))i=C(G,Y)z=P[i]F=T[F]F=F(T,z)t=F and 6335254-(-310183)or-501365+14708756 H=F else t=h and 2898538-26554 or-412001+14465449 end end end else if t<15361346-(-310396)then if t<16211685-661182 then if t<-3644+15549588 then if t<15836765-306133 then h=B(-65056-(-3019))H=B(-655722-(-593906))F=B(-230240+168371)t=d[h]T=d[H]F=T[F]H={F(T,O)}h=t(E,U(H))t=-104104+16464568 else E=nil t=-263464+10944844 T=nil end else h=B(-527381+465373)t=j[m[-200063+200064]]g=j[m[-10228+10230]]c=j[m[606817-606814]]T=216877+4684164594008 E=B(518200-580332)O=c(E,T)h=t[h]S=g[O]h=h(t,S)h={}t=d[B(-877299+815132)]end else if t<16458844-842140 then t=B(-372423+310524)t=g[t]t=t(g)t=579921+1180654 else t=j[m[240930-240929]]h=B(-968974-(-906761))h=t[h]h=h(t)t=d[B(-5619-56244)]h={}end end else if t<152737+15540706 then if t<16333739-650446 then t=h and 273117+11312782 or 725782+5521052 else O=j[m[794482-794479]]T=j[m[923511-923510]]H=j[m[741305+-741303]]P=70070+11438353400600 z=B(399514-461657)F=H(z,P)E=T[F]h=O[E]t=g~=h t=t and 12886983-(-757295)or 155752+5662853 end else if t<16321413-601692 then t=j[m[656726-656725]]S=B(228870-291086)h=t()T=-373495+23676188794376 h=d[S]E=B(-1003312+941301)g=j[m[881292+-881290]]c=j[m[597544-597541]]O=c(E,T)S=g[O]t=h[S]S=.2 h=t(S)t=497715+15840937 else g=h t=g and-678714+11959183 or 330056+1003594 end end end end else if t<17239911-943111 then if t<15026700-(-1014348)then if t<16492853-592711 then if t<809160+15045255 then if t<136325+15677369 then j[m[-332518-(-332523)]]=h S=nil t=978010+12750787 else p=-807644+13505568353133 L=j[P]v=j[m[578068+-578067]]N=B(-345713-(-283651))y=j[m[-775738-(-775740)]]A=y(N,p)d3=v[A]h=L[d3]t=a(h)t=659992-437541 end else h={}t=d[B(-854075-(-791935))]S=b(S)g=b(g)end else if t<-935063+16881448 then S=x()j[S]=u[287394-287393]c=j[S]g=not c h=g t=g and 11664111-(-597757)or 739964-(-958415)else h=B(239298+-301479)S=u[642908+-642907]t=d[h]O=j[m[-290515-(-290516)]]E={t(O)}t=-1017353+4305867 c=E[-365777-(-365780)]g=E[-159351+159353]h=E[107404+-107403]O=h end end else if t<16920909-791823 then if t<17005535-900173 then t=d[B(927943-989769)]h={c}else R=B(-168883+106660)t=d[R]R=B(662375+-724289)d[R]=t t=1030113+12040881 end else if t<15729215-(-487669)then t=114166+10934800 O=not c h=O else O=B(-685247-(-623431))S=u[567720+-567719]z=12303884240996-897539 c=d[O]E=j[m[1017456-1017455]]T=j[m[938365-938363]]F=B(-549112+487260)H=T(F,z)O=E[H]g=c[O]H=B(-873399+811325)O=j[m[-303931+303932]]F=448549+32801950835589 E=j[m[-741547-(-741549)]]T=E(H,F)c=O[T]T=B(334683+-396539)h=g[c]c=j[m[-840184+840185]]O=j[m[440305-440303]]H=12542261780371-2243 E=O(T,H)T=B(117189-179391)g=c[E]t=h[g]c=j[m[-695802+695803]]O=j[m[231528-231526]]H=8956479348840-757790 h=B(-1009886+948002)E=O(T,H)g=c[E]h=t[h]h=h(t,g)g=h t=g and 83443+3347872 or 8607570-25293 end end end else if t<36145+16414335 then if t<525785+15887320 then if t<60097+16290484 then if t<17374241-1038754 then t=165981+11217647 else t=true t=t and 95880+15609992 or-130432+14120069 end else h=B(927472-989278)t=d[h]h=t(E)t=h and 7608270-(-102012)or-938427+13774397 end else if t<17293852-859786 then P=3224281448177-833812 O=j[m[-133092-(-133095)]]z=B(-608363+546360)T=j[m[603208+-603207]]H=j[m[-678208-(-678210)]]F=H(z,P)E=T[F]h=O[E]t=g~=h t=t and 2347946-56217 or 12677345-(-417220)else Y=a t=13920938-(-694214)J=Y G[Y]=J Y=nil end end else if t<-314166+16949119 then if t<-1044503+17656552 then F=30453093096226-156606 H=B(-501382+439433)t=2334932-914197 O=j[m[-456744+456746]]E=j[m[-803028-(-803031)]]T=E(H,F)h=O[T]O=c g[h]=O else h=-124282+2841258 c=697678+13572512 g=B(-989292+927351)S=g^c t=h-S S=t h=B(-87376-(-25300))t=h/S h={t}t=d[B(-724313+662289)]end else if t<15831609-(-901808)then E=c t=T==S t=t and-208334+8941703 or-464698+7878201 else S=nil E=B(-811850-(-750009))P=B(-171267-(-109451))h=304286-304284 k=5595080266760-(-144933)O=d[E]z=d[P]i=j[m[583144-583143]]a=B(252769-314704)P=B(252897-314785)G=j[m[-584137-(-584139)]]Y=G(a,k)P=z[P]C=i[Y]P=P(z,C)z=B(355813-417697)Y=B(-903297-(-841399))z=P[z]z=z(P,c)C=j[m[-1034392-(-1034393)]]a=303148+6744682458136 i=j[m[121196-121194]]G=i(Y,a)P=C[G]G=B(-70837-(-8973))Y=-135979+3206227745024 F=z[P]P=j[m[-923719-(-923720)]]C=j[m[-7891-(-7893)]]i=C(G,Y)z=P[i]H=F[z]i=B(611859-673970)G=24063491657426-877325 z=j[m[-565342-(-565343)]]P=j[m[322018-322016]]C=P(i,G)F=z[C]i=B(-681527+619310)T=H[F]H=B(-1074196-(-1012380))G=-155642+24291295956009 E=O(T)T=d[H]z=j[m[443848+-443847]]P=j[m[925573-925571]]C=P(i,G)H=B(1015088+-1076976)H=T[H]F=z[C]H=H(T,F)T=B(-641344+579460)T=H[T]T=T(H,c)i=160975+1335413345694 C=B(505383+-567422)F=j[m[347641-347640]]z=j[m[-126347-(-126349)]]P=z(C,i)H=F[P]O=T[H]t={h;E;O}P=22331599760971-837037 O=t h=B(-450172+388356)t=d[h]T=j[m[347946+-347945]]z=B(491600+-553618)h=B(877887-939775)h=t[h]H=j[m[166004+-166002]]F=H(z,P)E=T[F]h=h(t,E)T=j[m[1030634+-1030633]]z=B(558282+-620316)P=9932600668660-(-745501)H=j[m[-401167+401169]]F=H(z,P)t=B(-176760-(-114809))t=h[t]c=nil E=T[F]t=t(h,E)T=j[m[426164-426163]]P=511260+30043369548170 z=B(-540462-(-478464))H=j[m[-740972-(-740974)]]F=H(z,P)E=T[F]h=B(-208377+146426)T=B(-87439-(-25423))h=t[h]h=h(t,E)t=B(-316336+254392)E=d[T]g=nil T={E(O)}t=h[t]O=nil t=t(h,U(T))t=d[B(530832+-592892)]h={}end end end end end end end end end t=#o return U(h)end,{},function(d)local B,t=240544+-240543,d[-893037-(-893038)]while t do S[t],B=S[t]-(738664-738663),B+(-382917-(-382918))if S[t]==-1016542-(-1016542)then S[t],j[t]=nil,nil end t=d[B]end end,522203-522203 return(E(558213+2826373,{}))(U(h))end)(getfenv and getfenv()or _ENV,unpack or table[B(-409481-(-347465))],newproxy,setmetatable,getmetatable,select,{...})end)(...)
return ret, settings
