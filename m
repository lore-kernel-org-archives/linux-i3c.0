Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FE1CA1010
	for <linux-i3c@archiver.kernel.org>; Tue,  5 Sep 2023 21:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfhYw0ezU+WdeSTfPY/qVbltlTxBbCvq66oNFO9LHDg=; b=K4lUZF/+4AvDaH
	THs4m1yLpcEihPaGmtB5MnoaAg6M9p8kB85zl8AWNY2wvgJ+MxYVt5xUuP9r1LhefrMubt+b9Ezfv
	amMJAzV7QEXMTlz+f/qil32Hs43JsEbmi3zw+fj+1NQlrEeE6xIDDWp+cOLkAWpCUTzEUsoRFBJ6c
	HovctQbGodo1juVGPDnwRufKf+AadM99UFRGqVpaLmGAXEoYjLph86Womw48PkZaG2AZaUsov2eCQ
	Tck0/HdFEV5JZUE5YtEJnDIM2XPATJjI8kqR83wcD8ulUzw/bVnjkvQnYZGUmEf7xxRVTUoIjzp++
	6ylraj5njGSKxxp7CryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qddlS-006lhu-2v;
	Tue, 05 Sep 2023 21:39:14 +0000
Received: from mail-db3eur04on061b.outbound.protection.outlook.com ([2a01:111:f400:fe0c::61b] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qddlQ-006lfI-2E
	for linux-i3c@lists.infradead.org;
	Tue, 05 Sep 2023 21:39:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFnjv4rH/R/nAYzObyQpnij0UjAhLbviyhlErAh5BVaL4Dd1+DKS6SQGfViiOmPjtiv5En2IAqePu/WTAFE2bGnglcVPDDORAxK5aQYhaPW1ULUTI4UTe/PkvsycpOg/iGJiaLeZyhkEPAm9+g0Iwq22Xwsg7sBRX52cTz0Z2tmUee3jnxspyeIAaCEa6SYcCnyR3GmC7kEvNxK2AyrJnqnk/njkaLn71L37yGDX3ymnbMuDRqmKM4vTlpTaYNvXj0J8x8O2ABlnz2msBzX/By/WPA+AmKEfzNHs2BwHS9yeoV2Sb/kwLV3fPOBhymAvYQQUvEWfzVNceqfjkph6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjL4OHwC/rHtCDoRpljh9fgGCzjlUSYpZKXCcvdcfOA=;
 b=MpeobatYKM0tsI7c9FhcQlbfQ0zStmCaDYnLvOT6RQxQdpobpcsF7sDYv40/kaFZkGwTYrAW6gFpl8CKrv/VBTEQy7UcWV06PKmKQcigjnh5kxs9+Aby3t+QLsaR3D7ySYFG0ptFCDNpni1mB1mmrKZDJAUDI6EzvuWNaFVI4yVrKX2DMgBux1+uwL78rBmU5vrS06QH7lAwV5nArtK5ZpZgmK/d6egqKhGYxhq04lzorl+PhrswR1/aeW5VlhopDlHLRW1CQxvhX0xPCcnZjzO1/L+kUJj48g0k8ILVCHhdFUPyMukl7H8DHB2GRAqsOP88sik0dgfx6zbKMgwjaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjL4OHwC/rHtCDoRpljh9fgGCzjlUSYpZKXCcvdcfOA=;
 b=Dnz3e+CrQov2AJowNWT26JlTi2ECBhxdlnHhzbD1KWUPgQ5HuYLxJ+zybdI1dVrW+ae6HqHli2+lEoPK0dFWQRHFZNZMjy5gCVpBy0XGwF7kw/zuRDQaTvUXGhL0RE72lYtNlD5Fu5/IJzg1m1XhwKZzyxi69l7gsHewcdpqAOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB9256.eurprd04.prod.outlook.com (2603:10a6:102:2ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Tue, 5 Sep
 2023 21:39:03 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::aa90:117d:c1d0:346a]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::aa90:117d:c1d0:346a%3]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 21:39:03 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/9] i3c: add actual in i3c_priv_xfer
Date: Tue,  5 Sep 2023 17:38:34 -0400
Message-Id: <20230905213842.3035779-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230905213842.3035779-1-Frank.Li@nxp.com>
References: <20230905213842.3035779-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PAXPR04MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee94220-a981-48b6-5114-08dbae5885db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7KBbxbE8CGm5YJ4Z6TgLh6Y5WZtxb2/qdL5p+kWerzMP9m0rIpbX1up7LVMGiMuAsLuXkAMFQ2jWR/nk7J/Ti9lbCcx4Bi0/0E5P47eBXLToiKw1YStrB/Kg0Xi3x/XjElQw0xYFNPpdCMlZ1DiXWhFXV008r+ibVPNktenq6ldaHJZlGyrDHyzv5VyrZVUA3Q0nJXqFAjgoFNegkfL2cPqxLuTlwH2q9tH0Mgn3i3t6IptrdwySMMFUt44yHS9AQcj4Ne/Z09upKAZRCy7UBiyfrJ8k/YNN9RPIUvGAg4HU56oBs6OJC2JW711PnZFyBAIcYKofnVLmlwtnRVgRjprPvv2+bDRqPs0dqx91hUT9xWEzq6rPxrNtxZBBDKJzVX5V2hEFMFGzcAN2ujeHYLbqH05X97lp+4/gtGkfaX1uHZGlZeVrvI8AeAfTLSeoCtkbQk/s9xi+dnyB45ILZiiL6PRqGSjZrrxgixgC8RU0VH6zrBahmyupqC9Y+4PGKzFLg0eMUslMT6PaYZVV0VxqRwEE3pnZoJWmnak9/JdiUatmFXA3RkepKZ4dSo918ql8JQwPlQUGRGbas17AruXOv7c3CUsohKh10ium/qy6wQlm3uag3/1TrWor6NdO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(366004)(346002)(136003)(186009)(1800799009)(451199024)(2906002)(4744005)(6486002)(52116002)(6506007)(6916009)(316002)(66946007)(66556008)(66476007)(478600001)(26005)(6666004)(5660300002)(1076003)(41300700001)(8676002)(8936002)(6512007)(2616005)(4326008)(36756003)(38100700002)(38350700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTVSMTR6Ny8zNDJ5Y0pvTVZ5bWRPT3hnc3hXbU5pUGoxNVRJZFpyTGs3cWYr?=
 =?utf-8?B?ODhPTG1yRlNzTm1NUEIxeDU1a2hOU2VJeUxTdmVsQWxod1IwR3QwVVNIT2lI?=
 =?utf-8?B?SDB5ZXlwVG9QSnNuYkI2ZXNjeXVnckkwSmgvTXBoUlFydXV0bjY1bWdMd201?=
 =?utf-8?B?TGozYVM1ajhjVlhoK1RNSHZFcVBBelVBUDdyVnA4MC93YjBVTHcyd2VMM1ZQ?=
 =?utf-8?B?T1k2WEUxQkhMaWUyQU02NS9RL0JSUjNmeVBmMGhGOWI2Zm5FMGpjQTF4T1Ay?=
 =?utf-8?B?cjEzOGV2MFhEdnB5NVRVSHhCcXJKb2tkOTFKUDVCTTlGODlSa2MxQWxyQTFo?=
 =?utf-8?B?anhmamlNUmJSTldzemMrMkd5dG5YQ25tZlVmNVZPck54M3l5cGFQOGlKOXRy?=
 =?utf-8?B?aFQzdksrK1k1a2tyRE40d05hUk05TS9SRzVVdU1oZlI2bzF3U3ZrcTRvTmZ6?=
 =?utf-8?B?UmtsbXlDRXU1RmZVcWlvR0hNOWwwUjdaWlQvTERCYnp1TE9RMElqVzJVNDcv?=
 =?utf-8?B?aTZwS1h3Zys1N1AxeTU2N0lUUWgvSldyL0JGNjE4djFKdnlIT1k4dUViQ29m?=
 =?utf-8?B?bjVRZEkyVUVVNmtoTkhBYnlhdU9rQWoyaW05cS9KR2Z4eURGVGZMamdtUjVi?=
 =?utf-8?B?NjhLb2xab2hUMEdXMERzdGFEWXpwcDdzeTZDbmVHb3JwOE5tbE5zUGp0MEhY?=
 =?utf-8?B?Z0h1dmJKZ0RTenc3T2RnT0hsbjh3NFZZcW9KT01USEJac0F2a2tOREpPMjhp?=
 =?utf-8?B?TjdHeCtwVG90N0UxbEVoZFRwaXY5VGVjR1RONjFIZ0VWdk5uWHNSeGZtZGtX?=
 =?utf-8?B?aEtPUTRqa09xWndZTlpVWWlGTDVXQUNndVdBRTV4Z1RNb3Bxd2hSd3F3eVZR?=
 =?utf-8?B?S1oyb0VaWnVkUmVvdVliMmgrbjJ0M2ZNWmIwcDlMeUZMaEJOSitVZXExeGFj?=
 =?utf-8?B?WTZoL2F1dzdMdUdSM3piMEhIbUZYNkVrODBmSi9qRXJFUEVCY0F5NHFPRmtP?=
 =?utf-8?B?OEU3Sjc2NHRuM0dQSzJDT1VrNi94KzBIZVdQTk9IUS9xR09kSy9tTjF6Qm4w?=
 =?utf-8?B?dmxYd2NSMFViS2lkTyt1aTZtd2lmQ1hiVzcxVHJCV1QrQmIwUW95STlEeGxQ?=
 =?utf-8?B?YTFiY0g0aDN0MUZMQThjUHlUb0xHVVZhM2ZOVzFwd0ZidnRlZjlxeXAzUVJS?=
 =?utf-8?B?dDJvS2Fqb2p1c3p5dE9rd3IwRnJrQ0l5MjB2WTJDQnBXZlArWDhwTm54dnRj?=
 =?utf-8?B?ZllwZCtlTE5BcEk0eDB3bHVZdWN3SWpYTUllTHB1bDVhTCtzcWNuWWd6RTNx?=
 =?utf-8?B?WmJkekhhaFdDWkRzZjBpV1A5aENJNnR1dFJKQndCVWxrNzNTcmZMUkVZekoy?=
 =?utf-8?B?Q2JicjJ0V0dkTU9NSU9YS3p3SnczSVJ0WStWSHZtUkNYZCtNS3gvTzJIVHQr?=
 =?utf-8?B?UnpxQ0IrakF5YUQwMFd5Ty9pa0gwUitiWmFmdWs3SFd0Z1JYT3B0aTNrSXMw?=
 =?utf-8?B?aWc2R3lVcXZoVTFMRzhKNjZqSGF5N0kwNDNuNmdpVzQzVFNIeE0zNjdKUHRt?=
 =?utf-8?B?SkoxUWdKaGJoTHVsSzQ5aUh1WW1LYzlkSUNUNjErWFpPSFRTcW5YQ2kybG1L?=
 =?utf-8?B?M3RDbmcybE1KNmZKVmNuWlBwNmxCOG14dXB4SS8zQVVqcXZLdFJLdTJlTllR?=
 =?utf-8?B?NDNJa0hUSGdWUHVjVU43bmxVeDgwZTVnU0VBYWhWSWtWOTd6UFl3aUlPZGhB?=
 =?utf-8?B?UC9RWEthcDl1U3JWUjNsM1VZWks2UVU2d2VsemRjUldoc2NuUGpaQnpXQzF6?=
 =?utf-8?B?Z1ZpakJtbzBrenE2Y2NHZitPTE12M2N5T3BLTXROcjdzR1JVc0dYUC93UU55?=
 =?utf-8?B?azRXdXY4MXBqZklMWkxrUFdJMXpMeUJGNkFEN3RCeXNBaHB4aVVWQ054OHNm?=
 =?utf-8?B?OHl5MjRRZTZ3YjhoUU5FWHZjWCtXT2d6YUlRWS9PUmNEcDVXekc5Wlc1T2Jq?=
 =?utf-8?B?UmZmdjM3SHEzUERaMzlvUzNsMndPOE1HZFFCNGZVWlIxR0s5c1FCRjRBYTJm?=
 =?utf-8?B?SjVzWWR0WmhlbU1PaGUvKzU1NWF4b1pTQUNPVFJuUVZIeVVlcFdMRWxSR1Jn?=
 =?utf-8?Q?yhqo3ttovXG/NsrsxsLAPikGA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee94220-a981-48b6-5114-08dbae5885db
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 21:39:03.2214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vn5NFJ3gXc4rvsmqLRevuRUGCEmfus8JB9ph/3kN1junEHj7dN6gmArrHo7PkussjFGspV74y7XCJRWOIC4nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_143912_731718_95EFD63A 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SW4gTUlQSSBJM0MgU3BlY2lmaWNhdGlvbjoKCiJOaW50aCBCaXQgb2YgU0RSIFRhcmdldCBSZXR1
cm5lZCAoUmVhZCkgRGF0YSBhcyBFbmQtb2YtRGF0YTogSW4gSTJDLCB0aGUKbmludGggRGF0YSBi
aXQgZnJvbSBUYXJnZXQgdG8gQ29udHJvbGxlciBpcyBhbiBBQ0sgYnkgdGhlIENvbnRyb2xsZXIu
IEJ5CmNvbnRyYXN0LCBpbiBJM0MgdGhpcyBiaXQgYWxsb3dzIHRoZSBUYXJnZXQgdG8gZW5kIGEg
UmVhZCwgYW5kIGFsbG93cyB0aGUKQ29udHJvbGxlciB0byBBYm9ydCBhIFJlYWQuIEluIFNEUiB0
ZXJtcywgdGhlIG5pbnRoIGJpdCBvZiBSZWFkIGRhdGEgaXMKcmVmZXJyZWQgdG8gYXMgdGhlIFQt
Qml0IChmb3Ig4oCYVHJhbnNpdGlvbuKAmSkiCgpJM0MgYWxsb3cgZGV2aWNlcyBlYXJseSB0ZXJt
aW5hdGUgZGF0YSB0cmFuc2Zlci4gU28gbmVlZCAiYWN0dWFsIiBmaWVsZCB0bwppbmRpY2F0ZSBo
b3cgbXVjaCBnZXQgYnkgaTNjX3ByaXZfeGZlci4KClNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxG
cmFuay5MaUBueHAuY29tPgotLS0KIGluY2x1ZGUvbGludXgvaTNjL2RldmljZS5oIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2kzYy9kZXZpY2UuaCBiL2luY2x1ZGUvbGludXgvaTNjL2RldmljZS5oCmluZGV4IDkwZmE4MzQ2
NGYwMDMuLmYyZmE3ZWU1ZDk2ZDkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvaTNjL2Rldmlj
ZS5oCisrKyBiL2luY2x1ZGUvbGludXgvaTNjL2RldmljZS5oCkBAIC02Niw2ICs2Niw3IEBAIHN0
cnVjdCBpM2NfcHJpdl94ZmVyIHsKIAkJdm9pZCAqaW47CiAJCWNvbnN0IHZvaWQgKm91dDsKIAl9
IGRhdGE7CisJdTE2IGFjdHVhbDsKIAllbnVtIGkzY19lcnJvcl9jb2RlIGVycjsKIH07CiAKLS0g
CjIuMzQuMQoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
