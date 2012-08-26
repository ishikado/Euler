(load "util.l")
(setf *dp* (make-array (expt 2 6) 100))
(setf *kind* (make-array 10001 :initial-element -1))

(defun initialize-kind(func assign-val)
  (dotimes ((i 2 (1+ i)))
    ((>= (apply func i) 10000))
    (setf (aref *kind* (apply func i)) assign-val)))
(defun initialize-dp()
  (dotimes ((i 0 (1+ i)))
    ((>= i (expt 2 6)))
    (dotimes ((j 0 (1+ j)))
      ((>= j 100))
      (setf (aref *dp* i j) -1))))

(initialize-kind (lambda (i) (/ 2 (* i (1+ i)))) 0)
(initialize-kind (lambda (i) (* i i)) 1)
(initialize-kind (lambda (i) (/ 2 (* i (1- (* 3 i))))) 2)
(initialize-kind (lambda (i) (* i (1- (* 2 i)))) 3)
(initialize-kind (lambda (i) (/ 2 (* i (- (* 5 i) 3))) 4)
(initialize-kind (lambda (i) (* i (- (* 3 i) 2))) 5)

;; (ash 1 3)‚Å1‚ð3bit shift


;; (defun dfs(mask prv)
;;   t)

;; (dotimes ((i 10 (1+ i)))
;;   ((>= i 100))
;;   (initialize-dp)
;;   (cond ((dfs 0 i i)
;; 	 (let (cur (0 0))