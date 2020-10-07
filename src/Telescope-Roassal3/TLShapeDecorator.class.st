"
TODO
"
Class {
	#name : #TLShapeDecorator,
	#superclass : #Object,
	#instVars : [
		'shape',
		'userFixedPosition'
	],
	#category : #'Telescope-Roassal3-Utils'
}

{ #category : #accessing }
TLShapeDecorator >> adjustPosition: evt [
	| delta |
	delta := evt newPosition - evt oldPosition.
	self children do: [ :child | 
		child translateBy: delta.
		].
	self parent ifNotNil: #adjustToChildren.
	
	
]

{ #category : #accessing }
TLShapeDecorator >> adjustToChildren [
	| rect box |
	rect := self children encompassingRectangle.
	box := self shape shapes first.
	box extent: rect extent+20.
	self shape 
		position: rect floatCenter;
		extent: box extent.
	self parent ifNotNil: #adjustToChildren.
]

{ #category : #accessing }
TLShapeDecorator >> children [
	^ shape propertyAt: #tlchildren ifAbsent: [ #() ]
]

{ #category : #accessing }
TLShapeDecorator >> children: aCollection [
	shape propertyAt: #tlchildren put: aCollection
]

{ #category : #'as yet unclassified' }
TLShapeDecorator >> defineFixedRelativePosition: aPoint [ 
	userFixedPosition := false.
	shape propertyAt: #decorator put: self.
	self position: aPoint.
	userFixedPosition :=  true.
]

{ #category : #dimension }
TLShapeDecorator >> dimension [
	^ self hasChildren
		ifTrue: [ self children extent + 20 ]
		ifFalse: [ shape extent ]
	
]

{ #category : #accessing }
TLShapeDecorator >> encompassingRectangle [
	^ Rectangle center: self position extent: self dimension
]

{ #category : #geometry }
TLShapeDecorator >> extent: aPoint [
	| node |
	shape extent: aPoint.
	shape shapes first extent: aPoint.
	shape shapes size < 2 ifTrue: [ ^ self ].
	
	shape shapes second remove.
	node := shape model.
	shape add: (node generator 
		createLabelFor: node 
		style: node effectiveStyleSheet 
		shape: shape shapes first).
	
]

{ #category : #accessing }
TLShapeDecorator >> hasChildren [
	^ self children isNotEmpty
]

{ #category : #'as yet unclassified' }
TLShapeDecorator >> incomingAdjacentNodes [
	| decorators |
	decorators := shape canvas tlDecorators.
	
	^ shape children first incomingEdges
		collect: [ :ed |
			decorators at: ed from ].
]

{ #category : #initialization }
TLShapeDecorator >> initialize [
	super initialize.
	userFixedPosition := false.
]

{ #category : #testing }
TLShapeDecorator >> isNode [
	^ shape isNode
]

{ #category : #dimension }
TLShapeDecorator >> occupyMaxSpace [
	^ false
]

{ #category : #'as yet unclassified' }
TLShapeDecorator >> outgoingAdjacentNodes [
	| decorators |
	decorators := shape canvas tlDecorators.
	
	^ shape children first outgoingEdges
		collect: [ :ed |
			decorators at: ed to ].
]

{ #category : #accessing }
TLShapeDecorator >> parent [
	^ shape propertyAt: #tlparent
]

{ #category : #accessing }
TLShapeDecorator >> parent: aTLShapeDecorator [
	shape propertyAt: #tlparent put: aTLShapeDecorator
]

{ #category : #accessing }
TLShapeDecorator >> position [
	^ shape position
]

{ #category : #accessing }
TLShapeDecorator >> position: aPoint [
	| gap e |
	self userFixedPosition ifTrue: [ ^ self ].
	
	shape position: aPoint.
	self hasChildren ifFalse: [ ^ self ].
	gap := 0@ -5.
	e := self children encompassingRectangle.
	
	self children do: [ :child | 
		child position: child position +((aPoint - e floatCenter))+ gap.
		 ].
]

{ #category : #removing }
TLShapeDecorator >> remove: aTLShapeDecorator [
	self children
		remove: aTLShapeDecorator
]

{ #category : #accessing }
TLShapeDecorator >> shape [
	^ shape
]

{ #category : #accessing }
TLShapeDecorator >> shape: aRSShape [
	shape := aRSShape.
	shape when: RSPositionChangedEvent send: #adjustPosition: to: self. 
]

{ #category : #accessing }
TLShapeDecorator >> translateBy: delta [
	^ shape translateBy: delta
]

{ #category : #accessing }
TLShapeDecorator >> userFixedPosition [
	^ userFixedPosition
]
