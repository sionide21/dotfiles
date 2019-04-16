(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; This crap was auto added when I installed my first package
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (distinguished-theme atom-one-dark-theme all-the-icons-ivy all-the-icons-dired neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Function to load additional conf files from .emacs directory
(defun load-user-conf (filename)
  (load-file (locate-user-emacs-file (concat filename ".el"))))


;; Run Setup Functions
; (load-user-conf "setup")

(setq inhibit-splash-screen t)    ; Don't show startup help
(setq split-width-threshold nil)  ; Don't auto-split windows
(setq make-backup-files nil)      ; Don't create backup~ files


;; Enable file browser sidebar
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Add a flag to show neo-tree on launch
(setq flag-enable-neotree (member "-tree" command-line-args))
(setq command-line-args (delete "-tree" command-line-args))

(if flag-enable-neotree
  (neotree-show))

;;(save-current-buffer (neotree-show))

;; Fuzzy Tab Completion
(ido-mode)
(ivy-mode)



;; Load additional cofigs based on whether this is a terminal or a gui
(if (display-graphic-p)
  (load-user-conf "gui")
  (load-user-conf "term"))

