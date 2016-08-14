(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


(setenv "GOPATH" "/Users/johntech/code/gocode")
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/Users/johntech/code/gocode/bin")

(add-to-list 'load-path "/Users/johntech/.emacs.d/lib/")
(load "php-mode")
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode)) 
(add-to-list 'auto-mode-alist '("\\.phps\\'" . php-mode)) 

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

(with-eval-after-load 'go-mode
  (require 'go-eldoc)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (require 'go-autocomplete)
  (global-linum-mode)
  (smartparens-global-mode)
  (require 'smartparens-config)
;  (require 'go-snippets)
 ;(require `es-windows)
 ;(require 'project-explorer)
  (global-set-key (kbd "M-e") 'project-explorer-toggle)
  (add-to-list 'load-path "/Users/johntech/code/gocode/src/github.com/dougm/goflymake")
  (require 'go-flymake)
  (require 'go-flycheck))


(add-to-list 'custom-theme-load-path "/Users/johntech/.emacs.d/color-themes/")
(load-theme 'taming-mr-arneson t)

(add-to-list 'load-path "/Users/johntech/.emacs.d/lib/neotree")
(require 'neotree)
(setq neo-smart-open t)
(global-set-key (kbd "M-x") 'smex)
(global-set-key [f8] 'neotree-toggle)

(window-numbering-mode)
(global-set-key (kbd "M-SPC") 'er/expand-region)
(setq linum-format "%2d ")

(require 'yasnippet)
;(yas-global-mode 1)
(yas-reload-all)
(add-hook 'go-mode-hook #'yas-minor-mode)
