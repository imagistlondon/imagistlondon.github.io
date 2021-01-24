'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "android-chrome-192x192.png": "b86e1bedfeba2b7f0ee344c2c4007125",
"android-chrome-512x512.png": "78b6fbf11ebd07343a7b1584195bbee7",
"favicon.ico": "19a0349ef88d75cb2624b98a4e03e2fa",
"favicon-32x32.png": "8b9d8a3841cfb6b20fb023430c3117dd",
"manifest.json": "1063745475257257f2aa77a8c929cd93",
"apple-touch-icon.png": "ae03aa0f1a3dba39c37ffd7ae02863bc",
"assets/NOTICES": "0291a82e47f2350276d6dc4e74765b7c",
"assets/assets/THUMB_NIKE_1.jpg": "b5c67d5c5f505b730bdc19eb48232fff",
"assets/assets/Argent_Process_14.jpg": "3cc8e8fb78421ee1d280ad8c3a67346e",
"assets/assets/THUMB_TASKFEED_1.jpg": "b999690e1d98d1e66935ee47e52b1da9",
"assets/assets/INDOI_ICON_ELEPHANT-01.jpg": "e171ee64f301cbb98a69c861229c13e5",
"assets/assets/ARCHIVE_BARBICAN_THUMB.gif": "b10b9c76c844160ff4a9f0eb16f13905",
"assets/assets/Manifesto_Process_03.jpg": "17de39c46aa84eb098ce3e2f3cf73418",
"assets/assets/CDY_LAYERS_PROCESS_04.jpg": "6df89ee2b121f90989cf9d59f5b59fb8",
"assets/assets/TheFeds_Process_01.jpg": "28c40ee2ae1a2eff0ee0ce16c576e7bc",
"assets/assets/Argent_Revolution_02.jpg": "f60ef9b3dbd09ee9ead7cb71125f7efb",
"assets/assets/Argent_Revolution_10.jpg": "682f83935829392676fec9b3cad50f27",
"assets/assets/CDY_Layers_09.jpg": "e0e60e868de7aa2ae5cd9be69e798e97",
"assets/assets/Manifesto_Identity_12.png": "2d98367a9260bdc1a7c11e3db1a434ad",
"assets/assets/03_INDOI_PROCESS_3.2.png": "072fb4d87fd9f43ae99b373e24bde244",
"assets/assets/Argent_Revolution_14.jpg": "169a7ff44f4e96b6f9b0629529894f3f",
"assets/assets/TheFeds_Identity_09.jpg": "4468cc3dede80bf3ac920c7093e102bc",
"assets/assets/Argent_Process_01.jpg": "75a63e685d96da074e5fdcd2484462df",
"assets/assets/Manifesto_Process_05.jpg": "bdc50696c4537fdc9c568a224d22ac6c",
"assets/assets/CDY_Layers_12.jpg": "add8384aef4218f618b70256ba805efd",
"assets/assets/CDY_Layers_20.jpg": "6dda693a0a943e58947c283f35e5ee7f",
"assets/assets/ARCHIVE_PARFIN_THUMB.png": "22ea5db288b7c6ab570629f63ab7054e",
"assets/assets/CDY_Layers_10.jpg": "849eb22f6636fe514fb691f2bf693028",
"assets/assets/Argent_Revolution_01.jpg": "f9a7e755a33a4f31818ff5afd9833c22",
"assets/assets/Manifesto_Identity_07.png": "2f3a476080f4c022375c6f23773cf946",
"assets/assets/Argent_Process_05.jpg": "54630ac5f52662e895bf9162fb66339e",
"assets/assets/CDY_Layers_06.jpg": "06869928853f96cf1f9325d7aeff2ee0",
"assets/assets/01_INDOI_LOGO-01.svg": "482de6d7dcf078837708f70b271355be",
"assets/assets/Argent_Revolution_08.jpg": "ef2ad72eb0be87d4d7fbc7d8e1f546c4",
"assets/assets/Manifesto_Identity_02.jpg": "9792b2516954ad962f8156fc8f921941",
"assets/assets/TheFeds_Identity_07.jpg": "e57ad6f1c6d28d92914b7609b90bd867",
"assets/assets/Argent_Process_08.jpg": "86c2e5f2dd4b335074a3ea0ebbf0c6ed",
"assets/assets/10_INDOI_WORDMARK.svg": "a261cde1307a16ab1ada217d1f31ed86",
"assets/assets/Manifesto_Identity_08.png": "a893537371a0c63e4ea296db901c2a2e",
"assets/assets/09_House_3.png": "7c70cf5046932e3734d1d67c0be25578",
"assets/assets/08_INDOI_LOGO-01.svg": "08238edcc182b7c8099263fb9630155e",
"assets/assets/THUMB_INDOI_1.jpg": "e4f9ff4beb8eebbbd2f153fb671e711f",
"assets/assets/Argent_Process_12.jpg": "dfcd224931abd0aeb0679ac6dc4d8dba",
"assets/assets/Argent_Revolution_09.png": "837ac8bdeab7c2ff624375dd806449fb",
"assets/assets/CDY_Layers_03.jpg": "408d4ff9504c6b12fd64109ae578535f",
"assets/assets/TheFeds_Identity_06.jpg": "253b68a90e8b3679f8f0801f8fd2ccd9",
"assets/assets/ARCHIVE_RADIO_THUMB.png": "5e2ad1f85a5cc53eace83db824f8dde8",
"assets/assets/ARCHIVE_SACCA_THUMB.jpg": "49887244c9ed95f749012de2430cc879",
"assets/assets/Indoi_labels_2_EDIT.jpg": "9555a5d39105b5eba675a55141113b31",
"assets/assets/CDY_Layers_01.jpg": "9434fcf3092286bc657e4703d0ad542c",
"assets/assets/empty.png": "c9477b1f1820f9acfb93eebb2e6679c2",
"assets/assets/Argent_Revolution_07.jpg": "a7843c77b7f354607640b1e91d72a55a",
"assets/assets/CDY_Layers_17.jpg": "d5de90d25c784ef33c1bf097c6ea4efe",
"assets/assets/Argent_Revolution_15.jpg": "711f52dd637d8924d607d7420af4959e",
"assets/assets/img-cross.svg": "93599771837f1051944c2000ba67779a",
"assets/assets/CDY_LAYERS_PROCESS_11.jpg": "46cc68108dfcca0ef3edcf47c339ca01",
"assets/assets/TheFeds_Identity_08.jpg": "0c55dcf0d0456c2238a8a1f85a9c5f0f",
"assets/assets/Manifesto_Identity_10.png": "4d14c9c3c3215012454787a57bf80ab4",
"assets/assets/Manifesto_Identity_04.png": "66d023e1b8088110bf844160e8930adb",
"assets/assets/Argent_Revolution_04.jpg": "4b3056af913aceb3c11048bb472bad06",
"assets/assets/ARCHIVE_TS_THUMB.jpg": "3dc63a0e4d1039c1aaf50d024cbcf826",
"assets/assets/CDY_Layers_00_banner.jpg": "7ea7f92f460755dd5b6f021ece7ca1bd",
"assets/assets/THUMB_HH_1.jpg": "d33c663155e4cee3ac38c4a305a6d586",
"assets/assets/Manifesto_Identity_03.png": "1609b375e0e4243437a4268deb2de6c3",
"assets/assets/img-cross.png": "6bd415605183521af44551b33d81b5ae",
"assets/assets/Manifesto_Process_01.jpg": "0d91af79f85d16bfb617b084a5709027",
"assets/assets/Indoi_Lookbook_01.jpg": "1db48a37a8da8b160b659adb9916bfa9",
"assets/assets/Argent_Process_10.jpg": "ae6bd3dda796da3fb1fabd927f2312ff",
"assets/assets/CDY_LAYERS_PROCESS_09.jpg": "278c081c4e8afa57df3125d5c13db6dc",
"assets/assets/Manifesto_Identity_09.png": "0a289c1cafb7eb05a61053d90adfb415",
"assets/assets/placeholder.png": "1632e46a5c79d43f3125ca62c54189cb",
"assets/assets/INDOI_ICON_ELEPHANT-01.svg": "5675b0267654e1f89d90cd135231a709",
"assets/assets/CDY_Layers_16.jpg": "8611148cf7ff504d4818c7469c0c9648",
"assets/assets/Argent_Process_13.jpg": "f8dd035d145daf10f5329be9c11353c9",
"assets/assets/INDOI_ICON_ELEPHANT-01.png": "7b3b6e66235de20d4c743b1edacb4f88",
"assets/assets/img-logo.png": "9d210a3dd551c5afab235c06dcbb3f6d",
"assets/assets/04_indusmain.png": "9f1cc7ecc291c1f82fab7f5f4c68a3be",
"assets/assets/TheFeds_Identity_01.jpg": "e78fd388d06a64e7a64cbcf50a5ab3f3",
"assets/assets/Argent_Process_06.jpg": "c84f7c287722442cea40b0941a94e235",
"assets/assets/CDY_LAYERS_PROCESS_02.jpg": "fa6a07eac0c3d67929f3f8e8a11bcc2c",
"assets/assets/CDY_LAYERS_PROCESS_05.jpg": "a8c182d0c1bc5998d09a735e3dc1ead8",
"assets/assets/TheFeds_Identity_03.jpg": "bfbafa4fca2cf17e99aa34c668c7b564",
"assets/assets/05_MalMum_1.png": "9f6c808923c5359e9fa59d91733cafd1",
"assets/assets/Manifesto_Identity_14.png": "4bc4ab28212530f25371de531d46c222",
"assets/assets/Manifesto_Process_02.jpg": "69e18747db7f86d4b3939f22a2e16af4",
"assets/assets/TheFeds_Identity_04.jpg": "c78b4670fb3fbb40f7df888394c2a474",
"assets/assets/img-arrow.png": "fbba79bb53cdc433812f83a519ee19b6",
"assets/assets/Indoi_lookbook_3.jpg": "17c6b5b07666ddcb0fa60c335bc7a586",
"assets/assets/CDY_LAYERS_PROCESS_07.jpg": "384038ce48368bcfbc6f3471644a8a82",
"assets/assets/Manifesto_Identity_13.png": "3d281b453c8d409df837f3fd4019b166",
"assets/assets/Argent_Revolution_13.jpg": "a79922930957958805b6685790f2038e",
"assets/assets/Indoi_labels_1_EDIT.jpg": "e4f9ff4beb8eebbbd2f153fb671e711f",
"assets/assets/CDY_Layers_18.jpg": "7feade054393540eb9c6246f53b5cdcd",
"assets/assets/Indoi_Swingtags_EDIT.jpg": "8fc6d92fb397ce2380d7502983d72840",
"assets/assets/06_52edc0a180e2c.jpg": "0a7d5465cd7bf231db1b5add3823d5d6",
"assets/assets/CDY_Layers_14.jpg": "eb77fd7f22c0244a20a8a1f1c702d9f6",
"assets/assets/01_MalMum_2.png": "05c1685eb24f7e506d0e7c608e5edd77",
"assets/assets/ARCHIVE_MANIFESTO_THUMB.jpg": "d3531a502e7626c5c453d895d675c9d5",
"assets/assets/ARCHIVE_RADIO_2_THUMB.jpg": "908e71ea0f8b35cbed23ae03159671b9",
"assets/assets/Argent_Process_04.jpg": "341797ae29dd2fcf92ebd590c4901ac9",
"assets/assets/Argent_Revolution_03.jpg": "e430228d2f4b009a99de042b6f3da447",
"assets/assets/CDY_LAYERS_PROCESS_08.jpg": "e3a46f0b79fabdbecb168e216f6e98d8",
"assets/assets/TheFeds_Identity_05.jpg": "959e366c189d600c675cbab334939b23",
"assets/assets/07_DizaneShrineofKalashNEAfgh.jpg": "0b5eedb89cfc1082b307dc1a03225295",
"assets/assets/CDY_LAYERS_PROCESS_01.jpg": "6ac89bbf5fc596dc8b456ab2fec8dbad",
"assets/assets/Argent_Process_11.jpg": "a933fec1acc746954c6e62cd09ef5af6",
"assets/assets/CDY_LAYERS_PROCESS_03.jpg": "e06ada4820b264c5c1db9e25a05ee0d8",
"assets/assets/CDY_LAYERS_PROCESS_06.jpg": "71aa44345232a31e7efc0711d6a031a5",
"assets/assets/CDY_Layers_15.jpg": "63db4a0daf057503199e73160e2f38d5",
"assets/assets/Argent_Process_03.jpg": "ac8e0d4c4cf7faa3eb39981354c731b7",
"assets/assets/Argent_Revolution_09.jpg": "7ee44510994324fbf3f51295c75126aa",
"assets/assets/CDY_Layers_05.jpg": "4c197d5b1cee7d802400a0e8056541c7",
"assets/assets/img-arrow.svg": "78369f6fd33705e1a1ea54ffb1699317",
"assets/assets/ARCHIVE_AA_THUMB.jpg": "c8b261b2e6fa4daae6578ff58cbd7158",
"assets/assets/Manifesto_Identity_01.jpg": "9b30708e2dbd2984b987d84a9a0e0ba2",
"assets/assets/THUMB_WAHACA_1.jpg": "f5cc01524a544bd3bf0a573864809b0b",
"assets/assets/Argent_Process_02.jpg": "6bfc20c9ec709887d61dab9328feacda",
"assets/assets/Manifesto_Process_04.jpg": "bb3dc6dfbcdc1f988128dbe110e3a40e",
"assets/assets/TheFeds_Process_02.jpg": "17122bbe6015feec9c40f95a0e16e7cf",
"assets/assets/ARCHIVE_B+A_THUMB.gif": "e8c2ddc102cd4a320e05e084c0709299",
"assets/assets/01_INDOI_LOGO-01.png": "ee086f9b5840d1f4c98d6eb53a3a5bcd",
"assets/assets/02_MISS_HIPPY.png": "4022b2781dc61f1ad8b21f61086cfc40",
"assets/assets/Indoi_Totebag1.jpg": "9d5c8ca7df0aacc4bb13a0184cf3eb3f",
"assets/assets/CDY_LAYERS_PROCESS_10.jpg": "ccf21a2876a4936d78bc5d96e40b6c5d",
"assets/assets/Argent_Process_07.jpg": "4427568b9bcecc6cad050c1ce3936abe",
"assets/assets/Argent_Process_09.jpg": "dd5d588e41776dc34c5e9bfdb1b69e67",
"assets/assets/11_INDOI_SHOOT.png": "8f096f224c8e159223a9184c671b7773",
"assets/assets/Argent_Revolution_05.jpg": "609416b91eb861ccbdbed41af5a675d3",
"assets/assets/CDY_Layers_07.jpg": "087affb030b68a6bb492dd4180b2c345",
"assets/assets/CDY_Layers_19.jpg": "f7987274a0ca2e302575b952aa44c8ca",
"assets/assets/CDY_Layers_11.jpg": "6ebecb1662c38ddfa392db470d497539",
"assets/assets/Manifesto_Identity_11.png": "d70e60ee06b96c02b3a1f25adc069122",
"assets/assets/THUMB_STRAZ_1.jpg": "8feda5bf20872adb4c1ae0e6c6b3eb97",
"assets/assets/Argent_Revolution_11.jpg": "791b82e6783b180cee7a3c60eee22ee4",
"assets/assets/INDOI_LOGO_Page_35.jpg": "2518c8891b8fdaac33fae0fade7d147a",
"assets/assets/CDY_Layers_13.jpg": "6fc29e669364df406ee2c12f9c1e3463",
"assets/assets/THUMB_HUN_1.jpg": "78a73f807769c0382812866d8da56da1",
"assets/assets/Manifesto_Identity_05.png": "906f78292444d68289b5de66f28472fb",
"assets/assets/TheFeds_Identity_02.jpg": "386896fb814d985d2e1ef319ac87510b",
"assets/assets/CDY_Layers_04.jpg": "78b3ea6f16350a6e604d48dd8ad4db06",
"assets/assets/ARCHIVE_DLR_THUMB.gif": "141f8fb3799930c256d1d5c939ea4a76",
"assets/assets/Argent_Revolution_06.png": "0164f098046e00a51349106d38b751e1",
"assets/assets/Manifesto_Identity_06.png": "0b3714abc9dbd2737afc832d49b64944",
"assets/assets/CDY_Layers_02.jpg": "593152d8b4a6fa24c462a68db0cecf64",
"assets/assets/TheFeds_Process_03.jpg": "d9e997d8725e49fea28fe0c1decbfc32",
"assets/assets/CDY_Layers_08.jpg": "12068048f22b9f0f234abecd733903cb",
"assets/assets/img-logo.svg": "c7bfee46837fe653aa63efe9c9abc193",
"assets/assets/Argent_Revolution_12.jpg": "353c56846c15acd4f8a7a663ecb15e79",
"assets/AssetManifest.json": "dc706fc1cd08fedab12dc33a2ad67ff2",
"assets/FontManifest.json": "1a331df5c5b92fa7020dd366ad7c3334",
"assets/fonts/font-saol-text-light.woff2": "598682f2968ad8d33ff48d04c8bafa93",
"assets/fonts/font-untitled-sans-web-light.woff2": "ab8dc13c2dd328a8498a7e573269da16",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"index.html": "a84727ae856e5949d88133ee242d964a",
"/": "a84727ae856e5949d88133ee242d964a",
"version.json": "fb800d37cb51ce25f91a8114a375508b",
"main.dart.js": "8c9d86556aca8bdd097e59690dd26322",
"404.html": "f4e3edb53349945387e617abbd0fd231"
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
