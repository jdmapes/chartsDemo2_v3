//
//  SecondViewController.swift
//  chartsDemo2
//
//  Created by Jordan Maples on 4/14/22.
//

import Charts
import UIKit

class SecondViewController: UIViewController, ChartViewDelegate {
    
    lazy var lineChart: LineChartView = {
        let chartView = LineChartView()
        
        chartView.backgroundColor = .systemFill
        
        return chartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lineChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lineChart.frame = CGRect(x: 0, y: 0,
                                width: self.view.frame.size.width,
                               height: self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        
        
        var entries = [ChartDataEntry]()
        
        for x in 0..<10 {
            entries.append(ChartDataEntry(x: Double(x),
                                             y: Double(x))
                           )
        }
        
        let set = LineChartDataSet(entries: entries, label: "Day")
        set.colors = ChartColorTemplates.material()

        let data = LineChartData(dataSet: set)
        lineChart.data = data

    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }

    


}
