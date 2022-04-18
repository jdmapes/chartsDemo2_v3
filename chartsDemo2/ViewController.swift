//
//  ViewController.swift
//  chartsDemo2
//
//  Created by Jordan Maples on 4/14/22.
//

import Charts // Import dependancy
import UIKit

class ViewController: UIViewController, ChartViewDelegate {
    
//    var barChart = BarChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        barChart.delegate = self
        createChart()
    }
    
    private func createChart() {
        // Create bar chart
        let barChart = BarChartView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width,
                                                  height: view.frame.size.width))
        
        
        // Configure the X axis
        let xAxis = barChart.xAxis
        xAxis.axisLineColor = .white
        xAxis.axisLineWidth = 2
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .boldSystemFont(ofSize: 14)
        xAxis.labelTextColor = .white
        xAxis.gridColor = .white
        
        // Configure the Y Axis
        let yAxis = barChart.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 14)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .white
        yAxis.gridColor = .white
        yAxis.axisMinimum = 0
      
        // Configure legend
        let l = barChart.legend
        l.horizontalAlignment = .center
        l.verticalAlignment = .bottom
        l.orientation = .vertical
        l.drawInside = false
        l.form = .line
        l.formSize = 9
        l.font = UIFont(name: "HelveticaNeue-Light", size: 12)!
        l.xEntrySpace = 6
        
        // Supply data
        var entries = [BarChartDataEntry]()
        var entries2 = [BarChartDataEntry]()
        
        // **FIXME** The method in which to pull data; here are two dataSets atm
        // Format [(date:String, time:(hours:Int, minutes: Int, seconds:Int ))]
        for x in 0..<10 {
            entries.append(BarChartDataEntry(x: Double(x), y: Double.random(in: 0...30)))
            entries2.append(BarChartDataEntry(x: Double(x), y: Double.random(in: 0...30)))
        }
        
        
        // Data set build
        let set = BarChartDataSet(entries: entries, label: "Day")
        let set2 = BarChartDataSet(entries: entries2, label: "Session")
        set.colors = ChartColorTemplates.material()  // **FIXME**
        set2.colors = ChartColorTemplates.liberty()  // **FIXME**
        let data = BarChartData(dataSets: [set, set2])
        barChart.data = data
        
        view.addSubview(barChart)
        barChart.rightAxis.enabled = false
        barChart.center = view.center
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        barChart.frame = CGRect(x: 0, y: 0,
//                                width: self.view.frame.size.width,
//                               height: self.view.frame.size.width)
//        barChart.center = view.center
//        view.addSubview(barChart)
//
//        var entries = [BarChartDataEntry]()
//
//        for x in 0..<10 {
//            entries.append(BarChartDataEntry(x: Double(x),
//                                             y: Double(x))
//                           )
//        }
//
//        let set = BarChartDataSet(entries: entries)
//        set.colors = ChartColorTemplates.joyful()
//
//        let data = BarChartData(dataSet: set)
//        barChart.data = data
//
//    }


}

