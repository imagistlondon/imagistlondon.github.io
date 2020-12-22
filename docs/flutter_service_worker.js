'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "font-untitled-sans-web-light.woff": "a770caa853bc25f2fa64b5ba65fc3f59",
"font-untitled-sans-web-light.eot": "de9d36fbcdf67c743843c1d6e4d98080",
"font-saol-text-light.woff": "af367118659c3dcdb6e18409b688d97a",
"android-chrome-192x192.png": "b86e1bedfeba2b7f0ee344c2c4007125",
"font-saol-text-light.woff2": "598682f2968ad8d33ff48d04c8bafa93",
"android-chrome-512x512.png": "78b6fbf11ebd07343a7b1584195bbee7",
"favicon.ico": "19a0349ef88d75cb2624b98a4e03e2fa",
"favicon-32x32.png": "8b9d8a3841cfb6b20fb023430c3117dd",
"manifest.json": "d7805ca91f654e0c376e7256b6bbb430",
"apple-touch-icon.png": "ae03aa0f1a3dba39c37ffd7ae02863bc",
"assets/web/font-saol-text-light.woff2": "598682f2968ad8d33ff48d04c8bafa93",
"assets/web/font-untitled-sans-web-light.woff2": "ab8dc13c2dd328a8498a7e573269da16",
"assets/NOTICES": "e9055bc1ad809fc86ccef3287259144a",
"assets/assets/THUMB_NIKE_1.jpg": "b5c67d5c5f505b730bdc19eb48232fff",
"assets/assets/THUMB_TASKFEED_1.jpg": "b999690e1d98d1e66935ee47e52b1da9",
"assets/assets/ARCHIVE_BARBICAN_THUMB.gif": "b10b9c76c844160ff4a9f0eb16f13905",
"assets/assets/03_INDOI_PROCESS_3.2.png": "072fb4d87fd9f43ae99b373e24bde244",
"assets/assets/ARCHIVE_PARFIN_THUMB.png": "22ea5db288b7c6ab570629f63ab7054e",
"assets/assets/01_INDOI_LOGO-01.svg": "482de6d7dcf078837708f70b271355be",
"assets/assets/10_INDOI_WORDMARK.svg": "a261cde1307a16ab1ada217d1f31ed86",
"assets/assets/09_House_3.png": "7c70cf5046932e3734d1d67c0be25578",
"assets/assets/08_INDOI_LOGO-01.svg": "08238edcc182b7c8099263fb9630155e",
"assets/assets/THUMB_INDOI_1.jpg": "e4f9ff4beb8eebbbd2f153fb671e711f",
"assets/assets/ARCHIVE_RADIO_THUMB.png": "5e2ad1f85a5cc53eace83db824f8dde8",
"assets/assets/ARCHIVE_SACCA_THUMB.jpg": "49887244c9ed95f749012de2430cc879",
"assets/assets/Indoi_labels_2_EDIT.jpg": "9555a5d39105b5eba675a55141113b31",
"assets/assets/empty.png": "c9477b1f1820f9acfb93eebb2e6679c2",
"assets/assets/img-cross.svg": "93599771837f1051944c2000ba67779a",
"assets/assets/ARCHIVE_TS_THUMB.jpg": "3dc63a0e4d1039c1aaf50d024cbcf826",
"assets/assets/THUMB_HH_1.jpg": "d33c663155e4cee3ac38c4a305a6d586",
"assets/assets/img-cross.png": "6bd415605183521af44551b33d81b5ae",
"assets/assets/Indoi_Lookbook_01.jpg": "1db48a37a8da8b160b659adb9916bfa9",
"assets/assets/placeholder.png": "1632e46a5c79d43f3125ca62c54189cb",
"assets/assets/INDOI_ICON_ELEPHANT-01.svg": "5675b0267654e1f89d90cd135231a709",
"assets/assets/img-logo.png": "9d210a3dd551c5afab235c06dcbb3f6d",
"assets/assets/04_indusmain.png": "9f1cc7ecc291c1f82fab7f5f4c68a3be",
"assets/assets/05_MalMum_1.png": "9f6c808923c5359e9fa59d91733cafd1",
"assets/assets/img-arrow.png": "fbba79bb53cdc433812f83a519ee19b6",
"assets/assets/image45.png": "98dd79cca5fe27159c9ee0e8a1abbd93",
"assets/assets/Indoi_lookbook_3.jpg": "17c6b5b07666ddcb0fa60c335bc7a586",
"assets/assets/Indoi_labels_1_EDIT.jpg": "e4f9ff4beb8eebbbd2f153fb671e711f",
"assets/assets/Indoi_Swingtags_EDIT.jpg": "8fc6d92fb397ce2380d7502983d72840",
"assets/assets/06_52edc0a180e2c.jpg": "0a7d5465cd7bf231db1b5add3823d5d6",
"assets/assets/01_MalMum_2.png": "05c1685eb24f7e506d0e7c608e5edd77",
"assets/assets/ARCHIVE_MANIFESTO_THUMB.jpg": "d3531a502e7626c5c453d895d675c9d5",
"assets/assets/ARCHIVE_RADIO_2_THUMB.jpg": "908e71ea0f8b35cbed23ae03159671b9",
"assets/assets/07_DizaneShrineofKalashNEAfgh.jpg": "0b5eedb89cfc1082b307dc1a03225295",
"assets/assets/img-arrow.svg": "78369f6fd33705e1a1ea54ffb1699317",
"assets/assets/ARCHIVE_AA_THUMB.jpg": "c8b261b2e6fa4daae6578ff58cbd7158",
"assets/assets/THUMB_WAHACA_1.jpg": "f5cc01524a544bd3bf0a573864809b0b",
"assets/assets/ARCHIVE_B+A_THUMB.gif": "e8c2ddc102cd4a320e05e084c0709299",
"assets/assets/02_MISS_HIPPY.png": "4022b2781dc61f1ad8b21f61086cfc40",
"assets/assets/Indoi_Totebag1.jpg": "9d5c8ca7df0aacc4bb13a0184cf3eb3f",
"assets/assets/11_INDOI_SHOOT.png": "8f096f224c8e159223a9184c671b7773",
"assets/assets/THUMB_STRAZ_1.jpg": "8feda5bf20872adb4c1ae0e6c6b3eb97",
"assets/assets/INDOI_LOGO_Page_35.jpg": "2518c8891b8fdaac33fae0fade7d147a",
"assets/assets/THUMB_HUN_1.jpg": "78a73f807769c0382812866d8da56da1",
"assets/assets/ARCHIVE_DLR_THUMB.gif": "141f8fb3799930c256d1d5c939ea4a76",
"assets/assets/THUMB_CDY_1.jpg": "6d69870f7d801ba4aa85be02a85f0312",
"assets/assets/img-logo.svg": "c7bfee46837fe653aa63efe9c9abc193",
"assets/AssetManifest.json": "34e9b5b9385a2ded0da14067d2549ed8",
"assets/FontManifest.json": "a506737225df98745abf78d11ebbf28a",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"index.html": "fa4050e4ecedeedd39b6e78ab638e7ae",
"/": "fa4050e4ecedeedd39b6e78ab638e7ae",
"font-untitled-sans-web-light.woff2": "ab8dc13c2dd328a8498a7e573269da16",
"version.json": "fb800d37cb51ce25f91a8114a375508b",
"main.dart.js": "5aff2172ccf770b41fbd7f9440396391",
"font-saol-text-light.eot": "cf44e4b6266324651556fb56186e6400"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
