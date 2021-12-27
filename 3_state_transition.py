import graphviz as gv

g = gv.Graph('G', filename = 'characters.gv', engine = 'dot')

# --- Nodes
g.node('1', label = 'Cheap', fontcolor = 'red', color = 'red', shape = 'circle', style = 'filled', fillcolor = 'black')
g.node('2', label = 'Good', fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'black')
g.node('3', label = 'Fast', fontcolor = 'green', color = 'green', shape = 'circle', style = 'filled', fillcolor = 'black')
# --- Interactions
g.edge('1', '1', label = '0.80', arrowhead = 'normal', dir = 'for', color = 'red')
g.edge('1', '2', label = '0.05', arrowhead = 'normal', color = 'red')
g.edge('1', '3', label = '0.15', arrowhead = "curve", color = 'red')

g.edge('2', '1', label = '0.05', color = 'blue')
g.edge('2', '2', label = '0.75', color = 'blue')
g.edge('2', '3', label = '0.20', color = 'blue')

g.edge('3', '1', label = '0.05', color = 'green')
g.edge('3', '2', label = '0.10', color = 'green')
g.edge('3', '3', label = '0.85', color = 'green')

g.view()