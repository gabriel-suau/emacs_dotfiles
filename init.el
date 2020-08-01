;; .emacs.d/init.el

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                           melpa package support                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; ;; Adds the Melpa stale archive to the list of available repositories
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             package installation                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; myPackages contains a list of package names
(defvar myPackages
   '(better-defaults                ;; Set up some better Emacs defaults
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    py-autopep8                     ;; Run autopep8 on save
    ;; blacken                         ;; Black formatting on save
    ;; ein                             ;; Emacs IPython Notebook
    yasnippet                       ;; yasnippet
    use-package                     ;; 
    treemacs                        ;; Treemacs
    treemacs-projectile             ;; Treemacs projectile
    treemacs-icons-dired            ;; Treemacs icons-dired
    treemacs-magit                  ;; Treemacs Magit
    auctex                          ;; Tool for TeX support
    auto-complete-auctex            ;; Auto completion in Texmode
    bind-key                        ;; Tool to bind keys easily
    magit                           ;; Git integration
    ac-html                         ;; HTML auto-completion
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                straight.el                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; From https://github.com/raxod502/straight.el#integration-with-use-package-1
;; use-package does not need ":straight" as it is now by default.
;; Use ":straight nil" to override locally.
(setq straight-use-package-by-default t)
;; Avoid the utilisation of find(1) to check for modified packages. Use
;; a more lazy approach.
;; See https://github.com/raxod502/straight.el/blob/master/README.md#customizing-when-packages-are-built
(setq straight-check-for-modifications '(check-on-save))
;; From https://github.com/raxod502/straight.el#getting-started
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                 custom.el                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                use-package                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'use-package)
;; See https://github.com/raxod502/straight.el#integration-with-use-package-1
(setq straight-use-package-by-default t)
(require 'use-package)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              packages-config                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/packages-config/")

;; Emacs generic configuration
(load "generic-config.el")                    ;; Generic configuration like UI, font or backups
(load "theme-config.el")                      ;; UI theme configuration
(load "smartparens-config.el")                ;; Make parentheses smarter.
(load "treemacs-config.el")                   ;; Tree-like view of project files
(load "dashboard-config.el")
(load "company-config.el")
(load "all-the-icons-config.el")
(load "whichkey-config.el")
(load "flycheck-config.el")

;; Developement environments
;; Python
(load "python-config.el")
;; LaTeX
(load "latex-config.el")
;; Fortran 90
(load "fortran90-config.el")
;; Git
(load "git-config.el")
;; HTML
(load "html-config.el")
