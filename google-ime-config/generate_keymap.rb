def entry(key, command, *statuses)
  statuses.map { |status| [status, key, command].join("\t") }
end

entries = [
  # IME切り替え
  entry("F13", "IMEOn", "DirectInput"),
  entry("F13", "InputModeHiragana", "Precomposition"),
  entry("F13", "Cancel", "Composition", "Conversion", "Prediction", "Suggestion"),
  entry("F14", "CancelAndIMEOff", "Precomposition", "Composition", "Conversion", "Prediction", "Suggestion"),
  entry("Ctrl Space", "IMEOn", "DirectInput"),
  entry("Ctrl Space", "CancelAndIMEOff", "Precomposition", "Suggestion", "Prediction", "Conversion", "Composition"),
].flatten(1)

entries += [
  # デフォルト変換
  entry("F2", "ConvertWithoutHistory", "Composition"),
  entry("F6", "ConvertToHiragana", "Composition", "Conversion"),
  entry("F7", "ConvertToFullKatakana", "Composition", "Conversion"),
  entry("F8", "ConvertToHalfWidth", "Composition", "Conversion"),
  entry("F9", "ConvertToFullAlphanumeric", "Composition", "Conversion"),
  entry("F10", "ConvertToHalfAlphanumeric", "Composition", "Conversion"),

  # デフォルト挙動
  entry("Delete", "Delete", "Composition"),
  entry("Enter", "Commit", "Composition", "Conversion"),
  entry("Space", "InsertSpace", "Precomposition"),
  entry("Space", "ConvertNext", "Conversion"),
  entry("Space", "Convert", "Composition"),
  entry("Backspace", "Backspace", "Composition"),
  entry("Backspace", "Revert", "Precomposition"),
  entry("Backspace", "Cancel", "Conversion"),

  entry("Tab", "PredictAndConvert", "Composition", "Conversion"),
  entry("Shift Tab", "ConvertPrev", "Conversion"),
  entry("Up", "ConvertPrev", "Conversion", "Prediction"),
  entry("Down", "CommitOnlyFirstSegment", "Conversion"),
  entry("Down", "ConvertNext", "Prediction"),
  entry("Down", "PredictAndConvert", "Suggestion"),

  entry("Left", "MoveCursorLeft", "Composition"),
  entry("Left", "SegmentWidthShrink", "Conversion"),
  entry("Right", "MoveCursorRight", "Composition"),
  entry("Right", "SegmentWidthExpand", "Conversion"),
  entry("Ctrl Left", "MoveCursorToBeginning", "Composition"),
  entry("Ctrl Left", "SegmentFocusFirst", "Conversion"),
  entry("Ctrl Right", "MoveCursorToEnd", "Composition"),
  entry("Ctrl Right", "SegmentFocusLast", "Conversion"),
  entry("Shift Right", "SegmentFocusRight", "Conversion"),
  entry("Shift Left", "SegmentFocusLeft", "Conversion"),
  entry("Ctrl Shift Left", "SegmentWidthShrink", "Conversion"),
  entry("Ctrl Shift Right", "SegmentWidthExpand", "Conversion"),
].flatten(1)

File.write('keymap.txt', "status	key	command\n#{entries.join("\n")}")
