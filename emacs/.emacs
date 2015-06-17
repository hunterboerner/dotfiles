;;; init -- My init script
;;; Commentary:
;;; This is my init file. It's mine.

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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

(require 'fill-column-indicator)
(setq fci-rule-color "#111122")

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)
(set-fringe-mode 0)
;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Don't highlight matches with jump-char - it's distracting
(setq jump-char-lazy-highlight-face nil)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Lines should be 80 characters wide, not 72
(setq fill-column 80)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Easily navigate sillycased words
(global-subword-mode 1)

;; Don't break lines for me, please
(setq-default truncate-lines nil)

;; Keep cursor away from edges when scrolling up/down
(require 'smooth-scrolling)

;; Allow recursive minibuffers
(setq enable-recursive-minibuffers t)

;; Don't be so stingy on the memory, we have lots now. It's the distant future.
(setq gc-cons-threshold 20000000)

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

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-hook 'web-mode-hook 'emmet-mode)

(setq web-mode-markup-indent-offset 2)

(add-hook 'web-mode-hook #'(lambda () (yas-activate-extra-mode 'handlebars-mode)))

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

;; Keybindings
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)
(global-set-key (kbd "s-r") 'emr-show-refactor-menu)
(global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-;") 'comment-dwim-2)

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
(tool-bar-mode -1)
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
 '(ansi-term-color-vector
   [unspecified "#2b303b" "#bf616a" "#a3be8c" "#ebcb8b" "#8fa1b3" "#b48ead" "#8fa1b3" "#c0c5ce"])
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("1abda075ebacaa3795d675bb2be0a905322ac856f9c0c259da63f9ccfe1962ec" "75c0b1d2528f1bce72f53344939da57e290aa34bea79f3a1ee19d6808cb55149" "3539b3cc5cbba41609117830a79f71309a89782f23c740d4a5b569935f9b7726" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "cbef37d6304f12fb789f5d80c2b75ea01465e41073c30341dc84c6c0d1eb611d" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#424242")
 '(package-selected-packages
   (quote
    (clojure-mode dash-functional js2-refactor list-utils makey multiple-cursors paredit perspective popup projectile queue redshank skewer-mode tern yasnippet package-build shut-up epl git commander f dash s pallet zenburn-theme web-mode volatile-highlights snippet smex smartparens scss-mode sass-mode rvm rust-mode robe rainbow-delimiters python-mode persp-projectile neotree markdown-mode magit impatient-mode highlight-indentation highlight-chars helm-projectile helm-ag haskell-mode grizzl go-mode flymake-elixir flymake-easy flycheck-rust flx-ido expand-region exec-path-from-shell evil-nerd-commenter emr emmet-mode ember-yasnippets ember-mode elixir-yasnippets elixir-mode discover-js2-refactor diff-hl company-tern comment-dwim-2 color-theme-sanityinc-tomorrow color-theme cider auctex alchemist ac-js2)))
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
