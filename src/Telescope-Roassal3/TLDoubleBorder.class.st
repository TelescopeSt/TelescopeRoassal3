"
created to simulated the double border
"
Class {
	#name : #TLDoubleBorder,
	#superclass : #RSBorder,
	#category : #'Telescope-Roassal3-Utils'
}

{ #category : #visiting }
TLDoubleBorder >> accept: visitor [
	^ visitor visitDoubleBorder: self.
]
