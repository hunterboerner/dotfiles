;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
    '(sql
       elm
       typescript
       csharp
       csv
       react
       treemacs
       lsp
       python
       ruby
       gtags
       shell-scripts
       tern
       ;; ----------------------------------------------------------------
       ;; Example of useful layers you may want to use right away.
       ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
       ;; `M-m f e R' (Emacs style) to install them.
       ;; ----------------------------------------------------------------
       (auto-completion :variables
         auto-completion-enable-help-tooltip t
         auto-completion-enable-sort-by-usage t)
       asm
       helm
       better-defaults
       emacs-lisp
       git
       github
       markdown
       (elixir :variables elixir-backend 'lsp)
       erlang
       osx
       semantic
       javascript
       coffeescript
       html
       (haskell :variables
         ;; haskell-completion-backend 'intero)
         haskell-enable-hindent-style "fundamental")
       yaml
       latex
       ess
       org
       imenu-list
       (c-c++ :variables c-c++-enable-clang-support t)
       ;; (shell :variables
       ;;        shell-default-height 30
       ;;        shell-default-position 'bottom)
       (spell-checking :variables enable-flyspell-auto-completion t)       ;; (syntax-checking :variables
       ;;                  syntax-checking-enable-tooltips nil)
       syntax-checking
       (version-control :variables version-control-diff-tool'diff-hl))
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
    '(column-enforce-mode
       editorconfig
       disaster
       (es6-snippets :location (recipe :fetcher github
                                 :repo "hunterboerner/es6-snippets"
                                 :files ("*.el" "snippets"))))
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(scss-mode evil-escape)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         solarized-dark
                         zenburn
                         spacemacs-light
                         solarized-light
                         leuven
                         monokai)
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(all-the-icons :separator slant)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                             :size 13
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)
   ;; dotspacemacs-default-font '("Fira Code"
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first.")


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq elixir-ls-path "~/code/elixir-ls/release")
  (which-key-remove-default-unicode-chars)
  (setq projectile-mode-line
    '(:eval (format " Projectile[%s]"
              (projectile-project-name))))
  ;; Use '[' and ']' for jumping backward and forward
  (spacemacs/set-leader-keys
    "[" 'evil-jump-backward
    "]" 'evil-jump-forward)

  (setq lsp-disabled-clients '(eslint))
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)

  (add-to-list 'auto-mode-alist '("\\.leex\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.heex\\'" . web-mode))

  (setq org-agenda-files (list "~/org/work.org" "~/org/school.org"
                           "~/org/notes.org"))
  (setq org-capture-templates '(("t" "Todo"
                                  entry
                                  (file+headline "~/org/notes.org" "Tasks")
                                  "* TODO %?\n  %i\n  %a")))
  (remove-hook 'c-mode-common-hook 'spacemacs//c-toggle-auto-newline)
  (setq powerline-default-separator 'wave)
  (setq tab-always-indent t)
  (spaceline-compile)
  (setq evil-emacs-state-cursor '("SkyBlue"
                                   (bar . 2)))
  (setq-default frame-title-format "%b")
  (setq-default cursor-type '(bar . 2))
  (setq-default sp-escape-quotes-after-insert
    nil)
  (add-hook 'prog-mode-hook 'column-enforce-mode)
  (setq column-enforce-column 99)
  (global-set-key (kbd "C->")
    'mc/mark-next-like-this)
  (global-set-key (kbd "C-<")
    'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<")
    'mc/mark-all-like-this)
  (editorconfig-mode 1)
  (delete-selection-mode 1)
  (eval-after-load "alchemist"
    '(defun alchemist-company--wait-for-doc-buffer ()
       (setf num 50)
       (while (and (not alchemist-company-doc-lookup-done)
                (> (decf num) 1))
         (sit-for 0.01))))
  (setq ess-swv-processor 'knitr)
  (setq ess-swv-plug-into-AUCTeX-p t)
  (add-hook 'LaTeX-mode-hook 'prettify-symbols-mode)

  (fset 'insert-latex-array-item
    (lambda (&optional arg)
      "Insert ampersand"
      (interactive "p")
      (kmacro-exec-ring-item (quote (" & " 0 "%d"))
        arg)))

  (global-set-key (kbd "<kp-add>") 'insert-latex-array-item)

  (fset 'insert-latex-array-row
    (lambda (&optional arg)
      "Keyboard macro."
      (interactive "p")
      (kmacro-exec-ring-item (quote ([32 92 92 return] 0
                                      "%d"))
        arg)))

  (global-set-key (kbd "<kp-enter>") 'insert-latex-array-row)

  (defun ess-swv-add-TeX-commands-custom ()
    "Add commands to AUCTeX's \\[TeX-command-list]."
    (unless (and (featurep 'tex-site)
              (featurep 'tex))
      (error "AUCTeX does not seem to be loaded"))
    (add-to-list 'TeX-command-list
      '("Knit" "Rscript -e \"library(knitr); knit('%t')\""
         TeX-run-command
         nil
         (latex-mode)
         :help "Run Knitr")
      t)
    (add-to-list 'TeX-command-list
      '("LaTeXKnit" "%l %(mode) %s"
         TeX-run-TeX
         nil
         (latex-mode)
         :help "Run LaTeX after Knit")
      t)
    (setq TeX-command-default "Knit")
    (mapc (lambda (suffix)
            (add-to-list 'TeX-file-extensions suffix))
      '("nw" "Snw" "Rnw")))
  ;; (defun ess-swv-remove-TeX-commands-custom (x)
  ;;   "Helper function: check if car of X is one of the Knitr strings"
  ;;   (let ((swv-cmds '("Knit" "LaTeXKnit")))
  ;;     (unless (member (car x) swv-cmds) x)))

  (advice-add 'ess-swv-add-TeX-commands :after #'ess-swv-add-TeX-commands-custom)
  ;;  (show-smartparens-global-mode -1)
  (add-hook 'git-commit-mode-hook
    (lambda ()
      (setq fill-column 72)
      (git-commit-turn-on-auto-fill)))
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "<return>") nil)
    (define-key company-active-map (kbd "RET") nil)
    (define-key company-active-map (kbd "C-SPC") 'company-complete-selection)
    (define-key company-active-map (kbd "M-SPC") 'company-complete-selection))
  (global-set-key (kbd "M-TAB")
    'company-manual-begin)
  (with-eval-after-load 'tex
    ;; use Skim as default pdf viewer
    ;; Skim's displayline is used for forward search (from .tex to .pdf)
    ;; option -b highlights the current line; option -g opens Skim in the background
    (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
    (setq TeX-view-program-list '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
  '(package-selected-packages
     '(omnisharp csharp-mode sqlup-mode sql-indent dap-mode lsp-treemacs bui treemacs cfrs pfuture posframe sphinx-doc rubocopfmt poetry osx-clipboard orgit-forge org-rich-yank org-contrib org org-cliplink npm-mode nose nodejs-repl lsp-haskell lsp-mode skewer-mode epc concurrent htmlize grip-mode gitignore-mode gh marshal logito pcache forge yaml closql magit-section flyspell-popup flycheck-ycmd ctable dante lcr cpp-auto-include company-ycmd ycmd request-deferred deferred web-completion-data company-reftex pos-tip company-math math-symbol-lists blacken attrap auto-complete tern flycheck-elm elm-test-runner elm-mode reformatter zenburn-theme yasnippet-snippets yaml-mode writeroom-mode visual-fill-column winum web-mode toc-org tide typescript-mode spaceline-all-the-icons solarized-theme sass-mode ruby-test-mode rubocop rspec-mode robe rjsx-mode pipenv pyvenv persp-mode paradox orgit org-projectile org-pomodoro alert org-mime org-download org-bullets org-brain nasm-mode nameless monokai-theme magithub ghub magit-svn lorem-ipsum live-py-mode link-hint json-navigator hierarchy json-mode js2-refactor multiple-cursors hl-todo helm-xref helm-swoop helm-projectile helm-org-rifle helm-make helm-descbinds helm-company haml-mode google-translate github-search git-timemachine git-link ggtags emacsql-sqlite emacsql flycheck-mix flycheck-haskell fish-mode eyebrowse expand-region evil-surround evil-nerd-commenter evil-matchit evil-magit erlang editorconfig dumb-jump doom-modeline shrink-path all-the-icons memoize diff-hl counsel-projectile projectile counsel swiper ivy company-rtags company-ghci haskell-mode company-c-headers color-identifiers-mode clang-format centered-cursor-mode bundler inf-ruby browse-at-remote auto-yasnippet aggressive-indent ace-window ace-link avy elixir-mode anaconda-mode auctex company ess julia-mode anzu iedit smartparens flycheck flyspell-correct yasnippet request window-purpose rtags helm helm-core ht magit-popup magit transient git-commit with-editor markdown-mode pythonic js2-mode simple-httpd powerline dash which-key use-package hydra lv async evil yapfify x86-lookup ws-butler web-beautify volatile-highlights vi-tilde-fringe uuidgen unfill treepy tagedit symon string-inflection stickyfunc-enhance srefactor spinner spaceline smeargle slim-mode seeing-is-believing rvm ruby-tools ruby-refactor ruby-hash-syntax reveal-in-osx-finder restart-emacs rbenv rake rainbow-mode rainbow-identifiers rainbow-delimiters pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pip-requirements pcre2el password-generator overseer osx-trash osx-dictionary org-present org-category-capture open-junk-file ob-elixir ob-coffeescript neotree mwim move-text mmm-mode minitest markdown-toc magit-gitflow magit-gh-pulls macrostep log4e livid-mode launchctl json-snatcher json-reformat js-doc insert-shebang indent-guide importmagic impatient-mode imenu-list hungry-delete hlint-refactor hindent highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-rtags helm-pydoc helm-purpose helm-mode-manager helm-hoogle helm-gtags helm-gitignore helm-git-grep helm-flx helm-css-scss helm-c-yasnippet helm-ag haskell-snippets graphql goto-chg google-c-style golden-ratio gnuplot gntp gitignore-templates github-clone gitconfig-mode gitattributes-mode git-messenger git-gutter-fringe git-gutter-fringe+ gist ghub+ gh-md fuzzy font-lock+ flyspell-correct-helm flycheck-rtags flycheck-pos-tip flycheck-credo flycheck-bashate flx-ido fill-column-indicator fancy-battery evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-org evil-numbers evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu ess-R-data-view es6-snippets emmet-mode elisp-slime-nav eldoc-eval dotenv-mode disaster diminish cython-mode csv-mode company-web company-tern company-statistics company-shell company-quickhelp company-cabal company-auctex company-anaconda column-enforce-mode coffee-mode cmm-mode clean-aindent-mode chruby bind-key auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk alchemist ace-jump-helm-line ac-ispell))
 '(paradox-github-token t)
 '(python-check-command "/usr/local/bin/pyflakes")
  '(safe-local-variable-values
     (quote
       (TeX-command-extra-options . "-shell-escape")
       (typescript-backend . tide)
       (typescript-backend . lsp)
       (javascript-backend . tide)
       (javascript-backend . tern)
       (javascript-backend . lsp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
