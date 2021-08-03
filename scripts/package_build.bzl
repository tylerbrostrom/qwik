load("@build_bazel_rules_nodejs//:index.bzl", "npm_package_bin")

def package_build(
        name,
        deps = [],
        srcs= [],
        **kwargs):
    npm_package_bin(
        name = name,
        tool = "//scripts:package_build_binary",
        data = deps + srcs + [
            "@npm//@microsoft/api-extractor",
            "@npm//@types/express",
            "@npm//@types/mri",
            "@npm//@types/node",
            "@npm//@types/prettier",
            "@npm//@types/source-map-support",
            "@npm//domino",
            "@npm//esbuild",
            "@npm//esbuild-register",
            "@npm//express",
            "@npm//mri",
            "@npm//prettier",
            "@npm//rollup",
            "@npm//source-map-support",
            "@npm//terser",
            "@npm//typescript",
            "//scripts:all_build_source",
        ],
        outs = [
            name + "/core.cjs",
            name + "/core.cjs.map",
            name + "/core.d.ts",
            name + "/core.mjs",
            name + "/core.mjs.map",
            name + "/jsx-runtime.cjs",
            name + "/jsx-runtime.d.ts",
            name + "/jsx-runtime.mjs",
            name + "/LICENSE",
            name + "/optimizer.cjs",
            name + "/optimizer.d.ts",
            name + "/optimizer.mjs",
            name + "/package.json",
            name + "/qwikloader.js",
            name + "/qwikloader.debug.js",
            name + "/qwikloader.optimize.js",
            name + "/qwikloader.optimize.debug.js",
            name + "/README.md",
            name + "/server/index.cjs",
            name + "/server/index.d.ts",
            name + "/server/index.mjs",
            name + "/testing/index.cjs",
            name + "/testing/index.d.ts",
            name + "/testing/index.mjs",
            name + "/testing/jest-preprocessor.cjs",
            name + "/testing/jest-preprocessor.mjs",
            name + "/testing/jest-preset.cjs",
            name + "/testing/jest-preset.mjs", 
        ],
        args = [
            "$(execpath %s/core.cjs)" % name,
        ],
        visibility = None,
    )