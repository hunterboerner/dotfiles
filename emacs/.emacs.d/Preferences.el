;;; package --- summary
;;; Commentary:
;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messages* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

;;; Code:
(aquamacs-autoface-mode -1) ; no mode-specific faces, everything in Monaco
(set-face-attribute 'mode-line nil :inherit 'unspecified) ; show modeline in
                                                          ; Monaco
(set-face-attribute 'echo-area nil :family 'unspecified)  ; show echo area in
                                                          ; Monaco
(tabbar-mode -1) ; no tabbar
(one-buffer-one-frame-mode -1) ; no one-buffer-per-frame
(setq display-buffer-alist nil) ; do not open certain buffers in special
                                ; windows/frames
(setq select-enable-clipboard t)
(setq ns-use-mac-modifier-symbols nil) ; display standard Emacs (and not
                                       ; standard Mac) modifier symbols)
(global-hl-line-mode t)
(provide 'Preferences)
;;; Preferences.el ends here
