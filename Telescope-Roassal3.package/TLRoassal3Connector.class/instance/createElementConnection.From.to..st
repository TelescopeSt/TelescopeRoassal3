generation - connection
createElementConnection: aTLConnection From: aTLNodeSource to: aTLNodeTarget
	
	| from to |
	from := self elementFromTLDrawable: aTLNodeSource.
	to := self elementFromTLDrawable: aTLNodeTarget.
	^ RSEdge new
		shape: TSLine new;
		from: from;
		to: to;
		yourself.
