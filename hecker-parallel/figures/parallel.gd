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
	{ Name parallel.gd }
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
	{ Name "" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 2
{
	{ Name "" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 3
{
	{ Name "target" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 4
{
	{ Name "" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 5
{
	{ Name "" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 6
{
	{ Name "" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 7
{
	{ Name "" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

GenericNode 8
{
	{ Name "source" }
	{ Annotation "" }
	{ Parent 0 }
	{ Index "" }
}

# GRAPH EDGES

GenericEdge 9
{
	{ Name "5" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 1 }
	{ Subject2 2 }
}

GenericEdge 10
{
	{ Name "4" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 2 }
	{ Subject2 3 }
}

GenericEdge 11
{
	{ Name "1" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 4 }
	{ Subject2 3 }
}

GenericEdge 12
{
	{ Name "1" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 2 }
	{ Subject2 4 }
}

GenericEdge 13
{
	{ Name "1" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 5 }
	{ Subject2 3 }
}

GenericEdge 14
{
	{ Name "2" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 5 }
	{ Subject2 4 }
}

GenericEdge 15
{
	{ Name "3" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 6 }
	{ Subject2 5 }
}

GenericEdge 16
{
	{ Name "2" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 7 }
	{ Subject2 2 }
}

GenericEdge 17
{
	{ Name "2" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 7 }
	{ Subject2 1 }
}

GenericEdge 18
{
	{ Name "1" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 4 }
	{ Subject2 7 }
}

GenericEdge 19
{
	{ Name "1" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 7 }
	{ Subject2 6 }
}

GenericEdge 20
{
	{ Name "3" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 8 }
	{ Subject2 6 }
}

GenericEdge 21
{
	{ Name "1" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 8 }
	{ Subject2 7 }
}

GenericEdge 22
{
	{ Name "2" }
	{ Annotation "" }
	{ Parent 0 }
	{ Subject1 8 }
	{ Subject2 1 }
}

# VIEWS AND GRAPHICAL SHAPES

View 23
{
	{ Index "0" }
	{ Parent 0 }
}

Circle 24
{
	{ View 23 }
	{ Subject 1 }
	{ Position 230 130 }
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

Circle 25
{
	{ View 23 }
	{ Subject 2 }
	{ Position 360 120 }
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
	{ View 23 }
	{ Subject 9 }
	{ FromShape 24 }
	{ ToShape 25 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 260 128 }
	{ Point 330 122 }
	{ NamePosition 294 116 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Circle 27
{
	{ View 23 }
	{ Subject 3 }
	{ Position 480 210 }
	{ Size 61 61 }
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

Line 28
{
	{ View 23 }
	{ Subject 10 }
	{ FromShape 25 }
	{ ToShape 27 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 384 138 }
	{ Point 456 192 }
	{ NamePosition 428 157 }
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
	{ View 23 }
	{ Subject 4 }
	{ Position 350 230 }
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

Line 30
{
	{ View 23 }
	{ Subject 11 }
	{ FromShape 29 }
	{ ToShape 27 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 380 225 }
	{ Point 450 215 }
	{ NamePosition 414 211 }
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
	{ View 23 }
	{ Subject 12 }
	{ FromShape 25 }
	{ ToShape 29 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 357 150 }
	{ Point 353 200 }
	{ NamePosition 342 175 }
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
	{ View 23 }
	{ Subject 5 }
	{ Position 350 330 }
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

Line 33
{
	{ View 23 }
	{ Subject 13 }
	{ FromShape 32 }
	{ ToShape 27 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 372 310 }
	{ Point 458 231 }
	{ NamePosition 406 263 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 34
{
	{ View 23 }
	{ Subject 14 }
	{ FromShape 32 }
	{ ToShape 29 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 350 300 }
	{ Point 350 260 }
	{ NamePosition 336 280 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Circle 35
{
	{ View 23 }
	{ Subject 6 }
	{ Position 220 340 }
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

Line 36
{
	{ View 23 }
	{ Subject 15 }
	{ FromShape 35 }
	{ ToShape 32 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 250 338 }
	{ Point 320 332 }
	{ NamePosition 284 326 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Circle 37
{
	{ View 23 }
	{ Subject 7 }
	{ Position 230 240 }
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

Line 38
{
	{ View 23 }
	{ Subject 16 }
	{ FromShape 37 }
	{ ToShape 25 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 252 220 }
	{ Point 338 140 }
	{ NamePosition 286 173 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 39
{
	{ View 23 }
	{ Subject 17 }
	{ FromShape 37 }
	{ ToShape 24 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 230 210 }
	{ Point 230 160 }
	{ NamePosition 216 185 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 40
{
	{ View 23 }
	{ Subject 18 }
	{ FromShape 29 }
	{ ToShape 37 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 320 232 }
	{ Point 260 238 }
	{ NamePosition 289 226 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 41
{
	{ View 23 }
	{ Subject 19 }
	{ FromShape 37 }
	{ ToShape 35 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 227 270 }
	{ Point 223 310 }
	{ NamePosition 212 290 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Circle 42
{
	{ View 23 }
	{ Subject 8 }
	{ Position 100 240 }
	{ Size 61 61 }
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

Line 43
{
	{ View 23 }
	{ Subject 20 }
	{ FromShape 42 }
	{ ToShape 35 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 123 260 }
	{ Point 197 321 }
	{ NamePosition 168 283 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 44
{
	{ View 23 }
	{ Subject 21 }
	{ FromShape 42 }
	{ ToShape 37 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 131 240 }
	{ Point 200 240 }
	{ NamePosition 165 230 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

Line 45
{
	{ View 23 }
	{ Subject 22 }
	{ FromShape 42 }
	{ ToShape 24 }
	{ Curved False }
	{ End1 Empty }
	{ End2 FilledArrow }
	{ Points 2 }
	{ Point 123 220 }
	{ Point 207 149 }
	{ NamePosition 156 177 }
	{ Color "black" }
	{ LineWidth 1 }
	{ LineStyle Solid }
	{ FixedName False }
	{ Font "-*-courier-medium-r-normal--10*" }
	{ TextAlignment Center }
	{ TextColor "black" }
	{ NameUnderlined False }
}

