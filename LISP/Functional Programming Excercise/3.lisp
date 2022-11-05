; Code by Ryan Scott
; 3. Write a function that collects integers from the user until a 0 is encountered and returns them in a list in the order they were input.

(defvar numList '()) ; initialize variable with list
(defvar *userInput*) ; initialize empty userInput variable

(format t "Behold, the almighty LIST: ~s" numList)
(terpri) ; new line
(format t "...")
(terpri) ; new line
(format t "It is quite plain at the moment... perhaps you can change that?")
(terpri) (terpri) ; new lines


(defun addToList ()
	(setf userInput (read)) ; read user input
	(loop while (/= userInput 0); loop while user input isn't 0
	do
		(push userInput numList) ; pushes the new input to the front of the list
		(format t "~s Added! Don't stop til' you're numb! (0 to stop)" userInput)
		(terpri) ; new line
		(setf userInput (read)) ; read new user input
	)
	(setf numList(reverse numList)) ; reverse list when loop is finished to display correct order
)

(addToList)

(format t "The verdict is in! ")	; print results
(format t "You added these numbers to the list: ~s " numList)
	
(read)