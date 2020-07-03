"
TODO
"
Class {
	#name : #TLDraggable,
	#superclass : #RSInteraction,
	#category : #'Telescope-Roassal3-Interactions'
}

{ #category : #hooks }
TLDraggable >> createBox: evt [
	| box c |
	c := evt canvas.
	box := RSBox new
		fromRectangle: evt shape encompassingRectangle;
		cornerRadius: 10;
		color: Color gray translucent;
		yourself.
	box extent: box extent + 20.
	c add: box.
	evt shape propertyAt: self key put: box.
]

{ #category : #hooks }
TLDraggable >> getBoxFrom: evt [
	^ evt shape propertyAt: self key
]

{ #category : #hooks }
TLDraggable >> key [
	^ #tlbox
]

{ #category : #hooks }
TLDraggable >> onShape: aShape [
	aShape draggable.
	aShape
		when: RSMouseDragStart send: #createBox: to: self;
		when: RSMouseDragging send: #updateBox: to: self;
		when: RSMouseDragEnd send: #removeBox: to: self.
	
]

{ #category : #hooks }
TLDraggable >> removeBox: evt [
	| box |
	box := self getBoxFrom: evt.
	box remove.
	evt shape removeKey: self key.
	evt signalUpdate.
]

{ #category : #hooks }
TLDraggable >> updateBox: evt [
	| box |
	box := self getBoxFrom: evt.
	box position: evt shape position.
]
