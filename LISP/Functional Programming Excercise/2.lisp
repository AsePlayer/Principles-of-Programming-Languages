; Code by Ryan Scott
; 2. Write a function that computes the maximum and minimum of a list of integers.

(defvar numList '(1 2 3 4 7 2 5 -420)) ; initialize variable with list
(defvar maximum -999999) ; initialize max with very small number
(defvar minimum  999999) ; initialize min with very big number


(format t "Behold, the almighty LIST: ~s" numList)
(terpri) ; new line

(format t "Checking for Max and Min...")
(terpri) ; new line

(defun getMinMax ()
	(loop for item in numList ; loop for every item in the list
		do 
		(when (< item minimum) ; when item < minimum
			(setf minimum item) ; set new minimum
		)
		(when (> item maximum) ; when item > maximum
			(setf maximum item) ; set new maximum
		)
	)
)

(getMinMax)

(format t "The verdict is in! ")	; print results

(format t "Max is: ~s " maximum)
(format t "Min is: ~s " minimum)
	
(read)