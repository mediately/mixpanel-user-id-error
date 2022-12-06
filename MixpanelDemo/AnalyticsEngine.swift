//
//  AnalyticsEngine.swift
//  MixpanelDemo
//
//  Created by Marko Engelman on 06/12/2022.
//

import Foundation
import Mixpanel

struct API {
    static let mixpanelToken = "b2b12cd93014f15c9720a4510f69958e"
    static let mixpanelCountryToken = "d0d6b72fd1261f4c4e26e9ad15ceb481"
}

let AMMixpanelInstanceName = "com.modrajagoda.mixpanel"
let AMCountryMixpanelInstanceName = "com.modrajagoda.countryMixpanel"
let DemoEvent = "DemoEvent"

final class AnalyticsEngine {
    var mixpanel: MixpanelInstance? {
        get {
            return Mixpanel.getInstance(name: AMMixpanelInstanceName)
        }
    }
    
    var countryMixpanel: MixpanelInstance? {
        get {
            return Mixpanel.getInstance(name: AMCountryMixpanelInstanceName)
        }
    }
    
    func instantiate() {
        Mixpanel.initialize(
            token: API.mixpanelToken,
            instanceName: AMMixpanelInstanceName,
            optOutTrackingByDefault: false
        )
        
        guard let mixpanel = mixpanel else { return }
        mixpanel.serverURL = "https://api-eu.mixpanel.com"
        mixpanel.identify(distinctId: mixpanel.distinctId)
        
        Mixpanel.initialize(
            token: API.mixpanelCountryToken,
            instanceName: AMCountryMixpanelInstanceName,
            optOutTrackingByDefault: false
        )
        
        guard let countryMixpanel = countryMixpanel else { return }
        countryMixpanel.serverURL = "https://api-eu.mixpanel.com"
        countryMixpanel.identify(distinctId: mixpanel.distinctId)
    }
    
    func sendEvent() {
        mixpanel?.track(event: DemoEvent)
        countryMixpanel?.track(event: DemoEvent)
    }
}
