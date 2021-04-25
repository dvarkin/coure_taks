(defvar *nlist* (nreverse (loop for x from 1 to 999 collect x)))


(defun is_palindrome? (num_str)
  (let ((end (- (length num_str) 1)))
    (or (< end 1)
	(and 
	 (eql (elt num_str 0) (elt num_str end))
	 (is_palindrome? (subseq num_str 1 end))))))

(defun calc_palindrome (a b)
;;  (format t "~a*~a=~a" a b (* a b))
  (let* ((product (* a b))
	 (num_str (write-to-string product)))
    (if (is_palindrome? num_str)
	product
	0)
    ))


(defun euler-4 ()
  (reduce #'max
   (loop for a in *nlist*
	 append (loop for b in *nlist* 
		      collect (calc_palindrome  a b)
		      ))))

