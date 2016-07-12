(add-to-list 'load-path "~/.emacs.d/plugins")

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

;; disable auto-indent
;; (add-hook 'Latex-mode-hook '(lambda () (electric-indent-local-mode -1)))
(electric-indent-mode -1)

(menu-bar-mode 0)

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
