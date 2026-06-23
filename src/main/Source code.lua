local cg = game:GetService("CoreGui")
local ts = game:GetService("TweenService")
local cp = game:GetService("ContentProvider")

local sd = Instance.new("Sound")
sd.SoundId = "rbxassetid://131390520971848"
sd.Volume = 0.5
sd.Parent = cg
pcall(function() cp:PreloadAsync({sd}) end)

local fd = Instance.new("Folder")
fd.Name = "xExec"
fd.Parent = cg

local sg = Instance.new("ScreenGui")
sg.IgnoreGuiInset = true
sg.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
sg.Name = "xExec"
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ps = pcall(function()
	if syn and type(syn.protect_gui) == "function" then
		syn.protect_gui(sg)
	end
end)

if not ps then return end
sg.Parent = fd

local mf = Instance.new("Frame")
mf.BorderSizePixel = 0
mf.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mf.Size = UDim2.new(0, 0, 0, 0)
mf.Position = UDim2.new(0.72489, 0, 0.03704, 0)
mf.Name = "MainFrameTop"
mf.BackgroundTransparency = 1
mf.ClipsDescendants = true
mf.Parent = sg

local hm = Instance.new("Frame")
hm.BorderSizePixel = 0
hm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hm.ClipsDescendants = true
hm.Size = UDim2.new(1, 0, 0.8, 0)
hm.Position = UDim2.new(0, 0, 0.2, 0)
hm.Name = "HolderModules"
hm.BackgroundTransparency = 1
hm.Parent = mf

local ls = Instance.new("ScrollingFrame")
ls.ScrollingDirection = Enum.ScrollingDirection.Y
ls.BorderSizePixel = 0
ls.ElasticBehavior = Enum.ElasticBehavior.Always
ls.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ls.Name = "List"
ls.ClipsDescendants = false
ls.Size = UDim2.new(1, 0, 1, 0)
ls.Position = UDim2.new(0, 0, 0, 0)
ls.BorderColor3 = Color3.fromRGB(28, 42, 54)
ls.BackgroundTransparency = 0.8
ls.Parent = hm

local cn_ls = Instance.new("UICorner")
cn_ls.Parent = ls

local st_ls = Instance.new("UIStroke")
st_ls.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
st_ls.Thickness = 0.9
st_ls.Color = Color3.fromRGB(176, 176, 176)
st_ls.Parent = ls

local ly = Instance.new("UIListLayout")
ly.Padding = UDim.new(0, 6)
ly.Parent = ls

local cn_hm = Instance.new("UICorner")
cn_hm.Parent = hm

local tb = Instance.new("TextBox")
tb.BorderSizePixel = 0
tb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tb.Size = UDim2.new(1, 0, 0.18, 0)
tb.BackgroundTransparency = 1
tb.Text = ""
tb.PlaceholderText = "Enter command here..."
tb.TextColor3 = Color3.fromRGB(255, 255, 255)
tb.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
tb.TextSize = 14
tb.Font = Enum.Font.SourceSans
tb.TextTransparency = 1
tb.Parent = mf

local cn_tb = Instance.new("UICorner")
cn_tb.Parent = tb

local st_tb = Instance.new("UIStroke")
st_tb.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
st_tb.Thickness = 0.9
st_tb.Color = Color3.fromRGB(176, 176, 176)
st_tb.Transparency = 1
st_tb.Parent = tb

local cn_mf = Instance.new("UICorner")
cn_mf.Parent = mf

local tg = Instance.new("TextButton")
tg.TextWrapped = true
tg.BorderSizePixel = 0
tg.TextScaled = true
tg.TextColor3 = Color3.fromRGB(255, 255, 255)
tg.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
tg.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
tg.Size = UDim2.new(0, 0, 0, 0)
tg.Text = "Toggle UI"
tg.Name = "UITOGGLE"
tg.Position = UDim2.new(0.58676, 0, 0.0463, 0)
tg.TextTransparency = 1
tg.BackgroundTransparency = 1
tg.Active = true
tg.Draggable = true
tg.Parent = sg

local cn_tg = Instance.new("UICorner")
cn_tg.CornerRadius = UDim.new(1, 0)
cn_tg.Parent = tg

local st_tg = Instance.new("UIStroke")
st_tg.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
st_tg.Transparency = 1
st_tg.Parent = tg

local ar_tg = Instance.new("UIAspectRatioConstraint")
ar_tg.AspectRatio = 1.05882
ar_tg.Parent = tg

local visible = true
local md_list = {}

tg.MouseButton1Click:Connect(function()
	visible = not visible
	if visible then
		mf.Visible = true
		ts:Create(mf, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0.24201, 0, 0.45, 0)}):Play()
		ts:Create(tg, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
	else
		local cl = ts:Create(mf, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {Size = UDim2.new(0.24201, 0, 0, 0)})
		cl.Completed:Connect(function()
			if not visible then mf.Visible = false end
		end)
		cl:Play()
		ts:Create(tg, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
	end
end)

tb.FocusLost:Connect(function(ep)
	if ep and tb.Text ~= "" then
		local txt = tb.Text
		local low = string.lower(txt)
		local mt_md = nil
		local mt_nm = ""
		
		if string.sub(low, 1, 5) == "unesp" then
			local targetMod = md_list["esp"]
			if targetMod and type(targetMod.Execute) == "function" then
				local start = 7
				local arg = string.sub(txt, start) or ""
				sd:Play()
				targetMod.Execute("unesp_" .. arg)
			end
		else
			for name, tbl in pairs(md_list) do
				local len = string.len(name)
				if string.sub(low, 1, len) == name then
					local nxt = string.sub(txt, len + 1, len + 1)
					if nxt == "" or nxt == " " then
						if string.len(name) > string.len(mt_nm) then
							mt_md = tbl
							mt_nm = name
						end
					end
				end
			end
			
			if mt_md and type(mt_md.Execute) == "function" then
				local start = string.len(mt_nm) + 2
				local arg = string.sub(txt, start) or ""
				sd:Play()
				mt_md.Execute(arg)
			end
		end
	end
	tb.Text = ""
end)

local get = type(game.HttpGetAsync) == "function" and function(url) return game:HttpGetAsync(url) end 
	or type(game.HttpGet) == "function" and function(url) return game:HttpGet(url) end 
	or type(request) == "function" and function(url) return request({Url = url, Method = "GET"}).Body end 
	or type(http_request) == "function" and function(url) return http_request({Url = url, Method = "GET"}).Body end

local dec = nil
local sc, sv = pcall(function() return game:GetService("HttpService") end)
if sc and sv then
	dec = function(data) return sv:JSONDecode(data) end
elseif type(request) == "function" then
	dec = function(data) return loadstring("return " .. data)() end
end

ts:Create(tg, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0.08219, 0, 0.15741, 0), TextTransparency = 0, BackgroundTransparency = 0}):Play()
ts:Create(st_tg, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Transparency = 0}):Play()

ts:Create(mf, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0.24201, 0, 0.45, 0)}):Play()
ts:Create(tb, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 0.8, TextTransparency = 0}):Play()
ts:Create(st_tb, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Transparency = 0}):Play()

local data = dec(get("https://api.github.com/repos/xExec760/xExec/contents/src/modules/Universel"))

for _, info in ipairs(data) do
	if info.type == "file" and string.sub(info.name, -7) == ".module" then
		local clean = string.sub(info.name, 1, -8)
		
		local fm_tp = Instance.new("Frame")
		fm_tp.BorderSizePixel = 0
		fm_tp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		fm_tp.Size = UDim2.new(1, 0, 0, 36)
		fm_tp.BackgroundTransparency = 1
		fm_tp.Name = clean .. "_Frame"
		fm_tp.Parent = ls

		local cn_tp = Instance.new("UICorner")
		cn_tp.Parent = fm_tp

		local btn = Instance.new("TextButton")
		btn.Name = "CommandButton"
		btn.Size = UDim2.new(1, -10, 1, 0)
		btn.Position = UDim2.new(0, 5, 0, 0)
		btn.BackgroundTransparency = 1
		btn.Text = clean
		btn.TextColor3 = Color3.fromRGB(255, 255, 255)
		btn.TextSize = 14
		btn.Font = Enum.Font.SourceSansSemibold
		btn.TextXAlignment = Enum.TextXAlignment.Left
		btn.TextTransparency = 1
		btn.Parent = fm_tp
		
		ts:Create(fm_tp, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 0.4}):Play()
		ts:Create(btn, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		
		local md = loadstring(get(info.download_url))()
		if type(md) == "table" then
			md_list[string.lower(clean)] = md
		end
		
		btn.MouseButton1Click:Connect(function()
			if md and md.Execute then
				sd:Play()
				md.Execute("")
			end
		end)
	end
end
