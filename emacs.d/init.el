(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'load-path "~/.emacs.d/lisp")

;Line Numbers
(global-linum-mode t)

;View buffers in current window
(global-set-key "\C-x\C-b" 'buffer-menu)

;Get rid of menu bars/scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1) 

;Debug always
;(setq debug-on-error t)

;Refresh buffers
(setq global-auto-revert-mode t)

;More comfortable scrolling in OSX
(setq mouse-wheel-scroll-amount '(0.01))


;Show whitespace
(setq show-trailing-whitespace t)

;Remove whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;LaTeX stuff
(setq TeX-PDF-mode t)
(setq latex-run-command "lualatex")
(setq TeX-engine 'luatex)

;;Powerline
(load "~/.emacs.d/lisp/powline.el")

;;org-mode
;;(setq org-agenda-files '("~/.emacs.d/org"))
;;(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
;;(global-set-key (kbd "C-c a") 'org-agenda)
;;(find-file "~/.emacs.d/org/TODO.org")

;Set path to normal term PATH
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path
      '(
    "/usr/local/bin"
    "/usr/bin"
    ))

;;JS2
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;;MOVE WINDOWS WITH C-c <DIR>
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)


;;TAB IS 4 CHARS
;(setq-default indent-tabs-mode nil)
;(setq-default tab-width 4)
;(setq indent-line-function 'insert-tab)

;; make whitespace-mode use just basic coloring
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))


;;AUTO-COMPLETE
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

;;LINT-NODE
;;(add-to-list 'load-path "~/.emacs.d/jshint-mode")
;;(require 'flymake-jshint)
;;(add-hook 'js3-mode-hook
;;     (lambda () (flymake-mode t)))


;;Haskell Mode 
(require 'company-ghci)
(push 'company-ghci company-backends)
(add-hook 'haskell-mode-hook 'company-mode)
(add-hook 'haskell-interactive-mode-hook 'company-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)



;;FLYMAKE-CUROSR
(require 'flymake-cursor)

;;JS3 STUFF
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list (quote (("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber") ("View" "open %s.pdf" TeX-run-discard-or-function t t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(doc-view-continuous t)
 '(inhibit-startup-screen t)
 '(js3-auto-indent-p t)
 '(js3-curly-indent-offset 2)
 '(js3-enter-indents-newline t)
 '(js3-expr-indent-offset 2)
 '(js3-highlight-level 3)
 '(js3-indent-on-enter-key t)
 '(js3-lazy-commas t)
 '(js3-lazy-operators t)
 '(js3-paren-indent-offset 4)
 '(js3-square-indent-offset 4)
 '(lintnode-node-program "node"))
 '(js3-label-indent-offset 1)

;;IDO
(require 'ido)
(ido-mode 'both)
(setq 
  ido-save-directory-list-file "~/.emacs.d/cache/ido.last"
  ido-ignore-buffers '("\\` " "^\*")
)

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/after-init.el")))

(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "#393939" :background "#dddddd" :box nil))))
 '(mode-line-buffer-id ((t (:foreground "#393939" :bold t))))
 '(mode-line-inactive ((t (:foreground "#393939" :background "#bbbbbb" :box nil))))
 '(which-func ((t (:foreground "#393939"))) t))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
