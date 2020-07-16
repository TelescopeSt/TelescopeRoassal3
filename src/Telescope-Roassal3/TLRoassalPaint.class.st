"
TODO
"
Class {
	#name : #TLRoassalPaint,
	#superclass : #Object,
	#instVars : [
		'color',
		'imageUrl',
		'firstTime',
		'image'
	],
	#category : #'Telescope-Roassal3-Utils'
}

{ #category : #accessing }
TLRoassalPaint >> asAthensPaintOn: canvas [
	^ self
]

{ #category : #accessing }
TLRoassalPaint >> athensFillPath: aPath on: aCanvas [ 
	| img |
	color
		ifNotNil: [ color athensFillPath: aPath on: aCanvas ].
	img := self image.
	img ifNotNil: [ img athensFillPath: aPath on: aCanvas ].
]

{ #category : #accessing }
TLRoassalPaint >> color: aColor [ 
	aColor isColor ifFalse: [ self halt. ].
	color := aColor
]

{ #category : #accessing }
TLRoassalPaint >> image [
	| url client paint img |
	imageUrl ifNil: [ ^ nil ].
	image ifNotNil: [ ^ image ].
	firstTime ifFalse: [ ^ nil ].
	firstTime := false.
	
	url := imageUrl.
	(url beginsWith: 'http')
		ifFalse: [ url := 'http://localhost:8080',url].
	[ 
	[(client := ZnEasy client)
		url: url;
		accept: ZnMimeType imagePng;
		get.
	img := ImageReadWriter formFromStream: client entity readStream.
	paint := (AthensCairoPatternSurfacePaint 
		createForSurface: (AthensCairoSurface 
			fromForm: img)).
	paint origin: (img extent /2) negated asFloatPoint.
	image := paint.
		] on: Error do: [ :ex | ex traceCr ]
	 ] fork.
	^ nil
]

{ #category : #accessing }
TLRoassalPaint >> imageUrl: aString [ 
	imageUrl := aString
]

{ #category : #initialization }
TLRoassalPaint >> initialize [
	super initialize.
	firstTime := true
]
