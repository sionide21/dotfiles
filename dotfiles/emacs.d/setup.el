;; Ensure that one-time setup happens on new machines


;; Install fonts for "all-the-icons"
;; (unless (file-accessible-directory-p "./fonts")
;;   (let ((font-dir (locate-user-emacs-file "fonts"))
;; 	(read-file-name-function nil))

;;     (setq read-file-name-function (lambda (&rest _) font-dir))
;;     (message (format "Installing icon fonts to %s" font-dir))
;;     (all-the-icons-install-fonts 1)))

(let* ((font-dir (locate-user-emacs-file "fonts"))
       (read-file-name-function (lambda (&rest _) font-dir))
       (process-environment (cons "HOME=/tmp/laskdjf" process-environment)))
  (unless (file-accessible-directory-p font-dir)
    (message (format "Installing icon fonts to %s" font-dir))
    (all-the-icons-install-fonts 1)))

