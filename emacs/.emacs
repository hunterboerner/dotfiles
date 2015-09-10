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
(require 'purescript-mode)
(require 'python-mode)
(require 'multiple-cursors)

(projectile-global-mode)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-eldoc-mode -1)
(global-set-key (kbd "C-x g") 'magit-status)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(setq require-final-newline t)

(add-hook 'align-load-hook (lambda ()
                             (add-to-list 'align-rules-list
                                          '(text-column-whitespace
                                            (regexp  . "\\(^\\|\\S-\\)\\([ \t]+\\)")
                                            (group   . 2)
                                            (modes   . align-text-modes)
                                            (repeat  . t)))))

(add-hook 'purescript-mode-hook 'purescript-indentation-mode)

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
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;(require 'fill-column-indicator)
;;(setq fci-rule-color "#111122")

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

(desktop-save-mode 1)

(setq js-indent-level 2)
(setq css-indent-offset 2)
(setq tab-width 4)
(setq show-paren-delay 0)
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
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))
(add-hook 'web-mode-hook 'emmet-mode)

(setq web-mode-markup-indent-offset 2)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-to-list 'company-backends 'company-ghc)

(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)

(add-hook 'web-mode-hook #'(lambda () (yas-activate-extra-mode 'handlebars-mode)))
(setq-default yas-prompt-functions '(yas-ido-prompt yas-dropdown-prompt))

;; (require 'tern)
;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))

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
(global-diff-hl-mode)
;; Hooks
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;;(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(tool-bar-mode -1)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(setq company-backends (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(add-to-list 'company-backends 'company-c-headers)
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
)
;; Custom functions

;; Custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-enabled-themes (quote (base16-default-dark)))
 '(custom-safe-themes
   (quote
    ("17f35b689dd41e49cb740bfb810ac8a53d13292cbebf68f41f772787d8b3aebf" "3514fe07ecd0dc2f8b747706370c169b3d8053f825c009414e1a86eac8978327" "1dd2d01010a9ae1f54775abceb080e231b6f9c781c5282b25b8c4edd3f3a14e0" "3f04f37604c5f5cc3c71bc1a4a604ed8be340d0f150946b25658e403ccbad6d2" "d7e434a3c19f87fa00b945edfaedc9a21a6e436a7814c23277d4112ad83b5e85" "d72836155cd3b3e52fd86a9164120d597cbe12a67609ab90effa54710b2ac53b" "6ebb2401451dc6d01cd761eef8fe24812a57793c5ccc427b600893fa1d767b1d" "d3a86848a5e9bf123f3dd3bf82ab96995837b50f780dd7d5f65dc72c2b81a955" "9fab7d4f70b99927d898a0c93b1ae90fc1529248b9c2604ed88e864fc2665aa7" "95a6ac1b01dcaed4175946b581461e16e1b909d354ada79770c0821e491067c6" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "b06aaf5cefc4043ba018ca497a9414141341cb5a2152db84a9a80020d35644d1" "9e7cc7f1db252d6fe0c7cc25d72d768712a97cda1f77bf63f0c1fd7be5dee7f4" "4ff23437b3166eeb7ca9fa026b2b030bba7c0dfdc1ff94df14dfb1bcaee56c78" "f0e69da2cf73c7f153fc09ed3e0ba6e1fd670fec09b8a6a8ed7b4f9efea3b501" "9f3a4edb56d094366afed2a9ba3311bbced0f32ca44a47a765d8ef4ce5b8e4ea" "ced74ff794aad9ac93266bf9a9a92c5641c01b05715c6862e30459a24844eec9" "3328e7238e0f6d0a5e1793539dfe55c2685f24b6cdff099c9a0c185b71fbfff9" "113ae6902d98261317b5507e55ac6e7758af81fc4660c34130490252640224a2" "6dbd0dd4c344f1ca534422cc5a1fd3ed822dcde947ae983948b70c7284a0ed33" "3dafeadb813a33031848dfebfa0928e37e7a3c18efefa10f3e9f48d1993598d3" "83279c1d867646c5eea8a804a67a23e581b9b3b67f007e7831279ed3a4de9466" "e7ec0cc3ce134cc0bd420b98573bbd339a908ac24162b8034c98e1ba5ee1f9f6" "1abda075ebacaa3795d675bb2be0a905322ac856f9c0c259da63f9ccfe1962ec" "75c0b1d2528f1bce72f53344939da57e290aa34bea79f3a1ee19d6808cb55149" "3539b3cc5cbba41609117830a79f71309a89782f23c740d4a5b569935f9b7726" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "cbef37d6304f12fb789f5d80c2b75ea01465e41073c30341dc84c6c0d1eb611d" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#202325")
 '(fill-column 80)
 '(global-company-mode t)
 '(haskell-tags-on-save t)
 '(inhibit-startup-screen t)
 '(magit-push-always-verify nil)
 '(package-selected-packages
   (quote
    (disaster company-c-headers helm-gtags paradox toml-mode json-mode tuareg caml erlang base16-theme fish-mode flycheck-pyflakes shm company-ghc gist purescript-mode protobuf-mode flatland-theme ibuffer-vc coffee-mode yard-mode spacegray-theme list-utils makey multiple-cursors paredit popup queue redshank skewer-mode shut-up epl git commander f pallet volatile-highlights snippet scss-mode sass-mode rvm rainbow-delimiters impatient-mode highlight-indentation highlight-chars grizzl flymake-elixir flymake-easy flycheck-rust flx-ido evil-nerd-commenter emr emmet-mode ember-yasnippets elixir-yasnippets discover-js2-refactor company-tern color-theme ac-js2)))
 '(paradox-github-token t)
 '(py-shell-name "ipython")
 '(safe-local-variable-values
   (quote
    ((erlang-indent-level . 2)
     (py-which-shell . "python3"))))
 '(scroll-bar-mode nil)
 '(vc-annotate-background "#1f2124")
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff0000")
     (40 . "#ff4a52")
     (60 . "#f6aa11")
     (80 . "#f1e94b")
     (100 . "#f5f080")
     (120 . "#f6f080")
     (140 . "#41a83e")
     (160 . "#40b83e")
     (180 . "#b6d877")
     (200 . "#b7d877")
     (220 . "#b8d977")
     (240 . "#b9d977")
     (260 . "#93e0e3")
     (280 . "#72aaca")
     (300 . "#8996a8")
     (320 . "#afc4db")
     (340 . "#cfe2f2")
     (360 . "#dc8cc3"))))
 '(vc-annotate-very-old-color "#dc8cc3"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 130 :family "Source Code Pro")))))

(provide '.emacs)
;;; .emacs ends here
(server-start)
