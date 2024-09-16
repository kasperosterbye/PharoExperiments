"
This program reduces page shifts from the input text file.
In all its simplicity, 
""bla bla
bla bla""
is rewritten to ""bal bla bla bla"", that is line shift is removed and a space is inserted instead
"
Class {
	#name : #AmazonToSpeechify,
	#superclass : #Object,
	#instVars : [
		'sourceFile',
		'betterText',
		'targetFile'
	],
	#category : #KasperPharoExperiments
}

{ #category : #'instance creation' }
AmazonToSpeechify class >> fromTextFile: named [

	| anAmazonToSpeechify |
	anAmazonToSpeechify := self new.

	anAmazonToSpeechify sourceFile: named.
	^anAmazonToSpeechify 
]

{ #category : #accessing }
AmazonToSpeechify >> adjustText [
	"change single letter seperated by newline by space"
	| index endIndex|
	index := 1.
	endIndex := betterText size.
	[index < endIndex] whileTrue: [
		index := betterText indexOfAnyOf: Character lf asString startingAt: index.
		(index > 1) & (index + 1 < endIndex ) 
			ifTrue: [ self handleIndex: index].
		index := index + 1.
	].
	self writeTargetFile.
	^betterText 
]

{ #category : #accessing }
AmazonToSpeechify >> betterText [
	^ betterText
]

{ #category : #accessing }
AmazonToSpeechify >> handleIndex: index [
	"Check that betterText at index is X'lf'y, where x and y are letters. If both are letters, change lf to space"
	| before after|
	before := betterText at: index - 1.
	after := betterText at: index + 1.
	(before isLetter) & (after isLetter ) 
		ifTrue: [ betterText at: index put: Character space ]
]

{ #category : #accessing }
AmazonToSpeechify >> sourceFile [

	^ sourceFile
]

{ #category : #accessing }
AmazonToSpeechify >> sourceFile: anObject [

	sourceFile := anObject.
	betterText := sourceFile asFileReference contents
]

{ #category : #accessing }
AmazonToSpeechify >> writeTargetFile [
	targetFile := (sourceFile copyReplaceAll: '.txt' with: '-A.txt' ) asFileReference writeStream.
	targetFile nextPutAll: betterText.
	targetFile close.
]
