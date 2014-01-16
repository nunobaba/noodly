library levenshtein;


/// Returns the Levenshtein's distance between [value] and [other].
int proximity(String value, String other) {
  
  // Degenerate cases.
  if (value == other) return 0;
  if (value.length == 0) return other.length;
  if (other.length == 0) return value.length;
  
  // Create a first vector of integer distances, which holds the numbers of 
  // characters to delete from [other].
  List<int> v0 = new List.generate(other.length + 1, (i) => i, growable: false);
  
  // Create a second vector, which holds row distances from the previous v0.
  List<int> v1 = new List(other.length + 1);

  // Find the minimum of delete chars from [value], delete char from [other],
  // and delete char from both.
  minimum(int s1, int s2, int s3) {
    var min = s1;
    if (s2 < min) min = s2;
    if (s3 < min) min = s3;
    return min;
  } 
  
  for (int i = 0; i < value.length; i++) {
    
    // First element of v1 is the distance from the opposite substring.
    v1[0] = i + 1;
    
    // Find substitution and insertion distances.
    for (int j = 0; j < other.length; j++) {
      var cost = (value[i] == other[j]) ? 0 : 1;
      v1[j + 1] = minimum(v1[j] + 1, v0[j+1] + 1, v0[j] + cost);
    }
    
    // Copy v1 (current row) to v0 (previous row) for next iteration.
    v0.setRange(0, v1.length, v1);
    // for (int j = 0; j < v0.length; j++) v0[j] = v1[j];
    
  }
  
  return v1[other.length];
}


void main() {
  print(proximity('supertramp', 'megatramp'));
}


