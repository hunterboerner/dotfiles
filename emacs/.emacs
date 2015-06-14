;;; init -- My init script
;;; Commentary:
;;; This is my init file. It's mine.

;;; Code:
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(require 'ember-mode)
(require 'ember-yasnippets)
(require 'ido)
(require 'js2-refactor)
(require 'elixir-mode)
(require 'alchemist)
(require 'smartparens-config)
(require 'smex)
(require 'magit)
(require 'volatile-highlights)
(require 'diff-hl)
(require 'yasnippet)
(require 'elixir-yasnippets)
(require 'expand-region)
(require 'emr)
(require 'python-mode)
(require 'inf-ruby)
(require 'robe)
(require 'comment-dwim-2)
(require 'color-theme-sanityinc-tomorrow)
(require 'whitespace)
(require 'tex)
(require 'helm-config)
(require 'emmet-mode)
(require 'go-mode)
(require 'desktop)
(require 'rvm)
(require 'helm-projectile)
(require 'perspective)
(helm-projectile-on)
(require 'persp-projectile)
(define-key projectile-mode-map (kbd "C-c p p") 'projectile-persp-switch-project)
(defun align-to-colon (begin end)
  "Align region to colon (:) signs"
  (interactive "r")
  (align-regexp begin end
                (rx ":" (group (zero-or-more (syntax whitespace))) ) 1 1 ))

(defun align-to-comma (begin end)
  "Align region to comma signs"
  (interactive "r")
  (align-regexp begin end
                (rx "," (group (zero-or-more (syntax whitespace))) ) 1 1 ))


(defun align-to-equals (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end
                (rx (group (zero-or-more (syntax whitespace))) "=") 1 1 ))

(defun align-to-hash (begin end)
  "Align region to hash ( => ) signs"
  (interactive "r")
  (align-regexp begin end
                (rx (group (zero-or-more (syntax whitespace))) "=>") 1 1 ))

;; work with this
(defun align-to-comma-before (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end
                (rx (group (zero-or-more (syntax whitespace))) ",") 1 1 ))

(add-hook 'ruby-mode-hook 'robe-mode)
(rvm-use-default)

(setq magit-last-seen-setup-instructions "1.4.0")

(desktop-save-mode 1)

(advice-add #'magit-key-mode-popup-committing :after
            (lambda ()
              (magit-key-mode-toggle-option (quote committing) "--verbose")))

(setq js-indent-level 2)
(setq css-indent-offset 2)
(setq tab-width 2)
(show-paren-mode 1)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq auto-save-default nil)
(setq make-backup-files nil)

(add-hook 'handlebars-mode-hook 'emmet-mode)

(require 'tern)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(require 'company-tern)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-tern))
(setq-default js2-basic-offset 2)

(helm-mode 1)
(setq-default tab-width 2)
(setq redisplay-dont-pause t)

(setq whitespace-style '(face tabs lines-tail trailing))
(global-whitespace-mode t)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(set (make-local-variable 'whitespace-line-column) 80)
(add-hook 'after-change-major-mode-hook
          '(lambda () (when (eq major-mode 'rust-mode)
                        (setq whitespace-line-column 99))))

;; Enable things
(yas-global-mode 1)
(global-linum-mode t)
(volatile-highlights-mode t)
(electric-pair-mode 1)
(projectile-global-mode)
(highlight-indentation-mode t)
(hc-toggle-highlight-trailing-whitespace t)
(hc-toggle-highlight-tabs t)

;; Keybindings
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)
(global-set-key (kbd "s-r") 'emr-show-refactor-menu)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-;") 'comment-dwim-2)

;; Setq's
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq-default cursor-type 'bar)
;; (setq alchemist-project-compile-when-needed t)
(setq projectile-completion-system 'grizzl)
(setq-default indent-tabs-mode nil)

;; Hooks
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;;(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Custom functions

;; Custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "cbef37d6304f12fb789f5d80c2b75ea01465e41073c30341dc84c6c0d1eb611d" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#424242")
 '(package-selected-packages
   (quote
    (clojure-mode dash-functional js2-refactor list-utils makey multiple-cursors paredit perspective popup projectile queue redshank skewer-mode tern yasnippet package-build shut-up epl git commander f dash s pallet zenburn-theme web-mode volatile-highlights snippet smex smartparens scss-mode sass-mode rvm rust-mode robe rainbow-delimiters python-mode persp-projectile neotree markdown-mode magit impatient-mode highlight-indentation highlight-chars helm-projectile helm-ag haskell-mode handlebars-mode grizzl go-mode flymake-elixir flymake-easy flycheck-rust flx-ido expand-region exec-path-from-shell evil-nerd-commenter emr emmet-mode ember-yasnippets ember-mode elixir-yasnippets elixir-mode discover-js2-refactor diff-hl company-tern comment-dwim-2 color-theme-sanityinc-tomorrow color-theme cider auctex alchemist ac-js2)))
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 130 :family "Source Code Pro")))))

(provide '.emacs)
;;; .emacs ends here
