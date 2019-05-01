;;; packages.el --- hugo layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:  <micha@T470>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `hugo-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `hugo/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `hugo/pre-init-PACKAGE' and/or
;;   `hugo/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst hugo-packages
  '(easy-hugo)
  "The list of Lisp packages required by the hugo layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


;;; packages.el ends here

(defun hugo/init-easy-hugo ()
  (use-package easy-hugo
    ;; :mode "\\.ahk\\'"
    :defer t
    :init
    (spacemacs/set-leader-keys-for-major-mode 'easy-hugo-mode
      "n" 'easy-hugo-newpost
      "D" 'easy-hugo-article
      "p" 'easy-hugo-preview
      "P" 'easy-hugo-publish
      "o" 'easy-hugo-open
      "d" 'easy-hugo-delete
      "e" 'easy-hugo-open
      "c" 'easy-hugo-open-config
      "f" 'easy-hugo-open
      "N" 'easy-hugo-no-help
      "v" 'easy-hugo-view
      "r" 'easy-hugo-refresh
      "g" 'easy-hugo-refresh
      "s" 'easy-hugo-sort-time
      "S" 'easy-hugo-sort-char
      "G" 'easy-hugo-github-deploy
      "A" 'easy-hugo-amazon-s3-deploy
      "C" 'easy-hugo-google-cloud-storage-deploy
      "q" 'evil-delete-buffer
      (kbd "TAB") 'easy-hugo-open
      (kbd "RET") 'easy-hugo-preview)
    
  :config
  (evil-make-overriding-map easy-hugo-mode-map 'normal)))
