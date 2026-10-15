#import "@preview/cetz:0.5.2"
#import "styles.typ": default-colors, default-style

#let stackup-diagram(
  layers,
  width: 6,
  scale-y: default-style.scale-y,
  show-dimensions: true,
  theme: default-colors,
) = {
  cetz.canvas({
    import cetz.draw: *

    let current-y = 0

    for l in layers {
      // Calculate visual height with scaling so tiny copper layers remain visible
      let visual-h = l.thickness * scale-y
      let y-bottom = current-y
      let y-top = current-y + visual-h

      // Resolve color
      let fill-color = if l.fill != auto { l.fill } else {
        theme.at(l.kind, default: luma(200))
      }

      // Draw main layer block
      rect(
        (0, y-bottom),
        (width, y-top),
        fill: fill-color,
        stroke: default-style.stroke,
        name: l.name,
      )

      // Center layer label
      let display-text = if l.label != auto { l.label } else { l.name }
      if display-text != "" {
        content(
          (width / 2, y-bottom + visual-h / 2),
          text(fill: white, size: default-style.text-size, weight: "bold", display-text),
        )
      }

      // Right-side thickness annotation callout
      if show-dimensions {
        let text-str = str(l.thickness) + " mm"
        content(
          (width + 0.3, y-bottom + visual-h / 2),
          anchor: "west",
          text(size: default-style.text-size, fill: luma(60), [#l.name: #text-str]),
        )
      }

      current-y += visual-h
    }

    // Draw total stackup dimension line on the left
    if show-dimensions and layers.len() > 0 {
      let total-thickness = layers.map(l => l.thickness).sum()
      line(
        (-0.3, 0),
        (-0.3, current-y),
        stroke: 0.5pt + luma(100),
        mark: (start: "stealth", end: "stealth"),
      )
      content(
        (-0.4, current-y / 2),
        anchor: "east",
        text(size: default-style.text-size, weight: "medium", [#total-thickness mm Total]),
      )
    }
  })
}