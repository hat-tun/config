;;; elisp
(setq load-path (cons "~/.emacs.d/elisp" load-path)) 
(setq load-path (cons "~/.emacs.d/elisp/apel-10.8/" load-path))
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
; (setq auto-install-use-wget nil)
; (auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;;; set Path
;; (when (and (file-exists-p dir) (not (member dir exec-path)))
;;   (setenv "PATH"　(concat dir ":" (getenv "PATH")))
;;   (setq exec-path (append (list dir) exec-path)))

;;; ElScreen
(require 'elscreen)
(setq elscreen-prefix-key "\C-o")
(load "elscreen" "ElScreen" t)

;;; gtags
;; (when (locate-library "gtags") (require 'gtags)) 
;; (global-set-key "\M-t" 'gtags-find-tag)
;; (global-set-key "\M-r" 'gtags-find-rtag)
;; (global-set-key "\M-s" 'gtags-find-symbol)
;; (global-set-key "\M-f" 'gtags-find-file)
;; (global-set-key "\C-t" 'gtags-pop-stack)
;; (add-hook 'gtags-select-mode-hook 'hi-line-mode)
;; (add-hook 'c-mode-common-hook
;; 	  '(lambda ()
;; 		(gtags-mode 1)
;; 		(gtags-make-complete-list)))

;;; color-moccur
(load "color-moccur")
(setq dmoccur-recursive-search t)
(setq moccur-grep-default-word-near-poit t)
(setq moccurt-split-word t)
(setq dmoccur-exclusion-mask (append '("\\~$" "\\.svn\\/\*" "\\.git\\/\*" "\\.o$"
					"GPATH" "GRTAGS" "GSYMS" "GTAGS")
					dmoccur-exclusion-mask))

;;; color-grep
(require 'color-grep)
(setq color-grep-sync-kill-buffer t)
(setq grep-find-command "ack --nocolor --nogroup ")

;;; Anything
(require 'anything)
(setq anything-sources
      '(anything-c-source-buffers+
;	anything-c-source-colors
	anything-c-source-recentf
	anything-c-source-man-pages
	anything-c-source-emacs-commands
	anything-c-source-emacs-functions
	anything-c-source-files-in-current-dir))
(require 'recentf)
(setq recentf-max-saved-items 1000)
(recentf-mode 1)

(require 'anything-gtags)

;;; tag select function
;; (defun anything-etags-and-gtags-select ()
;;   "Tag jump using etags, gtags and anything."
;;   (interactive)
;;   (let* ((initial-pattern (regexp-quote (or (thing-at-point 'symbol) ""))))
;;     (anything (list anything-c-source-gtags-select
;; 		    anything-c-source-etags-select)
;; 	      (if (or anything-etags-enable-initial-pattern anything-gtags-enable-initial-pattern) 
;; 		  initial-pattern)
;; 	      "Find Tag: " nil)))


;;; gdb
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t)

;;; don't display startup page
(setq inhibit-startup-message t)

;;; don't make backup files
(setq backup-inhibited t)

;;; initial window size
(if window-system (progn
    (setq initial-frame-alist '((width . 110) (height . 60) (top . 10)))
    (set-background-color "White")
    (set-foreground-color "Black")
    (set-cursor-color "Gray")
))

;;; blink cursor
(blink-cursor-mode t)

;;; delete scroll bar
(set-scroll-bar-mode nil)
 
;;; beap ignore
(setq ring-bell-function 'ignore)

;;; undo limit
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;;; Language
;(set-language-environment "Japanese")
;(set-terminal-coding-system 'sjis)
;(set-buffer-file-coding-system 'sjis)
;(set-keyboard-coding-system 'sjis)


;;; coloring
(global-font-lock-mode t)
;(setq font-lock-support-mode 'fast-lock-mode)
(setq font-lock-maximum-decoration t)
(setq fast-lock-cache-directories '("~/.emacs-flc" "."))

;;; key bind
(define-key global-map (kbd "C-;") 'anything) ; anything
(define-key global-map "\C-h" 'delete-backward-char) ; delete
(define-key global-map "\C-x \C-c" 'save-buffers-kill-emacs) ;save and exit
;(define-key global-map "\C-@" 'set-mark-command) ; set-mark
(define-key global-map "\C- " 'set-mark-command) ; set-mark
;(define-key global-map "\C-o" 'set-mark-command) ; set-mark
(define-key global-map [?¥] [?\\])


;;; auto-complete
;(require 'auto-complete)
;(global-auto-complete-mode t)

;;; line number
(require 'linum)
(global-linum-mode t)

;;;
;;; SCIM-Anthy
;(require 'scim-bridge)
;(require 'scim-bridge-ja)
;(add-hook 'after-init-hook 'scim-mode-on)
;(scim-define-common-key ?\C-\  nil)
;(scim-define-common-key ?\C-j t)
;(setq scim-cursor-color '("red" "blue" "limegreen")




;;; Yatex
(setq auto-mode-alist
	(cons	(cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq load-path
	(cons	(expand-file-name
		 "~/yatex1.74") load-path))
;; 0: no-conversion
;; 1: Shift JIS (win & dos)
;; 2: ISO-2022-JP (other)
;; 3: EUC
;; 4: UTF-8
(setq YaTeX-kanji-code 4)

;; c-mode, c++-mode
(add-hook 'c-mode-common-hook
	  '(lambda ()
		(setq c-basic-offset 4)
))
;; c#-mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist (cons '("\\.cs$" . csharp-mode) auto-mode-alist))
	
