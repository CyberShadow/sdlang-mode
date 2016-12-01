;;; sdlang-mode-test.el --- Tests for Simple Declarative Language major mode

;;; Commentary:

;;; Code:

(require 'sdlang-mode nil t)

(require 'htmlfontify)

(defun sdlang-mode-test-read-file (name)
  "Read file NAME and return it as a string."
  (with-temp-buffer
    (insert-file-contents name)
    (buffer-string)))

(defun sdlang-mode-test-htmlize-file (name)
  "Read file NAME, fontify it and return the HTML as a string."
  (save-current-buffer
    (find-file name)
    (let ((hfy-optimisations (list 'body-text-only 'merge-adjacent-tags)))
      (with-current-buffer (htmlfontify-buffer) (buffer-string)))))

(ert-deftest sdlang-mode-test-fontification ()
  (should
   (equal
    (sdlang-mode-test-htmlize-file "test.sdl")
    (sdlang-mode-test-read-file "test.sdl.html"))))

;;----------------------------------------------------------------------------

(provide 'sdlang-mode-test)

;;; sdlang-mode-test.el ends here
