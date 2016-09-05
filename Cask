(source gnu)
(source melpa)

(package "github-elpa" "0.0.1" "Github Elpa")

(package-file "github-elpa.el")

(files :defaults "bin")

(development
 ;; Somehow `:defaults` seems not to work
 ;;(depends-on "github-elpa" :git "." :files (:defaults "bin"))
 (depends-on "github-elpa" :git "." :files ("*.el" "bin")))
