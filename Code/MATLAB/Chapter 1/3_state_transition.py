import graphviz as gv

g = gv.Digraph('G', filename = 'characters.gv', engine = 'dot')

# --- Nodes
lang = 'english'
if lang == 'english':
    g.node('1', label = 'Cheap', fontcolor = 'red', color = 'red', shape = 'circle', style = 'filled', fillcolor = 'white')
    g.node('2', label = 'Good', fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'white')
    g.node('3', label = 'Fast', fontcolor = 'brown', color = 'brown', shape = 'circle', style = 'filled', fillcolor = 'white')
elif lang == 'spanish':
    g.node('1', label='Buena', fontcolor='red', color='red', shape='circle', style='filled', fillcolor='white')
    g.node('2', label='Barata', fontcolor='blue', color='blue', shape='circle', style='filled', fillcolor='white')
    g.node('3', label='Gastada', fontcolor='brown', color='brown', shape='circle', style='filled', fillcolor='white')

# --- Interactions
g.edge('1', '1', label = '0.80', arrowhead = 'vee')
g.edge('1', '2', label = '0.05', arrowhead = 'vee')
g.edge('1', '3', label = '0.15', arrowhead = "vee")

g.edge('2', '1', label = '0.05', arrowhead = "vee")
g.edge('2', '2', label = '0.75', arrowhead = "vee")
g.edge('2', '3', label = '0.20', arrowhead = "vee")

g.edge('3', '1', label = '0.05', arrowhead = "vee")
g.edge('3', '2', label = '0.10', arrowhead = "vee")
g.edge('3', '3', label = '0.85', arrowhead = "vee")

g.view()