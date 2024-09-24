"
I can speak the text stored in the clipboard.

"
Class {
	#name : 'KoeClipboardSpeaker',
	#superclass : 'Object',
	#instVars : [
		'process',
		'sayCommand'
	],
	#classInstVars : [
		'kcs'
	],
	#category : 'KasperPharoExperiments',
	#package : 'KasperPharoExperiments'
}

{ #category : 'accessing' }
KoeClipboardSpeaker class >> kcs [
	kcs ifNil: [ kcs := self new ].
	^kcs
]

{ #category : 'speaker' }
KoeClipboardSpeaker class >> speakClipboard [ 
	self kcs speakClipboard
]

{ #category : 'speaker' }
KoeClipboardSpeaker class >> stopSpeak [ 
	self kcs stopSpeak 
]

{ #category : 'initialization' }
KoeClipboardSpeaker >> initialize [ 
	process := OSSUnixSubprocess new.
	sayCommand := 'say -v Ava -r 200 '
]

{ #category : 'speaker' }
KoeClipboardSpeaker >> speak: text [
	| speakCommandAndText |
	speakCommandAndText := sayCommand , text.
	process shellCommand: speakCommandAndText.
	process run.
]

{ #category : 'speaker' }
KoeClipboardSpeaker >> speakClipboard [
	| speakCommandAndText |
	speakCommandAndText := sayCommand , '"',Clipboard clipboardText string, '"'.
	process shellCommand: speakCommandAndText.
	process run.
]

{ #category : 'speaker' }
KoeClipboardSpeaker >> stopSpeak [
	process sigkill
]
