class CostsListData {
  CostsListData({
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.amount = 0,
  });

  String titleTxt;
  String startColor;
  String endColor;
  int amount;

  static List<CostsListData> costsListData = <CostsListData>[
    CostsListData(
      titleTxt: 'sales',
      startColor: '#FA7D82',
      endColor: '#FFB295',
      amount: 10000,
    ),
    CostsListData(
      titleTxt: 'material',
      startColor: '#738AE6',
      endColor: '#5C5EDD',
      amount: 100000,
    ),
    CostsListData(
      titleTxt: 'labor',
      startColor: '#FE95B6',
      endColor: '#FF5287',
      amount: 1000000,
    ),
    CostsListData(
      titleTxt: 'Outsourcing',
      startColor: '#6F72CA',
      endColor: '#1E1466',
      amount: 50000,
    ),
  ];
}
