;; color-theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'molokai t)
(enable-theme 'molokai)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; display line-number left side
(require 'linum)
(global-linum-mode)
(setq linum-format "%3d ")

;; for window system
(if window-system 
    (progn
      (set-frame-parameter nil 'alpha 95)
      (tool-bar-mode 0)
      (if (string-match "apple-darwin" system-configuration)
        (progn
          (create-fontset-from-ascii-font "Ricty-18:weight=normal:slant=normal" nil "ricty")
          (set-fontset-font "fontset-ricty"
                            'unicode
                            (font-spec :family "Ricty" :size 18)
                            nil
                            'append)
          (add-to-list 'default-frame-alist '(font . "fontset-ricty"))))
      (if (string-match "mingw" system-configuration)
        (progn
          (create-fontset-from-ascii-font "Myrica M-18:weight=normal:slant=normal" nil "myrica")
          (set-fontset-font "fontset-myrica"
                            'unicode
                            (font-spec :family "Myrica M" :size 18)
                            nil
                            'append)
          (add-to-list 'default-frame-alist '(font . "fontset-myrica"))))
    ))


;; disable auto-indent
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
