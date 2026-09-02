{
  lib,
  rustPlatform,
  fetchFromGitHub,
  fetchurl,
  linkFarm,
  gnused,
  nix-update-script,
}:

let
  # mdslw's build.rs normally downloads these CLDR sentence-break suppression
  # lists from the network at build time, which the Nix sandbox disallows.
  # Pre-fetch them here (hash-pinned) and hand them to build.rs via
  # MDSLW_LANG_JSON_DIR instead; see postPatch below.
  cldrSegmentsUrl = "https://raw.githubusercontent.com/unicode-org/cldr-json/main/cldr-json/cldr-segments-full/segments";
  langSuppressions = {
    de = "sha256-UWftkf5EoXMUNqJQStQQMeTBHPkJEb475VEdHY65RpY=";
    en = "sha256-L/kf4d4lmEiYWPcsgVZwbO3o8Xg5qgqrgHA0G7R9xbg=";
    es = "sha256-4nJ/M/PV1JaP2yQdUUgngEcti6k4LbQwJzldO5noO4Y=";
    fr = "sha256-+8IRov9qlmNsaWEdJpYqPMzHZi89rlYc2eNb1eq7QhM=";
    it = "sha256-p+ULlpB00qLEhIv2ccSXK48cu9LvfvVRv0vzUzsJg8Y=";
  };
  langSuppressionFiles = linkFarm "mdslw-lang-suppressions" (
    lib.mapAttrsToList (lang: hash: {
      name = "${lang}.json";
      path = fetchurl {
        url = "${cldrSegmentsUrl}/${lang}/suppressions.json";
        inherit hash;
      };
    }) langSuppressions
  );
in
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "mdslw";
  version = "0.17.2";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "razziel89";
    repo = "mdslw";
    tag = finalAttrs.version;
    hash = "sha256-4iSQS13tMglOV8nWBw7Zxi8+DcKHKGl99cuHKvOIE7s=";
  };

  cargoHash = "sha256-emaBv9b9WjFKbyN5V0A5N8NHea8YMBvj256gv9P116E=";

  nativeBuildInputs = [ gnused ];

  # Rewrite the network download in build.rs to read the pre-fetched JSON
  # files from $MDSLW_LANG_JSON_DIR instead. Whitespace-tolerant (\s*) since
  # exact indentation is fragile to match with substituteInPlace.
  postPatch = ''
    sed -z -E -i \
      's/let data = reqwest::blocking::get\(format!\(\s*"\{\}\/\{\}\/suppressions\.json",\s*LANG_SUPPRESSION_URL, lang\s*\)\)\s*\.expect\("downloading language"\)\s*\.json::<Value>\(\)\s*\.expect\("parsing response as json"\);/let lang_json_dir = std::env::var("MDSLW_LANG_JSON_DIR").expect("MDSLW_LANG_JSON_DIR env var must be set"); let lang_json_path = Path::new(\&lang_json_dir).join(format!("{}.json", lang)); let data: Value = serde_json::from_str(\&fs::read_to_string(\&lang_json_path).expect("reading language json")).expect("parsing response as json");/' \
      build.rs
  '';

  env.MDSLW_LANG_JSON_DIR = langSuppressionFiles;

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Prepare your markdown for easy diff'ing";
    homepage = "https://github.com/razziel89/mdslw";
    changelog = "https://github.com/razziel89/mdslw/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "mdslw";
  };
})
