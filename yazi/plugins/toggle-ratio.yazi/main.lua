--- @sync
local RATIOS = {
	{ 1, 5, 2 }, -- 默认平衡
	{ 1, 2, 5 }, -- 预览扩大
	{ 1, 1, 6 }, -- 预览最大
	{ 0, 3, 5 }, -- 隐藏父面板
}
local idx = 1

local function setup(args)
	if args[1] == "reset" then
		idx = 1
	else
		idx = idx % #RATIOS + 1
	end
	rt.mgr.ratio = RATIOS[idx]
	ya.manager_emit("resize", nil)
end

return { setup = setup }
