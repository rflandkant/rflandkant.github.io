'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "d73a2723e63a6a8a47152a799b78c494",
"assets/AssetManifest.bin.json": "64c0eb5baf24593e1fee6700665b3748",
"assets/AssetManifest.json": "cf3492149a120ba2f4a9014130f30600",
"assets/assets/background_drawer.jpg": "1667426cd9b01e0ae1b6ed2f4948d536",
"assets/assets/certificate1.jpg": "341ca8328682eaf09647c617c5d34e4c",
"assets/assets/certificate2.jpg": "144bb0ca94ca6bafb11e621c903d2bbf",
"assets/assets/certificate3.jpg": "39f27bad3a85211ca7eb2c8a21510332",
"assets/assets/content1.png": "3f64b1f8ce94fb81cd216c871503126f",
"assets/assets/content1_projects.png": "432c52e0198f1847dc2d3a0b50747cfe",
"assets/assets/content2.png": "6269e2e2c69cb4d0e771fc5d1f40e29f",
"assets/assets/content2_projects.png": "b564b1c2c8d7a952a6b9c407969c92f1",
"assets/assets/content3.png": "5b8f6a29eac5c6ea6cff94b56cc4af7b",
"assets/assets/content3_projects.png": "5fce6765f8ae81cc0d56a93a555d35d9",
"assets/assets/content4_projects.png": "2d11856508d31dc642296f12bdd5c4ed",
"assets/assets/facebook.png": "cf8d9e5ebafdab4a80a966e1e9a43203",
"assets/assets/instagram.png": "1ba2e0cc779f692681e988cb97dea971",
"assets/assets/linkedin.png": "af44625737b5aa1fea487485928120ab",
"assets/assets/logoblogger.png": "8ce2bdcbb9e7c555a4f7bf1d130c8046",
"assets/assets/logobootstrap.png": "198a777cb3751d00f680652b7d513fdd",
"assets/assets/logocanva.png": "685926503de722ad02fd03f642adfa3e",
"assets/assets/logocapcut.png": "170b27df11097e4c5111e43d9407ee04",
"assets/assets/logoci.png": "c45800f95c607ccc06b3a7305b479195",
"assets/assets/logocoreldraw.png": "f445e9d2b8403456cb7113af7495535d",
"assets/assets/logocss.png": "f22c55ff44845e8d2d3f6e4485b92a37",
"assets/assets/logodart.png": "9862b47d22fafd78fbfb4c45ddb88545",
"assets/assets/logofigma.png": "5b595e32bf28e9831aed0dc34434264b",
"assets/assets/logofirebase.png": "45ec5c8523c42019e2aa9fe5436750af",
"assets/assets/logoflutter.png": "12af08c8facd058a4746545b6ba7a91a",
"assets/assets/logogit.png": "b9925639795cfe12fd51b11b585830dc",
"assets/assets/logohtml.png": "ed227a7ce465e3e48bfde51a8cd4e526",
"assets/assets/logojs.jpg": "6afb19bb4fe1ad9b59d3cfe2c7b95d17",
"assets/assets/logolaravel.png": "c839e1ed048eee27877c8b2b91560937",
"assets/assets/logomysql.png": "6edd78fce2b2eb6d019f2046dfed2f4d",
"assets/assets/logonetlify.png": "a2147829cad76b2932066d58592c0625",
"assets/assets/logonodejs.png": "5830a1f92ddbf5a129f1fdd8285fcc0c",
"assets/assets/logophotoshop.png": "a173c45c1086a275af2fbe0c75aeac3b",
"assets/assets/logophp.png": "b87b9af171ebe7a6b1f32e983d8d9fab",
"assets/assets/logovercel.png": "b495bccf57b7cd35828421c977d0f705",
"assets/assets/logovscode.png": "27df7ae9afd7767b16127acf7fbbe6f8",
"assets/assets/logowix.png": "d9d5f27fd65dae53f13a72f525595db7",
"assets/assets/logowp.png": "03e89e7cef358ba24c80d21051a4a6f4",
"assets/assets/logoxampp.png": "d4b8644f51c99576b6556be351ce6eaf",
"assets/assets/profil.png": "1cea46a60e9067c461a226a1529994fa",
"assets/assets/quotes.jpg": "9cfd864a96323e5eb9f304e40a4a1f99",
"assets/assets/twitter.png": "baee712d1f6e26ac584c74a07cb5ebca",
"assets/FontManifest.json": "fdd162438259736033fd48bf80d2c636",
"assets/fonts/MaterialIcons-Regular.otf": "d24b0a5adaca22be9742fa7c8dd64746",
"assets/NOTICES": "ad70c7b224bb4c6adc329be96457591d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/eva_icons_flutter/lib/fonts/Eva-Icons.ttf": "a71dbd49ad4a52020638190e30ac52e0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "dafa74e8e8981b9769fb5b8c7be9b78a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b72c617acdf2227c8b1413215f620711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"favicon_rifal.png": "84066ef233169d9db144d93cd3850afb",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e09bff0a4baf6b247b94c30900ef3c24",
"/": "e09bff0a4baf6b247b94c30900ef3c24",
"main.dart.js": "b0b971538d3efd4538248e8e89a8bbbb",
"manifest.json": "bb236b6320ef7bff7686a82882a48b38",
"version.json": "47ccb94925108e71b2b87ff7af429b5f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
