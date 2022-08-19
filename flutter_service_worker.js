'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"main.dart.js_5.part.js": "49cd3527110d724a65a3a57cd1dbc614",
"main.dart.js": "dcaa14563bf668952d3c1ab633f38f6f",
"assets/AssetManifest.json": "e7b017ed18906508cd589b0c00408e34",
"assets/assets/images/pattern.png": "7aa9e53a9487c0365a6954c0516c0925",
"assets/assets/images/splash.png": "655f52b10a10250fbbde532d688821f3",
"assets/assets/images/iphone.png": "d538362c8b127994651a4b0df1a47ecc",
"assets/assets/images/icon.png": "8d76d928fefbd56e5b2e775ce776fed1",
"assets/assets/images/getandroid.png": "fb5630f289bebc532fb734a0f43d28ce",
"assets/assets/images/getphone.png": "26f8052eb144bc11d4f54523823f9f48",
"assets/FontManifest.json": "d751713988987e9331980363e24189ce",
"assets/NOTICES": "b81f3ea496062a55e0a169c0fa3e79f7",
"main.dart.js_1.part.js": "2ee425a1a2a46c0111a6068b94f1c67c",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"main.dart.js_2.part.js": "fc80575f343083e69de57b0fd5066415",
"logo.png": "f14d70dfdd07b73b820ebe256e12416d",
"splash/splash.js": "123c400b58bea74c1305ca3ac966748d",
"splash/style.css": "3e8699dd65a865ff991ec5b47a93643d",
"splash/img/dark-1x.png": "149b6cea7dbadf10069c9974c18abc8a",
"splash/img/light-1x.png": "149b6cea7dbadf10069c9974c18abc8a",
"splash/img/light-3x.png": "2255c6beee2eff29c19fdf73bbb6bfe0",
"splash/img/dark-2x.png": "c6802bb0141175adc2eab959057e48b2",
"splash/img/light-2x.png": "c6802bb0141175adc2eab959057e48b2",
"splash/img/dark-4x.png": "32f483d0a10e0f1758c2e2a208ba5619",
"splash/img/dark-3x.png": "2255c6beee2eff29c19fdf73bbb6bfe0",
"splash/img/light-4x.png": "32f483d0a10e0f1758c2e2a208ba5619",
"index.html": "80607bc13ce3f61328fe8c620ab0c03e",
"/": "80607bc13ce3f61328fe8c620ab0c03e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "2f941cdfd549c658f448f33e693e7ac6",
"main.dart.js_3.part.js": "9c98b088d3fbfba1b083a966f1fd340b",
"manifest.json": "fa9acbf539b602314c94292e75539d16",
"icons/apple-touch-icon.png": "8679af5b1e70da09183c187546ed2906",
"icons/android-chrome-512x512.png": "25069e9788060fd959630dab2c63ea56",
"icons/android-chrome-192x192.png": "f14d70dfdd07b73b820ebe256e12416d"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
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
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
  for (var resourceKey of Object.keys(RESOURCES)) {
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
