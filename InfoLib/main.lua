local ServerInfoLib = {}
ServerInfoLib.__index = ServerInfoLib

local ELEMENT_HEIGHT_PX = 12
local CELL_PADDING_PX   = 2
local BOTTOM_PADDING_PX = 6
local TOP_PADDING_PX    = 6
local STROKE_THICKNESS  = 3
local CORNER_RADIUS     = 6

function ServerInfoLib.new()
	local self = setmetatable({}, ServerInfoLib)
	self._elements = {}
	self._count = 0

	local ServerInfo = Instance.new("ScreenGui")
	ServerInfo.Name = "ServerInfo"
	ServerInfo.Parent = game:GetService("CoreGui")
	ServerInfo.ResetOnSpawn = false
	ServerInfo.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local MainFrame = Instance.new("Frame")
	MainFrame.Name = "MainFrame"
	MainFrame.Parent = ServerInfo
	MainFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.00588, 0, 0.4176, 0)
	MainFrame.Size = UDim2.new(0.1, 0, 0, 0)
	MainFrame.ZIndex = 2

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, CORNER_RADIUS)
	UICorner.Parent = MainFrame

	local Stroke = Instance.new("Frame")
	Stroke.Name = "Stroke"
	Stroke.Parent = MainFrame
	Stroke.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Stroke.BorderSizePixel = 0
	Stroke.Position = UDim2.new(0, 0, 0, 0)
	Stroke.Size = UDim2.new(1, 0, 0, STROKE_THICKNESS)
	Stroke.ZIndex = 10

	local UICorner_Stroke = Instance.new("UICorner")
	UICorner_Stroke.CornerRadius = UDim.new(0, CORNER_RADIUS)
	UICorner_Stroke.Parent = Stroke

	local UIGradient = Instance.new("UIGradient")
	UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
	UIGradient.Rotation = 0
	UIGradient.Parent = Stroke

	local Holder = Instance.new("Frame")
	Holder.Name = "Holder"
	Holder.Parent = MainFrame
	Holder.BackgroundTransparency = 1
	Holder.BorderSizePixel = 0
	Holder.Position = UDim2.new(0.05, 0, 0, TOP_PADDING_PX)
	Holder.Size = UDim2.new(0.9, 0, 1, -TOP_PADDING_PX)

	local UIGridLayout = Instance.new("UIGridLayout")
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellSize = UDim2.new(1, 0, 0, ELEMENT_HEIGHT_PX)
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0, CELL_PADDING_PX)
	UIGridLayout.Parent = Holder

	self._gui       = ServerInfo
	self._mainFrame = MainFrame
	self._stroke    = Stroke
	self._gradient  = UIGradient
	self._holder    = Holder
	self._grid      = UIGridLayout

	return self
end

function ServerInfoLib:_updateSize()
	local totalPx = TOP_PADDING_PX + (self._count * ELEMENT_HEIGHT_PX) + (math.max(self._count - 1, 0) * CELL_PADDING_PX) + BOTTOM_PADDING_PX
	self._mainFrame.Size = UDim2.new(0.1, 0, 0, totalPx)
end

function ServerInfoLib:SetGradient(colorSequence, rotation)
	self._gradient.Color = colorSequence
	self._gradient.Rotation = rotation or 0
end

function ServerInfoLib:CreateElement(text)
	self._count += 1
	local label = Instance.new("TextLabel")
	label.Parent = self._holder
	label.BackgroundTransparency = 1
	label.BorderSizePixel = 0
	label.Size = UDim2.new(1, 0, 0, ELEMENT_HEIGHT_PX)
	label.Font = Enum.Font.GothamBold
	label.Text = text or "Element"
	label.TextColor3 = Color3.fromRGB(230, 230, 230)
	label.TextSize = 12
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.LayoutOrder = self._count
	label.Name = "Element_" .. self._count
	table.insert(self._elements, label)
	self:_updateSize()
	return label
end

function ServerInfoLib:Clear()
	for _, label in ipairs(self._elements) do
		label:Destroy()
	end
	self._elements = {}
	self._count = 0
	self:_updateSize()
end

function ServerInfoLib:Destroy()
	self._gui:Destroy()
end

return ServerInfoLib

--[[ example usage for my fellow skids: (this is inspired by roblox vape v4's session info ui)
  local InfoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/EUC4LYPTU5/NexusLib/refs/heads/main/InfoLib/main.lua"))()
  local lib = InfoLib.new()
  
  lib:SetGradient(ColorSequence.new{
  	ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 28, 138)),
  	ColorSequenceKeypoint.new(1, Color3.fromRGB(131, 45, 161))
    },
    0
  )
  
  local serverLabel = lib:CreateElement("Server: " .. game.JobId)
  local playersLabel = lib:CreateElement("Players: " .. #game.Players:GetPlayers())
  local pingLabel = lib:CreateElement("Ping: --")
  
  game:GetService("RunService").Heartbeat:Connect(function()
  	pingLabel.Text = "Ping: " .. math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) .. "ms"
  	playersLabel.Text = "Players: " .. #game.Players:GetPlayers()
  end)
  
  task.wait(10)
  lib:Clear()
  
  lib:CreateElement("Refreshed!")
  
  task.wait(5)
  lib:Destroy()
]]
