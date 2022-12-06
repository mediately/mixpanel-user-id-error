//
//  AnalyticsEngine.swift
//  MixpanelDemo
//
//  Created by Marko Engelman on 06/12/2022.
//

import Foundation
import Mixpanel

struct API {
    static let primaryMixpanelToken = "b2b12cd93014f15c9720a4510f69958e"
    static let secondaryMixpanelToken = "d0d6b72fd1261f4c4e26e9ad15ceb481"
}

let AMMixpanelInstanceName = "com.modrajagoda.mixpanel"
let AMCountryMixpanelInstanceName = "com.modrajagoda.countryMixpanel"
let DemoEvent = "DemoEvent"

final class AnalyticsEngine {
    var primaryMixpanel: MixpanelInstance? {
        get {
            return Mixpanel.getInstance(name: AMMixpanelInstanceName)
        }
    }
    
    var secondaryMixpanel: MixpanelInstance? {
        get {
            return Mixpanel.getInstance(name: AMCountryMixpanelInstanceName)
        }
    }
    
    var primaryMixpanelID: String {
        return primaryMixpanel?.distinctId ?? "N/A"
    }
    
    var secondaryMixpanelID: String {
        return secondaryMixpanel?.distinctId ?? "N/A"
    }
    
    func instantiate() {
        Mixpanel.initialize(
            token: API.primaryMixpanelToken,
            trackAutomaticEvents: true,
            instanceName: AMMixpanelInstanceName,
            optOutTrackingByDefault: false
        )
        
        guard let primaryMixpanel = primaryMixpanel else { return }
        primaryMixpanel.serverURL = "https://api-eu.mixpanel.com"
        primaryMixpanel.identify(distinctId: primaryMixpanel.distinctId)
        
        Mixpanel.initialize(
            token: API.secondaryMixpanelToken,
            trackAutomaticEvents: true,
            instanceName: AMCountryMixpanelInstanceName,
            optOutTrackingByDefault: false
        )
        
        guard let secondaryMixpanel = secondaryMixpanel else { return }
        secondaryMixpanel.serverURL = "https://api-eu.mixpanel.com"
        secondaryMixpanel.identify(distinctId: primaryMixpanel.distinctId)
    }
    
    func sendEvent() {
        primaryMixpanel?.track(event: DemoEvent)
        secondaryMixpanel?.track(event: DemoEvent)
    }
}
