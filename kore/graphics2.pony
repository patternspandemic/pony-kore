
class KoreGraphics2
  var _target: (Canvas | None)
  // var _render_target: (KoreGraphics4RenderTarget | None) = None

  new create(target: (Canvas | None) = None) =>
    _target = target
    /*
    match _target
    | None => None
    // TODO: Requires implementation of CubeMap, Image
    // | let cube_map: CubeMap => _render_target = cube_map._get_render_target()
    | let image: Image => _render_target = image._get_render_target()
    end
    */
