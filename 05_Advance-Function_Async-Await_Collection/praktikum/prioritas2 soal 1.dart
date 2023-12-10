void main() {
  List<List<String>> dataList = [
    ['Buah', 'Mangga'],
    ['Hewan', 'Kucing'],
    ['Kucing', 'Piranha'],
  ];

  Map<String, String> dataMap = Map.fromIterable(
    dataList,
    key: (item) => item[0],
    value: (item) => item[1],
  );

  // Tampilkan list dan map
  print('List:');
  printDataList(dataList);

  print('\nMap:');
  printDataMap(dataMap);
}

void printDataList(List<List<String>> dataList) {
  for (List<String> data in dataList) {
    print('[' + data.join(', ') + ']');
  }
}

void printDataMap(Map<String, String> dataMap) {
  dataMap.forEach((key, value) {
    print('$key: $value');
  });
}
