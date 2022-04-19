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
        
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 14)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .black
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 14)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.axisLineColor = .systemFill
        
        chartView.animate(xAxisDuration: 2.5)
        
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
        
        
        
        let entries: [ChartDataEntry] = [
            ChartDataEntry(x: 0.0, y: 10.0),
            ChartDataEntry(x: 1.0, y: 5.0),
            ChartDataEntry(x: 2.0, y: 7.0),
            ChartDataEntry(x: 3.0, y: 5.0),
            ChartDataEntry(x: 4.0, y: 10.0),
            ChartDataEntry(x: 5.0, y: 6.0),
            ChartDataEntry(x: 6.0, y: 5.0),
            ChartDataEntry(x: 7.0, y: 7.0),
            ChartDataEntry(x: 8.0, y: 8.0),
            ChartDataEntry(x: 9.0, y: 12.0),
            ChartDataEntry(x: 10.0, y: 13.0),
            ChartDataEntry(x: 11.0, y: 5.0),
            ChartDataEntry(x: 12.0, y: 7.0),
            ChartDataEntry(x: 13.0, y: 3.0),
            
            ]
        
//        for x in 0..<10 {
//            entries.append(ChartDataEntry(x: Double(x),
//                                             y: Double(x))
//                           )
//        }
        
        

        let set = LineChartDataSet(entries: entries, label: "Day")
//        set.colors = ChartColorTemplates.material()
        set.drawCirclesEnabled = false
        set.lineWidth = 3
        set.fillColor = .white
        set.fillAlpha = 0.8
        set.drawFilledEnabled = true
        
        set.drawHorizontalHighlightIndicatorEnabled = false
        set.highlightColor = .systemCyan
        
        let data = LineChartData(dataSet: set)
        //data.setDrawValues(false)
        lineChart.data = data
        

    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }

    


}
