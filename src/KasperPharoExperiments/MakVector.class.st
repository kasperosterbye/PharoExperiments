"
I am a vector with origin, angle from the x axis, and a length. 
"
Class {
	#name : 'MakVector',
	#superclass : 'Object',
	#instVars : [
		'angle',
		'length',
		'origin'
	],
	#category : 'KasperPharoExperiments',
	#package : 'KasperPharoExperiments'
}

{ #category : 'accessing' }
MakVector class >> from: p1 to: p2 [
	"create a vector with origin in p1, and angle and length to hit p2"
	| diff |
	diff := p2-p1.
	^ self new
		origin: p1;
		angle: diff angle;
		length: diff r
]

{ #category : 'accessing' }
MakVector >> angle [

	^ angle
]

{ #category : 'accessing' }
MakVector >> angle: anObject [

	angle := anObject
]

{ #category : 'accessing' }
MakVector >> length [

	^ length
]

{ #category : 'accessing' }
MakVector >> length: anObject [

	length := anObject
]

{ #category : 'accessing' }
MakVector >> origin [

	^ origin
]

{ #category : 'accessing' }
MakVector >> origin: anObject [

	origin := anObject
]

{ #category : 'accessing - structure variables' }
MakVector >> x [
	^ angle cos * length + origin x
]

{ #category : 'accessing - structure variables' }
MakVector >> y [
	^ angle sin * length + origin y
]
