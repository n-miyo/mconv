#!/usr/bin/osascript

-- mconv:
--   Eliminate extra 'moov.meta' atom from 'mp4' file and
--   rename it.
--   See detail: http://thousandleaves-project.com/blog/2012/10/drm%E3%83%95%E3%83%AA%E3%83%BC%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%9Fmora%E6%A5%BD%E6%9B%B2%E3%82%92%E5%86%8D%E3%82%A8%E3%83%B3%E3%82%B3%E3%83%BC%E3%83%89%E3%81%AA%E3%81%97%E3%81%A7iphonetouch%E3%81%A7.html
--
-- Licese: MIT License

property atomicParsleyCmd : "%ATOMICPARSLEYCMD%"
property doneDirName : "Done"

on findCommand(cmdName)
	set dirList to targetDirList
	tell application "Finder"
		repeat with f in dirList
			set p to f & cmdName
			if exists p as POSIX file then
				return p
			end if
		end repeat
		return ""
	end tell
end findCommand

on adding folder items to thisFolder after receiving theseItems
	tell application "Finder"
		if not (exists folder doneDirName of thisFolder) then
			make new folder at thisFolder with properties {name:doneDirName}
		end if
		set destinationFolder to folder doneDirName of thisFolder as alias
		set destinationDirectory to POSIX path of destinationFolder
	end tell

	repeat with i from 1 to number of items in theseItems
		set thisItem to item i of theseItems
		tell application "Finder"
			if name extension of thisItem is "mp4" then

				duplicate thisItem to destinationFolder with replacing

				set targetPath to destinationDirectory & name of (info for thisItem)
				do shell script atomicParsleyCmd & " " & quoted form of targetPath & " --manualAtomRemove \"moov.meta\" --overWrite"

				set finderFile to file (targetPath as POSIX file)
				set name extension of finderFile to "m4a"
			end if
		end tell
	end repeat
end adding folder items to

-- EOF
