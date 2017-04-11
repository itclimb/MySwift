//
//  RadarChartViewController.swift
//  MySwift
//
//  Created by itclimb on 07/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

import UIKit
import Charts

class RadarChartViewController: DemoBaseViewController {

    @IBOutlet weak var chartView: RadarChartView!
    
    var originalBarBgColor: UIColor?
    var originalBarTintColor: UIColor?
    var originalBarStyle: UIBarStyle?

    var activities: Array<Any> = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.15) { 
            let navigationBar = self.navigationController?.navigationBar
            self.originalBarBgColor = self.navigationController?.navigationBar.barTintColor
            self.originalBarTintColor = self.navigationController?.navigationBar.tintColor
            self.originalBarStyle = self.navigationController?.navigationBar.barStyle
            
            navigationBar?.barTintColor = self.view.backgroundColor
            navigationBar?.tintColor = UIColor.white
            navigationBar?.barStyle = UIBarStyle.black
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIView.animate(withDuration: 0.15) { 
            let navigationBar: UINavigationBar = (self.navigationController?.navigationBar)!
            navigationBar.barTintColor = self.originalBarBgColor
            navigationBar.barTintColor = self.originalBarTintColor
            navigationBar.barStyle = self.originalBarStyle!
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Radar Bar Chart"
        
        activities = ["Burger","Steak","Salad","Pasta","Pizza"]
        
        self.options = [
            ["key": "toggleValues", "label": "Toggle Values"],
            ["key": "toggleHighlight", "label": "Toggle Highlight"],
            ["key": "toggleHighlightCircle", "label": "Toggle highlight circle"],
            ["key": "toggleXLabels", "label": "Toggle X-Values"],
            ["key": "toggleYLabels", "label": "Toggle Y-Values"],
            ["key": "toggleRotate", "label": "Toggle Rotate"],
            ["key": "toggleFill", "label": "Toggle Fill"],
            ["key": "animateX", "label": "Animate X"],
            ["key": "animateY", "label": "Animate Y"],
            ["key": "animateXY", "label": "Animate XY"],
            ["key": "spin", "label": "Spin"],
            ["key": "saveToGallery", "label": "Save to Camera Roll"],
            ["key": "toggleData", "label": "Toggle Data"]
        ]
        
        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false;
        chartView.webLineWidth = 1.0;
        chartView.innerWebLineWidth = 1.0;
        chartView.webColor = UIColor.lightGray;
        chartView.innerWebColor = UIColor.lightGray;
        chartView.webAlpha = 1.0;

        let xAxis = chartView.xAxis
        xAxis.labelFont = UIFont.systemFont(ofSize: 10.0)
        xAxis.xOffset = 0.0
        xAxis.yOffset = 0.0
        xAxis.valueFormatter = self
        xAxis.labelTextColor = UIColor.white
        
        let yAxis = chartView.yAxis
        yAxis.labelFont = UIFont.systemFont(ofSize: 9.0)
        yAxis.labelCount = 5
        yAxis.axisMinimum = 0.0
        yAxis.axisMaximum = 80.0
        yAxis.drawLabelsEnabled = false

        let l = chartView.legend
//        l.horizontalAlignment = HorizontalAlignment.center
//        l.verticalAlignment = VerticalAlignment.top
//        l.orientation = ChartLegendOrientationHorizontal
        l.drawInside = false
        l.font = UIFont.systemFont(ofSize: 10.0)
        l.xEntrySpace = 7.0
        l.yEntrySpace = 5.0
        l.textColor = UIColor.white
        
        updateChartData()
    
        chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4)
    }
    
    override func updateChartData() {
        
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        
        setChartData()
    }
    
    func setChartData() {
        
        let mult: UInt32 = 80;
        let min: UInt32 = 20;
        let cnt: Int = activities.count;
        
        let entries1: NSMutableArray = NSMutableArray.init()
        let entries2: NSMutableArray = NSMutableArray.init()
        
        for _ in 0..<cnt {
            entries1.add(RadarChartDataEntry.init(value: Double(arc4random_uniform(mult) + min)))
            entries2.add(RadarChartDataEntry.init(value: Double(arc4random_uniform(mult) + min)))
        }
        
        let set1: RadarChartDataSet = RadarChartDataSet.init(values: entries1 as? [ChartDataEntry], label: "Last Week")
        set1.setColor(NSUIColor.init(red: 103/255.0, green: 110/255.0, blue: 129/255.0, alpha: 1.0))
        set1.fillColor = UIColor.init(red: 103/255.0, green: 110/255.0, blue: 129/255.0, alpha: 1.0)
        set1.drawFilledEnabled = true;
        set1.fillAlpha = 0.7;
        set1.lineWidth = 2.0;
        set1.drawHighlightCircleEnabled = true;
        set1.setDrawHighlightIndicators(true)
        
        let set2: RadarChartDataSet = RadarChartDataSet.init(values: entries2 as? [ChartDataEntry], label: "This Week")
        set2.setColor(NSUIColor.init(red: 121/255.0, green: 162/255.0, blue: 175/255.0, alpha: 1.0))
        set2.fillColor = UIColor.init(red: 121/255.0, green: 162/255.0, blue: 175/255.0, alpha: 1.0)
        set2.drawFilledEnabled = true;
        set2.fillAlpha = 0.7;
        set2.lineWidth = 2.0;
        set2.drawHighlightCircleEnabled = true;
        set2.setDrawHighlightIndicators(false)
        
        let data: RadarChartData = RadarChartData.init(dataSets: [set1,set2])
        data.setValueFont(NSUIFont.init(name: "HelveticaNeue-Light", size: 8.0))
        data.setDrawValues(false)
        data.setValueTextColor(UIColor.white)
        
        chartView.data = data;
    }
    
    override func optionTapped(key: String) {
        if (key == "toggleXLabels")
        {
            chartView.xAxis.drawLabelsEnabled = !chartView.xAxis.isDrawLabelsEnabled;
            chartView.data?.notifyDataChanged()
            chartView.notifyDataSetChanged()
            chartView.setNeedsLayout()
            return;
        }
        
        if (key == "toggleYLabels")
        {
            chartView.yAxis.drawLabelsEnabled = !chartView.yAxis.isDrawLabelsEnabled;
            chartView.setNeedsLayout()
            return;
        }
        
        if (key == "toggleRotate")
        {
            chartView.rotationEnabled = !chartView.isRotationEnabled;
            return;
        }
        
        if (key == "toggleFill")
        {
            for set in (chartView.data?.dataSets)!
            {
                set.drawValuesEnabled = !set.isDrawValuesEnabled;
            }
            
            chartView.setNeedsLayout()
            return;
        }
        
        if (key == "toggleHighlightCircle")
        {
            for set in (chartView.data?.dataSets)!
            {
                set.drawValuesEnabled = !set.isDrawValuesEnabled;
            }
            
            chartView.setNeedsLayout()
            return;
        }
        
        if (key == "animateX")
        {
            chartView.animate(xAxisDuration: 1.4)
            return;
        }
        
        if (key == "animateY")
        {
            chartView.animate(yAxisDuration: 1.4)
            return;
        }
        
        if (key == "animateXY")
        {
            chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4)
            return;
        }
        
        if (key == "spin")
        {
            chartView.spin(duration: 2.0, fromAngle: chartView.rotationAngle, toAngle: chartView.rotationAngle + 360.0)
            return;
        }
        super.handleOptionWit(key: key, chartView: chartView)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension RadarChartViewController: ChartViewDelegate,IAxisValueFormatter{
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("chartValueSelected")
    }
    
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        print("chartValueNothingSelected")
    }

    //MARK: - IAxisValueFormatter
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return activities[Int(value) % activities.count] as! String
    }
    
}
