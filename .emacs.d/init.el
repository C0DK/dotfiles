(require 'package)

(add-to-list 'exec-path "~/go/bin")

;;; code:
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; Projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


;; Enable defer and ensure by default for use-package
;;(setq use-package-always-defer t
;;      use-package-always-ensure t)
;; evil mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

;; evil-collection
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; flyspell/aspell
(use-package flyspell
  :ensure t)

;; show which combos are next
(which-key-mode)


;; flycheck
(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; web-mode
;; based on, partially: https://gist.github.com/CodyReichert/9dbc8bd2a104780b64891d8736682cea
(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'tide-mode-hook 'prettier-js-mode)
(add-hook 'javascript-hook 'prettier-js-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (tide-mode))))
;; configure jsx-tide checker to run after your default jsx checker
(flycheck-add-mode 'javascript-eslint 'web-mode)
;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

(use-package tide
  :ensure t
  :after (typescript-mode flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))
;; react mode (rjsx-mode)
;; (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

;; golang stuff
;; https://github.com/mdempsky/gocode
;; https://github.com/emacsmirror/godoctor
(add-to-list 'load-path "~/.emacs.d/gocomplete/")
(use-package go-mode
  :ensure t
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)

  (use-package go-eldoc
    :ensure t
    :config
    (add-hook 'go-mode-hook 'go-eldoc-setup))

  (use-package auto-complete
    :ensure t)

  (require 'go-autocomplete)
  (require 'auto-complete-config)
  (ac-config-default)

  (use-package godoctor
    :ensure t)

  (use-package go-guru
    :ensure t))

;; Set proper scope in go-guru
(defun jc/go-guru-set-current-package-as-main ()
  "GoGuru requires the scope to be set to a go package which
   contains a main, this function will make the current package the
   active go guru scope, assuming it contains a main"
  (interactive)
  (let* ((filename (buffer-file-name))
         (gopath-src-path (concat (file-name-as-directory (go-guess-gopath)) "src"))
         (relative-package-path (directory-file-name (file-name-directory (file-relative-name filename gopath-src-path)))))
    (setq go-guru-scope relative-package-path)))


;; Enable scala-mode and sbt-mode
(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :hook (scala-mode . lsp)
  :config (setq lsp-prefer-flymake nil))

;; (use-package lsp-ui)

;; Add company-lsp backend for metals
;; (use-package company-lsp)

;; use ssh instead of scp for tramp
(setq tramp-default-method "ssh")



;; indents smaller
(setq-default tab-width 3)
;; remove toolbar and menubar
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

;; disable line wrapping
(set-default 'truncate-lines t)
(global-visual-line-mode 1)

;; python stuff
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; (add-hook 'elpy-mode (lambda()):
(add-to-list 'load-path "~/.emacs.d/scripts/")
(require 'blacken)
(add-hook 'python-mode-hook 'blacken-mode)
(require 'toml-mode)
;; stop splash screen from showing
(setq inhibit-splash-screen t)


;; markdown
(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
			  (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
			(current-buffer)))

(global-hl-todo-mode)

(show-paren-mode 1)
;; history
(savehist-mode 1)
;; ORG
(add-hook 'org-mode-hook 'org-indent-mode)

(setq org-agenda-files '("~/Documents/org/inbox.org"
                         "~/Documents/org/gtd.org"
                         "~/Documents/org/wishlist.org"
                         "~/Documents/org/tickler.org"))

(setq org-refile-targets '(("~/Documents/org/gtd.org" :maxlevel . 3)
                           ("~/Documents/org/someday.org" :level . 1)
                           ("~/Documents/org/archive.org" :level . 1)
                           ("~/Documents/org/wishlist.org" :level . 1)
                           ("~/Documents/org/tickler.org" :maxlevel . 2)))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c g") (lambda() (interactive)(find-file "~/Documents/org/gtd.org")))
(global-set-key (kbd "C-c i") (lambda() (interactive)(find-file "~/Documents/org/inbox.org")))

;; Auto finis when all supparts are finished
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(setq org-agenda-todo-list-sublevels 1)
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
;; org capture
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/Documents/org/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("n" "Note" entry
                               (file+headline "~/Documents/org/notes.org" "Notes")
                               "* %U \n%i%?")
                              ("f" "Frida Journal" entry
                               (file+headline "~/Documents/org/frida.org" "Fridas dagbog")
                               "* %U \n%i%?")
                              ("w" "Wish" entry
                               (file+headline "~/Documents/org/wishlist.org" "Wishlist")
                               "* %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Documents/org/tickler.org" "Tickler")
                               " %i%? \n %U")))
;; Org projects

(setq org-publish-project-alist
      '(("KBP"
         :base-directory "~/Documents/org/kbp"
         :publishing-directory "/keybase/public/cabang/"
         :publishing-function org-twbs-publish-to-html
         ;;:section-numbers nil
			:with-headline-numbers nil
			;;:table-of-contents nil
			)))

;; line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(setq display-line-numbers-type 'absolute)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blacken-line-length 100)
 '(custom-enabled-themes (quote (nord)))
 '(custom-safe-themes
	(quote
	 ("d6c5b8dc6049f2e9dabdfcafa9ef2079352640e80dffe3e6cc07c0f89cbf9748" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "82358261c32ebedfee2ca0f87299f74008a2e5ba5c502bde7aaa15db20ee3731" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "5034d4b3ebd327bbdc1bbf925b6bf7e4dfbe4f3f84ee4d21e154143f128c6e04" default)))
 '(org-agenda-files
	(quote
	 ("~/dev/gitbase-bot/gtd.org" "~/Documents/org/gtd.org")))
 '(org-agenda-prefix-format
	(quote
	 ((agenda . " %i %-12:c%?-12t% s")
	  (todo . "%l %i %-6:c")
	  (tags . " %i %-12:c")
	  (search . " %i %-12:c"))))
 '(org-agenda-remove-times-when-in-prefix nil)
 '(package-selected-packages
	(quote
	 (scala-mode tide add-node-modules-path which-key ox-twbs projectile hl-todo nord-theme rjsx-mode neotree impatient-mode ## prettier-js web-mode php-mode toml-mode elpy use-package smart-mode-line powerline-evil godoctor go-guru go-eldoc flycheck evil-collection dracula-theme auto-complete)))
 '(pyvenv-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:foreground "#8fbcbb" :weight extra-bold))))
 '(org-level-2 ((t (:foreground "#88C0D0" :weight bold))))
 '(org-level-3 ((t (:foreground "#81a1c1" :weight semi-bold))))
 '(org-level-4 ((t (:foreground "#5e81ac" :weight normal))))
 '(org-level-5 ((t (:inherit org-level-4))))
 '(org-level-6 ((t (:inherit org-level-4))))
 '(org-level-7 ((t (:inherit org-level-4))))
 '(org-level-8 ((t (:inherit org-level-2)))))


;;; init.el ends here
