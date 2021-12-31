import graphviz as gv

g = gv.Graph('G', filename = 'netework_idea.gv', engine = 'dot')

# --- Nodes
g.node('1', label = 'Alice', fontcolor = 'pink', color = 'pink', shape = 'circle', style = 'filled', fillcolor = 'black')
g.node('2', label = 'Brandon', fontcolor = 'cyan', color = 'cyan', shape = 'circle', style = 'filled', fillcolor = 'black')
g.node('3', label = 'Candice', fontcolor = 'pink', color = 'pink', shape = 'circle', style = 'filled', fillcolor = 'black')
g.node('4', label = 'Dimitri', fontcolor = 'cyan', color = 'cyan', shape = 'circle', style = 'filled', fillcolor = 'black')
g.node('5', label = 'Elijah', fontcolor = 'cyan', color = 'cyan', shape = 'circle', style = 'filled', fillcolor = 'black')

# --- Interactions
g.edge('1', '2')
g.edge('2', '3')
g.edge('3', '4')
g.edge('4', '2')
g.edge('4', '5')
g.edge('5', '1')

g.view()