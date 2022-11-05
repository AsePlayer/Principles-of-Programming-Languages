; Code by Ryan Scott
; Write a tail-recursive function to compute the length of an arbitrary list.

(defvar numList '(1 2 3 4)) ; initialize variable with list
(defvar counter 0)

(format t "Behold, the almighty LIST: ~s" numList)
(terpri) ; new line

(defun getLengthOfList(theList i)
	(if (null theList) i ; if list is null, don't do recursive call
		(getLengthOfList (cdr theList) (+ i 1)) ; else, do recursive call going up the list
	)
)

(setf counter (getLengthOfList numList 0))
(format t "The verdict is in! ")	; print results
(format t "Length of the list is: ~s" counter)

(read)
