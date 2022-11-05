; Code NOT by Ryan Scott. I got this off the internet and modified it. https://stackoverflow.com/questions/37981228/bubble-sort-common-lisp-error

; Write a LISP algorithm for a Quicksort, Radix sort OR Shell sort for a list of integers. If you have a favorite sorting algorithm you can write a LISP program for that also. Be sure to add comment that explain how your sorting algorithm works.

; EXPLANATION OF ALGORITHM: Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements if they are in wrong order. - GeeksforGeeks

(defvar numList '(1 2 3 4 3 2 1)) ; initialize variable with list

(format t "Behold, the almighty LIST: ~s" numList)
(terpri) ; new line

(defun bubbleSort (lis)
  (let ((sorted nil) ; initialize sorted flag with false (aka nil)
        (end (length lis))) ; get length of list
    (do () (sorted lis)
      (setf sorted t) ; set sorted flag to true
      (decf end) ;; ==> 1 (equivalent to (setq x (1- x))
      (do ((i 0 (1+ i))) ; lisp for loop
          ((>= i end))
        (when (> (nth i lis) (nth (1+ i) lis)) ; i > i + 1, condition met to swap
          (rotatef (nth i lis) (nth (1+ i) lis)) ; perform the swap
          (setf sorted nil)))))) ; reset sorted flag


(bubbleSort numList)
(format t "The verdict is in! ")	; print results
(format t "Bubble Sort produced this list: ~s " numList)

(read)
