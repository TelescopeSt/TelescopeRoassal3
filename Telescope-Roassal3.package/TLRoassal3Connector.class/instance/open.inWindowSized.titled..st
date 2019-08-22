opening
open: aTLVisualization inWindowSized: aPoint titled: aString
	| window |
	view := RSView new.
	view addInteraction: RSControlsView new.
	window := view open.
	window
		extent: aPoint;
		setLabel: aString.
	aTLVisualization generateWith: self