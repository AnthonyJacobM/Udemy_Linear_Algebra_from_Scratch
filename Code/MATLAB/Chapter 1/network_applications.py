import graphviz as gv

g = gv.Graph('G', filename = 'netework_idea.gv', engine = 'dot')
g = gv.Graph('G', filename = 'netework_idea.gv', engine = 'circo', graph_attr = {'splines':'ortho', 'arrowhead': 'none'})


# --- Nodes
g.node('1', label = 'Alice', fontcolor = 'red', color = 'red', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('2', label = 'Brandon', fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('3', label = 'Candice', fontcolor = 'red', color = 'red', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('4', label = 'Dimitri', fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('5', label = 'Elijah', fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'white')

# --- Interactions
g.edge('1', '2')
g.edge('2', '3')
g.edge('3', '4')
g.edge('4', '2')
g.edge('4', '5')
g.edge('5', '1')

g.view()