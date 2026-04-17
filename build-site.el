(require 'ox-publish)
(require 'ob-plantuml)
;; Define the publishing project
(setq org-confirm-babel-evaluate nil)
(setq org-plantuml-jar-path (if (eq system-type 'windows-nt) "d:/EmacsConfig/plantuml.jar" "~/plantuml.jar"))
(setq org-publish-project-alist
	  `(
		("homepage"
		 :recursive nil
		 :base-directory "./content"
		 :publishing-directory "./public"
		 :publishing-function org-html-publish-to-html
		 :section-numbers nil
		 :with-toc nil
		 :with-creator t
		 :section-number nil
		 :time-stamp-file nil
		 )
		("images"
		 :base-directory "./content"
		 :base-extension "jpg\\|png\\|gif"
		 :publishing-directory "./public/images"
		 :publishing-function org-publish-attachment
		 :recursive t
		 )
		("Emacs Blogs"
		 :recursive t
		 :base-directory "./content/EmacsBlogs"
		 :publishing-directory "./public/EmacsBlogs"
		 :publishing-function org-html-publish-to-html
		 :auto-sitemap t
		 :sitemap-title "Emacs"
		 :sitemap-filename "emacs-index.org"
		 :sitemap-sort-files anti-chronologically
		 )
		)
	  )
;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />"
	  )
;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages")
	  package-archives '(("melpa" . "https://melpa.org/packages/")
						 ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Generate the site output
(org-publish-all t)

(message "Build complete!")
