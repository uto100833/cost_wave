class CostListData {
  CostListData({
    this.titleTxt = '',
    this.note = '',
    this.startColor = '',
    this.endColor = '',
    this.amount = 0,
  });

  String titleTxt;
  String note;
  String startColor;
  String endColor;
  int amount;

  static List<CostListData> costListData = <CostListData>[
    CostListData(
      titleTxt: 'sales',
      note: 'note',
      startColor: '#FA7D82',
      endColor: '#FFB295',
      amount: 10000,
    ),
    CostListData(
      titleTxt: 'material',
      note: 'note',
      startColor: '#738AE6',
      endColor: '#5C5EDD',
      amount: 100000,
    ),
    CostListData(
      titleTxt: 'labor',
      note: 'note',
      startColor: '#FE95B6',
      endColor: '#FF5287',
      amount: 1000000,
    ),
    CostListData(
      titleTxt: 'Outsourcing',
      note: 'note',
      startColor: '#6F72CA',
      endColor: '#1E1466',
      amount: 50000,
    ),
  ];

}
