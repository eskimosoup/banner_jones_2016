/*
var clickDimensions = (function () {
  var self = {};

  var getCookie = function(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
  }

  var setValue = function(value) {
    let elements = document.querySelectorAll('#contact_cd_visitorkey')
    for (let i = 0, n = elements.length; i < n; i++) {
      elements[i].value = value;
    };
  }

  self.init = function() {
    var cookieValue = getCookie('cuvid');
    if (cookieValue != '') {
      setValue(cookieValue);
    }
  }

  return self;
}());

document.addEventListener('DOMContentLoaded',
  clickDimensions.init,
  false
);
*/
