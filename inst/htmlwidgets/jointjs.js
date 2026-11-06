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
          gridSize: x.gridSize || 10,
          // In v3.x, passing drawGrid as true inside options triggers the base grid
          drawGrid: x.drawGrid || false,
          background: { color: x.backgroundColor || '#F8F9FA' },
          interactive: true 
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

        // --- GLOBAL EVENT LISTENER ---
        if (window._jointjsClickListener) {
          document.removeEventListener('click', window._jointjsClickListener);
        }

        window._jointjsClickListener = function(event) {
          if (event.target.id === 'btn-add-rect') {
            event.preventDefault();
            var rect = new joint.shapes.standard.Rectangle();
            var randomX = Math.floor(Math.random() * 200) + 50;
            var randomY = Math.floor(Math.random() * 200) + 50;
            
            rect.position(randomX, randomY);
            rect.resize(120, 50);
            rect.attr({
              body: { fill: '#007BFF', rx: 5, ry: 5, stroke: '#0056B3', strokeWidth: 2 },
              label: { text: 'New Node', fill: 'white', fontSize: 13, fontFamily: 'sans-serif' }
            });
            graph.addCell(rect);
          }

          if (event.target.id === 'btn-clear') {
            event.preventDefault();
            graph.clear();
          }
        };

        document.addEventListener('click', window._jointjsClickListener);
      },

      resize: function(width, height) {
        if (paper) { paper.setDimensions(width, height); }
      }
    };
  }
});
