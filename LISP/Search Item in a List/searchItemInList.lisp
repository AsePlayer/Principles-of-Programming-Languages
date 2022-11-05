; Code by Ryan Scott
(defvar numList '(1 2 3 4)) ; initialize variable with list
(defvar *searchFor*) 		; initialize variable without value
(defvar foundItem 0) 		; initialize variable with value

(loop while (equal 1 1) ; while true
	do
	(format t "Behold, the almighty LIST: ~s" numList)
	(terpri) ; new line

	(format t "Check for item in list: ")
	(setf searchFor (read)) ; takes user input
	(terpri) ; new line

	(loop for item in numList ; loop for every item in the list
		do 
		(if (equal searchFor item) ; if the item matches user input
				(setf foundItem 1) ; item found, change flag
		) 
	)

	(format t "The verdict is in! ")	; print results
	(if (equal foundItem 0) 							; if-part
		(format t "Didn't find item: ~s" searchFor) 	; then-part
	(format t "Found item: ~s" searchFor)) 				; else-part
	(terpri) (terpri) ; new lines
	
	(setf foundItem 0) ; reset flag
)
