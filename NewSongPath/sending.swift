//
//  sendingpage.swift
//  newsongtime
//
//  Created by Cherish Park on 12/26/19.
//  Copyright © 2019 Newsong church. All rights reserved.
//

import UIKit
import SwiftSoup

class sending: UIViewController{
    
    
    @IBOutlet weak var sendingpageToggle: UISegmentedControl!
    @IBOutlet weak var sendingeng: UIView!
    @IBOutlet weak var sendingkor: UIView!
    
    @IBOutlet weak var textViewQT: UITextView!
    @IBOutlet weak var sendingTextField: UITextField!
    
    var builder: StringBuilder!
    var htmlContentInStringFormat = ""
    
    var sendingSchedule_kor = [
            // 1 월
            "01_01":"마태복음 1-3, 시편 1장, 잠언 1장","01_02":"마태복음 4-6장, 시편 2장, 잠언 2장","01_03":"마태복음 7-9장, 시편 3장, 잠언 3장","01_04":"마태복음 10-12장, 시편 4장, 잠언 4장",
            "01_05":"마태복음 13-15장, 시편 5장, 잠언 5장","01_06":"마태복음 16-18장, 시편 6장, 잠언 6장","01_07":"마태복음 19-21장, 시편 7장, 잠언 7장","01_08":"마태복음 22-24장, 시편 8장, 잠언 8장",
            "01_09":"마태복음 25-26장, 시편 9장, 잠언 9장","01_10":"마태복음 27-28장, 시편 10장, 잠언 10장","01_11":"마가복음 1-3장, 시편 11장, 잠언 11장","01_12":"마가복음 4-6장, 시편 12장, 잠언 12장",
            "01_13":"마가복음 7-9장, 시편 13장, 잠언 13장","01_14":"마가복음 10-12장, 시편 14장, 잠언 14장","01_15":"마가복음 13-14장, 시편 15장, 잠언 15장","01_16":"마가복음 15-16장, 시편 16장, 잠언 16장",
            "01_17":"누가복음 1-3장, 시편 17장, 잠언 17장","01_18":"누가복음 4-6장, 시편 18장, 잠언 18장","01_19":"누가복음 7-9장, 시편 19장, 잠언 19장","01_20":"누가복음 10-12장, 시편 20장, 잠언 20장",
            "01_21":"누가복음 13-15장, 시편 21장, 잠언 21장","01_22":"누가복음 16-18장, 시편 22장, 잠언 22장","01_23":"누가복음 19-21장, 시편 23장, 잠언 23장","01_24":"누가복음 22-24장, 시편 24장, 잠언 24장",
            "01_25":"요한복음 1-3장, 시편 25장, 잠언 25장","01_26":"요한복음 4-6장, 시편 26장, 잠언 26장","01_27":"요한복음 7-9장, 시편 27장, 잠언 27장","01_28":"요한복음 10-12장, 시편 28장, 잠언 28장",
            "01_29":"요한복음 13-15장, 시편 29장, 잠언 29장","01_30":"요한복음 16-18장, 시편 30장, 잠언 30장","01_31":"요한복음 19-21장, 시편 31장, 잠언 31장",

            // 2 월
            "02_01":"사도행전 1-3장, 시편 32장, 잠언 1장","02_02":"사도행전 4-6장, 시편 33장, 잠언 2장","02_03":"사도행전 7-9장, 시편 34장, 잠언 3장",
            "02_04":"사도행전 10-12장, 시편 35장, 잠언 4장","02_05":"사도행전 13-15장, 시편 36장, 잠언 5장","02_06":"사도행전 16-18장, 시편 37장, 잠언 6장",
            "02_07":"사도행전 19-21장, 시편 38장, 잠언 7장","02_08":"사도행전 22-24장, 시편 39장, 잠언 8장","02_09":"사도행전 25-26장, 시편 40장, 잠언 9장",
            "02_10":"사도행전 27-28장, 시편 41장, 잠언 10장","02_11":"로마서 1-3장, 시편 42장, 잠언 11장","02_12":"로마서 4-6장, 시편 43장, 잠언 12장",
            "02_13":"로마서 7-9장, 시편 44장, 잠언 13장","02_14":"로마서 10-12장, 시편 45장, 잠언 14장","02_15":"로마서 13-14장, 시편 46장, 잠언 15장",
            "02_16":"로마서 15-16장, 시편 47장, 잠언 16장","02_17":"고린도전서 1-3장, 시편 48장, 잠언 17장","02_18":"고린도전서 4-6장, 시편 49장, 잠언 18장",
            "02_19":"고린도전서 7-9장, 시편 50장, 잠언 19장","02_20":"고린도전서 10-12장, 시편 51장, 잠언 20장","02_21":"고린도전서 13-14장, 시편 52장, 잠언 21장",
            "02_22":"고린도전서 15-16장, 시편 53장, 잠언 22장","02_23":"고린도후서 1-3장, 시편 54장, 잠언 23장","02_24":"고린도후서 4-6장, 시편 55장, 잠언 24장",
            "02_25":"고린도후서 7-9장, 시편 56장, 잠언 25장","02_26":"고린도후서 10-11장, 시편 57장, 잠언 26장","02_27":"고린도후서 12-13장, 시편 58장, 잠언 27장",
            "02_28":"갈라디아서 1-3장, 시편 59장, 잠언 28장","02_29":"갈라디아서 4-6장, 시편 60장, 잠언 29장",

            // 3 월
            "03_01":"에베소서 1-3장, 시편 61장, 잠언 1장","03_02":"에베소서 4-6장, 시편 62장, 잠언 2장","03_03":"빌립보서 1-2장, 시편 63장, 잠언 3장","03_04":"빌립보서 3-4장, 시편 64장, 잠언 4장",
            "03_05":"골로새서 1-2장, 시편 65장, 잠언 5장","03_06":"골로새서 3-4장, 시편 66장, 잠언 6장","03_07":"데살로니가전서 1-3장, 시편 67장, 잠언 7장","03_08":"데살로니가전서 4-5장, 시편 68장, 잠언 8장",
            "03_09":"데살로니가후서 1-3장, 시편 69장, 잠언 9장","03_10":"디모데전서 1-3장, 시편 70장, 잠언 10장","03_11":"디모데전서 4-6장, 시편 71장, 잠언 11장","03_12":"디모데후서 1-2장, 시편 72장, 잠언 12장",
            "03_13":"디모데후서 3-4장, 시편 73장, 잠언 13장","03_14":"디도서, 시편 74장, 잠언 14장","03_15":"빌레몬서, 히브리서 1-2장 시편 75장, 잠언 15장","03_16":"히브리서 3-5장, 시편 76장, 잠언 16장",
            "03_17":"히브리서 6-8장, 시편 77장, 잠언 17장","03_18":"히브리서 9-11장, 시편 78장, 잠언 18장","03_19":"히브리서 12-13장, 시편 79장, 잠언 19장","03_20":"야고보서 1-3장, 시펀 80장, 잠언 20장",
            "03_21":"야고보서 4-5장, 시편 81장, 잠언 21장","03_22":"베드로전서 1-3장, 시편 82장, 잠언 22장","03_23":"베드로전서 4-5장, 시편 83장, 잠언 23장","03_24":"베드로후서 1-3장, 시편 84장, 잠언 24장",
            "03_25":"요한일서 1-3장, 시편 85장, 잠언 25장","03_26":"요한일서 4-5장, 시편 86장, 잠언 26장","03_27":"요한이서, 요한삼서, 유다서 7-9장, 시편 87장, 잠언 27장","03_28":"요한계시록 1-3장, 시편 88장, 잠언 28장",
            "03_29":"요한계시록 4-6장, 시편 89장, 잠언 29장","03_30":"요한계시록 7-9장, 시편 90장, 잠언 30장","03_31":"요한계시록 10-12장, 시편 91장, 잠언 31장",

            // 4 월
            "04_01":"요한계시록 13-15장, 시편 92장, 잠언 1장","04_02":"요한계시록 16-19장, 시편 93장, 잠언 2장","04_03":"요한계시록 20-22장, 시편 94장, 잠언 3장","04_04":"창세기 1-3장, 시편 95장, 잠언 4장",
            "04_05":"창세기 4-6장, 시편 96장, 잠언 5장","04_06":"창세기 7-9장, 시편 97장, 잠언 6장","04_07":"창세기 10-12장, 시편 98장, 잠언 7장","04_08":"창세기 13-15장, 시편 99장, 잠언 8장",
            "04_09":"창세기 16-18장, 시편 100장, 잠언 9장","04_10":"창세기 19-21장, 시편 101장, 잠언 10장","04_11":"창세기 22-24장, 시편 102장, 잠언 11장","04_12":"창세기 25-27장, 시편 103장, 잠언 12장",
            "04_13":"창세기 28-30장, 시편 104장, 잠언 13장","04_14":"창세기 31-33장, 시편 105장, 잠언 14장","04_15":"창세기 34-36장, 시편 106장, 잠언 15장","04_16":"창세기 37-39장, 시편 107장, 잠언 16장",
            "04_17":"창세기 40-42장, 시편 108장, 잠언 17장","04_18":"창세기 43-45장, 시편 109장, 잠언 18장","04_19":"창세기 46-48장, 시편 110장, 잠언 19장","04_20":"창세기 49-50장, 시편 111장, 잠언 20장",
            "04_21":"출애굽기 1-3장, 시편 112장, 잠언 21장","04_22":"출애굽기 4-6장, 시편 113장, 잠언 22장","04_23":"출애굽기 7-8장, 시편 114장, 잠언 23장","04_24":"출애굽기 9장, 시편 115장, 잠언 24장",
            "04_25":"출애굽기 10-12장, 시편 116장, 잠언 25장","04_26":"출애굽기 13-15장, 시편 117장, 잠언 26장","04_27":"출애굽기 16-18장, 시편 118장, 잠언 27장","04_28":"출애굽기 19-21장, 시편 119장, 잠언 28장",
            "04_29":"출애굽기 22-24장, 시편 120장, 잠언 30장","04_30":"출애굽기 25-27장, 시편 121장, 잠언 31장",

            // 5 월
            "05_01":"출애굽기 28-30장, 시편 122장, 잠언 1장","05_02":"출애굽기 31-33장, 시편 123장, 잠언 2장","05_03":"출애굽기 34-36장, 시편 124장, 잠언 3장","05_04":"출애굽기 37-38장, 시편 125장, 잠언 4장",
            "05_05":"출애굽기 39-40장, 시편 126장, 잠언 5장","05_06":"레위기 1-3장, 시편 127장, 잠언 6장","05_07":"레위기 4-6장, 시편 128장, 잠언 7장","05_08":"레위기 7-9장, 시편 129장, 잠언 8장",
            "05_09":"레위기 10-12장, 시편 130장, 잠언 9장","05_10":"레위기 13-15장, 시편 131장, 잠언 10장","05_11":"레위기 16-18장, 시편 132장, 잠언 11장","05_12":"레위기 19-21장, 시편 133장, 잠언 12장",
            "05_13":"레위기 22-23장, 시편 134장, 잠언 13장","05_14":"레위기 24-25장, 시편 135장, 잠언 14장","05_15":"레위기 26-27장, 시편 136장, 잠언 15장","05_16":"민수기 1-3장, 시편 137장, 잠언 16장",
            "05_17":"민수기 4-6장, 시편 138장, 잠언 17장","05_18":"민수기 7-9장, 시편 139장, 잠언 18장","05_19":"민수기 10-12장, 시편 140장, 잠언 19장","05_20":"민수기 13-15장, 시편 141장, 잠언 20장",
            "05_21":"민수기 16-18장, 시편 142장, 잠언 21장","05_22":"민수기 19-21장, 시편 143장, 잠언 22장","05_23":"민수기 22-24장, 시편 144장, 잠언 23장","05_24":"민수기 25-27장, 시편 145장, 잠언 24장",
            "05_25":"민수기 28-30장, 시편 146장, 잠언 25장","05_26":"민수기 31-32장, 시편 147장, 잠언 26장","05_27":"민수기 33-34장, 시편 148장, 잠언 27장","05_28":"민수기 35-36장, 시편 149장, 잠언 28장",
            "05_29":"신명기 1-3장, 시편 150장, 잠언 29장","05_30":"신명기 4-6장, 시편 1장, 잠언 30장","05_31":"신명기 7-9장, 시편 2장, 잠언 31장",

            // 6 월
            "06_01":"신명기 10-12장, 시편 3장, 잠언 1장","06_02":"신명기 13-15장, 시편 4장, 잠언 2장","06_03":"신명기 16-18장, 시편 5장, 잠언 3장","06_04":"신명기 19-21장, 시편 6장, 잠언 4장",
            "06_05":"신명기 22-24장, 시편 7장, 잠언 5장","06_06":"신명기 25-27장, 시편 8장, 잠언 6장","06_07":"신명기 28-30장, 시편 9장, 잠언 7장","06_08":"신명기 31-32장, 시편 10장, 잠언 8장",
            "06_09":"신명기 33-34장, 시편 11장, 잠언 9장","06_10":"여호수아 1-3장, 시편 12장, 잠언 10장","06_11":"여호수아 4-6장, 시편 13장, 잠언 11장","06_12":"여호수아 7-9장, 시편 14장, 잠언 12장",
            "06_13":"여호수아 10-12장, 시편 15장, 잠언 13장","06_14":"여호수아 13-15장, 시편 16장, 잠언 14장","06_15":"여호수아 16-18장, 시편 17장, 잠언 15장","06_16":"여호수아 19-20장, 시편 18장, 잠언 16장",
            "06_17":"여호수아 21-22장, 시편 19장, 잠언 17장","06_18":"여호수아 23-24장, 시편 20장, 잠언 18장","06_19":"사사기 1-3장, 시편 21장, 잠언 19장","06_20":"사사기 4-6장, 시편 22장, 잠언 20장",
            "06_21":"사사기 7-9장, 시편 23장, 잠언 21장","06_22":"사사기 10-12장, 시편 24장, 잠언 22장","06_23":"사사기 13-15장, 시편 25장, 잠언 23장","06_24":"사사기 16-17장, 시편 26장, 잠언 24장",
            "06_25":"사사기 18-19장, 시편 27장, 잠언 25장","06_26":"사사기 20-21장, 시편 28장, 잠언 26장","06_27":"룻기 1-2장, 시편 29장, 잠언 27장","06_28":"룻기 3-4장, 시편 30장, 잠언 28장",
            "06_29":"사무엘상 1-3장, 시편 31장, 잠언 29장","06_30":"사무엘상 4-6장, 시편 32장, 잠언 30장",

            // 7 월
            "07_01":"사무엘상 7-9장, 시편 33장, 잠언 1장","07_02":"사무엘상 10-12장, 시편 34장, 잠언 2장","07_03":"사무엘상 13-15장, 시편 35장, 잠언 3장","07_04":"사무엘상 16-18장, 시편 36장, 잠언 4장",
            "07_05":"사무엘상 19-21장, 시편 37장, 잠언 5장","07_06":"사무엘상 22-24장, 시편 38장, 잠언 6장","07_07":"사무엘상 25-27장, 시편 39장, 잠언 7장","07_08":"사무엘상 28-29장, 시편 40장, 잠언 8장",
            "07_09":"사무엘상 30-31장, 시편 41장, 잠언 9장","07_10":"사무엘하 1-3장, 시편 42장, 잠언 10장","07_11":"사무엘하 4-6장, 시편 43장, 잠언 11장","07_12":"사무엘하 7-9장, 시편 44장, 잠언 12장",
            "07_13":"사무엘하 10-12장, 시편 45장, 잠언 13장","07_14":"사무엘하 13-15장, 시편 46장, 잠언 14장","07_15":"사무엘하 16-18장, 시편 47장, 잠언 15장","07_16":"사무엘하 19-20장, 시편 48장, 잠언 16장",
            "07_17":"사무엘하 21-22장, 시편 49장, 잠언 17장","07_18":"사무엘하 23-24장, 시편 50장, 잠언 18장","07_19":"열왕기상 1-3장, 시편 51장, 잠언 19장","07_20":"열왕기상 4-6장, 시편 52장, 잠언 20장",
            "07_21":"열왕기상 7-9장, 시편 53장, 잠언 21장","07_22":"열왕기상 10-12장, 시편 54장, 잠언 22장","07_23":"열왕기상 13-15장, 시편 55장, 잠언 23장","07_24":"열왕기상 16-18장, 시편 56장, 잠언 24장",
            "07_25":"열왕기상 19-20장, 시편 57장, 잠언 25장","07_26":"열왕기상 21-22장, 시편 58장, 잠언 26장","07_27":"열왕기하 1-3장, 시편 59장, 잠언 27장","07_28":"열왕기하 4-6장, 시편 60장, 잠언 28장",
            "07_29":"열왕기하 7-9장, 시편 61장, 잠언 29장","07_30":"열왕기하 10-12장, 시편 62장, 잠언 30장","07_31":"열왕기하 13-15장, 시편 63장, 잠언 31장",

            // 8 월
            "08_01":"열왕기하 16-18장, 시편 64장, 잠언 1장","08_02":"열왕기하 19-21장, 시편 65장, 잠언 2장","08_03":"열왕기하 22-23장, 시편 66장, 잠언 3장","08_04":"열왕기하 24-25장, 시편 67장, 잠언 4장",
            "08_05":"역대상 1-3장, 시편 68장, 잠언 5장","08_06":"역대상 4-6장, 시편 69장, 잠언 6장","08_07":"역대상 7-9장, 시편 70장, 잠언 7장","08_08":"역대상 10-12장, 시편 71장, 잠언 8장",
            "08_09":"역대상 13-15장, 시편 72장, 잠언 9장","08_10":"역대상 16-18장, 시편 73장, 잠언 10장","08_11":"역대상 19-21장, 시편 74장, 잠언 11장","08_12":"역대상 22-24장, 시편 75장, 잠언 12장",
            "08_13":"역대상 25-27장, 시편 76장, 잠언 13장","08_14":"역대상 28-29장, 시편 77장, 잠언 14장","08_15":"역대하 1-3장, 시편 78장, 잠언 15장","08_16":"역대하 4-6장, 시편 79장, 잠언 16장",
            "08_17":"역대하 7-9장, 시편 80장, 잠언 17장","08_18":"역대하 10-12장, 시편 81장, 잠언 18장","08_19":"역대하 13-15장, 시편 82장, 잠언 19장","08_20":"역대하 16-18장, 시편 83장, 잠언 20장",
            "08_21":"역대하 19-21장, 시편 84장, 잠언 21장","08_22":"역대하 22-24장, 시편 85장, 잠언 22장","08_23":"역대하 25-27장, 시편 86장, 잠언 23장","08_24":"역대하 28-30장, 시편 87장, 잠언 24장",
            "08_25":"역대하 31-32장, 시편 88장, 잠언 25장","08_26":"역대하 33-34장, 시편 89장, 잠언 26장","08_27":"역대하 35-36장, 시편 90장, 잠언 27장","08_28":"에스라 1-3장, 시편 92장, 잠언 28장",
            "08_29":"에스라 4-6장, 시편 92장, 잠언 29장","08_30":"에스라 7-8장, 시편 93장, 잠언 30장","08_31":"에스라 9-10장, 시편 94장, 잠언 31장",

            // 9 월
            "09_01":"느헤미야 1-3장, 잠언 95장, 시편 1-2장, 잠언 1장","09_02":"느헤미야 4-6장, 시편 96장, 잠언 2장","09_03":"느헤미야 7-9장, 시편 97장, 잠언 3장","09_04":"느헤미야 10-11장, 시편 98장, 잠언 4장",
            "09_05":"느헤미야 12-13장, 시편 99장, 잠언 5장","09_06":"에스더 1-3장, 시편 100장, 잠언 6장","09_07":"에스더 4-6장, 시편 101장, 잠언 7장","09_08":"에스더 7-8장, 시편 102장, 잠언 8장",
            "09_09":"에스더 9-10장, 시편 103장, 잠언 9장","09_10":"욥기 1-3장, 시편 104장, 잠언 10장","09_11":"욥기 4-6장, 시편 105장, 잠언 11장","09_12":"욥기 7-9장, 시편 106장, 잠언 12장",
            "09_13":"욥기 10-12장, 시편 107장, 잠언 13장","09_14":"욥기 13-15장, 시편 108장, 잠언 14장","09_15":"욥기 16-18장, 시편 109장, 잠언 15장","09_16":"욥기 19-21장, 시편 110장, 잠언 16장",
            "09_17":"욥기 22-24장, 시편 111장, 잠언 17장","09_18":"욥기 25-27장, 시편 112장, 잠언 18장","09_19":"욥기 28-30장, 시편 113장, 잠언 19장","09_20":"욥기 31-33장, 시편 114장, 잠언 20장",
            "09_21":"욥기 34-36장, 시편 115장, 잠언 21장","09_22":"욥기 37-38장, 시편 116장, 잠언 22장","09_23":"욥기 39-40장, 시편 117장, 잠언 23장","09_24":"욥기 41-42장, 시편 118장, 잠언 24장",
            "09_25":"전도서 1-3장, 시편 119장, 잠언 25장","09_26":"전도서 4-6장, 시편 120장, 잠언 26장","09_27":"전도서 7-8장, 시편 121장, 잠언 27장","09_28":"전도서 9-10장, 시편 122장, 잠언 28장",
            "09_29":"전도서 11-12장, 시편 123장, 잠언 29장","09_30":"아가 1-3장, 시편 124장, 잠언 30장",

            // 10 월
            "10_01":"아가 4-6장, 시편 125장, 잠언 1장","10_02":"아가 7-8장, 시편 126장, 잠언 2장","10_03":"이사야 1-3장, 시편 127장, 잠언 3장","10_04":"이사야 4-6장, 시편 128장, 잠언 4장",
            "10_05":"이사야 7-9장, 시편 129장, 잠언 5장","10_06":"이사야 10-12장, 시편 130장, 잠언 6장","10_07":"이사야 13-15장, 시편 131장, 잠언 7장","10_08":"이사야 16-18장, 시편 132장, 잠언 8장",
            "10_09":"이사야 19-21장, 시편 133장, 잠언 9장","10_10":"이사야 22-24장, 시편 134장, 잠언 10장","10_11":"이사야 25-27장, 시편 135장, 잠언 11장","10_12":"이사야 28-30장, 시편 136장, 잠언 12장",
            "10_13":"이사야 31-33장, 시편 137장, 잠언 13장","10_14":"이사야 34-36장, 시편 138장, 잠언 14장","10_15":"이사야 37-39장, 시편 139장, 잠언 15장","10_16":"이사야 40-42장, 시편 140장, 잠언 16장",
            "10_17":"이사야 43-45장, 시편 141장, 잠언 17장","10_18":"이사야 46-48장, 시편 142장, 잠언 18장","10_19":"이사야 49-51장, 시편 143장, 잠언 19장","10_20":"이사야 52-54장, 시편 144장, 잠언 20장",
            "10_21":"이사야 55-57장, 시편 145장, 잠언 21장","10_22":"이사야 58-60장, 시편 146장, 잠언 22장","10_23":"이사야 61-62장, 시편 147장, 잠언 23장","10_24":"이사야 63-64장, 시편 148장, 잠언 24장",
            "10_25":"이사야 65-66장, 시편 149장, 잠언 25장","10_26":"예레미야 1-3장, 시편 150장, 잠언 26장","10_27":"예레미야 4-6장, 시편 1장, 잠언 27장","10_28":"예레미야 7-9장, 시편 2장, 잠언 28장",
            "10_29":"예레미야 10-12장, 시편 3장, 잠언 29장","10_30":"예레미야 13-15장, 시편 4장, 잠언 30장","10_31":"예레미야 16-18장, 시편 5장, 잠언 31장",

            // 11 월
            "11_01":"예레미야 19-21장, 시편 6장, 잠언 1장","11_02":"예레미야 22-24장, 시편 7장, 잠언 2장","11_03":"예레미야 25-27장, 시편 8장, 잠언 3장","11_04":"예레미야 28-30장, 시편 9장, 잠언 4장",
            "11_05":"예레미야 31-33장, 시편 10장, 잠언 5장","11_06":"예레미야 34-36장, 시편 11장, 잠언 6장","11_07":"예레미야 37-39장, 시편 12장, 잠언 7장","11_08":"예레미야 40-42장, 시편 13장, 잠언 8장",
            "11_09":"예레미야 43-45장, 시편 14장, 잠언 9장","11_10":"예레미야 46-48장, 시편 15장, 잠언 10장","11_11":"예레미야 49-50장, 시편 16장, 잠언 11장","11_12":"예레미야 51-52장, 시편 17장, 잠언 12장",
            "11_13":"예레미야애가 1-3장, 시편 18장, 잠언 13장","11_14":"예레미야애가 4-5장, 시편 19장, 잠언 14장","11_15":"에스겔 1-3장, 시편 20장, 잠언 15장","11_16":"에스겔 4-6장, 시편 21장, 잠언 16장",
            "11_17":"에스겔 7-9장, 시편 22장, 잠언 17장","11_18":"에스겔 10-12장, 시편 23장, 잠언 18장","11_19":"에스겔 13-15장, 시편 24장, 잠언 19장","11_20":"에스겔 16-18장, 시편 25장, 잠언 20장",
            "11_21":"에스겔 19-21장, 시편 26장, 잠언 21장","11_22":"에스겔 22-24장, 시편 27장, 잠언 22장","11_23":"에스겔 25-27장, 시편 28장, 잠언 23장","11_24":"에스겔 28-30장, 시편 29장, 잠언 24장",
            "11_25":"에스겔 31-33장, 시편 30장, 잠언 25장","11_26":"에스겔 34-36장, 시편 31장, 잠언 26장","11_27":"에스겔 37-39장, 시편 32장, 잠언 27장","11_28":"에스겔 40-42장, 시편 33장, 잠언 28장",
            "11_29":"에스겔 43-44장, 시편 34장, 잠언 29장","11_30":"에스겔 45-46장, 시편 35장, 잠언 30장",

            // 12 월
            "12_01":"에스겔 47-48장, 시편 36장, 잠언 1장","12_02":"다니엘 1-3장, 시편 37장, 잠언 2장","12_03":"다니엘 4-6장, 시편 38장, 잠언 3장","12_04":"다니엘 7-8장, 시편 39장, 잠언 4장",
            "12_05":"다니엘 9-10장, 시편 40장, 잠언 5장","12_06":"다니엘 11-12장, 시편 41장, 잠언 6장","12_07":"호세아 1-3장, 시편 42장, 잠언 7장","12_08":"호세아 4-6장, 시편 43장, 잠언 8장",
            "12_09":"호세아 7-9장, 시편 44장, 잠언 9장","12_10":"호세아 10-12장, 시편 45장, 잠언 10장","12_11":"호세아 13-14장, 시편 46장, 잠언 11장","12_12":"요엘 1-3장, 시편 47장, 잠언 12장",
            "12_13":"아모스 1-3장, 시편 48장, 잠언 13장","12_14":"아모스 4-6장, 시편 49장, 잠언 14장","12_15":"아모스 7-9장, 시편 50장, 잠언 15장","12_16":"오바댜, 요나 2장, 시편 51장, 잠언 16장",
            "12_17":"요나 3-4장, 시편 52장, 잠언 17장","12_18":"미가 1-3장, 시편 53장, 잠언 18장","12_19":"미가 4-5장, 시편 54장, 잠언 19장","12_20":"미가 6-7장, 시편 55장, 잠언 20장",
            "12_21":"나훔 1-3장, 시편 56장, 잠언 21장","12_22":"하박국 1-3장, 시편 57장, 잠언 22장","12_23":"스바냐 1-3장, 시편 58장, 잠언 23장","12_24":"학개 1-2장, 시편 59장, 잠언 24장",
            "12_25":"스가랴 1-3장, 시편 60장, 잠언 25장","12_26":"스가랴 4-6장, 시편 61장, 잠언 26장","12_27":"스가랴 7-9장, 시편 62장, 잠언 27장","12_28":"스가랴 10-12장, 시편 63장, 잠언 28장",
            "12_29":"스가랴 13-14장, 시편 64장, 잠언 29장","12_30":"말라기 1-2장, 시편 65장, 잠언 30장","12_31":"말라기 3-4장, 시편 66장, 잠언 31장"
]
    var sendingSchedule_eng = [

            // 1 월
            "01_01":"Matthew 1-3, Psalms 1, Proverbs 1","01_02":"Matthew 4-6, Psalms 2, Proverbs 2","01_03":"Matthew 7-9, Psalms 3, Proverbs 3","01_04":"Matthew 10-12, Psalms 4, Proverbs 4",
            "01_05":"Matthew 13-15, Psalms 5, Proverbs 5","01_06":"Matthew 16-18, Psalms 6, Proverbs 6","01_07":"Matthew 19-21, Psalms 7, Proverbs 7","01_08":"Matthew 22-24, Psalms 8, Proverbs 8",
            "01_09":"Matthew 25-26, Psalms 9, Proverbs 9","01_10":"Matthew 27-28, Psalms 10, Proverbs 10","01_11":"Mark 1-3, Psalms 11, Proverbs 11","01_12":"Mark 4-6, Psalms 12, Proverbs 12",
            "01_13":"Mark 7-9, Psalms 13, Proverbs 13","01_14":"Mark 10-12, Psalms 14, Proverbs 14","01_15":"Mark 13-14, Psalms 15, Proverbs 15","01_16":"Mark 15-16, Psalms 16, Proverbs 16",
            "01_17":"Luke 1-3, Psalms 17, Proverbs 17","01_18":"Luke 4-6, Psalms 18, Proverbs 18","01_19":"Luke 7-9, Psalms 19, Proverbs 19","01_20":"Luke 10-12, Psalms 20, Proverbs 20",
            "01_21":"Luke 13-15, Psalms 21, Proverbs 21","01_22":"Luke 16-18, Psalms 22, Proverbs 22","01_23":"Luke 19-21, Psalms 23, Proverbs 23","01_24":"Luke 22-24, Psalms 24, Proverbs 24",
            "01_25":"John 1-3, Psalms 25, Proverbs 25","01_26":"John 4-6, Psalms 26, Proverbs 26","01_27":"John 7-9, Psalms 27, Proverbs 27","01_28":"John 10-12, Psalms 28, Proverbs 28",
            "01_29":"John 13-15, Psalms 29, Proverbs 29","01_30":"John 16-18, Psalms 30, Proverbs 30","01_31":"John 19-21, Psalms 31, Proverbs 31",

            // 2 월
            "02_01":"Acts 1-3, Psalms 32, Proverbs 1","02_02":"Acts 4-6, Psalms 33, Proverbs 2","02_03":"Acts 7-9, Psalms 34, Proverbs 3",
            "02_04":"Acts 10-12, Psalms 35, Proverbs 4","02_05":"Acts 13-15, Psalms 36, Proverbs 5","02_06":"Acts 16-18, Psalms 37, Proverbs 6",
            "02_07":"Acts 19-21, Psalms 38, Proverbs 7","02_08":"Acts 22-24, Psalms 39, Proverbs 8","02_09":"Acts 25-26, Psalms 40, Proverbs 9",
            "02_10":"Acts 27-28, Psalms 41, Proverbs 10","02_11":"Romans 1-3, Psalms 42, Proverbs 11","02_12":"Romans 4-6, Psalms 43, Proverbs 12",
            "02_13":"Romans 7-9, Psalms 44, Proverbs 13","02_14":"Romans 10-12, Psalms 45, Proverbs 14","02_15":"Romans 13-14, Psalms 46, Proverbs 15",
            "02_16":"Romans 15-16, Psalms 47, Proverbs 16","02_17":"1Corinthians 1-3, Psalms 48, Proverbs 17","02_18":"1Corinthians 4-6, Psalms 49, Proverbs 18",
            "02_19":"1Corinthians 7-9, Psalms 50, Proverbs 19","02_20":"1Corinthians 10-12, Psalms 51, Proverbs 20","02_21":"1Corinthians 13-14, Psalms 52, Proverbs 21",
            "02_22":"1Corinthians 15-16, Psalms 53, Proverbs 22","02_23":"2Corinthians 1-3, Psalms 54, Proverbs 23","02_24":"2Corinthians 4-6, Psalms 55, Proverbs 24",
            "02_25":"2Corinthians 7-9, Psalms 56, Proverbs 25","02_26":"2Corinthians 10-11, Psalms 57, Proverbs 26","02_27":"2Corinthians 12-13, Psalms 58, Proverbs 27",
            "02_28":"Galatians 1-3, Psalms 59, Proverbs 28","02_29":"Galatians 4-6, Psalms 60, Proverbs 29",

            // 3 월
            "03_01":"Ephesians 1-3, Psalms 61, Proverbs 1","03_02":"Ephesians 4-6, Psalms 62, Proverbs 2","03_03":"Philippians 1-2, Psalms 63, Proverbs 3","03_04":"Philippians 3-4, Psalms 64, Proverbs 4",
            "03_05":"Colossians 1-2, Psalms 65, Proverbs 5","03_06":"Colossians 3-4, Psalms 66, Proverbs 6","03_07":"1Thessalonians 1-3, Psalms 67, Proverbs 7","03_08":"1Thessalonians 4-5, Psalms 68, Proverbs 8",
            "03_09":"2Thessalonians 1-3, Psalms 69, Proverbs 9","03_10":"1Timothy 1-3, Psalms 70, Proverbs 10","03_11":"1Timothy 4-6, Psalms 71, Proverbs 11","03_12":"2Timothy 1-2, Psalms 72, Proverbs 12",
            "03_13":"2Timothy 3-4, Psalms 73, Proverbs 13","03_14":"Titus, Psalms 74, Proverbs 14","03_15":"Philemon, Hebrews 1-2 Psalms 75, Proverbs 15","03_16":"Hebrews 3-5, Psalms 76, Proverbs 16",
            "03_17":"Hebrews 6-8, Psalms 77, Proverbs 17","03_18":"Hebrews 9-11, Psalms 78, Proverbs 18","03_19":"Hebrews 12-13, Psalms 79, Proverbs 19","03_20":"James 1-3, 시펀 80, Proverbs 20",
            "03_21":"James 4-5, Psalms 81, Proverbs 21","03_22":"1Peter 1-3, Psalms 82, Proverbs 22","03_23":"1Peter 4-5, Psalms 83, Proverbs 23","03_24":"2Peter 1-3, Psalms 84, Proverbs 24",
            "03_25":"1John 1-3, Psalms 85, Proverbs 25","03_26":"1John 4-5, Psalms 86, Proverbs 26","03_27":"2John, 3John, 유다서 7-9, Psalms 87, Proverbs 27","03_28":"Revelation 1-3, Psalms 88, Proverbs 28",
            "03_29":"Revelation 4-6, Psalms 89, Proverbs 29","03_30":"Revelation 7-9, Psalms 90, Proverbs 30","03_31":"Revelation 10-12, Psalms 91, Proverbs 31",

            // 4 월
            "04_01":"Revelation 13-15, Psalms 92, Proverbs 1","04_02":"Revelation 16-19, Psalms 93, Proverbs 2","04_03":"Revelation 20-22, Psalms 94, Proverbs 3","04_04":"Genesis 1-3, Psalms 95, Proverbs 4",
            "04_05":"Genesis 4-6, Psalms 96, Proverbs 5","04_06":"Genesis 7-9, Psalms 97, Proverbs 6","04_07":"Genesis 10-12, Psalms 98, Proverbs 7","04_08":"Genesis 13-15, Psalms 99, Proverbs 8",
            "04_09":"Genesis 16-18, Psalms 100, Proverbs 9","04_10":"Genesis 19-21, Psalms 101, Proverbs 10","04_11":"Genesis 22-24, Psalms 102, Proverbs 11","04_12":"Genesis 25-27, Psalms 103, Proverbs 12",
            "04_13":"Genesis 28-30, Psalms 104, Proverbs 13","04_14":"Genesis 31-33, Psalms 105, Proverbs 14","04_15":"Genesis 34-36, Psalms 106, Proverbs 15","04_16":"Genesis 37-39, Psalms 107, Proverbs 16",
            "04_17":"Genesis 40-42, Psalms 108, Proverbs 17","04_18":"Genesis 43-45, Psalms 109, Proverbs 18","04_19":"Genesis 46-48, Psalms 110, Proverbs 19","04_20":"Genesis 49-50, Psalms 111, Proverbs 20",
            "04_21":"Exodus 1-3, Psalms 112, Proverbs 21","04_22":"Exodus 4-6, Psalms 113, Proverbs 22","04_23":"Exodus 7-8, Psalms 114, Proverbs 23","04_24":"Exodus 9, Psalms 115, Proverbs 24",
            "04_25":"Exodus 10-12, Psalms 116, Proverbs 25","04_26":"Exodus 13-15, Psalms 117, Proverbs 26","04_27":"Exodus 16-18, Psalms 118, Proverbs 27","04_28":"Exodus 19-21, Psalms 119, Proverbs 28",
            "04_29":"Exodus 22-24, Psalms 120, Proverbs 30","04_30":"Exodus 25-27, Psalms 121, Proverbs 31",

            // 5 월
            "05_01":"Exodus 28-30, Psalms 122, Proverbs 1","05_02":"Exodus 31-33, Psalms 123, Proverbs 2","05_03":"Exodus 34-36, Psalms 124, Proverbs 3","05_04":"Exodus 37-38, Psalms 125, Proverbs 4",
            "05_05":"Exodus 39-40, Psalms 126, Proverbs 5","05_06":"Leviticus 1-3, Psalms 127, Proverbs 6","05_07":"Leviticus 4-6, Psalms 128, Proverbs 7","05_08":"Leviticus 7-9, Psalms 129, Proverbs 8",
            "05_09":"Leviticus 10-12, Psalms 130, Proverbs 9","05_10":"Leviticus 13-15, Psalms 131, Proverbs 10","05_11":"Leviticus 16-18, Psalms 132, Proverbs 11","05_12":"Leviticus 19-21, Psalms 133, Proverbs 12",
            "05_13":"Leviticus 22-23, Psalms 134, Proverbs 13","05_14":"Leviticus 24-25, Psalms 135, Proverbs 14","05_15":"Leviticus 26-27, Psalms 136, Proverbs 15","05_16":"Numbers 1-3, Psalms 137, Proverbs 16",
            "05_17":"Numbers 4-6, Psalms 138, Proverbs 17","05_18":"Numbers 7-9, Psalms 139, Proverbs 18","05_19":"Numbers 10-12, Psalms 140, Proverbs 19","05_20":"Numbers 13-15, Psalms 141, Proverbs 20",
            "05_21":"Numbers 16-18, Psalms 142, Proverbs 21","05_22":"Numbers 19-21, Psalms 143, Proverbs 22","05_23":"Numbers 22-24, Psalms 144, Proverbs 23","05_24":"Numbers 25-27, Psalms 145, Proverbs 24",
            "05_25":"Numbers 28-30, Psalms 146, Proverbs 25","05_26":"Numbers 31-32, Psalms 147, Proverbs 26","05_27":"Numbers 33-34, Psalms 148, Proverbs 27","05_28":"Numbers 35-36, Psalms 149, Proverbs 28",
            "05_29":"Deuteronomy 1-3, Psalms 150, Proverbs 29","05_30":"Deuteronomy 4-6, Psalms 1, Proverbs 30","05_31":"Deuteronomy 7-9, Psalms 2, Proverbs 31",

            // 6 월
            "06_01":"Deuteronomy 10-12, Psalms 3, Proverbs 1","06_02":"Deuteronomy 13-15, Psalms 4, Proverbs 2","06_03":"Deuteronomy 16-18, Psalms 5, Proverbs 3","06_04":"Deuteronomy 19-21, Psalms 6, Proverbs 4",
            "06_05":"Deuteronomy 22-24, Psalms 7, Proverbs 5","06_06":"Deuteronomy 25-27, Psalms 8, Proverbs 6","06_07":"Deuteronomy 28-30, Psalms 9, Proverbs 7","06_08":"Deuteronomy 31-32, Psalms 10, Proverbs 8",
            "06_09":"Deuteronomy 33-34, Psalms 11, Proverbs 9","06_10":"Joshua 1-3, Psalms 12, Proverbs 10","06_11":"Joshua 4-6, Psalms 13, Proverbs 11","06_12":"Joshua 7-9, Psalms 14, Proverbs 12",
            "06_13":"Joshua 10-12, Psalms 15, Proverbs 13","06_14":"Joshua 13-15, Psalms 16, Proverbs 14","06_15":"Joshua 16-18, Psalms 17, Proverbs 15","06_16":"Joshua 19-20, Psalms 18, Proverbs 16",
            "06_17":"Joshua 21-22, Psalms 19, Proverbs 17","06_18":"Joshua 23-24, Psalms 20, Proverbs 18","06_19":"Judges 1-3, Psalms 21, Proverbs 19","06_20":"Judges 4-6, Psalms 22, Proverbs 20",
            "06_21":"Judges 7-9, Psalms 23, Proverbs 21","06_22":"Judges 10-12, Psalms 24, Proverbs 22","06_23":"Judges 13-15, Psalms 25, Proverbs 23","06_24":"Judges 16-17, Psalms 26, Proverbs 24",
            "06_25":"Judges 18-19, Psalms 27, Proverbs 25","06_26":"Judges 20-21, Psalms 28, Proverbs 26","06_27":"Ruth 1-2, Psalms 29, Proverbs 27","06_28":"Ruth 3-4, Psalms 30, Proverbs 28",
            "06_29":"1Samuel 1-3, Psalms 31, Proverbs 29","06_30":"1Samuel 4-6, Psalms 32, Proverbs 30",

            // 7 월
            "07_01":"1Samuel 7-9, Psalms 33, Proverbs 1","07_02":"1Samuel 10-12, Psalms 34, Proverbs 2","07_03":"1Samuel 13-15, Psalms 35, Proverbs 3","07_04":"1Samuel 16-18, Psalms 36, Proverbs 4",
            "07_05":"1Samuel 19-21, Psalms 37, Proverbs 5","07_06":"1Samuel 22-24, Psalms 38, Proverbs 6","07_07":"1Samuel 25-27, Psalms 39, Proverbs 7","07_08":"1Samuel 28-29, Psalms 40, Proverbs 8",
            "07_09":"1Samuel 30-31, Psalms 41, Proverbs 9","07_10":"2Samuel 1-3, Psalms 42, Proverbs 10","07_11":"2Samuel 4-6, Psalms 43, Proverbs 11","07_12":"2Samuel 7-9, Psalms 44, Proverbs 12",
            "07_13":"2Samuel 10-12, Psalms 45, Proverbs 13","07_14":"2Samuel 13-15, Psalms 46, Proverbs 14","07_15":"2Samuel 16-18, Psalms 47, Proverbs 15","07_16":"2Samuel 19-20, Psalms 48, Proverbs 16",
            "07_17":"2Samuel 21-22, Psalms 49, Proverbs 17","07_18":"2Samuel 23-24, Psalms 50, Proverbs 18","07_19":"1Kings 1-3, Psalms 51, Proverbs 19","07_20":"1Kings 4-6, Psalms 52, Proverbs 20",
            "07_21":"1Kings 7-9, Psalms 53, Proverbs 21","07_22":"1Kings 10-12, Psalms 54, Proverbs 22","07_23":"1Kings 13-15, Psalms 55, Proverbs 23","07_24":"1Kings 16-18, Psalms 56, Proverbs 24",
            "07_25":"1Kings 19-20, Psalms 57, Proverbs 25","07_26":"1Kings 21-22, Psalms 58, Proverbs 26","07_27":"2Kings 1-3, Psalms 59, Proverbs 27","07_28":"2Kings 4-6, Psalms 60, Proverbs 28",
            "07_29":"2Kings 7-9, Psalms 61, Proverbs 29","07_30":"2Kings 10-12, Psalms 62, Proverbs 30","07_31":"2Kings 13-15, Psalms 63, Proverbs 31",

            // 8 월
            "08_01":"2Kings 16-18, Psalms 64, Proverbs 1","08_02":"2Kings 19-21, Psalms 65, Proverbs 2","08_03":"2Kings 22-23, Psalms 66, Proverbs 3","08_04":"2Kings 24-25, Psalms 67, Proverbs 4",
            "08_05":"1Chronicles 1-3, Psalms 68, Proverbs 5","08_06":"1Chronicles 4-6, Psalms 69, Proverbs 6","08_07":"1Chronicles 7-9, Psalms 70, Proverbs 7","08_08":"1Chronicles 10-12, Psalms 71, Proverbs 8",
            "08_09":"1Chronicles 13-15, Psalms 72, Proverbs 9","08_10":"1Chronicles 16-18, Psalms 73, Proverbs 10","08_11":"1Chronicles 19-21, Psalms 74, Proverbs 11","08_12":"1Chronicles 22-24, Psalms 75, Proverbs 12",
            "08_13":"1Chronicles 25-27, Psalms 76, Proverbs 13","08_14":"1Chronicles 28-29, Psalms 77, Proverbs 14","08_15":"2Chronicles 1-3, Psalms 78, Proverbs 15","08_16":"2Chronicles 4-6, Psalms 79, Proverbs 16",
            "08_17":"2Chronicles 7-9, Psalms 80, Proverbs 17","08_18":"2Chronicles 10-12, Psalms 81, Proverbs 18","08_19":"2Chronicles 13-15, Psalms 82, Proverbs 19","08_20":"2Chronicles 16-18, Psalms 83, Proverbs 20",
            "08_21":"2Chronicles 19-21, Psalms 84, Proverbs 21","08_22":"2Chronicles 22-24, Psalms 85, Proverbs 22","08_23":"2Chronicles 25-27, Psalms 86, Proverbs 23","08_24":"2Chronicles 28-30, Psalms 87, Proverbs 24",
            "08_25":"2Chronicles 31-32, Psalms 88, Proverbs 25","08_26":"2Chronicles 33-34, Psalms 89, Proverbs 26","08_27":"2Chronicles 35-36, Psalms 90, Proverbs 27","08_28":"Ezra 1-3, Psalms 92, Proverbs 28",
            "08_29":"Ezra 4-6, Psalms 92, Proverbs 29","08_30":"Ezra 7-8, Psalms 93, Proverbs 30","08_31":"Ezra 9-10, Psalms 94, Proverbs 31",

            // 9 월
            "09_01":"Nehemiah 1-3, Proverbs 95, Psalms 1-2, Proverbs 1","09_02":"Nehemiah 4-6, Psalms 96, Proverbs 2","09_03":"Nehemiah 7-9, Psalms 97, Proverbs 3","09_04":"Nehemiah 10-11, Psalms 98, Proverbs 4",
            "09_05":"Nehemiah 12-13, Psalms 99, Proverbs 5","09_06":"Esther 1-3, Psalms 100, Proverbs 6","09_07":"Esther 4-6, Psalms 101, Proverbs 7","09_08":"Esther 7-8, Psalms 102, Proverbs 8",
            "09_09":"Esther 9-10, Psalms 103, Proverbs 9","09_10":"Job 1-3, Psalms 104, Proverbs 10","09_11":"Job 4-6, Psalms 105, Proverbs 11","09_12":"Job 7-9, Psalms 106, Proverbs 12",
            "09_13":"Job 10-12, Psalms 107, Proverbs 13","09_14":"Job 13-15, Psalms 108, Proverbs 14","09_15":"Job 16-18, Psalms 109, Proverbs 15","09_16":"Job 19-21, Psalms 110, Proverbs 16",
            "09_17":"Job 22-24, Psalms 111, Proverbs 17","09_18":"Job 25-27, Psalms 112, Proverbs 18","09_19":"Job 28-30, Psalms 113, Proverbs 19","09_20":"Job 31-33, Psalms 114, Proverbs 20",
            "09_21":"Job 34-36, Psalms 115, Proverbs 21","09_22":"Job 37-38, Psalms 116, Proverbs 22","09_23":"Job 39-40, Psalms 117, Proverbs 23","09_24":"Job 41-42, Psalms 118, Proverbs 24",
            "09_25":"Ecclesiastes 1-3, Psalms 119, Proverbs 25","09_26":"Ecclesiastes 4-6, Psalms 120, Proverbs 26","09_27":"Ecclesiastes 7-8, Psalms 121, Proverbs 27","09_28":"Ecclesiastes 9-10, Psalms 122, Proverbs 28",
            "09_29":"Ecclesiastes 11-12, Psalms 123, Proverbs 29","09_30":"Song of Songs 1-3, Psalms 124, Proverbs 30",

            // 10 월
            "10_01":"Song of Songs 4-6, Psalms 125, Proverbs 1","10_02":"Song of Songs 7-8, Psalms 126, Proverbs 2","10_03":"Isaiah 1-3, Psalms 127, Proverbs 3","10_04":"Isaiah 4-6, Psalms 128, Proverbs 4",
            "10_05":"Isaiah 7-9, Psalms 129, Proverbs 5","10_06":"Isaiah 10-12, Psalms 130, Proverbs 6","10_07":"Isaiah 13-15, Psalms 131, Proverbs 7","10_08":"Isaiah 16-18, Psalms 132, Proverbs 8",
            "10_09":"Isaiah 19-21, Psalms 133, Proverbs 9","10_10":"Isaiah 22-24, Psalms 134, Proverbs 10","10_11":"Isaiah 25-27, Psalms 135, Proverbs 11","10_12":"Isaiah 28-30, Psalms 136, Proverbs 12",
            "10_13":"Isaiah 31-33, Psalms 137, Proverbs 13","10_14":"Isaiah 34-36, Psalms 138, Proverbs 14","10_15":"Isaiah 37-39, Psalms 139, Proverbs 15","10_16":"Isaiah 40-42, Psalms 140, Proverbs 16",
            "10_17":"Isaiah 43-45, Psalms 141, Proverbs 17","10_18":"Isaiah 46-48, Psalms 142, Proverbs 18","10_19":"Isaiah 49-51, Psalms 143, Proverbs 19","10_20":"Isaiah 52-54, Psalms 144, Proverbs 20",
            "10_21":"Isaiah 55-57, Psalms 145, Proverbs 21","10_22":"Isaiah 58-60, Psalms 146, Proverbs 22","10_23":"Isaiah 61-62, Psalms 147, Proverbs 23","10_24":"Isaiah 63-64, Psalms 148, Proverbs 24",
            "10_25":"Isaiah 65-66, Psalms 149, Proverbs 25","10_26":"Jeremiah 1-3, Psalms 150, Proverbs 26","10_27":"Jeremiah 4-6, Psalms 1, Proverbs 27","10_28":"Jeremiah 7-9, Psalms 2, Proverbs 28",
            "10_29":"Jeremiah 10-12, Psalms 3, Proverbs 29","10_30":"Jeremiah 13-15, Psalms 4, Proverbs 30","10_31":"Jeremiah 16-18, Psalms 5, Proverbs 31",

            // 11 월
            "11_01":"Jeremiah 19-21, Psalms 6, Proverbs 1","11_02":"Jeremiah 22-24, Psalms 7, Proverbs 2","11_03":"Jeremiah 25-27, Psalms 8, Proverbs 3","11_04":"Jeremiah 28-30, Psalms 9, Proverbs 4",
            "11_05":"Jeremiah 31-33, Psalms 10, Proverbs 5","11_06":"Jeremiah 34-36, Psalms 11, Proverbs 6","11_07":"Jeremiah 37-39, Psalms 12, Proverbs 7","11_08":"Jeremiah 40-42, Psalms 13, Proverbs 8",
            "11_09":"Jeremiah 43-45, Psalms 14, Proverbs 9","11_10":"Jeremiah 46-48, Psalms 15, Proverbs 10","11_11":"Jeremiah 49-50, Psalms 16, Proverbs 11","11_12":"Jeremiah 51-52, Psalms 17, Proverbs 12",
            "11_13":"Jeremiah애가 1-3, Psalms 18, Proverbs 13","11_14":"Jeremiah애가 4-5, Psalms 19, Proverbs 14","11_15":"Ezekiel 1-3, Psalms 20, Proverbs 15","11_16":"Ezekiel 4-6, Psalms 21, Proverbs 16",
            "11_17":"Ezekiel 7-9, Psalms 22, Proverbs 17","11_18":"Ezekiel 10-12, Psalms 23, Proverbs 18","11_19":"Ezekiel 13-15, Psalms 24, Proverbs 19","11_20":"Ezekiel 16-18, Psalms 25, Proverbs 20",
            "11_21":"Ezekiel 19-21, Psalms 26, Proverbs 21","11_22":"Ezekiel 22-24, Psalms 27, Proverbs 22","11_23":"Ezekiel 25-27, Psalms 28, Proverbs 23","11_24":"Ezekiel 28-30, Psalms 29, Proverbs 24",
            "11_25":"Ezekiel 31-33, Psalms 30, Proverbs 25","11_26":"Ezekiel 34-36, Psalms 31, Proverbs 26","11_27":"Ezekiel 37-39, Psalms 32, Proverbs 27","11_28":"Ezekiel 40-42, Psalms 33, Proverbs 28",
            "11_29":"Ezekiel 43-44, Psalms 34, Proverbs 29","11_30":"Ezekiel 45-46, Psalms 35, Proverbs 30",

            // 12 월
            "12_01":"Ezekiel 47-48, Psalms 36, Proverbs 1","12_02":"Daniel 1-3, Psalms 37, Proverbs 2","12_03":"Daniel 4-6, Psalms 38, Proverbs 3","12_04":"Daniel 7-8, Psalms 39, Proverbs 4",
            "12_05":"Daniel 9-10, Psalms 40, Proverbs 5","12_06":"Daniel 11-12, Psalms 41, Proverbs 6","12_07":"Hosea 1-3, Psalms 42, Proverbs 7","12_08":"Hosea 4-6, Psalms 43, Proverbs 8",
            "12_09":"Hosea 7-9, Psalms 44, Proverbs 9","12_10":"Hosea 10-12, Psalms 45, Proverbs 10","12_11":"Hosea 13-14, Psalms 46, Proverbs 11","12_12":"요엘 1-3, Psalms 47, Proverbs 12",
            "12_13":"Amos 1-3, Psalms 48, Proverbs 13","12_14":"Amos 4-6, Psalms 49, Proverbs 14","12_15":"Amos 7-9, Psalms 50, Proverbs 15","12_16":"Obadiah, Jonah 2, Psalms 51, Proverbs 16",
            "12_17":"Jonah 3-4, Psalms 52, Proverbs 17","12_18":"Micah 1-3, Psalms 53, Proverbs 18","12_19":"Micah 4-5, Psalms 54, Proverbs 19","12_20":"Micah 6-7, Psalms 55, Proverbs 20",
            "12_21":"Nahum 1-3, Psalms 56, Proverbs 21","12_22":"Habakkuk 1-3, Psalms 57, Proverbs 22","12_23":"스바냐 1-3, Psalms 58, Proverbs 23","12_24":"학개 1-2, Psalms 59, Proverbs 24",
            "12_25":"Zephaniah 1-3, Psalms 60, Proverbs 25","12_26":"Zephaniah 4-6, Psalms 61, Proverbs 26","12_27":"Zephaniah 7-9, Psalms 62, Proverbs 27","12_28":"Zephaniah 10-12, Psalms 63, Proverbs 28",
            "12_29":"Zephaniah 13-14, Psalms 64, Proverbs 29","12_30":"Malachi 1-2, Psalms 65, Proverbs 30","12_31":"Malachi 3-4, Psalms 66, Proverbs 31"
]
    
    
    
    @IBAction func sendingpageToggleAction(_ sender: UISegmentedControl) {
        switch sendingpageToggle.selectedSegmentIndex{
        case 0:
            sendingkor.isHidden = false
            sendingeng.isHidden = true
            textViewQT.isHidden = true
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MM_dd"
            let result = formatter.string(from: date)
            sendingTextField.text = sendingSchedule_kor[result]
        case 1:
            sendingeng.isHidden = true
            sendingkor.isHidden = true
            textViewQT.isHidden = false
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MM_dd"
            let result = formatter.string(from: date)
            sendingTextField.text = sendingSchedule_kor[result]
        case 2:
            sendingkor.isHidden = true
            sendingeng.isHidden = false
            textViewQT.isHidden = true
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MM_dd"
            let result = formatter.string(from: date)
            sendingTextField.text = sendingSchedule_eng[result]
    
        default:
            break
        }
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM_dd"
        let result = formatter.string(from: date)
        sendingTextField.textAlignment = .center;
        sendingTextField.text = sendingSchedule_kor[result]
        
        textViewQT.isEditable = false
        
        do{
            let baseUrl = "http://www.newsongdallas.org/tong/s_board/read.asp?board_seq=28&board_sub_seq=1&view_sub_seq=0&seq=2602&lef=&sublef=&page=1&search_select=&search_text="
            let url = URL(string: baseUrl)!
            let encoding:UInt =  CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(
                CFStringEncodings.EUC_KR.rawValue))
            let html = try String(contentsOf: url, encoding: String.Encoding(rawValue: encoding))
            
            let doc: Document = try SwiftSoup.parseBodyFragment(html)
            
            //            let title: Elements = try doc.select("div.sboard_cont_details > p") //parent > child: child elements that descend directly from parent, e.g.
            
            for titleContents in try! doc.select("div.sboard_cont_details > p") {
                textViewQT.text = (textViewQT.text ?? "") + "\n" + (try titleContents.text())
                htmlContentInStringFormat = try titleContents.text()
            }
                
            } catch Exception.Error(_, let message) {
                print(message)
            } catch {
                print("error")
            }
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
}

