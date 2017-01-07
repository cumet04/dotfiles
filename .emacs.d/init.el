
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/plugins")

;; font setting
(if (display-graphic-p) 
    (progn
        (set-face-attribute 'default nil :family "Ricty Diminished" :height 180)
        (set-fontset-font t 'japanese-jisx0208 (font-spec :family "Ricty Diminished"))
))

;; color-theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'molokai t)
(enable-theme 'molokai)

;; display line-number left side
(require 'linum)
(global-linum-mode)
(setq linum-format "%3d ")

;; markdown-mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(if (display-graphic-p)
    (setq confirm-kill-emacs 'y-or-n-p))

;; default init display
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

;; disable auto-indent
;; (add-hook 'Latex-mode-hook '(lambda () (electric-indent-local-mode -1)))
(electric-indent-mode -1)

(menu-bar-mode 0)
(tool-bar-mode 0)

(add-hook 'window-configuration-change-hook (lambda () (ruler-mode 1)))

;; C-h -> backspace
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; clipboard
(if (string-match "linux" system-configuration)
    (progn
        (setq interprogram-paste-function
            (lambda () (shell-command-to-string "xclip -o -selection clipboard")))
        (setq interprogram-cut-function
            (lambda (text &optional rest)
                (let* ((process-connection-type nil)
                       (proc (start-process "xclip" nil "xclip" "-i" "-selection" "clipboard")))
                    (process-send-string proc text)
                    (process-send-eof proc)))
        )))

(if (string-match "apple-darwin" system-configuration)
    (progn
        (defun copy-from-osx ()
         (shell-command-to-string "pbpaste"))
        (defun paste-to-osx (text &optional push)
         (let ((process-connection-type nil))
             (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
               (process-send-string proc text)
               (process-send-eof proc))))
        (setq interprogram-cut-function 'paste-to-osx)
        (setq interprogram-paste-function 'copy-from-osx)
    ))
