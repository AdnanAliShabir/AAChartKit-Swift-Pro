//
//  AABoostFractalChartComposer.swift
//  AAChartKit-ProDemo
//
//  Created by AnAn on 2025/4/9.
//  Copyright © 2025 An An. All rights reserved.
//

import Foundation

class AABoostFractalChartComposer {

    /**
     Highcharts.chart('container', {
         chart: {
             type: 'scatter',
             zoomType: 'xy',
             boost: {
                 useGPUTranslations: true,
                 usePreallocated: true,
                 seriesThreshold: 1
             },
             backgroundColor: 'transparent', // 透明背景
             renderTo: 'container'
         },
         title: {
             text: 'Colorful Sierpinski Carpet', // 更新标题
             style: {
                 color: '#e0f0ff',
                 fontSize: '24px',
                 textShadow: '0 0 5px #ffffff'
              }
         },
         // 设置坐标轴范围以匹配画布大小
         xAxis: { min: 0, max: 800, visible: false, startOnTick: false, endOnTick: false },
         yAxis: { min: 0, max: 800, visible: false, startOnTick: false, endOnTick: false },
         legend: { enabled: false },
         plotOptions: {
             scatter: {
                 marker: {
                     radius: 1, // 根据 maxDepth 和点密度调整
                     symbol: 'square' // 方形标记更符合地毯主题
                 },
                 tooltip: { enabled: false },
                 boostThreshold: 1,
                 states: {
                     hover: { enabled: false },
                     inactive: { enabled: false }
                 }
             }
         },
         series: [{
             name: 'Carpet',
             data: generateSierpinskiData(),
             // animation: false // 可选：禁用动画
         }],
         credits: { enabled: false }
     });

     */
        // 配置 AAChartKit 图表选项
        let chart = AAChart()
            .type(.scatter)
//            .zoomType(.xy)
            .backgroundColor(AAColor.black)
//                .useGPUTranslations(true)
//                .usePreallocated(true)
//                .seriesThreshold(1))
        
        let boost = AABoost()
            .useGPUTranslations(true)
            .usePreallocated(true)
            .seriesThreshold(1)
        
        let title = AATitle()
            .style(AAStyle()
                .color("#e0f0ff")
//                .fontSize("24px")
                .textOutline("0 0 5px #ffffff"))
        
        let xAxis = AAXAxis()
            .min(0)
            .visible(false)
            .startOnTick(false)
            .endOnTick(false)
        
        let yAxis = AAYAxis()
            .min(0)
            .visible(false)
            .startOnTick(false)
            .endOnTick(false)
        
        let seriesElement = AASeriesElement()
            .name("Fractal") // 通用名称
            // .data(...) // 数据将在具体函数中设置
            .marker(AAMarker()
                .radius(1)
                .symbol(AAChartSymbolType.square.rawValue)
            )
        
        let options = AAOptions()
            .chart(chart)
            .boost(boost)
            .title(title)
            .xAxis(xAxis)
            .yAxis(yAxis)
            .series([seriesElement])
            .credits(AACredits().enabled(false))
        
        return options
    }
    
    //分形曼德尔布罗特图
    class func fractalMandelbrot() -> AAOptions {
        let aaOptions = boostFractalChart(titleText: "Mandelbrot Set") // 更新标题
        let seriesElement = aaOptions.series?.first as! AASeriesElement
        seriesElement.data = AAFractalChartData.generateMandelbrotData()
        seriesElement.marker?.symbol(AAChartSymbolType.square.rawValue) // Mandelbrot 用方形
//        if let scatter = aaOptions.plotOptions?.scatter {
//            scatter.marker?.symbol(AAChartSymbolType.square.rawValue)
//        }
        return aaOptions
    }
    
    //分形谢尔宾斯基树图
    class func fractalSierpinskiTreeData() -> AAOptions {
        let aaOptions = boostFractalChart(titleText: "Fractal Canopy Tree") // 更新标题
        let seriesElement = aaOptions.series?.first as! AASeriesElement
        seriesElement.data = AAFractalChartData.generateSierpinskiTreeData()
        aaOptions.boost = nil // 树的点可能不多，禁用 boost
        // 树形结构可能需要调整坐标轴范围
        aaOptions.xAxis?.max(800)
        aaOptions.yAxis?.max(800)
        return aaOptions
    }
    
    //分形谢尔宾斯基三角形图
    class func fractalSierpinskiTriangleData() -> AAOptions {
        let aaOptions = boostFractalChart(titleText: "Sierpinski Triangle") // 更新标题
        let seriesElement = aaOptions.series?.first as! AASeriesElement
        seriesElement.data = AAFractalChartData.generateSierpinskiTriangleData()
        seriesElement.marker?.symbol(AAChartSymbolType.triangle.rawValue) // 三角形用三角形标记
//        if let scatter = aaOptions.plotOptions?.scatter {
//            scatter.marker?.symbol(AAChartSymbolType.triangle.rawValue)
//        }
        return aaOptions
    }
    
    //分形谢尔宾斯基地毯图
    class func fractalSierpinskiCarpetData() -> AAOptions {
        let aaOptions = boostFractalChart(titleText: "Sierpinski Carpet") // 更新标题
        let seriesElement = aaOptions.series?.first as! AASeriesElement
        seriesElement.data = AAFractalChartData.generateSierpinskiCarpetData()
        seriesElement.marker?.symbol(AAChartSymbolType.square.rawValue) // 地毯用方形标记
//        if let scatter = aaOptions.plotOptions?.scatter {
//            scatter.marker?.symbol(AAChartSymbolType.square.rawValue)
//        }
        return aaOptions
    }
    
    //分形茱莉亚集合图
    class func fractalJuliaSetData() -> AAOptions {
        let aaOptions = boostFractalChart(titleText: "Julia Set") // 更新标题
        let seriesElement = aaOptions.series?.first as! AASeriesElement
        seriesElement.data = AAFractalJuliaSetData.generateJuliaSetData()
        seriesElement.marker?.symbol(AAChartSymbolType.square.rawValue) // Julia Set 也常用方形
//         if let scatter = aaOptions.plotOptions?.scatter {
//            scatter.marker?.symbol(AAChartSymbolType.square.rawValue)
//        }
       return aaOptions
    }

    // 新增：巴恩斯利蕨
    class func fractalBarnsleyFern() -> AAOptions {
        let aaOptions = boostFractalChart(titleText: "Barnsley Fern")
        let seriesElement = aaOptions.series?.first as! AASeriesElement
        seriesElement.data = AAFractalChartData.generateBarnsleyFernData()
        // 蕨类植物使用小圆点可能效果更好
        seriesElement.marker?.radius(0.5)
//        if let scatter = aaOptions.plotOptions?.scatter {
//            scatter.marker?.radius(0.5)
//        }
        // 可能需要调整坐标轴范围以更好地显示蕨类
        aaOptions.xAxis?.min(-300).max(300) // 示例范围，需要根据生成数据调整
        aaOptions.yAxis?.min(0).max(600)   // 示例范围
        aaOptions.chart?.zoomType(.xy) // 蕨类细节多，允许缩放
        return aaOptions
    }

    // 新增：科赫雪花 (点表示)
    class func fractalKochSnowflake() -> AAOptions {
        let aaOptions = boostFractalChart(titleText: "Koch Snowflake (Points)")
        let seriesElement = aaOptions.series?.first as! AASeriesElement
        seriesElement.data = AAFractalChartData.generateKochSnowflakeData()
        // 雪花可以用小圆点
        seriesElement.marker?.radius(0.8)
//         if let scatter = aaOptions.plotOptions?.scatter {
//            scatter.marker?.radius(0.8)
//        }
       // 可能需要调整坐标轴范围
        aaOptions.xAxis?.min(0).max(800)
        aaOptions.yAxis?.min(100).max(900) // 雪花通常在中间偏上
        aaOptions.chart?.zoomType(.xy) // 允许缩放
        return aaOptions
    }
}
