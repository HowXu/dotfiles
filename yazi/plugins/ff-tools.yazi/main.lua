--- @since 26.5.6

local selected_or_hovered = ya.sync(function()
	local tab, paths = cx.active, {}
	for _, file in ipairs(tab.current.files) do
		if file:is_selected() and not file.cha.is_dir then
			paths[#paths + 1] = tostring(file.url)
		end
	end
	if #paths == 0 and tab.current.hovered and not tab.current.hovered.cha.is_dir then
		paths[1] = tostring(tab.current.hovered.url)
	end
	return paths
end)

local VIDEO = {
	mp4 = true, mkv = true, mov = true, avi = true, webm = true, ts = true,
	m4v = true, flv = true, mpeg = true, mpg = true, wmv = true, ["3gp"] = true,
}
local AUDIO = {
	mp3 = true, flac = true, wav = true, aac = true, m4a = true, opus = true,
	ogg = true, wma = true, ac3 = true, aiff = true, ape = true,
}
local IMAGE = {
	jpg = true, jpeg = true, png = true, webp = true, bmp = true, gif = true,
	tiff = true, tif = true, avif = true, heic = true, heif = true, jxl = true,
	apng = true,
}
local SUBTITLE = { srt = true, ass = true, ssa = true, vtt = true }

local function extension(path)
	return (path:match("%.([^./]+)$") or ""):lower()
end

local function executable_exists(name)
	local status = Command("which"):arg(name):status()
	return status and status.success
end

local function shell_command(executable, args)
	local parts = { executable }
	for _, value in ipairs(args or {}) do
		parts[#parts + 1] = ya.quote(value)
	end
	return table.concat(parts, " ")
end

local function add_action(actions, key, desc, executable, args)
	actions[#actions + 1] = {
		cand = { on = key, desc = desc },
		executable = executable,
		args = args,
	}
end

return {
	entry = function()
		local paths = selected_or_hovered()
		if #paths == 0 then
			return ya.notify {
				title = "FFmpeg 工具箱",
				content = "请选择或悬停一个媒体文件",
				level = "warn",
				timeout = 4,
			}
		end

		local videos, media, subtitles = {}, {}, {}
		for _, path in ipairs(paths) do
			local ext = extension(path)
			if VIDEO[ext] then
				videos[#videos + 1] = path
				media[#media + 1] = path
			elseif AUDIO[ext] or IMAGE[ext] then
				media[#media + 1] = path
			elseif SUBTITLE[ext] then
				subtitles[#subtitles + 1] = path
			end
		end

		local actions = {}
		add_action(actions, "F", "打开完整 FFmpeg 工具箱", "fzf-fftools")

		if #paths == 1 and #media == 1 then
			add_action(actions, "c", "转换媒体格式", "fzf-convert-media", media)
			add_action(actions, "v", "验证媒体完整性", "fzf-validate-media", media)
		end

		if #paths == 1 and #videos == 1 then
			add_action(actions, "t", "无损裁剪视频", "fzf-trim-video", videos)
			add_action(actions, "z", "压缩视频", "fzf-compress-video", videos)
			add_action(actions, "e", "提取音频", "fzf-extract-audio", videos)
			add_action(actions, "m", "移除音轨", "fzf-mute-video", videos)
			add_action(actions, "s", "调整播放速度", "fzf-speed-video", videos)
			add_action(actions, "g", "视频转 GIF", "fzf-video-to-gif", videos)
			add_action(actions, "b", "构建 FFmpeg 命令", "fzf-ffmpeg-builder", videos)
			add_action(actions, "p", "使用快速编码预设", "fzf-ffmpeg-preset", videos)
			add_action(actions, "h", "HDR / 色彩处理", "fzf-ffmpeg-color", videos)
			add_action(actions, "w", "添加文字或图片水印", "fzf-add-watermark", videos)
		elseif #paths == 1 and #media == 1 and IMAGE[extension(media[1])] then
			add_action(actions, "w", "添加文字或图片水印", "fzf-add-watermark", media)
		end

		if #paths >= 2 and #videos == #paths then
			add_action(actions, "m", "批量移除音轨", "fzf-mute-video", videos)
			add_action(actions, "x", "批量转码为 H.265", "fzf-ffmpeg-batch", videos)
			add_action(actions, "v", "批量验证媒体完整性", "fzf-validate-media", videos)
			if #videos >= 2 then
				add_action(actions, "j", "按当前列表顺序拼接视频", "fzf-concat-video", videos)
			end
		elseif #paths >= 2 and #media == #paths then
			add_action(actions, "v", "批量验证媒体完整性", "fzf-validate-media", media)
		end

		if #paths == 2 and #videos == 1 and #subtitles == 1 then
			add_action(
				actions,
				"u",
				"烧录所选字幕到视频",
				"fzf-burn-subs",
				{ videos[1], subtitles[1] }
			)
		end

		if #actions == 1 then
			return ya.notify {
				title = "FFmpeg 工具箱",
				content = "所选文件不是支持的媒体类型",
				level = "warn",
				timeout = 4,
			}
		end

		local candidates = {}
		for _, action in ipairs(actions) do
			candidates[#candidates + 1] = action.cand
		end
		local index = ya.which { cands = candidates }
		local action = index and actions[index]
		if not action then
			return
		end
		if not executable_exists(action.executable) then
			return ya.notify {
				title = "FFmpeg 工具箱",
				content = "未找到命令: " .. action.executable,
				level = "error",
				timeout = 5,
			}
		end

		ya.emit("shell", {
			shell_command(action.executable, action.args),
			block = true,
			confirm = false,
		})
	end,
}
