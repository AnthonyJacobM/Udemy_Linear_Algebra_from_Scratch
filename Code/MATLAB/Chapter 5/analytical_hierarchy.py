import graphviz as gv
# reference:
# https://medium.com/@ahsenparwez/building-a-family-tree-with-python-and-graphviz-e4afb8367316

g = gv.Graph('G', filename = 'choosing_the_best_candidate_analytically.gv', engine = 'dot', graph_attr = {'splines':'ortho'})
g = gv.Digraph('G', filename = 'choosing_the_best_candidate_analytically.gv', engine = 'dot', graph_attr = {'splines':'ortho'})

# --- Nodes

# -- Goal
g.node('G1', label = 'Pick a Candidate \n 100%', fontcolor = 'green', color = 'green', shape = 'rectangle', style = 'filled', fillcolor = 'black')

# -- Criteria
r_val = '40%'
t_val = '40%'
p_val = '20%'
g.node('Cr1', label = f"Research \n {r_val}", fontcolor = 'black', color = 'black', shape = 'square', style = 'filled', fillcolor = 'white')
g.node('Cr2', label = f"Teaching \n {t_val}", fontcolor = 'black', color = 'black', shape = 'square', style = 'filled', fillcolor = 'white')
g.node('Cr3', label = f"Professional \n Activities \n {p_val}", fontcolor = 'black', color = 'black', shape = 'square', style = 'filled', fillcolor = 'white')

# -- Subcriteria
s1_val = "40%"
s2_val = "60%"
g.node('S1', label = f"Research \n Quantity \n {s1_val}", fontcolor = 'black', color = 'black', shape = 'oval', style = 'filled', fillcolor = 'white')
g.node('S2', label = f"Research \n Quality \n {s2_val}", fontcolor = 'black', color = 'black', shape = 'oval', style = 'filled', fillcolor = 'white')


# -- Candidates
Cr1_S1_C1_val = "35%"
Cr1_S1_C2_val = "20%"
Cr1_S1_C3_val = "25%"
Cr1_S1_C4_val = "20%"
g.node('Cr1_S1_C1', label = f"Dr. G \n {Cr1_S1_C1_val}", shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('Cr1_S1_C2', label = f"Dr. I \n {Cr1_S1_C2_val}", shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('Cr1_S1_C3', label = f"Dr. O \n {Cr1_S1_C3_val}", shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('Cr1_S1_C4', label = f"Dr. T \n {Cr1_S1_C4_val}", shape = 'circle', style = 'filled', fillcolor = 'white')

Cr1_S2_C1_val = "33%"
Cr1_S2_C2_val = "17%"
Cr1_S2_C3_val = "17%"
Cr1_S2_C4_val = "28%"
g.node('Cr1_S2_C1', label = f"Dr. G \n {Cr1_S2_C1_val}", fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('Cr1_S2_C2', label = f"Dr. I \n {Cr1_S2_C2_val}", fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('Cr1_S2_C3', label = f"Dr. O \n {Cr1_S2_C3_val}", fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('Cr1_S2_C4', label = f"Dr. T \n {Cr1_S2_C4_val}", fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'white')

#g.node('Cr1_S2_C1', label = f"Dr. G \n ___%", fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'white')
#g.node('Cr1_S2_C2', label = f"Dr. I \n ___%", fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'white')
#g.node('Cr1_S2_C3', label = f"Dr. O \n ___%", fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'white')
#g.node('Cr1_S2_C4', label = f"D. T \n ___%", fontcolor = 'blue', color = 'blue', shape = 'circle', style = 'filled', fillcolor = 'white')


Cr2_C1_val = "21%"
Cr2_C2_val = "29%"
Cr2_C3_val = "33%"
Cr2_C4_val = "17%"
g.node('Cr2_C1', label = f"Dr. G \n {Cr2_C1_val}", fontcolor = 'black', color = 'black', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('Cr2_C2', label = f"Dr. I \n {Cr2_C2_val}", fontcolor = 'black', color = 'black', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('Cr2_C3', label = f"Dr. O \n {Cr2_C3_val}", fontcolor = 'black', color = 'black', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('Cr2_C4', label = f"Dr. T \n {Cr2_C4_val}", fontcolor = 'black', color = 'black', shape = 'circle', style = 'filled', fillcolor = 'white')

Cr3_C1_val = "23%"
Cr3_C2_val = "28%"
Cr3_C3_val = "28%"
Cr3_C4_val = "21%"
g.node('Cr3_C1', label = f"Dr. G \n {Cr3_C1_val}", fontcolor = 'black', color = 'black', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('Cr3_C2', label = f"Dr. I \n {Cr3_C2_val}", fontcolor = 'black', color = 'black', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('Cr3_C3', label = f"Dr. O \n {Cr3_C3_val}", fontcolor = 'black', color = 'black', shape = 'circle', style = 'filled', fillcolor = 'white')
g.node('Cr3_C4', label = f"Dr. T \n {Cr3_C4_val}", fontcolor = 'black', color = 'black', shape = 'circle', style = 'filled', fillcolor = 'white')


# --- Interactions
g.edge('G1', 'Cr1')
g.edge('G1', 'Cr2')
g.edge('G1', 'Cr3')

g.edge('Cr1', 'S1')
g.edge('Cr1', 'S2')
candidates = ['C1', 'C2', 'C3', 'C4']
categories = ['Cr2', 'Cr3']
for candidate in candidates:
    for cat in categories:
        g.edge(f"{cat}", f"{cat}_{candidate}")

for candidate in candidates:
    g.edge(f"S1", f"Cr1_S1_{candidate}")
    g.edge(f"S2", f"Cr1_S2_{candidate}")


g.view()