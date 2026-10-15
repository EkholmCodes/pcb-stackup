#let default-colors = (
  copper: rgb("#b87333"),
  core: rgb("#2d5a27"),
  prepreg: rgb("#41703c"),
  soldermask: rgb("#0f3818"),
  silkscreen: rgb("#ffffff"),
  finish: rgb("#e5c158"), // e.g. ENIG Gold
)

#let default-style = (
  stroke: 0.5pt + luma(80),
  text-size: 8pt,
  scale-y: 12.0, // Scale factor to make thin copper layers visible alongside thicker core
)