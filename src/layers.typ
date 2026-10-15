/// Generic layer dictionary
#let layer(
  name: "",
  thickness: 0.035, // in mm
  kind: "copper",   // "copper", "core", "prepreg", "soldermask"
  fill: auto,
  label: auto,
) = (
  name: name,
  thickness: thickness,
  kind: kind,
  fill: fill,
  label: label,
)

// Shorthand functions for convenience
#let copper-layer(name, thickness: 0.035, label: auto) = layer(name: name, thickness: thickness, kind: "copper", label: label)
#let core-layer(thickness: 0.8, label: "FR4 Core") = layer(name: "Core", thickness: thickness, kind: "core", label: label)
#let prepreg-layer(thickness: 0.1, label: "Prepreg 2116") = layer(name: "Prepreg", thickness: thickness, kind: "prepreg", label: label)
#let soldermask-layer(thickness: 0.02) = layer(name: "Solder Mask", thickness: thickness, kind: "soldermask", label: "")