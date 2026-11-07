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

    var graph = new joint.dia.Graph();
    var paper = null;

    return {

      renderValue: function(x) {
        
        // Wipe out old elements inside the container target
        el.innerHTML = '';

        // Initialize JointJS Paper using 3.7.7 syntax
        paper = new joint.dia.Paper({
          el: el,
          model: graph,
          width: el.clientWidth || width || 800,
          height: el.clientHeight || height || 500,
          gridSize: x.paper.gridSize || 10,
          drawGrid: x.paper.drawGrid || false,
          background: { color: x.paper.color || '#F8F9FA' },
          interactive: x.paper.interactive || true,
          snapLinks: { radius: 20 },
          allowLink: x.paper.allowLink || true,
    
          // This function decides if a link can connect to a target element
          validateConnection: function(cellViewS, magnetS, cellViewT, magnetT, end, linkView) {
            // Prevent linking an element to itself
            if (cellViewS === cellViewT) return false;
            // Ensure a connection is only made if dragging onto a valid target element
            return cellViewT && cellViewT.model.isElement();
          },

          // This tells JointJS what kind of link object to create when the user drags a new connection
          defaultLink: new joint.dia.Link({
            attrs: {
              '.connection': { stroke: '#2c3e50', 'stroke-width': 2 },
              '.marker-target': { fill: '#2c3e50', d: 'M 10 0 L 0 5 L 10 10 z' } // Adds an arrowhead
            }
          })
        });

        // Optional Grid styling overrides for JointJS v3.x
        if (x.drawGrid) {
          paper.setGridSize(x.gridSize || 20);
          paper.drawGrid({
            name: 'dot',
            args: { color: '#A0A0A0', thickness: 1 }
          });
        }

        graph.clear();
        if (x.graph) {
          graph.fromJSON(x.graph);
        }
        
        var elId = el.id;

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
        
        graph.on('add remove change change:position', function() {
          // Locate the native SVG element rendered by JointJS inside wrapper div
          var svgElement = el.querySelector('svg');
          if (!svgElement) return;

          // Serialize the live DOM element into an XML text string
          var serializer = new XMLSerializer();
          var svgString = serializer.serializeToString(svgElement);

          // Wrap it in standard XML headers so it's a valid standalone SVG file
          if (!svgString.startsWith('<?xml')) {
            svgString = '<?xml version="1.0" encoding="utf-8"?>\n' + svgString;
          }

          // Stream the raw string back to Shiny app
          if (window.Shiny) {
            Shiny.setInputValue(elId + '_svg', svgString);
          }
        });
        
        graph.on('add remove change', function() {
          var graphJSON = graph.toJSON();
          if (window.Shiny) {
            Shiny.setInputValue(elId + '_graph_state', graphJSON);
          }
        });

      },

      resize: function(width, height) {
        if (paper) { paper.setDimensions(width, height); }
      }
    };
  }
});
