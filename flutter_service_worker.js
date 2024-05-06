'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "11373497cb6fd8da6180ff0e08c6447c",
"assets/AssetManifest.bin.json": "be99822d5b709943eef4845bd21aa1c0",
"assets/AssetManifest.json": "b491a726a2b8f65d9eb02dd58d10a983",
"assets/assets/certificate/certificate1.jpg": "341ca8328682eaf09647c617c5d34e4c",
"assets/assets/certificate/certificate2.jpg": "144bb0ca94ca6bafb11e621c903d2bbf",
"assets/assets/certificate/certificate3.jpg": "39f27bad3a85211ca7eb2c8a21510332",
"assets/assets/content_home/content1.png": "3f64b1f8ce94fb81cd216c871503126f",
"assets/assets/content_home/content2.png": "6269e2e2c69cb4d0e771fc5d1f40e29f",
"assets/assets/content_home/content3.png": "5b8f6a29eac5c6ea6cff94b56cc4af7b",
"assets/assets/content_home/quotes.jpg": "9cfd864a96323e5eb9f304e40a4a1f99",
"assets/assets/content_projects/content1_projects.png": "432c52e0198f1847dc2d3a0b50747cfe",
"assets/assets/content_projects/content2_projects.png": "b564b1c2c8d7a952a6b9c407969c92f1",
"assets/assets/content_projects/content3_projects.png": "5fce6765f8ae81cc0d56a93a555d35d9",
"assets/assets/content_projects/content4_projects.png": "2d11856508d31dc642296f12bdd5c4ed",
"assets/assets/content_projects/content5_projects.png": "82ae4051163c97cd0b7a2e96aaa381f7",
"assets/assets/content_projects/content6_projects.png": "531a8331af685d2e8fc5b7579dbaa6c3",
"assets/assets/design/menu_laminating_1.png": "df22d58599a74bfa9fe8aeb130893f1e",
"assets/assets/design/menu_laminating_2.png": "e444788b56d32168ddfce066a05ef7a7",
"assets/assets/design/mockup_booth_makanan_1.png": "db62cfc8000a8ac910ef1148c2657dc2",
"assets/assets/design/mockup_booth_makanan_2.png": "a7bfce0a7335fd5cf916f9b6f323c0b9",
"assets/assets/design/mockup_booth_minuman_1.png": "d249e2bbcf8b074293fe5240030c76f1",
"assets/assets/design/mockup_booth_minuman_2.png": "dcf172d5d54be188193e1d9bea9f139c",
"assets/assets/design/mockup_booth_minuman_3.png": "17f4ada076d6fb07f0565f637e17fb24",
"assets/assets/drawer/background_drawer.jpg": "1667426cd9b01e0ae1b6ed2f4948d536",
"assets/assets/drawer/profil.png": "1cea46a60e9067c461a226a1529994fa",
"assets/assets/logo/facebook.png": "cf8d9e5ebafdab4a80a966e1e9a43203",
"assets/assets/logo/instagram.png": "1ba2e0cc779f692681e988cb97dea971",
"assets/assets/logo/linkedin.png": "af44625737b5aa1fea487485928120ab",
"assets/assets/logo/logoblogger.png": "8ce2bdcbb9e7c555a4f7bf1d130c8046",
"assets/assets/logo/logobootstrap.png": "198a777cb3751d00f680652b7d513fdd",
"assets/assets/logo/logocanva.png": "685926503de722ad02fd03f642adfa3e",
"assets/assets/logo/logocapcut.png": "170b27df11097e4c5111e43d9407ee04",
"assets/assets/logo/logoci.png": "c45800f95c607ccc06b3a7305b479195",
"assets/assets/logo/logocoreldraw.png": "f445e9d2b8403456cb7113af7495535d",
"assets/assets/logo/logocss.png": "f22c55ff44845e8d2d3f6e4485b92a37",
"assets/assets/logo/logodart.png": "9862b47d22fafd78fbfb4c45ddb88545",
"assets/assets/logo/logofigma.png": "5b595e32bf28e9831aed0dc34434264b",
"assets/assets/logo/logofirebase.png": "45ec5c8523c42019e2aa9fe5436750af",
"assets/assets/logo/logoflutter.png": "12af08c8facd058a4746545b6ba7a91a",
"assets/assets/logo/logogit.png": "b9925639795cfe12fd51b11b585830dc",
"assets/assets/logo/logohtml.png": "ed227a7ce465e3e48bfde51a8cd4e526",
"assets/assets/logo/logojs.jpg": "6afb19bb4fe1ad9b59d3cfe2c7b95d17",
"assets/assets/logo/logolaravel.png": "c839e1ed048eee27877c8b2b91560937",
"assets/assets/logo/logomysql.png": "6edd78fce2b2eb6d019f2046dfed2f4d",
"assets/assets/logo/logonetlify.png": "a2147829cad76b2932066d58592c0625",
"assets/assets/logo/logonodejs.png": "5830a1f92ddbf5a129f1fdd8285fcc0c",
"assets/assets/logo/logophotoshop.png": "a173c45c1086a275af2fbe0c75aeac3b",
"assets/assets/logo/logophp.png": "b87b9af171ebe7a6b1f32e983d8d9fab",
"assets/assets/logo/logovercel.png": "b495bccf57b7cd35828421c977d0f705",
"assets/assets/logo/logovscode.png": "27df7ae9afd7767b16127acf7fbbe6f8",
"assets/assets/logo/logowix.png": "d9d5f27fd65dae53f13a72f525595db7",
"assets/assets/logo/logowp.png": "03e89e7cef358ba24c80d21051a4a6f4",
"assets/assets/logo/logoxampp.png": "d4b8644f51c99576b6556be351ce6eaf",
"assets/assets/logo/twitter.png": "baee712d1f6e26ac584c74a07cb5ebca",
"assets/FontManifest.json": "fdd162438259736033fd48bf80d2c636",
"assets/fonts/MaterialIcons-Regular.otf": "6d27311c0992ebcf631fef99d5c7ed5e",
"assets/NOTICES": "1fb2da03427a76a84670ba50d71df6bd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/eva_icons_flutter/lib/fonts/Eva-Icons.ttf": "a71dbd49ad4a52020638190e30ac52e0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "dafa74e8e8981b9769fb5b8c7be9b78a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b72c617acdf2227c8b1413215f620711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"favicon_rifal.png": "84066ef233169d9db144d93cd3850afb",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "c5e63829bc8a5f4cc4da1b82c97742cc",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "60e2e94ed577cb3026ad017d2f94e8fe",
"/": "60e2e94ed577cb3026ad017d2f94e8fe",
"main.dart.js": "43cf0382c893ac4008271e2aa03e790b",
"manifest.json": "bb236b6320ef7bff7686a82882a48b38",
"version.json": "47ccb94925108e71b2b87ff7af429b5f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
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
