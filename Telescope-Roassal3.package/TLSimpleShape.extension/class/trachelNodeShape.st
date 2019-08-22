*Telescope-Roassal3
trachelNodeShape
	^ TSPolygon new
		points: (self polygonPoints collect: [ :p | p * (1 @ -1) ]);
		yourself