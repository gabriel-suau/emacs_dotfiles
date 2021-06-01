(use-package tex-site
  :defer t
  :straight auctex
  :config
  ;; Activate nice interface between RefTeX and AUCTeX
  (setq reftex-plug-into-AUCTeX t)
  ;; Load RefTeX
  (require 'reftex)
  ;; From https://tex.stackexchange.com/a/278060/166093
  (setq reftex-label-alist '(AMSTeX))
  ;; From https://tex.stackexchange.com/questions/139824/disabling-the-select-reference-format-menu-in-reftex
  (setq reftex-ref-macro-prompt nil)
  ;; Turn on RefTeX in AUCTeX
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  ;; Set Biblatex by default
  (setq bibtex-dialect 'biblatex)
  ;; Turn on folding
  ;; From https://www.gnu.org/software/auctex/manual/auctex/Folding.html
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (TeX-fold-mode 1)))
  ;; Refresh the PDFView buffer after compilation
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)
  ;; to use pdfview with auctex
  ;; From https://emacs.stackexchange.com/a/21764
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
        TeX-source-correlate-start-server t) ;; not sure if last line is neccessary
  (with-eval-after-load "flycheck" (flycheck-add-next-checker 'tex-chktex 'textlint))
  )

(use-package pdf-tools
  :ensure t
  :mode  ("\\.pdf\\'" . pdf-view-mode)
  :config
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-annot-activate-created-annotations t)
  (pdf-tools-install :no-query)
  (require 'pdf-occur))
