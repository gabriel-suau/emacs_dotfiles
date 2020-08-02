(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (setq elpy-modules (delete 'elpy-module-flymake elpy-modules)))

(use-package py-autopep8
  :ensure t)

;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; Python indent preferences
(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent-offset 4)))

;; Enable autopep8
(require 'py-autopep8)
(setq py-autopep8-options '("--ignore=E402"))
(add-hook 'python-mode-hook
          'py-autopep8-enable-on-save
         )
