"
TODO
"
Class {
	#name : #TLDragPointCanvas,
	#superclass : #RSInteraction,
	#category : #'Telescope-Roassal3-Interactions'
}

{ #category : #hooks }
TLDragPointCanvas >> onShape: aCanvas [
	| point |
	aCanvas
		when: RSMouseDragStart do: [ :evt |
			point := RSEllipse new
				size: 50;
				color: Color lightGray translucent;
				isFixed: true;
				position: (evt camera fromSpaceToPixel: evt position);
				yourself.
			aCanvas addShape: point ];
		when: RSMouseDragging do: [ :evt | 
			point position: (evt camera fromSpaceToPixel: evt position).
			];
		when: RSMouseDragEnd do: [ :evt | 
			point remove.
			point := nil.
			].
]
