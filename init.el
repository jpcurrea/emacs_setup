;; .emacs customization
;;;;;;;;;;;;;;;;;
;; preferences ;;
;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; global variable settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; startup
(setq inhibit-splash-screen t)		;remove splash screen

(require 'package)

;; (add-to-list 'load-path "file:///Users/socialmedia/emacs_files/")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    flycheck;; add the flycheck package
    py-autopep8
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme

(require 'org)

;; modeline
(setq line-number-mode t)		; start in line-number-mode
(setq column-number-mode t)		; start in column-number-mode

;; files
;; display
(transient-mark-mode 1)			; Enable transient mark mode
(global-visual-line-mode 1)		; wrap text between words

;; behavior
(fset 'yes-or-no-p 'y-or-n-p)                 ;write y instead of yes
(setq kill-whole-line t)                      ;C-k kills whole line
(setq x-select-enable-clipboard t)            ;use the system clipboard
(setq skeleton-pair t)                        ;auto match parentheses and quotes
(setq skeleton-pair-filter-function 'jct-pair-filter)  ;filter auto match


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
;; global functions ;;
;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;
;; text mode ;;
;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; calendar and planner ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;
;; org mode ;;
;;;;;;;;;;;;;;
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/PhD/1161/BioDev/Position Paper 2/reviews.org" "~/PhD/Research/SmoothLight/BRI application/project_description.org" "~/PhD/1161/Quant2/class_notes.org" "~/PhD/Research/intersensoryRedundancy/progress.org" "~/PhD/1161/Motor_/lecture_notes.org" "~/PhD/1161/BioDev/positionPaper.org" "~/PhD/1161/BioDev/HW4.org" "~/PhD/1161/BioDev/classNotes.org" "~/PhD/Research/planning/progress.org" "~/PhD/Research/motionPerception/progress.org")))
 '(package-selected-packages
   (quote
    (arduino-mode pdf-tools org git web-mode skewer-mode python-mode nurumacs ipython))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1)))))

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-log-done 'time)

;;;;;;;;;;;;;;;;;
;; eshell mode ;;
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; eshell mode ;;
;;;;;;;;;;;;;;;;;
(require 'ess-site)
(ess-toggle-underscore nil)

;;;;;;;;;;;;;;;
;; elpy mode ;;
;;;;;;;;;;;;;;;

(elpy-enable)
(elpy-use-ipython)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;;;;;;;;;;;;;;;;;;;
;; docview mode ;;
;;;;;;;;;;;;;;;;;;;

(require 'doc-view)
(setq doc-view-resolution 200)
(setq doc-view-continuous t)

;; (fset 'doc-prev "\C-xo\C-x[\C-xo")
;; (fset 'doc-next "\C-xo\C-x]\C-xo")
;; (global-set-key (kbd "M-[") 'doc-prev)
;; (global-set-key (kbd "M-]") 'doc-next)

;;;;;;;;;;;;;;;;;
;; python mode ;;
;;;;;;;;;;;;;;;;;
;; (require 'python-mode)
;; (setq-default py-shell-name "ipython")
;; (setq-default py-which-bufname "IPython")
;; (setq python-shell-interpreter "ipython"
;;        python-shell-interpreter-args "-i")
;; (setq py-python-command-args '("-pylab" "-i" "-p" "scipy" "-colors" "LightBG")) 
;; ;; (setq py-python-command-args '("-pylab" "-i" "-colors" "LightBG"))
;; (setq py-python-command        "ipython3")
;; (setq py-python-command-args '("--pylab" "-i"))

(setq py-shell-switch-buffers-on-execute nil) ;stay in edit buffer
(setq py-split-windows-on-execute nil); don't split windows
(setq py-split-window-on-execute nil); don't split window
(setq py-smart-indentation t); automatically guess indentation


;; (defun forward-indent-python ()
;;   "Shift the region over 4 spaces"
;;   (interactive)
;;   (if mark-active 
;;       (indent-rigidly (region-beginning) (region-end) 4) 
;;     (indent-rigidly (line-beginning-position) (line-end-position) 4) )
;;   (setq deactivate-mark nil)
;;   )

;; (defun backward-indent-python ()
;;   "Shift the region over 4 spaces"
;;   (interactive)
;;   (if mark-active 
;;       (indent-rigidly (region-beginning) (region-end) -4) 
;;     (indent-rigidly (line-beginning-position) (line-end-position) -4) )
;;   (setq deactivate-mark nil)
;;   )

;; (defun goto-python-shell () 
;;   "Go to the python command window (start it if needed)" 
;;   (interactive)
;;   (setq current-python-script-buffer (current-buffer))
;;   (py-shell)
;;   (end-of-buffer) )

;; (defun goto-python-source () 
;;   "switch back to source window" 
;;   (interactive)
;;   (switch-to-buffer-other-window current-python-script-buffer) )

;; (defun py-execute-statement-and-step ()
;;   "select a statement, submit as a region and then step forward"
;;   (interactive)
;;   (end-of-line) 
;;   (set-mark-command nil)
;;   (beginning-of-line-text)
;;   (copy-region-as-kill (point) (mark))
;;   (goto-python-shell)
;;   (end-of-buffer)
;;   (yank)
;;   (comint-send-input)
;;   (goto-python-source) 
;;   (py-next-statement 1) )

;; (defun py-execute-function-and-step ()
;;   "select a statement, submit as a region and then step forward"
;;   (interactive)
;;   (py-clear-queue)
;;   (py-execute-def-or-class)
;;   (py-end-of-def-or-class)
;;   (py-next-statement 1) )

;; (defun py-execute-buffer-ipython ()
;;   "execute current buffer name.py by entering 'run name' in the ipython buffer"
;;   (interactive)
;;   (setq bname (buffer-file-name))
;;   (save-buffer)
;;   (goto-python-shell)
;;   (insert (concat "run " bname))
;;   (comint-send-input) )

;; (defun py-execute-region-or-line ()
;;   "execute a region if the mark is active, otherwise the current line"
;;   (interactive)
;;   (if mark-active
;;       (py-execute-region (region-beginning) (region-end))
;;       (py-execute-statement-and-step) ))

;; ;; start the ipython shell as a killable process
;; (add-hook 'py-shell-hook (lambda () 
;; 			   (process-kill-without-query (get-process "Python"))
;; 			   ;;(setq hippie-expand-try-functions-list (append '(ipython-complete) hippie-expand-try-functions-list)) ) )
;; 			  (local-set-key "\C-\M-t" 'ipython-complete) ) )

;; ;; set some local key bindings
;; (add-hook 'python-mode-hook (lambda ()
;; 			      (local-set-key "\M-s"        'isearch-backward)
;; 			      (local-set-key "\C-c\C-c" 'py-execute-buffer-ipython) 
;; 			      (local-set-key "\C-c\C-t" 'py-execute-region-or-line) 
;; 			      (local-set-key "\C-c\C-w" 'py-execute-function-and-step) ))

;; (define-key py-shell-map "\C-d" 'help)
;; (define-key py-shell-map "\C-t" 'up-in-comint)
;; (define-key py-shell-map "\C-w" 'down-in-comint)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;
;; colors ;;
;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;; global key bindings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

