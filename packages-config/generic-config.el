;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            Disabling GUI things                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (menu-bar-mode -1)
(tooltip-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Hide the startup message
(setq inhibit-startup-message t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Fonts and encoding                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(prefer-coding-system 'utf-8)
;; Set default font
;; (set-face-attribute 'default nil
;;                     :family "SauceCodePro Nerd Font"
;;                     :height 100
;;                     :weight 'normal
;;                     :width 'normal)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Basic Customization                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Maximise Emacs on startup
;; From https://emacs.stackexchange.com/a/3008
(toggle-frame-maximized)

;; Sometimes emacs asks us to write 'yes' or 'no'. This is too long.
;; Change it to one press on the keys 'y' or 'n'.
(fset 'yes-or-no-p 'y-or-n-p)

;; Prevent Extraneous Tabs
;; See https://www.gnu.org/software/emacs/manual/html_node/eintr/Indent-Tabs-Mode.html
(setq-default indent-tabs-mode nil)

;; Turn on autofill in all text files.
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Display line and column numbers in the mode line.
(line-number-mode 1)
(column-number-mode 1)
(size-indication-mode t)
(global-linum-mode t)

;; When some text is selected, writing overwrites the existing text
(delete-selection-mode 1)

;; Display the name of the current buffer in the title bar.
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                 "%b"))
        (:eval (if (buffer-modified-p) 
                   "*"))
        " - Emacs")
      )

;; Visual matching of parenthesis.
(require 'paren)
(show-paren-mode t)
(setq blink-matching-paren t)
(setq blink-matching-paren-on-screen t)
;;(setq show-paren-style 'expression)
(setq blink-matching-paren-dont-ignore-comments t)

;; Switching buffer with C-tab.
(bind-key* "<C-tab>" 'next-buffer)
(bind-key* "<backtab>" 'previous-buffer)

;; List of opened buffers with C-x C-b.
(global-set-key (kbd "C-x C-b") 'electric-buffer-list)

;; Disable autosave, keep backups in a separate directory.
(setq auto-save-default nil)
(defvar backup-dir "~/.emacsbackups/")
(setq backup-directory-alist (list (cons "." backup-dir)))

;; I dunno what this does.
(setq tab-width 4)
(setq-default indent-tabs-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  REMOVE USELESS BUFFERS                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(if (get-buffer "*Messages*")
    (kill-buffer "*Messages*"))

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))

;; Removes *straight-process* from the buffer
(if (get-buffer "*straight-process*")
    (kill-buffer "*straight-process*"))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)
