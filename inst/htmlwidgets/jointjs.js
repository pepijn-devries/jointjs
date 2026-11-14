// Fix for mismatch in jQuery dependency of JointJS and Shiny
if (window.jQuery && !window.jQuery.camelCase) {
    window.jQuery.camelCase = function(string) {
        return string.replace(/-([a-z])/g, function(all, letter) {
            return letter.toUpperCase();
        });
    };
}

HTMLWidgets.widget({

  name: 'jointjs',
  type: 'output',

  factory: function(el, width, height) {

    var graph = new joint.dia.Graph({}, { cellNamespace: joint.shapes });
    var paper = null;
    var elId = el.id;

    function syncGraphToShiny() {
      if (window.Shiny) {
        var graphJSON = graph.toJSON();
        Shiny.setInputValue(elId + '_graph_state', graphJSON);
      }
    }

    function syncSvgToShiny() {
      var svgElement = el.querySelector('svg');
      if (!svgElement) return;

      var serializer = new XMLSerializer();
      var svgString = serializer.serializeToString(svgElement);

      if (!svgString.startsWith('<?xml')) {
        svgString = '<?xml version="1.0" encoding="utf-8"?>\n' + svgString;
      }

      if (window.Shiny) {
        Shiny.setInputValue(elId + '_svg', svgString);
      }
    }

    // Attach graph listener ONCE in factory so it never stacks on re-renders
    graph.on('add remove change change:position', function() {
      syncSvgToShiny();
      syncGraphToShiny();
    });

    return {

      renderValue: function(x) {
        // Update elId in case Shiny assigned it dynamically after factory creation
        elId = el.id;

        // Re-initialize paper if it hasn't been created OR if its SVG was wiped
        if (!paper || !el.querySelector('svg')) {
          if (paper) {
            paper.remove();
          }

          var config = x.paper || {};
          Object.keys(config).forEach(function(key) {
            if (config[key] === null) delete config[key];
          });

          config.el = el;
          config.model = graph;
          config.cellNamespace = joint.shapes;
          if (!config.width) config.width = width || '100%';
          if (!config.height) config.height = height || 400;

          if (config.defaultLink) {
            config.defaultLink = new joint.shapes.standard.Link(config.defaultLink);
          }

          paper = new joint.dia.Paper(config);

          var linkToolsView = new joint.dia.ToolsView({
            tools: [
              new joint.linkTools.Vertices(),
              new joint.linkTools.Segments(),
              new joint.linkTools.SourceArrowhead(),
              new joint.linkTools.TargetArrowhead(),
              new joint.linkTools.Boundary(),
              new joint.linkTools.Remove()
            ]
          });

          paper.on('link:mouseenter', function(linkView) {
            linkView.addTools(linkToolsView);
          });

          paper.on('link:mouseleave', function(linkView) {
            linkView.removeTools();
          });

          paper.on('cell:pointerclick', function(cellView) {
            var model = cellView.model;
            var eventData = { 
              id: model.id, 
              type: model.get('type'),
              timestamp: new Date().getTime() 
            };
            if (window.Shiny) {
              Shiny.setInputValue(elId + '_cell_click', eventData, {priority: 'event'});
            }
          });
        }

        graph.clear();
        if (x.graph) {
          graph.fromJSON(x.graph);
        }

        syncSvgToShiny();
        syncGraphToShiny();
      },

      resize: function(width, height) {
        if (paper) { paper.setDimensions(width, height); }
      }
    };
  }
});
