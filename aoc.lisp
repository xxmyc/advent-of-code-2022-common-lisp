;; aoc-1
(defun aoc-1 ()
    (with-open-file (input #P"aoc-1/input.txt"
                       :direction :input)
      (let ((result '())
            (sum 0))
        (do ((line (read-line input nil 'eof)
                   (read-line input nil 'eof)))
            ((equal line 'eof))
          (if (equal line "")
              (progn
                (push sum result)
                (setf sum 0))
              (progn
                (setf sum (+ sum (parse-integer line))))))
        (format t "Part1:~A~%" (first result))
        (setf result (sort result #'>))
        (format t "Part2:~A~%"
                (+ (first result) (second result) (third result))))))

;; aoc-2
;; I use the package 'str',please install 'quickload' first.
(ql:quickload "str")
(defun aoc-2 (f)
  (with-open-file (input #P"aoc-2/input.txt"
                         :direction :input)
    (let ((sum 0))
      (do ((line (read-line input nil 'eof)
                 (read-line input nil 'eof)))
          ((equal line 'eof))
        (setf sum (+ sum (funcall f (str::split #\SPACE line)))))
      sum)))
(defun aoc-2-part1 (list)
  (let ((abc "ABC")
        (xyz "XYZ")
        (result #2A((4 8 3) (1 5 9) (7 2 6))))
    (aref result (position (char (first list) 0) abc)
          (position (char (second list) 0) xyz))))
(defun aoc-2-part2 (list)
  (let ((abc "ABC")
        (xyz "XYZ")
        (result #2A((3 4 8) (1 5 9) (2 6 7))))
    (aref result (position (char (first list) 0) abc)
          (position (char (second list) 0) xyz))))
(defun aoc-2-answer ()
  (format t "Part1:~A~%" (aoc-2 #'aoc-2-part1))
  (format t "Part2:~A~%" (aoc-2 #'aoc-2-part2)))

;; aoc-3
;;
(defun aoc-3-answer ()
  (format t "Part1:~A~%" (aoc-3-part1))
  (format t "Part2:~A~%" (aoc-3-part2)))
;;part1
(defun aoc-3-part1 ()
  (with-open-file (input #P"aoc-3/input.txt"
                         :direction :input)
    (let ((sum 0))
      (do ((line (read-line input nil 'eof)
                 (read-line input nil 'eof)))
          ((equal line 'eof))
        (setf sum (+ sum (aoc-3-part1-tool line))))
      sum)))
(defun aoc-3-part1-tool (str)
  (let* ((len (length str))
         (mid (/ len 2))
         (f-str (coerce (subseq str 0 mid) 'list))
         (l-str (coerce (subseq str mid len) 'list)))
    (dolist (ch f-str)
      (if (member ch l-str)
          (return (gererate-priority ch))))))
;;part2
(defun aoc-3-part2 ()
  (with-open-file (input #P"aoc-3/input.txt"
                         :direction :input)
    (let ((sum 0))
      (do ((line1 (read-line input nil 'eof)
                  (read-line input nil 'eof))
           (line2 (read-line input nil 'eof)
                  (read-line input nil 'eof))
           (line3 (read-line input nil 'eof)
                  (read-line input nil 'eof)))
           ((equal line1 'eof))
        (setf sum (+ sum (aoc-3-part2-tool line1 line2 line3))))
      sum)))
(defun aoc-3-part2-tool (str1 str2 str3)
  (let* ((s1 (coerce str1 'list))
         (s2 (coerce str2 'list))
         (s3 (coerce str3 'list)))
    (dolist (ch s1)
      (if (and (member ch s2)
               (member ch s3))
          (return (gererate-priority ch))))))
;;tool function
(defun gererate-priority (ch)
  (let ((priority "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"))
    (1+ (position ch priority))))

;;aoc-3
;;

(defun aoc-4-answer ()
  (format t "Part1:~A~%" (aoc-4 #'aoc-4-part1-tool))
  (format t "Part2:~A~%" (aoc-4 #'aoc-4-part2-tool)))

(defun aoc-4 (f)
  (with-open-file (input #P"aoc-4/input.txt"
                         :direction :input)
    (let ((count 0))
      (do ((line (read-line input nil 'eof)
                 (read-line input nil 'eof)))
          ((equal line 'eof))
        (if (funcall f line)
            (setf count (1+ count))))
      count)))
(defun aoc-4-part1-tool (s)
  (let* ((s1 (str::split #\, s))
         (s2 (str::split #\- (first s1)))
         (s3 (str::split #\- (second s1)))
         (l1 (parse-integer (first s2)))
         (l2 (parse-integer (second s2)))
         (r1 (parse-integer (first s3)))
         (r2 (parse-integer (second s3))))
    ;(format t "~A:~A~%" (stringp (first s2)) s3)
    (if (or (and (<= l1 r1)
                 (>= l2 r2))
            (and (>= l1 r1)
                 (<= l2 r2)))
        T
        nil)))
(defun aoc-4-part2-tool (s)
  (let* ((s1 (str::split #\, s))
         (s2 (str::split #\- (first s1)))
         (s3 (str::split #\- (second s1)))
         (l1 (parse-integer (first s2)))
         (l2 (parse-integer (second s2)))
         (r1 (parse-integer (first s3)))
         (r2 (parse-integer (second s3))))
    ;(format t "~A:~A~%" (stringp (first s2)) s3)
    (if (or (< l2 r1)
            (> l1 r2))
        nil
        T)))
