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
	{ Name dfs.gd }
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
	{ Name "a" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 2
{
	{ Name "b" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 3
{
	{ Name "d" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 4
{
	{ Name "c" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 5
{
	{ Name "e" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 6
{
	{ Name "g" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 7
{
	{ Name "f" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

# GRAPH EDGES

GenericEdge 8
{
	{ Name "1" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 1 }
	{ Subject2 2 }
}

GenericEdge 9
{
	{ Name "1" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 2 }
	{ Subject2 3 }
}

GenericEdge 10
{
	{ Name "1" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 4 }
	{ Subject2 2 }
}

GenericEdge 11
{
	{ Name "3" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 4 }
	{ Subject2 3 }
}

GenericEdge 12
{
	{ Name "2" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 4 }
	{ Subject2 1 }
}

GenericEdge 13
{
	{ Name "1" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 5 }
	{ Subject2 4 }
}

GenericEdge 14
{
	{ Name "2" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 1 }
	{ Subject2 5 }
}

GenericEdge 15
{
	{ Name "3" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 7 }
	{ Subject2 6 }
}

GenericEdge 16
{
	{ Name "2" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 7 }
	{ Subject2 4 }
}

GenericEdge 17
{
	{ Name "2" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 5 }
	{ Subject2 7 }
}

GenericEdge 18
{
	{ Name "1" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 7 }
	{ Subject2 5 }
}

# VIEWS AND GRAPHICAL SHAPES

View 19
{
	{ Index "0" }
	{ Parent 0 }
}

Circle 20
{
	{ View 19 }
	{ Subject 1 }
	{ Position 200 140 }
	{ Size 60 60 }
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

Circle 21
{
	{ View 19 }
	{ Subject 2 }
	{ Position 340 140 }
	{ Size 60 60 }
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

Line 22
{
	{ View 19 }
	{ Subject 8 }
	{ FromShape 20 }
	{ ToShape 21 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 230 140 }
	{ Point 310 140 }
	{ NamePosition 270 130 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Circle 23
{
	{ View 19 }
	{ Subject 3 }
	{ Position 350 230 }
	{ Size 60 60 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Dashed }
	{ FillStyle Unfilled }
	{ FillColor "white" }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 24
{
	{ View 19 }
	{ Subject 9 }
	{ FromShape 21 }
	{ ToShape 23 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 343 170 }
	{ Point 347 200 }
	{ NamePosition 358 184 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Circle 25
{
	{ View 19 }
	{ Subject 4 }
	{ Position 250 250 }
	{ Size 60 60 }
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

Line 26
{
	{ View 19 }
	{ Subject 10 }
	{ FromShape 25 }
	{ ToShape 21 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 269 227 }
	{ Point 321 163 }
	{ NamePosition 285 189 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 27
{
	{ View 19 }
	{ Subject 11 }
	{ FromShape 25 }
	{ ToShape 23 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 279 244 }
	{ Point 321 236 }
	{ NamePosition 298 231 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 28
{
	{ View 19 }
	{ Subject 12 }
	{ FromShape 25 }
	{ ToShape 20 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 238 223 }
	{ Point 212 167 }
	{ NamePosition 237 191 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Circle 29
{
	{ View 19 }
	{ Subject 5 }
	{ Position 170 250 }
	{ Size 60 60 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Dashed }
	{ FillStyle Unfilled }
	{ FillColor "white" }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 30
{
	{ View 19 }
	{ Subject 13 }
	{ FromShape 29 }
	{ ToShape 25 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 200 250 }
	{ Point 220 250 }
	{ NamePosition 210 240 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 31
{
	{ View 19 }
	{ Subject 14 }
	{ FromShape 20 }
	{ ToShape 29 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 192 169 }
	{ Point 178 221 }
	{ NamePosition 172 193 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Circle 32
{
	{ View 19 }
	{ Subject 6 }
	{ Position 260 350 }
	{ Size 60 60 }
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

Circle 33
{
	{ View 19 }
	{ Subject 7 }
	{ Position 160 360 }
	{ Size 60 60 }
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

Line 34
{
	{ View 19 }
	{ Subject 15 }
	{ FromShape 33 }
	{ ToShape 32 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 190 357 }
	{ Point 230 353 }
	{ NamePosition 209 346 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 35
{
	{ View 19 }
	{ Subject 16 }
	{ FromShape 33 }
	{ ToShape 25 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 179 337 }
	{ Point 231 273 }
	{ NamePosition 195 299 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 36
{
	{ View 19 }
	{ Subject 17 }
	{ FromShape 29 }
	{ ToShape 33 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 4 }
	{ Point 147 269 }
	{ Point 120 290 }
	{ Point 110 330 }
	{ Point 134 345 }
	{ NamePosition 102 308 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 37
{
	{ View 19 }
	{ Subject 18 }
	{ FromShape 33 }
	{ ToShape 29 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 163 330 }
	{ Point 167 280 }
	{ NamePosition 152 305 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

