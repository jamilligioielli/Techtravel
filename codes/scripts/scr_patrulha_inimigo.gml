///scr_patrulha_inimigo(old_dir, x, y);
var dir = argument[0];
var xx = argument[1] div 48;
var yy = argument[2] div 48;
var target = 0;

var right = 0; var up = 1;
var left = 2; var down = 3;

switch (dir) {
    case 0: // Going right
        if (mp_grid_get_cell(enemy_grid, xx, yy + 1) == 0) { target += 1; }
        if (mp_grid_get_cell(enemy_grid, xx + 1, yy) == 0) { target += 3; }
        if (mp_grid_get_cell(enemy_grid, xx, yy - 1) == 0) { target += 5; }
        
        switch (target) {
            case 0: dir = left; break;
            case 1: dir = down; break;
            case 3: dir = right; break;
            case 4: dir = choose(right,down); break;
            case 5: dir = up; break;
            case 6: dir = choose(down, up); break;
            case 8: dir = choose(right, up); break;
            case 9: dir = choose(right, up, down); break;
        }
            
    break;
    case 1:     // Going up
        if (mp_grid_get_cell(enemy_grid, xx - 1, yy) == 0) { target += 1; }
        if (mp_grid_get_cell(enemy_grid, xx, yy + 1) == 0) { target += 3; }
        if (mp_grid_get_cell(enemy_grid, xx + 1, yy) == 0) { target += 5; }
        
        switch (target) {
            case 0: dir = down; break;
            case 1: dir = left; break;
            case 3: dir = up; break;
            case 4: dir = choose(left,up); break;
            case 5: dir = right; break;
            case 6: dir = choose(left, right); break;
            case 8: dir = choose(right, up); break;
            case 9: dir = choose(right, up, left); break;
        }
    break;
    case 2:     // Going left
        if (mp_grid_get_cell(enemy_grid, xx, yy - 1) == 0) { target += 1; }
        if (mp_grid_get_cell(enemy_grid, xx - 1, yy) == 0) { target += 3; }
        if (mp_grid_get_cell(enemy_grid, xx, yy + 1) == 0) { target += 5; }
        
        switch (target) {
            case 0: dir = right; break;
            case 1: dir = up; break;
            case 3: dir = left; break;
            case 4: dir = choose(up,left); break;
            case 5: dir = down; break;
            case 6: dir = choose(up, down); break;
            case 8: dir = choose(left, down); break;
            case 9: dir = choose(up, left, down); break;
        }
    break;
    case 3:     // Going down
        if (mp_grid_get_cell(enemy_grid, xx + 1, yy) == 0) { target += 1; }
        if (mp_grid_get_cell(enemy_grid, xx, yy - 1) == 0) { target += 3; }
        if (mp_grid_get_cell(enemy_grid, xx - 1, yy) == 0) { target += 5; }
        
        switch (target) {
            case 0: dir = up; break;
            case 1: dir = right; break;
            case 3: dir = down; break;
            case 4: dir = choose(right,down); break;
            case 5: dir = left; break;
            case 6: dir = choose(right, left); break;
            case 8: dir = choose(left, down); break;
            case 9: dir = choose(right, left, down); break;
        }
    break;
}

return dir;
