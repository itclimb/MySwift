//
//  DemoBaseViewController.swift
//  MySwift
//
//  Created by itclimb on 07/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

import UIKit
import Charts

class DemoBaseViewController: UIViewController {
    
    var parties: Array<Any>?
    
    var options: Array<[String: Any]>?
    
    var optionButton: UIButton!
    
    var optionTableView: UITableView?
    
    let shouldHideData: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parties = [
            "Party A", "Party B", "Party C", "Party D", "Party E", "Party F",
            "Party G", "Party H", "Party I", "Party J", "Party K", "Party L",
            "Party M", "Party N", "Party O", "Party P", "Party Q", "Party R",
            "Party S", "Party T", "Party U", "Party V", "Party W", "Party X",
            "Party Y", "Party Z"
        ]
        
        optionButton = UIButton.init(type: .custom)
        view.addSubview(optionButton)
        optionButton.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
        }
        optionButton.setTitle("Options", for: .normal)
        optionButton.setTitleColor(.white, for: .normal)
        optionButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func optionTapped(key: String) {
        
    }
    
    //MARK: - Common option actions
    
    func handleOptionWit(key: String, chartView: ChartViewBase) {
        if key == "toggleValues" {
            for set in (chartView.data?.dataSets)! {
                set.drawValuesEnabled = !set.isDrawValuesEnabled
            }
            chartView.setNeedsDisplay()
        }
        
        if key == "toggleIcons" {
            for _ in (chartView.data?.dataSets)! {
                
            }
            chartView.setNeedsDisplay()
        }
        
        if key == "toggleHighlight" {
            chartView.data?.highlightEnabled = !(chartView.data?.isHighlightEnabled)!
            chartView.setNeedsDisplay()
        }
        
        if key == "animateX" {
            chartView .animate(xAxisDuration: 3.0)
        }
        
        if key == "animateY" {
            chartView.animate(yAxisDuration: 3.0)
        }
        
        if key == "animateXY" {
            chartView.animate(xAxisDuration: 3.0, yAxisDuration: 3.0)
        }
        
        if key == "saveToGallery" {
            UIImageWriteToSavedPhotosAlbum(chartView.getChartImage(transparent: false)!, nil, nil, nil)
        }
        
        if key == "togglePinchZoom" {
            let barLineChart: BarLineChartViewBase = chartView as! BarLineChartViewBase
            barLineChart.pinchZoomEnabled = !barLineChart.isPinchZoomEnabled
            chartView.setNeedsDisplay()
        }
        
        if key == "toggleAutoScaleMinMax" {
            let barLineChart: BarLineChartViewBase = chartView as! BarLineChartViewBase
            barLineChart.autoScaleMinMaxEnabled = !barLineChart.isAutoScaleMinMaxEnabled
            chartView.setNeedsDisplay()
        }
        
        if key == "toggleData" {
            
            
        }
        
        if key == "toggleBarBorders" {
            chartView.setNeedsDisplay()
        }
        
    }
    
    //MARK: - Actions
    
    func optionButtonTapped(_ sender: UIButton) {
        
        if (optionTableView != nil) {
            optionTableView?.removeFromSuperview()
            optionTableView = nil
            return
        }
        
        optionTableView = UITableView.init()
        optionTableView?.backgroundColor = UIColor.init(white: 0.0, alpha: 0.9)
        optionTableView?.delegate = self
        optionTableView?.dataSource = self
        optionTableView?.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints: NSMutableArray = NSMutableArray.init()
        constraints.add(NSLayoutConstraint.init(item: optionTableView ?? "", attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 40.0))
        
        constraints.add(NSLayoutConstraint.init(item: optionTableView ?? "", attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: sender, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: 0))
        
        constraints.add(NSLayoutConstraint.init(item: optionTableView ?? "" , attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: sender, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 5.0))
        
        view.addSubview(optionTableView!)
        view.addConstraints(constraints as! [NSLayoutConstraint])
        optionTableView?.addConstraints([
            NSLayoutConstraint.init(item: optionTableView ?? "", attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 220)
            ])
    }
    
    //MARK: - Stubs for chart view
    
    func updateChartData() {
        // loading...
    }
    
    func setupRadarChartView(chartView: RadarChartView) {
        chartView.chartDescription?.enabled = false
    }
    
    
}

extension DemoBaseViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == optionTableView {
            return 1
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == optionTableView {
            let num = options?.count ?? 0
            return num
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        if tableView == optionTableView {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "Cell")
        }
        cell?.backgroundView = nil
        cell?.backgroundColor = UIColor.clear
        cell?.textLabel?.textColor = UIColor.white
        cell?.textLabel?.text = self.options?[indexPath.row]["label"] as? String
        return cell!
        //        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (optionTableView != nil) {
            optionTableView?.removeFromSuperview()
            self.optionTableView = nil
        }
        
        self.optionTapped(key: options![indexPath.row]["key"] as! String)
    }
    
}
