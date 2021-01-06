// http://yohasebe.com/wp/archives/3513
// for tiling windows of focused app onto desktop
// (3 x 2, clockwise)

var topLeft = slate.operation("corner", {
  "direction" : "top-left",
  "width"  : "screenSizeX/3",
  "height" : "screenSizeY/2"
});

var topRight = slate.operation("corner", {
  "direction" : "top-right",
  "width"  : "screenSizeX/3",
  "height" : "screenSizeY/2"
});

var bottomRight = slate.operation("corner", {
  "direction" : "bottom-right",
  "width"  : "screenSizeX/3",
  "height" : "screenSizeY/2"
});

var bottomLeft = slate.operation("corner", {
  "direction" : "bottom-left",
  "width"  : "screenSizeX/3",
  "height" : "screenSizeY/2"
});





// alt+tabでアプリのウィンドウをタイル状に並べる
var tileKey = "tab:alt";

slate.bind(tileKey, function(win){
  var appName = win.app().name();
  var tiled = {};
  tiled[appName] = {
    "operations" : [topLeft, topRight, bottomRight, bottomLeft],
    "main-first" : true,
    "repeat"     : true
  };
  var tiledLayout = slate.layout("tiledLayout", tiled);
  slate.operation("layout", {"name" : tiledLayout }).run();
  slate.operation("show", {"app" : appName}).run();
});






// http://d.hatena.ne.jp/sugyan/20130301/1362129310
// アプリ立ち上げる関数
var launch_and_focus = function (target) {
  return function (win) {
    var apps = [];
    S.eachApp(function (app) { apps.push(app.name()); });
    if (! _.find(apps, function (name) { return name === target; })) {
      win.doOperation(
        S.operation('shell', {
          command: "/usr/bin/open -a " + target,
          waithFoeExit: true
        })
      );
    }
    win.doOperation(S.operation('focus', { app: target }));
  };
};

//slate.bind('f:alt', launch_and_focus('Finder'));
slate.bind('r:alt', launch_and_focus('Reeder'));
slate.bind('s:alt', launch_and_focus('Safari'));
slate.bind('i:alt', launch_and_focus('iTerm'));
slate.bind('m:alt', launch_and_focus('Music'));
//slate.bind('e:alt', launch_and_focus('Google Chrome'));
//slate.bind('e:alt', launch_and_focus('Chromium'));

//slate.bind('d:alt', launch_and_focus('Dictionary'));
//S.bind('p:alt', launch_and_focus('Preview'));
//slate.bind('space:alt', launch_and_focus('Found'));





// http://www.infiniteloop.co.jp/blog/2013/08/osx_slate/
var util = {
  // alt + ..
  key: function(k, mod) {
    return k + ':alt' + (mod ? ',' + mod : '');
  },
  focusWindow: function(f) {
    var hit = false;
    slate.eachApp(function(app) {
      if (hit) return;
      app.eachWindow(function(win) {
        if (hit) return;
        if (f(win)) {
          win.focus();
          hit = true;
        }
      });
    });
  },
  nextScreen: function(screen) {
    return slate.screenForRef(String( (screen.id()+1)%slate.screenCount() ));
  }
};





// ----------- 以下 alt+

// hjkl       .. その方向へフォーカス移動
slate.bind(util.key('h'), slate.operation('focus', { direction: 'left' }));
slate.bind(util.key('j'), slate.operation('focus', { direction: 'down' }));
slate.bind(util.key('k'), slate.operation('focus', { direction: 'up' }));
slate.bind(util.key('l'), slate.operation('focus', { direction: 'right' }));

// n          .. 下に隠れているウィンドウをフォーカス
//slate.bind(util.key('n'), slate.operation('focus', { direction: 'behind' }));

// p          .. スクリーン間でフォーカスを移動
slate.bind(util.key('p'), function(win) {
  var next = util.nextScreen(slate.screen());

  util.focusWindow(function(win) {
    return win.screen().id() == next.id();
  });
});

// p+shift    .. 次のスクリーンへ飛ばす
slate.bind(util.key('p', 'shift'), function(win) {
  if (!win) return;
  var next = util.nextScreen(win.screen());

  win.move(next.visibleRect());
});

// o+shift    .. 4隅に飛ばす
var corners = slate.bind(util.key('o', 'shift'), slate.operation('chain', {
  operations: _.map(['top-left', 'top-right', 'bottom-right', 'bottom-left'], function(d) {
    return slate.operation('corner', {
      direction: d,
      width: 'screenSizeX/2',
      height: 'screenSizeY/2'
    });
  })
}));

// m+shift    .. 最大化
slate.bind(util.key('m', 'shift'), function(win) {
  if (!win) return;
  var bounds = win.screen().visibleRect();
  win.doOperation('move', bounds);
});

// n+shift    .. 左右に1/2のサイズにして飛ばす
slate.bind(util.key('n', 'shift'), slate.operation('chain', {
  operations: _.map(['left', 'right'], function(d) {
    return slate.operation('push', {
      direction: d,
      style: 'bar-resize:screenSizeX/2'
    });
  })
}));

// b+shift    .. 左右に1/3のサイズにして飛ばす
//slate.bind(util.key('b', 'shift'), slate.operation('chain', {
//  operations: _.map(['left', 'right'], function(d) {
//    return slate.operation('push', {
//      direction: d,
//      style: 'bar-resize:screenSizeX/3'
//    });
//  })
//}));

// b+shift    .. 上下に1/2のサイズにして飛ばす
slate.bind(util.key('b', 'shift'), slate.operation('chain', {
  operations: _.map(['top', 'bottom'], function(d) {
    return slate.operation('push', {
      direction: d,
      style: 'bar-resize:screenSizeY/2'
    });
  })
}));

/*
// h+shift   .. ウィンドウが左にあるなら縮小, 右にあるなら拡大
slate.bind(util.key('h', 'shift'), function(win) {
  if (!win) return;
  var rect = win.rect();
  var bounds = win.screen().visibleRect();
  if (bounds.x + bounds.width - 30 < rect.x + rect.width) {
    rect.x -= bounds.width * 0.05;
    rect.width = bounds.x + bounds.width - rect.x;
  } else {
    rect.width -= bounds.width * 0.05;
  }
  win.doOperation('move', rect);
});

// l+shift   .. ウィンドウが右にあるなら縮小, 左にあるなら拡大
slate.bind(util.key('l', 'shift'), function(win) {
  if (!win) return;
  var rect = win.rect();
  var bounds = win.screen().visibleRect();
  if (rect.x < bounds.x + 30) {
    rect.x = bounds.x;
    rect.width += bounds.width * 0.05;
  } else {
    rect.x += bounds.width * 0.05;
    rect.width -= bounds.width * 0.05;
  }
  win.doOperation('move', rect);
});

// k+shift   .. ウィンドウが上にあるなら縮小, 下にあるなら拡大
slate.bind(util.key('k', 'shift'), function(win) {
  if (!win) return;
  var rect = win.rect();
  var bounds = win.screen().visibleRect();
  if (bounds.y + bounds.height - 30 < rect.y + rect.height) {
    rect.y -= bounds.height * 0.05;
    rect.height += bounds.height * 0.05;
  } else {
    rect.height -= bounds.height * 0.05;
  }
  win.doOperation('move', rect);
});

// j+shift   .. ウィンドウが下にあるなら縮小, 上にあるなら拡大
slate.bind(util.key('j', 'shift'), function(win) {
  if (!win) return;
  var rect = win.rect();
  var bounds = win.screen().visibleRect();
  if (rect.y < bounds.y + 30) {
    rect.y = bounds.y;
    rect.height += bounds.height * 0.05;
  } else {
    rect.y += bounds.height * 0.05;
    rect.height -= bounds.height * 0.05;
  }
  win.doOperation('move', rect);
});
*/

// http://mint.hateblo.jp/category/Slate
// 同じアプリケーションで別のウィンドウにフォーカスする (Chrome対応版)
slate.bind(util.key('u'), function() {
  function get_next_win(windows) {
    truth_values_of_is_main = _.map(windows, function(w){ return w.isMain(); })
    next_idx = _.indexOf(truth_values_of_is_main, 1) + 1;
    if (next_idx >= _.size(windows)) { return windows[0]; }
    return windows[next_idx];
  }
  windows = [];
  slate.app().eachWindow(function(win){
    if (win.title() !== '') { windows.push(win); } // タイトルが無いウィンドウは無視
  });
  if (_.size(windows) === 1){ return; }
  sorted = _.sortBy(windows, function(win){ return win.title(); });
  get_next_win(sorted).focus();
});

/*
// a+shift   .. ウィンドウを左に移動
slate.bind(util.key('a', 'shift'), function(win) {
    if (!win) return;
    var rect = win.rect();
    var bounds = win.screen().visibleRect();
    rect.x -= bounds.width * 0.05;
    win.doOperation('move', rect);
});

// d+shift   .. ウィンドウを右に移動
slate.bind(util.key('d', 'shift'), function(win) {
    if (!win) return;
    var rect = win.rect();
    var bounds = win.screen().visibleRect();
    rect.x += bounds.width * 0.05;
    win.doOperation('move', rect);
});

// w+shift   .. ウィンドウを上に移動
slate.bind(util.key('w', 'shift'), function(win) {
    if (!win) return;
    var rect = win.rect();
    var bounds = win.screen().visibleRect();
    rect.y -= bounds.height * 0.05;
    win.doOperation('move', rect);
});

// s+shift   .. ウィンドウを下に移動
slate.bind(util.key('s', 'shift'), function(win) {
    if (!win) return;
    var rect = win.rect();
    var bounds = win.screen().visibleRect();
    rect.y += bounds.height * 0.05;
    win.doOperation('move', rect);
});
*/
