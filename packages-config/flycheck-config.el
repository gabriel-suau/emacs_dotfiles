(use-package flycheck
  :init (global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  ;; From https://www.flycheck.org/en/latest/user/quickstart.html#enable-flycheck
  (add-hook 'after-init-hook #'global-flycheck-mode)
  ;; A checker is automatically disabled if more than 1000 errors reported
  (setq flycheck-checker-error-threshold 1000)
  )

;; (use-package flycheck-grammalecte
;;   :defer t
;;   :config
;;   (with-eval-after-load 'flycheck
;;     (require 'flycheck-grammalecte)
;;     (setq flycheck-grammalecte-report-esp nil)
;;     (add-to-list 'flycheck-grammalecte-enabled-modes 'fountain-mode)
;;     (flycheck-grammalecte-setup)))
