generate:
	make mint
	tuist fetch
	tuist generate

mint:
	sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
	arch -arm64 mint bootstrap --link
