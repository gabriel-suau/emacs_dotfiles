(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (setq elpy-modules (delete 'elpy-module-flymake elpy-modules)))

(use-package py-autopep8
  :config
  (setq py-autopep8-options '("--max-line-length=90"))
  :hook
  (python-mode . py-autopep8-enable-on-save)
  )

;; Python indent preferences
(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent-offset 4)))

;; Enable autopep8
(require 'py-autopep8)
;; Ignore the 'load all the modules before doing anything else' rule 
;; (setq py-autopep8-options '("--ignore=E402"))
(add-hook 'python-mode-hook
          'py-autopep8-enable-on-save
         )
