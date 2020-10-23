;; From https://jblevins.org/projects/markdown-mode/
(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; (use-package grip-mode
;;   :bind (:map markdown-mode-command-map
;;               ("g" . grip-mode))
;;   :init
;;   ;; When nil, update the preview after file saves only, instead of also
;;   ;; after every text change
;;   (setq grip-update-after-change nil)

;;   ;; Use embedded webkit to previe
;;   ;; This requires GNU/Emacs version >= 26 and built with the `--with-xwidgets`
;;   ;; option.
;;   (setq grip-preview-use-webkit t))
