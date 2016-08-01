{:user {:plugins [[venantius/ultra "0.3.4"]
                  [cider/cider-nrepl "0.9.1"]
                  #_[refactor-nrepl "1.1.0"]
                  ; [com.cemerick/austin "0.1.6"]
                  [lein-cljfmt "0.5.3"]
                  [lein-midje "3.1.3"]
                  [lein-try "0.4.3"]]
        :dependencies [
                       ; [jonase/eastwood "0.2.1" :exclusion [org.clojure/clojure]]
                       [com.cemerick/piggieback "0.2.1"]
                       [org.clojure/tools.nrepl "0.2.10"]
                       [spyscope "0.1.3"]
                       [redl "0.2.4"]]
        :injections [(require 'spyscope.core)
                     (require '[redl complete core])]
        :figwheel {:nrepl-port 7888}
        :repl-options {:port 12121
                       :nrepl-middleware [cemerick.piggieback/wrap-cljs-repl]}
        ;; :dependencies [[acyclic/squiggly-clojure "0.1.2-SNAPSHOT"]]
        :ultra {:color-scheme :solarized_dark}}}
; {}
