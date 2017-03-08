
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; markdown-mode
(add-to-list 'load-path "~/.emacs.d/plugins")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; color-theme
(load-theme 'tango-dark t)

;; display line-number left side
(require 'linum)
(global-linum-mode)
(setq linum-format "%3d ")

;; disable garbage
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; disable UI
(menu-bar-mode 0)
;(tool-bar-mode 0)

;; default init display
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

(electric-indent-mode -1)

;; show ruler
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
