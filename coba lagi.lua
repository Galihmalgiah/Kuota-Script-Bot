def calculate_sum(dice_faces, n):
    """Menghitung total setiap angka."""
    total_dict = {}
    for i in range(1, n+1):
        total_dict[i] = sum(dice_faces[i])
    return total_dict

def dice_strategy(dice_faces):
    """Menentukan keputusan terbaik dalam permainan dice."""
    total_dict = calculate_sum(dice_faces, 6)
    sorted_dict = sorted(total_dict.items(), key=lambda x: (x[1], x[0], -sum(dice_faces[x[0]]))))
    best_move = sorted_dict[0][0]
    return best_move

# Contoh penggunaan
dice_faces = [
    [1, 2, 3],
    [2, 3, 4],
    [3, 4, 5],
    [4, 5, 6],
    [5, 6, 1],
    [6, 1, 2],
]
best_move = dice_strategy(dice_faces)
print("Keputusan terbaik adalah angka:", best_move)