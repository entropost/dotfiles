(require 'package)
 (add-to-list 'package-archives

'("melpa-stable" . "https://stable.melpa.org/packages/") t) 
(package-initialize)
(setq make-backup-files nil)
(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(catppuccin))
 '(custom-safe-themes
   '("4825b816a58680d1da5665f8776234d4aefce7908594bea75ec9d7e3dc429753" "e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" default))
 '(frame-brackground-mode 'dark)
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(airline-themes avy multiple-cursors yasnippet dashboard doom-modeline magit flymake-python-pyflakes flymake-cursor lsp-ui eglot counsel ivy-rich which-key lsp-ivy ivy lsp-mode python-mode virtualenvwrapper jedi eldoc pyvenv gnu-elpa-keyring-update lsp-jedi lsp-mode drag-stuff catppuccin-theme linum-relative elpy gruber-darker-theme smex))
 '(rustic-ansi-faces
   (vector
    (catppuccin-get-color 'surface1)
    (catppuccin-get-color 'red)
    (catppuccin-get-color 'green)
    (catppuccin-get-color 'yellow)
    (catppuccin-get-color 'blue)
    (catppuccin-get-color 'pink)
    (catppuccin-get-color 'teal)
    (catppuccin-get-color 'subtext1))))


(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)

(setq visible-bell t)
(add-to-list 'default-frame-alist `(font . "Iosevka-24"))
(ido-mode t)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(require 'yasnippet)
(yas-global-mode 1)


(setq display-line-numbers-type 'relative) 
(global-display-line-numbers-mode)
(drag-stuff-mode t)
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

(require 'lsp-mode)
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :ensure t
  :hook ((python-mode . lsp))
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t)
  )


(setq lsp-pylsp-server-command "/home/entropologist/anaconda3/bin/jedi-language-server")

(use-package lsp-ui
  :config (setq lsp-ui-sideline-show-hover t)
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))


(use-package company
  :after lsp-mode
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))




(use-package virtualenvwrapper
  :ensure t
  :init
  (venv-initialize-eshell))

(use-package pyvenv
  :ensure t)





(use-package lsp-ivy
  :ensure t)


(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (counsel-mode 1))



(use-package nerd-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

