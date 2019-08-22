generation - interaction
generateClickInteraction: aTLClickInteraction onDrawable: aTLDrawable targetingDrawable: aTLDrawableTarget
	(self elementFromTLDrawable: aTLDrawable)
		when: TSMouseClick
		do: [ aTLClickInteraction actionOn: aTLDrawableTarget.
			aTLDrawableTarget visualization updateWith: self ]