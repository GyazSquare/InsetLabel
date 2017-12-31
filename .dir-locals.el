;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((nil
  . ((eval . (setenv "DEVELOPER_DIR"
                     "/Applications/Xcode.app/Contents/Developer"))
     (fill-column . 80)
     (whitespace-style . (face lines indentation:space))
     (eval . (set (make-local-variable 'project-dir)
                  (file-name-directory
                   (let ((d (dir-locals-find-file ".")))
                     (if (stringp d) d (car d))))))))
 (swift-mode
  . ((flycheck-swift3-xcrun-sdk . "iphoneos")
     (flycheck-swift3-target . "arm64-apple-ios8")
     (eval . (set (make-local-variable 'library-root)
                  (expand-file-name "InsetLabel" project-dir)))
     (eval . (set (make-local-variable 'library-sources)
                  (directory-files-recursively library-root
                                               "^[^.].*\\.swift\\'")))
     (eval . (set (make-local-variable 'example-root)
                  (expand-file-name "InsetLabelExample/InsetLabelExample"
                                    project-dir)))
     (eval . (set (make-local-variable 'example-sources)
                  (directory-files-recursively example-root
                                               "^[^.].*\\.swift\\'")))))
 ("InsetLabel"
  . ((swift-mode
      . ((eval . (set 'flycheck-swift3-inputs library-sources))))))
 ("InsetLabelExample/InsetLabelExample"
  . ((swift-mode
      . ((flycheck-swift3-module-name . "InsetLabelExample")
         (eval . (set 'flycheck-swift3-inputs
                      (append library-sources example-sources)))))))
 ("InsetLabelExample/InsetLabelExampleTests"
  . ((swift-mode
      . ((flycheck-swift3-conditional-compilation-flags . ("DISABLE_TESTABLE"))
         (eval . (add-to-list
                  'flycheck-swift3-framework-search-paths
                  (expand-file-name
                   "Platforms/iPhoneOS.platform/Developer/Library/Frameworks"
                   (getenv "DEVELOPER_DIR"))))
         (eval . (set 'flycheck-swift3-inputs
                      (append library-sources example-sources))))))))
