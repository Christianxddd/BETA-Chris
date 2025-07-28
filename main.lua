-- Crear GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FloatingIcon"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

-- Crear el botón (icono)
local ImageButton = Instance.new("ImageButton")
ImageButton.Name = "DraggableIcon"
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.Position = UDim2.new(0, 100, 0, 100)
ImageButton.Size = UDim2.new(0, 48, 0, 48)
ImageButton.Image = "rbxassetid://120008128829681"
ImageButton.BorderSizePixel = 0
ImageButton.AutoButtonColor = false
ImageButton.Active = true
ImageButton.Selectable = true

-- Bordes redondeados
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = ImageButton

-- Servicios
local UIS = game:GetService("UserInputService")
local dragging = false
local dragStart, startPos

-- Función de mover
local function update(input)
	if not dragging then return end
	local delta = input.Position - dragStart
	ImageButton.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

-- Detectar toque o click (touch y mouse)
ImageButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = ImageButton.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		update(input)
	end
end)
