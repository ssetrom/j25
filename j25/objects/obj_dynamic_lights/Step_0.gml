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

//Construct the vertex buffer with every wall
//Instead of using the four edges as the walls, we use the diagonals instead (Optimization)
vertex_begin(vb,vf);
var _vb = vb;

var cam = view_camera[0];
var cx  = camera_get_view_x(cam);
var cy  = camera_get_view_y(cam);

with(obj_wall){
    var x1 = bbox_left - cx;
    var y1 = bbox_top - cy;
    var x2 = bbox_right - cx;
    var y2 = bbox_bottom - cy;

    // topp
    Quad(_vb, x1, y1, x2, y1);
    // høyre
    Quad(_vb, x2, y1, x2, y2);
    // bunn
    Quad(_vb, x2, y2, x1, y2);
    // venstre
    Quad(_vb, x1, y2, x1, y1);
}

vertex_end(vb);
