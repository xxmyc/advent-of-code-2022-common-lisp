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
