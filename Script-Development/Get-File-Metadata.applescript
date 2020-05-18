use scripting additions
use kl : script "Kevin's Library"
-- add some path posix path here to get the metadata
--set thePath to somePosixPath
set wherefroms to cleanMdls(do shell script "mdls -name kMDItemWhereFroms " & quoted form of thePath)
set authors to cleanMdls(do shell script "mdls -name kMDItemAuthors " & quoted form of thePath)

on cleanMdls(mdls)
	if mdls contains "null" then return missing value
	set mdls to kl's split(kl's extractBetween(mdls, "(" & return, return & ")"), ",")
	repeat with w in mdls
		set contents of w to kl's TrimWhitespace(kl's SearchandReplace(w, "\"", ""))
	end repeat
	if (count of mdls) = 1 then return item 1 of mdls
	return mdls
end cleanMdls
