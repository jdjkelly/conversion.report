(function() {
  var ConvertReportTracker;

  ConvertReportTracker = (function() {
    function ConvertReportTracker() {
      this.bindClickEvents();
    }

    ConvertReportTracker.prototype.bindClickEvents = function() {
      var link, links, _i, _len, _results;
      links = this.findLinks();
      _results = [];
      for (_i = 0, _len = links.length; _i < _len; _i++) {
        link = links[_i];
        _results.push((function(_this) {
          return function(link) {
            if (link.addEventListener) {
              return link.addEventListener('click', _this.trackClick, true);
            } else if (link.attachEvent) {
              return link.attachEvent('onclick', _this.trackClick);
            }
          };
        })(this)(link));
      }
      return _results;
    };

    ConvertReportTracker.prototype.findLinks = function() {
      return document.querySelectorAll('a[data-convert-report-id]');
    };

    ConvertReportTracker.prototype.trackClick = function(e) {
      var id, request, _ref;
      id = (_ref = e.target.attributes["data-convert-report-id"]) != null ? _ref.value : void 0;
      if (id == null) {
        return;
      }
      request = new XMLHttpRequest;
      request.open("post", "http://localhost:3000/api/v1/conversions", false);
      request.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
      return request.send(JSON.stringify({
        trackerId: id
      }));
    };

    return ConvertReportTracker;

  })();

  window.onload = function(e) {
    return new ConvertReportTracker;
  };

}).call(this);
