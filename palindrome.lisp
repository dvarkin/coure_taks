(defvar *nlist* (nreverse (loop for x from 1 to 999 collect x)))


(defun is_palindrome? (num_str)
  (let ((end (- (length num_str) 1)))
    (or (< end 1)
	(and 
	 (eql (elt num_str 0) (elt num_str end))
	 (is_palindrome? (subseq num_str 1 end))))))

(defun calc_palindrome (a b)
  (let* ((product (* a b))
	 (num_str (write-to-string product)))
    (when (is_palindrome? num_str)
      product)))


(defun euler-4 ()
  (loop named loop-1 for a in *nlist*
	do (loop  for b in *nlist*
		  when (is_palindrome? (write-to-string  (* a b)))
		    do  (progn (format t "~a*~a=~a" a b (* a b))
			 (return-from loop-1 (* a b))))))

