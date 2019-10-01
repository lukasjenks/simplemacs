(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize))

(setq initial-major-mode 'text-mode)

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq initial-scratch-message nil)
(setq message-log-max nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu t)

(kill-buffer "*Messages*")
(add-hook 'minibuffer-exit-hook 
   '(lambda ()
      (let ((buffer "*Completions*"))
        (and (get-buffer buffer)
         (kill-buffer buffer)))))

(cond
((string-equal system-type "windows-nt") (global-display-line-numbers-mode t))
((string-equal system-type "gnu/linux") (global-display-line-numbers-mode t)))

;; (require 'hlinum)
;; (hlinum-activate)

(add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1)))
(add-hook 'tetris-mode-hook (lambda() (display-line-numbers-mode-mode -1)))
(add-hook 'snake-mode-hook (lambda() (display-line-numbers-mode -1)))
(add-hook 'doctor-mode-hook (lambda() (display-line-numbers-mode -1)))

(xterm-mouse-mode t)

;;(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 4)
;;(setq c-basic-offset 4)
;;(setq tab-stop-list (number-sequence 4 200 4))

(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq backward-delete-char-untabify-method 'hungry)

(setq scroll-conservatively 101)

(setq mouse-wheel-scroll-amound '(1))
(setq mouse-wheel-progressive-speed nil)

(setq create-lockfiles nil)

(setq backup-directory-alist `(("." . "~/saves")))

(cond
((string-equal system-type "windows-nt")
(set-face-attribute 'default nil
                 :family "consolas"
                 :height 110
                 :weight 'normal
                 :width 'normal))
((string-equal system-type "gnu/linux")
(set-face-attribute 'default nil
                 :family "SourceCodePro-Regular"
                 :height 115
                 :weight 'normal
                 :width 'normal)))

(setq-default cursor-type 'bar)
(set-cursor-color "#d742f4")

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'centaur-tabs)
(centaur-tabs-mode t)
;; (global-set-key (kbd "C-7") 'centaur-tabs-add-tab)
;; (global-set-key (kbd "C-8") 'centaur-tabs-backward)
;; (global-set-key (kbd "C-9") 'centaur-tabs-forward)
(setq centaur-tabs-style "alternate")
(setq centaur-tabs-set-bar 'over)

(global-set-key [f9] 'treemacs)

(cond
((string-equal system-type "windows-nt") (load (expand-file-name "c:/Users/ljenks/quicklisp/slime-helper.el")))
((string-equal system-type "gnu/linux") (load (expand-file-name "~/quicklisp/slime-helper.el"))))
(setq inferior-lisp-program "alisp")

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; (ac-config-default)
;; (global-auto-complete-mode t)
;; (ac-linum-workaround)

(add-hook 'after-init-hook 'global-company-mode)

(defun tldr-newsletter () (interactive)
    (switch-to-buffer (get-buffer-create "tldr-newsletter"))

    ;; Check if today's tldr is available (released 6AM ETC)
    ;; (if (equal (shell-command-to-string (concat "/usr/bin/curl -s -o /dev/null -w \"%{http_code}\" http://www.tldrnewsletter.com/archives/" (format-time-string "%Y%m%d"))) "200")

    (with-current-buffer "tldr-newsletter"
        (goto-char (point-max))

        (cond
            ((string-equal system-type "windows-nt")
                (setq curl-cmd "C:/Windows/System32/curl -s https://www.tldrnewsletter.com/archives/"))
            ((string-equal system-type "gnu/linux")
                (setq curl-cmd "/usr/bin/curl -s https://www.tldrnewsletter.com/archives/")))

                ;; Insert latest tldr newsletter HTML webpage into the buffer
                (insert
                    (shell-command-to-string (concat curl-cmd (format-time-string "%Y%m%d"))))

        ;; Render HTML content so it is readable to the user
        (shr-render-region (point-min) (point-max))
        (beginning-of-buffer)
        (read-only-mode 1)
    )
)

(setq x-select-enable-clipboard t)
