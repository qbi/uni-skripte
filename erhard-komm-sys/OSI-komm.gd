Storage 
{
	{ Format 1.33 }
	{ GeneratedFrom TGD-version-2.20 }
	{ WrittenBy joerg }
	{ WrittenOn "" }
}

Document 
{
	{ Type "Generic Diagram" }
	{ Name OSI-komm.gd }
	{ Author joerg }
	{ CreatedOn "" }
	{ Annotation "" }
	{ Hierarchy False }
}

Page 
{
	{ PageOrientation Portrait }
	{ PageSize A4 }
	{ ShowHeaders False }
	{ ShowFooters False }
	{ ShowNumbers False }
}

Scale 
{
	{ ScaleValue 1 }
}

# GRAPH NODES

GenericNode 1
{
	{ Name "Dienstbenutzer\r(n+1)-te schicht" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 2
{
	{ Name "Diensterbringer\rn-te schicht" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 3
{
	{ Name "SAP" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 4
{
	{ Name "ICI" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 5
{
	{ Name "SDU" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 6
{
	{ Name "SAP" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

# GRAPH EDGES

GenericEdge 7
{
	{ Name "" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 3 }
	{ Subject2 1 }
}

# VIEWS AND GRAPHICAL SHAPES

View 8
{
	{ Index "0" }
	{ Parent 0 }
}

Box 9
{
	{ View 8 }
	{ Subject 1 }
	{ Position 240 120 }
	{ Size 148 40 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FillStyle Unfilled }
	{ FillColor "white" }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Box 10
{
	{ View 8 }
	{ Subject 2 }
	{ Position 240 260 }
	{ Size 148 40 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FillStyle Unfilled }
	{ FillColor "white" }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Ellipse 11
{
	{ View 8 }
	{ Subject 3 }
	{ Position 240 220 }
	{ Size 80 40 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FillStyle Unfilled }
	{ FillColor "white" }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 12
{
	{ View 8 }
	{ Subject 7 }
	{ FromShape 11 }
	{ ToShape 9 }
	{ Curved False }
	{ End1 FilledArrow }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 240 200 }
	{ Point 240 140 }
	{ NamePosition 226 170 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Box 13
{
	{ View 8 }
	{ Subject 4 }
	{ Position 440 150 }
	{ Size 58 40 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FillStyle Unfilled }
	{ FillColor "white" }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Box 14
{
	{ View 8 }
	{ Subject 5 }
	{ Position 510 150 }
	{ Size 80 40 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FillStyle Unfilled }
	{ FillColor "white" }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Ellipse 15
{
	{ View 8 }
	{ Subject 6 }
	{ Position 480 230 }
	{ Size 80 40 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FillStyle Unfilled }
	{ FillColor "white" }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

