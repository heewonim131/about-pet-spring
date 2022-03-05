(function() {
    var w = window;
    if (w.Twc) {
      return false;
    }

    var ch = function () {
        ch.c(arguments)
    };

    ch.q = [];
    ch.c = function (args) {
        ch.q.push(args);
    };
    w.Twc = ch;
    function load() {
        if (w.TwcInitialized) {
            return;
        }
        w.TwcInitialized = true;
        var s = document.createElement('script');
        s.type = 'text/javascript';
        s.async = true;
        s.src = 'https://storage.googleapis.com/cloud-gate-cdn/sdk/Twc.sdk.js?timestemp=' + new Date().getTime();
        s.charset = 'UTF-8';
        var x = document.getElementsByTagName('script')[0];
        x.parentNode.insertBefore(s, x);
    }

    if (document.readyState === 'complete') {
        load();
    } else if (window.attachEvent) {
        window.attachEvent('onload', load);
    } else {
        window.addEventListener('DOMContentLoaded', load, false);
        window.addEventListener('load', load, false);
    }
  })();