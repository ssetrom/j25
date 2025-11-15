//Creates Quad with two triangles. Used to make the shadows. 
//Z coordinate is used as a flag to determine if the vertex will be repositioned in the shader
function Quad(_vb,_x1,_y1,_x2,_y2){
	//Upper triangle
	vertex_position_3d(_vb,_x1,_y1,0);
	vertex_position_3d(_vb,_x1,_y1,1); //repositioned vertex
	vertex_position_3d(_vb,_x2,_y2,0);
	
	//Lower Triangle
	vertex_position_3d(_vb,_x1,_y1,1); //repositioned vertex
	vertex_position_3d(_vb,_x2,_y2,0);
	vertex_position_3d(_vb,_x2,_y2,1); //repositioned vertex
}

function RectShadowQuads(_vb, _x, _y, _w, _h){
    var x1 = _x;
    var y1 = _y;
    var x2 = _x + _w;
    var y2 = _y + _h;

    // Topp
    Quad(_vb, x1, y1, x2, y1);
    // Høyre
    Quad(_vb, x2, y1, x2, y2);
    // Bunn
    Quad(_vb, x2, y2, x1, y2);
    // Venstre
    Quad(_vb, x1, y2, x1, y1);
}

//Construct the vertex buffer with every wall
//Instead of using the four edges as the walls, we use the diagonals instead (Optimization)
vertex_begin(vb,vf);
var _vb = vb;

with(obj_wall){
    var w = sprite_width  * image_xscale;
    var h = sprite_height * image_yscale;

    RectShadowQuads(_vb, x, y, w, h);
}

vertex_end(vb);

