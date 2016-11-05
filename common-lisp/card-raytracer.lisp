;;;
;;; Special thanks to Paul Heckbert
;;;
;;; http://tproger.ru/translations/business-card-raytracer
;;;

(declaim 
 (optimize (speed 3)))

(defpackage :card-raytraycer
  (:use :common-lisp))

(in-package :card-raytraycer)

(require :sb-sprof)

;; "width of the scene screen"
(defparameter *WIDTH* 512)

;; "height of the scene screen"   
(defparameter *HEIGHT* 512)

;;; As there is built-in notion of vector in common lisp, which is an array of 1 dimention,
;;; we will be refering to our class for vector in 3D space as `space vector'.

(defclass v ()
;;  "Space vector, a point in 3D"
  ((x :accessor x
      :initform 0
      :initarg :x)
   (y :accessor y
      :initform 0
      :initarg :y)
   (z :accessor z
      :initform 0
      :initarg :z)))

(defmethod print-object ((s v) out)
  (print-unreadable-object (s out :type t)
    (format out "(~s,~s,~s)" (slot-value s 'x) (slot-value s 'y) (slot-value s 'z))))
  
(defun make-v (&optional (x 0) (y 0) (z 0))
  (make-instance 'v :x (coerce x 'float) :y (coerce y 'float) :z (coerce z 'float)))

(defmethod assign ((s v) (r v))
  "assign a space vector to this one"
  (setf (x s) (x r))
  (setf (y s) (y r))
  (setf (z s) (z r)))

(defmethod v+ ((s v) (r v))
  "vector summ of two space vectors"
  (make-instance 'v 
		 :x (+ (x s) (x r)) 
		 :y (+ (y s) (y r)) 
		 :z (+ (z s) (z r))))

(defmethod v* ((s v) (r number))
  "product of the space vector and a scalar"
  (make-instance 'v 
		 :x (* (x s) r) 
		 :y (* (y s) r)
		 :z (* (z s) r)))

(defmethod v* ((s number) (r number))
  "product of two scalars"
  (* s r)) 

(defmethod % ((s v) (r v))
  "scalar product of two space vectors"
  (+ (* (x s) (x r))
     (* (y s) (y r))
     (* (z s) (z r))))

(defmethod ^ ((s v) (r v))
  "xxxx of two space vectors"
  (make-instance 'v 
		 :x (- (* (y s) (z r)) (* (z s) (y r)))
		 :y (- (* (z s) (x r)) (* (x s) (z r)))
		 :z (- (* (x s) (y r)) (* (y s) (x r)))))

(defmethod ! ((s v))
  "xxxx of a space vector"
  (v* s (/ (sqrt (% s s)))))


(defparameter *G* #(#x0003C712  ;// 00111100011100010010 
		    #x00044814  ;// 01000100100000010100
		    #x00044818  ;// 01000100100000011000
		    #x0003CF94  ;// 00111100111110010100
		    #x00004892  ;// 00000100100010010010
		    #x00004891  ;// 00000100100010010001
		    #x00038710  ;// 00111000011100010000
		    #x00000010  ;// 00000000000000010000
		    #x00000010  ;// 00000000000000010000
		    ))
		  

(defun rnd()
  (random 1.0))

(defmethod tracer ((o v) (d v) (tt cons) (n v))
  (setf (first tt) 1e9)
  (let ((m :sky)
	(p (/ (- (z o)) (z d))))
    (when (< 0.01 p)
      (setf (first tt) p)
      (assign n (make-v 0 0 1))
      (setf m :floor))
    (do ((k 18 (1- k)))	((minusp k) m)
      (do ((j 8 (1- j))) ((minusp j))
	(when (logbitp k (elt *g* j))
	  (break)
	  (let* ((p (v+ o (make-v (- k) 0 (- 0 j 4))))
		 (b (% p d))
		 (c (1- (% p p)))
		 (q (- (* b b) c)))
	    (when (plusp q)
	      (let* ((s (- b (sqrt q))))
		(when (< 0.01 s (first tt))
		  (setf (first tt) s)
		  (assign n (! (+ p (v* d (first tt)))))
		  (setf m :sphere))))))))))

(defmethod sampler ((o v) (d v))
  (let* ((tt (list nil))
	 (n (make-v))
	 (m (tracer o d tt n)))
    (cond 
      ((eq m :sky) 
       (v* (make-v 0.7 0.6 1) (expt (- 1 (z d)) 4)))
      (t (let* ((h (v+ o (v* d (first tt))))
		(l (! (v+ (make-v (+ (rnd) 9) (+ (rnd) 9) 16) (v* h -1))))
		(r (v+ d (v* n (v* (% n d) -2))))
		(b (% l n )))
	   (when (or (minusp b) (tracer h l tt n))
	     (setf b 0))
	   (let ((p (expt (v* (% l r) (if (> b 0) 1 0)) 99)))
	     (case m
	       (:floor (setf h (v* h 0.2))
		       (v*
			(if (logbitp 1 (floor (+ (ceiling (x h)) (ceiling (y h))))) 
			    (make-v 3 1 1) 
			    (make-v 3 3 3)) 
			(+ (* b .2) .1)))
	       (:sphere 
		(v+ (make-v p p p) (v* (sampler h r) 0.5))))))))))

(defun main (argv)
  (with-open-file (out (elt argv 1) :direction :output :if-exists :supersede)
    (declare (stream out)
	     (fixnum *HEIGHT* *WIDTH*))
    (format out "P6 ~d ~d 255 " *width* *height*)
    (let* ((g (! (make-v -6 -16 0)))
	   (a (v* (! (^ (make-v 0 0 1) g)) 0.002))
	   (b (v* (! (^ g a)) 0.002))
	   (c (v+ (v* (v+ a b) -256) g)))
	   (loop for y from (1- *HEIGHT*) downto 0 
		do (loop for x from (1- *WIDTH*) downto 0
			do (let ((p (make-v 13 13 13)))
			     (dotimes (r 64)
			       (let ((tt (v+ (v* a (* (- (rnd) .5) 99)) (v* b (* (- (rnd) .5) 99)))))
				 (assign p
					 (v+
					  (v* (sampler 
					       (v+ (make-v 17 16 8) tt)

					       (! (v+ (v* tt -1)
						      (v* (v+ (v+ (v* a (+ x (rnd))) 
								  (v* b (+ y (rnd))))
								  c)
							  16))))
					      3.5)
					  p))))
			     (format out "~C~C~C" 
				     (code-char (floor (x p)))
				     (code-char (floor (y p)))
				     (code-char (floor (z p))))))))))

;(eval-when (:load-toplevel)
;  (let ((v (make-v)))
;    (format t "~% ~A" v)))

;(sb-sprof:with-profiling (:max-samples 1000
;                          :report :flat
;                          :loop t
;                          :show-progress t)
;  (main '(asbf "card.ppm")))

(main '(asbf "card.ppm"))
    


