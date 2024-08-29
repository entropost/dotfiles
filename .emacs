(require 'package)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
 (add-to-list 'package-archives

'("melpa-stable" . "https://stable.melpa.org/packages/") t) 
(package-initialize)

(custom-set-variables
 '(custom-enabled-themes '(catppuccin))
 '(custom-safe-themes
   '("4825b816a58680d1da5665f8776234d4aefce7908594bea75ec9d7e3dc429753" "e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" default))
 '(frame-brackground-mode 'dark)
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(yasnippet dashboard doom-modeline magit flymake-python-pyflakes flymake-cursor lsp-ui eglot counsel ivy-rich which-key lsp-ivy ivy lsp-mode python-mode virtualenvwrapper jedi eldoc pyvenv gnu-elpa-keyring-update lsp-jedi lsp-mode drag-stuff catppuccin-theme linum-relative elpy gruber-darker-theme smex)))


(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)


(ido-mode t)
(tool-bar-mode 1)
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
               ; lsp-ui-sideline-delay 0.5
               ; lsp-ui-doc-delay 5
               ; lsp-ui-sideline-ignore-duplicates t
               ; lsp-ui-doc-position 'bottom
               ; lsp-ui-doc-alignment 'frame
               ; lsp-ui-doc-header nil
               ; lsp-ui-doc-include-signature t
               ; lsp-ui-doc-use-childframe t)
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

;(use-package company-box
;  :hook (company-mode . company-box-mode))



(use-package virtualenvwrapper
  :ensure t
  :init
  (venv-initialize-eshell))

(use-package pyvenv
  :ensure t)




;(add-hook 'python-mode-hook 'je6di:setup)
;(setq jedi:complete-on-dot t)         

(use-package lsp-ivy
  :ensure t)

;(use-package python-mode
 ; :mode "\\.py\\'"
 ; :hook (python-mode . lsp-deferred))


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

;(use-package lsp-mode
;  :init
;  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;  (setq lsp-keymap-prefix "C-c l")
;  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;         (python-mode . lsp)
;         ;; if you want which-key integration
;         (lsp-mode . lsp-enable-which-key-integration))
;  :commands lsp)


;
;(require 'flymake-python-pyflakes)
;(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
;(eval-after-load 'flymake '(require 'flymake-cursor))


;(use-package eglot
;  :ensure t
;  :config
;  (add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))

;  (setq-default eglot-workspace-configuration
;                '((:pylsp . (:configurationSources ["flake8"] :plugins (:pycodestyle (:enabled nil) :mccabe (:enabled nil) :flake8 (:enabled t))))))

;  :hook
;  ((python-mode . eglot-ensure)))

;(require 'eglot)

;; Associate Eglot with Python mode
;(add-hook 'python-mode-hook 'eglot-ensure)

;; Specify the Jedi language server for Eglot
;(setq eglot-server-programs
;      '((python-mode . ("/home/entropologist/anaconda3/bin/jedi-language-server"))))


;(unless (package-installed-p 'company)
;  (package-refresh-contents)
;  (package-install 'company))


;(add-hook 'after-init-hook 'global-company-mode)



;; Use company with Eglot
;(add-hook 'eglot-managed-mode-hook
;          (lambda ()
;            (setq-local company-backends '(company-capf))))
;(use-package eglot
;  :config
;  
;  (setq-default eglot-workspace-configuration
;                '((:pylsp . (:configurationSources ["flake8"] :plugins (:pycodestyle (:enabled n; l) :mccabe (:enabled nil) :flake8 (:enabled t)))))))



(use-package nerd-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))



