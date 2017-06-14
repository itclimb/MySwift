//
//  JJChartsView.swift
//
//
//  Created by itclimb on 29/03/2017.
//
//

import UIKit
import Charts

public enum JJChartsType: Int {
    case pieCharts   //饼图
    case barCharts   //条形图
    case lineCharts  //折现图
}

class JJChartsView: UIView {
    
    let pieView = PieChartView()
    let barChartView = BarChartView()
    let lineView = LineChartView()
    
    
    var chartsType: JJChartsType?{
        didSet{
            createUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        
        switch chartsType! {
        case .pieCharts:
            //饼图
            addSubview(pieView)
            pieView.snp.makeConstraints { (make) in
                make.edges.equalTo(self)
            }
            pieView.backgroundColor = UIColor.white
            testConfigPie()
            
            //        pieView.legend.enabled = true
            //        pieView.usePercentValuesEnabled = true
            //        pieView.drawSlicesUnderHoleEnabled = false
            //        pieView.chartDescription?.enabled = false
            //        pieView.drawCenterTextEnabled = true
            //        pieView.drawEntryLabelsEnabled = false
            //
            //        pieView.drawHoleEnabled = true
            //        pieView.rotationAngle = 0.0
            //        pieView.rotationEnabled = true
            //        pieView.highlightPerTapEnabled = true
            //
            //        let legend = pieView.legend
            //        legend.horizontalAlignment = .left
            //        legend.verticalAlignment = .bottom
            //        legend.orientation = .horizontal
            //        legend.drawInside = false
            //        legend.xEntrySpace = 7.0
            //        legend.yEntrySpace = 0.0
            //        legend.yOffset = 4
            break
            
        case .barCharts:
            //条形图
            addSubview(barChartView)
            barChartView.snp.makeConstraints { (make) in
                make.edges.equalTo(self)
            }
            barChartView.backgroundColor = UIColor.white
            barChartView.chartDescription?.enabled = false
            barChartView.drawGridBackgroundEnabled = false
            barChartView.setScaleEnabled(false)
            barChartView.pinchZoomEnabled = false
            barChartView.dragEnabled = true
            
            let xAxis = barChartView.xAxis
            xAxis.labelPosition = .bottom
            xAxis.drawGridLinesEnabled = false
            
            barChartView.leftAxis.drawGridLinesEnabled = false
            
            barChartView.rightAxis.enabled = false
            
            let leftAxis = barChartView.leftAxis
            leftAxis.labelFont = UIFont.systemFont(ofSize: 8);
            leftAxis.labelTextColor = UIColor.darkGray
            
            barChartView.extraBottomOffset = 5.0
            barChartView.leftAxis.drawGridLinesEnabled = false
            barChartView.xAxis.drawGridLinesEnabled = false
            barChartView.xAxis.labelCount = 5
            barChartView.xAxis.granularity = 1.0
            testConfigBar()
            break
        case .lineCharts:
            addSubview(lineView)
            lineView.snp.makeConstraints({ (make) in
                make.edges.equalTo(self)
            })
            lineView.backgroundColor = UIColor.lightGray
            
//            let marker: BalloonMarker = <#value#>
            
//            BalloonMarker *marker = [[BalloonMarker alloc]
//                initWithColor: [UIColor colorWithWhite:180/255. alpha:1.0]
//                font: [UIFont systemFontOfSize:12.0]
//                textColor: UIColor.whiteColor
//                insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0)];
//            marker.chartView = _chartView;
//            marker.minimumSize = CGSizeMake(80.f, 40.f);
//            _chartView.marker = marker;
//            
//            _chartView.legend.form = ChartLegendFormLine;
//            
//            _sliderX.value = 45.0;
//            _sliderY.value = 100.0;
//            [self slidersValueChanged:nil];
//            
//            [_chartView animateWithXAxisDuration:2.5];
            lineView.animate(xAxisDuration: 2.5)
            break
        }
        
    }
    
    func showPie(showPie:Bool) {
        pieView.isHidden = !showPie
        barChartView.isHidden = showPie
    }
    
    func pieShowHole(show : Bool) {
        pieView.holeRadiusPercent = show ? 0.45 : 0
        pieView.transparentCircleRadiusPercent = show ? 0.5 : 0
    }
    
    
}


extension JJChartsView{
    func testConfigPie()  {
        var entries : [PieChartDataEntry] = Array()
        var parties : [String] = ["A","B","C","D","E","F"]
        var values : [Double] = [0.05, 0.08, 0.17, 0.25, 0.3, 0.15]
        for i in 0...5 {
            entries.append(PieChartDataEntry.init(value: values[i], label: parties[i]))
        }
        
        let dataSet = PieChartDataSet.init(values: entries, label: "Election Results")
        dataSet.sliceSpace = 1.0
        dataSet.valueLinePart1OffsetPercentage = 0.8;
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.4
        dataSet.yValuePosition = .outsideSlice
        
        
        var colors : [NSUIColor] = Array()
        colors = colors + ChartColorTemplates.vordiplom()
        colors = colors + ChartColorTemplates.joyful()
        colors = colors + ChartColorTemplates.colorful()
        colors = colors + ChartColorTemplates.liberty()
        colors = colors + ChartColorTemplates.pastel()
        colors.append(NSUIColor.init(colorLiteralRed: 51/255.0, green: 181/255.0, blue: 229/255.0, alpha: 1))
        dataSet.colors = JJCompanyModel.getCompanyColors()
        
        let data = PieChartData.init(dataSets: [dataSet])
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        data.setValueFont(NSUIFont.init(name: "HelveticaNeue-Light", size: 11))
        data.setValueTextColor(NSUIColor.black)
        
        pieView.data = data
        pieView.highlightValues(nil)
    }
    
    func testConfigBar() {
        
        var yVals : [BarChartDataEntry] = Array()
        let values : [Double] = [20102, 100000, 230043, 120329, 305000.2 , 123455]
        for i in 0...values.count-1 {
            yVals.append(BarChartDataEntry.init(x: Double(i), y : values[i]))
        }
        
        var set1 : BarChartDataSet
        if barChartView.data != nil , (barChartView.data?.dataSetCount)! > 0 {
            set1 = barChartView.data!.dataSets[0] as! BarChartDataSet;
            set1.values = yVals
            set1.label = "xxx"
            barChartView.data?.notifyDataChanged()
            barChartView.notifyDataSetChanged()
        }
        else
        {
            set1 = BarChartDataSet.init(values: yVals, label: "DataSet")
            var colors : [NSUIColor] = Array()
            colors = colors + ChartColorTemplates.vordiplom()
            colors = colors + ChartColorTemplates.joyful()
            colors = colors + ChartColorTemplates.colorful()
            colors = colors + ChartColorTemplates.liberty()
            colors = colors + ChartColorTemplates.pastel()
            colors.append(NSUIColor.init(colorLiteralRed: 51/255.0, green: 181/255.0, blue: 229/255.0, alpha: 1))
            set1.colors = JJCompanyModel.getCompanyColors()
            set1.drawValuesEnabled = true
            var dataSets : [BarChartDataSet] = Array()
            dataSets.append(set1)
            
            let data = BarChartData.init(dataSets: dataSets)
            data.setValueFont(NSUIFont.init(name: "HelveticaNeue-Light", size: 11))
            data.setValueTextColor(NSUIColor.black)
            
            barChartView.data = data
            barChartView.fitBars = true
        }
        
        barChartView.setNeedsDisplay()
    }
    
}
