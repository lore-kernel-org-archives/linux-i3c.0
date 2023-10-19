Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D9FCDB465
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Oct 2023 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwf8mb5CQZoXdc0vIqMWUQwZOfGUkYSqM0xcuP6a2ZY=; b=L9mvljZZA2grk2
	TU2vUsxSeVoiat0RgItHWUWQ8YtgofvlqgxaFqfpMVhklDxjtlKjND5RN703vwpxde1oAQwE7CIBh
	YQgqE+PvnKNqejtZczQaY0G92zbZppwkwnkHJamJ7hJ/wzAqopR2fWiMKlhNZX+1iuogWFbFEwo6C
	R+cOhBmrpTtBwtAMf2dMtFkMunpGDZw0XPejRGWQ5Pg0uJ5W9AJRSKMdOhWyA4AefXEIcovvCzSHC
	YwYV7jbW64l7kuTQuqUMij8OfJmCrQ3eOZdt6G+R2KurYaFtK1qVEJyXSZXBOE8h6WYPDUuW6Kf8W
	SKTmO1wow7eqg4xy6GDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtV7t-000Dhx-3A;
	Thu, 19 Oct 2023 15:39:57 +0000
Received: from mail-db5eur01on0623.outbound.protection.outlook.com ([2a01:111:f400:fe02::623] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtV7r-000DhR-2d
	for linux-i3c@lists.infradead.org;
	Thu, 19 Oct 2023 15:39:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItL7/vkZbU/LBV5N7pHI0ew9Vy9ERXd6KDup8X3Run5Ign4tY1guKSsUJM70TJzqybWZf6BTikjvbiTv+6aR69VK96fd59SLlbO9Vs1Hpq487yCa66MZpJ6AcnpvxgXTu3lFSvF10vntlAfvRbTuurho/Ji1gJRqiPAR4aWHQqriAFxoezTqjVmYehZy0keQ8TaZk04+7V/VrW74h0DjFtdb6zCMZ3tzelcZSTzFhBWS+bII3QMMNZPyqLfppeoEZ7wGcYxIc+jvU80hnvmu8GoXuKnE2W7xD5yircqtFXlV3N1Ut50q4ECAtOKf5LqAQJO357AXl9h0qmbo+jQvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSmT55J/U0Cc3T5W7bpRh6gVDScINUp0DW/nzVpCVlU=;
 b=EphP0aRRMmp2lPVnwLzoWhdsteSYJCdJ4HgfYYZjcShps7dRwoSwatZ0IqCGWS3PMoiLJzk3rxAHu8c+OevOWNH6VaHReqqz2kKHCPdt3RXWTYf0TBj9GSLNtGCF0hIJKwcc5KLo/a1e1hsQbmSq2fjLHmS2gKrQq5cdMGyJFmBAe7M4oAAwq9sp7sZS5uAIykosVoEYnl56BRxOpLCrLwq1LNHzMfOtNYhqiG852B2dtuydYJDicuvuPlqu9ReOz9ppqgjCapSay85RaEp0Hctvus+AwIw7j3NAeJOSJ+NJTo0NdTUuDmLe3XFd2L6LcCbJBtwKdktOA0ZqN4augQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSmT55J/U0Cc3T5W7bpRh6gVDScINUp0DW/nzVpCVlU=;
 b=P1mrmTpSbbx0Z/yoZSRg5/XcTUytAsr6CtjoQ4VDtqoowlua8T9qntj/eBJ9S4d8sHA82iyNyZ1EoAczypYOrbi9FHDun2bDgkf36V729NhaEmSVYc0brrqoQLbBjGQTS5ce/I/qZDSpEAhxepFHnnW3iY9pXW+pMzxdc1kPh/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by VE1PR04MB7230.eurprd04.prod.outlook.com (2603:10a6:800:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 15:39:50 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 15:39:50 +0000
Date: Thu, 19 Oct 2023 11:39:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
	imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 Resent 6/6] i3c: master: svc: fix random hot join
 failure since timeout error
Message-ID: <ZTFNvrsSoHOS3P2g@lizhi-Precision-Tower-5810>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
 <20231018155926.3305476-7-Frank.Li@nxp.com>
 <20231019084452.11fd0645@xps-13>
Content-Disposition: inline
In-Reply-To: <20231019084452.11fd0645@xps-13>
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|VE1PR04MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: eb32f40e-9900-4510-5083-08dbd0b9a1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gstARcAsWZ8gC0ogodJuHlbbP3QCsylMFPGGAB4eXbjaqZtkya3TtqYNgELZPkFCD8jnQgHNAjXZjlS8w7IB9w76yNFxniImURMNerIOyudg+fmedBQ6ZLzT82ovc0B7HCjilBj5+g4AtnpfO5DmGvo22SbMdlNwf0EyGwDZbGbWXY3EjrTqQ1cUqKyWVx35aFDg+pctxyegbUHZP1i5X1M40m+Tsu0uO8LUeaM/HNJ1/73UdMm59D5GvmzGuUL4MiR0Y24bh5M6ujofi9uQQL3D2xXHH0KfWokZIq3nsg87hj5gG8cZ5WwOIAiIaKdu9gxfE3KBc0tvN5WoGNsWv3IsoNjrQ29w8yXeEK4Jc6WhtsgeTWylhRibNTBJan0Ks17dz2gQPzROPqtgA5wfhe2luBI3ZryiOjP2HTFc1Y4xYj9OJiXYyHUw2fGl2tV6ZRYUEi2CRAP/mQKqw2ANmH6EEHRLjBehEgm35qOX++08fYCgCEIJuQhIiiGuvU5Wipu4Mo/qaUQiiJTCpbq5vkmPLQUS8LhYuYxDVNjGHOWJpqUWoBXss5dLhrlugg1jEnZ0zCfhw4Iu/rqHIHP7o88aZffcKqLBwVWh60ELlYIClaTP68tK8pYY1jJ3tyyB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(136003)(39860400002)(366004)(376002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(83380400001)(38100700002)(38350700005)(316002)(9686003)(33716001)(6512007)(86362001)(6916009)(66476007)(41300700001)(5660300002)(2906002)(66556008)(66946007)(8936002)(478600001)(8676002)(4326008)(52116002)(6666004)(6506007)(6486002)(66574015)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXU1V09DbWllQzQ5eWxFelpVMVF2NVlLTUZwUGhsNktkTHByaXpGZ3lyTGNT?=
 =?utf-8?B?dUo3SzhXeEZhbWl1ZmFqZUp3RE5iWnFJalRsbk1SdGtraGpHdk8rUzZpZzdo?=
 =?utf-8?B?L0Zkem1xK2ErWkVubGxqY1dQK3B6c3o3Z29wa1d5MDVmV0FQemNZL2hJNG81?=
 =?utf-8?B?NnkxNWlINllNU2RTeElEUFFlWWVCUUJCTFJVWmk0aGd5UXIzcmo2VWNYTy8r?=
 =?utf-8?B?T01neHlENUdHWVdkOExuR0xHRGV4eWdxTzdhcklKcHpUR3hWY0p6ZWJNcUto?=
 =?utf-8?B?YUp2QXI4NmhIS3lWMlVrMDZxdC9NTE0wRWNBejF6dGZ0eHBaZVFabzVQVUx2?=
 =?utf-8?B?aXRXN3ozSVl2Z0NGK0lVeVhmOTBWUXZnQ1pMcVYwblNVTGJTSms5RFltdnNI?=
 =?utf-8?B?RTBBM3ljL0hXMi85M2k1MmRhSCtQR1JWYTBrSzJmWnJwRlBjLzh2WEVvNUtn?=
 =?utf-8?B?UlBiTG1UUnRPUnBOTUpaMFJOOHRvbm9ERGN2aU1UaHRHSUFDL3RjREhzdkR2?=
 =?utf-8?B?MEpWejBYRHRaZ2Q1Tk8wNW01dHE5N1p6MTMvSmxTSXI4QlhQdUdvNGdQZ1FT?=
 =?utf-8?B?dllNYUVObFJOVThyaUJPOFI5ZDhQbHhFbXppSEpFRldxTkNsRXV0TE51NTB0?=
 =?utf-8?B?SFhtdmRFMk85eno5NlRXWGR2Yy8xMmpieGJqdEowWFBHMVphMnB0ODFDOFlT?=
 =?utf-8?B?TFZxRTNCbTRuR0N0OFhINFJPamVldVZwYzgxSjRvUm5WSU53a1gvQWNXcVda?=
 =?utf-8?B?RmxVOVE3QWVQNkFCd1lmeVY4eTd0d3BjK3ZOR2FrbjR1anVQcDVhK2tFZSsx?=
 =?utf-8?B?SE4zWnNHTEhnOTFHUWM4K3JQMjZBbjRIbFAza0cvVkZuVGtTa1VLN1Q3SERK?=
 =?utf-8?B?b3MwZlZ1eFB4MjFEWVVuWUFIZFpVMXBRWmlUY056YUwxSEpTb2dKSEgrSStD?=
 =?utf-8?B?T2JaRXNTY0Uwc01vSVRQa21KajA4QzRacEh3RGNoNmp2bWNUZEZldTluMkt3?=
 =?utf-8?B?Q1JBWEg1SjZMV3gvUFF6aGg3ZWpQWGRWUzduY1BnUWJSSFhaZjBNN0lzUHB1?=
 =?utf-8?B?c0pxNUgzOHp0Q3RYaTRlSGQ4Vkp0Tk5oMlNpVmZoVmFNZ2pKUE96eFVpR0lP?=
 =?utf-8?B?VXY4aFdZOENyVUxQSm8yL0JGR2czZTZqMGhCK0dIbmhJVTE5b3hXTWZXTUxa?=
 =?utf-8?B?UzRtTksvcjgza3IxeUFUQnBuU1FvTU91a1BKSXBuUVZCUlNITVQxVlVNV1RE?=
 =?utf-8?B?SWRKZjgrTlFuMjhIR2tRRWZnb3QxZE5zQjhCL0grelJ1WStIMDkzdTB6Y3N1?=
 =?utf-8?B?amxZRmlYWlJmQ0hiemYxZmUrTldpRGx6NmRYTkIxZDFycFlWbm1BU2RVRHpC?=
 =?utf-8?B?Z01YMURuYW80MjZpNlNpTUJaZkgvR1hGYVMydlc1czh1dmpDL1ZZeVZZYW9m?=
 =?utf-8?B?SDV4SnRXQmFVODM5MjkwQ0JNaWtQTUh0Yk5lVEJuRjVGNU14bllNWVY0QWxJ?=
 =?utf-8?B?NUFWejI5MWwvRk1PNFNyeFVUeXhMZkNpT1ZOUmVMenRNUjhrUzNvdHJ0aVI0?=
 =?utf-8?B?MU1VcG9pTVNXWWdIaXBzSnNMaUhkc1VzUWhOUi9sRnd6UnJPMXl0ZWtxZmY2?=
 =?utf-8?B?RWZ2WWdOOEIvMnBTb1lZWW9aT05MeXZQT09BSmxPSU1rOGhMMUZXNUxaYTVo?=
 =?utf-8?B?T1J4eUNzeVdWVU16MEZqeDRjcjRSbkNNbEd1azBVM1BNUVlZbXdDVnFyWExm?=
 =?utf-8?B?SStFd01Od1BDTkVZSzZkUEYzVUJTVC9DTHBLVTArSnNxOGQ1cElHbkpYSjVn?=
 =?utf-8?B?RC8zZktTZGE3c3Fza1VXS0grQ0lLamkwZUtwajlwVXlrN3BnUGtvOFEwSU5C?=
 =?utf-8?B?aGQyVHJ5alVtck80Wm1kZGY1TUkzN3Q1ZFdTaXlEUnowK0pGbzlSY3JtTTMv?=
 =?utf-8?B?aFNVSm1ETGNLYTIzVk5MR3E1TTU0QWg0TGRTRGFFRzgzTGJGY051MDJNN1pk?=
 =?utf-8?B?N3N3eFZzS1ZBWlN3V2w5SzFFRXVyMGhQNklSU21LSUlBL2JaTTZyR1J3djF4?=
 =?utf-8?B?YU1XWU9RRnU3bjdQZ1RVR25lNWcxY0NRbEJxSFlMV3hVYng3UlVLNjNsT2Jn?=
 =?utf-8?Q?4HQo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb32f40e-9900-4510-5083-08dbd0b9a1c6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 15:39:50.5911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqxGGvVPz3xzpY2HH9CmJkifZQFc0+iKNazBd1RdGiSgnCoDfncayfbAxGK/ujQonM0BKKETu2d309q+BaV4dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_083955_859938_08BC40C4 
X-CRM114-Status: GOOD (  28.69  )
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

T24gVGh1LCBPY3QgMTksIDIwMjMgYXQgMDg6NDQ6NTJBTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSBGcmFuaywKPiAKPiBGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMTgg
T2N0IDIwMjMgMTE6NTk6MjYgLTA0MDA6Cj4gCj4gPiBtYXN0ZXIgc2lkZSByZXBvcnQ6Cj4gPiAg
IHNpbHZhY28taTNjLW1hc3RlciA0NDMzMDAwMC5pM2MtbWFzdGVyOiBFcnJvciBjb25kaXRpb246
IE1TVEFUVVMgMHgwMjAwOTBjNywgTUVSUldBUk4gMHgwMDEwMDAwMAo+ID4gCj4gPiBCSVQgMjA6
IFRJTUVPVVQgZXJyb3IKPiA+ICAgVGhlIG1vZHVsZSBoYXMgc3RhbGxlZCB0b28gbG9uZyBpbiBh
IGZyYW1lLiBUaGlzIGhhcHBlbnMgd2hlbjoKPiA+ICAgLSBUaGUgVFggRklGTyBvciBSWCBGSUZP
IGlzIG5vdCBoYW5kbGVkIGFuZCB0aGUgYnVzIGlzIHN0dWNrIGluIHRoZQo+ID4gbWlkZGxlIG9m
IGEgbWVzc2FnZSwKPiA+ICAgLSBObyBTVE9QIHdhcyBpc3N1ZWQgYW5kIGJldHdlZW4gbWVzc2Fn
ZXMsCj4gPiAgIC0gSUJJIG1hbnVhbCBpcyB1c2VkIGFuZCBubyBkZWNpc2lvbiB3YXMgbWFkZS4K
PiAKPiBJIGFtIHN0aWxsIG5vdCBjb252aW5jZWQgdGhpcyBzaG91bGQgYmUgaWdub3JlZCBpbiBh
bGwgY2FzZXMuCj4gCj4gQ2FzZSAxIGlzIGEgcHJvYmxlbSBiZWNhdXNlIHRoZSBoYXJkd2FyZSBm
YWlsZWQgc29tZWhvdy4KCkJ1dCBzbyBmYXIsIG5vIGFjdGlvbiB0byBoYW5kbGUgdGhpcyBjYXNl
IGluIGN1cnJlbnQgY29kZS4KCkluIHN2Y19pM2NfbWFzdGVyX3hmZXIoKSBoYXZlIG5vdCBjaGVj
ayB0aGlzIGZsYWdzLiBhbHNvIGhhdmUgbm90IGVuYWJsZQpFUlJXQVJOIGlycS4KCklmIHdlIG1l
dCB0aGlzIGNhc2UsIHdlIGNhbiBhZGQgbmV3IGZ1bmN0aW9ucy9hcmd1bWVudCB0byBoYW5kbGUg
dGhpcy4KVGhlbiB3ZSBjYW4gcmVhbCBkZWJ1ZyB0aGUgY29kZSBhbmQgcmVjb3ZlciBidXMuCgpX
aXRob3V0IHRoaXMgcGF0Y2gsIHNpbXBsZXN0IGFkZCBzb21lIGRlYnVnIG1lc3NhZ2UgYmVmb3Jl
IGlzc3VlClNWQ19JM0NfTUNUUkxfUkVRVUVTVF9BVVRPX0lCSSwgVElNRU9VVCB3aWxsIGJlIHNl
dC4KCkFuZCBzdmNfaTNjX21hc3Rlcl9lcnJvcigpIHdhcyBvbmx5IGNhbGxlZCBieSBzdmNfaTNj
X21hc3Rlcl9pYmlfd29yaygpLgpTbyBJIGNhbiB0aGluayBvbmx5IGNhc2UgMyBoYXBwZW4gaW4g
c3ZjX2kzY19tYXN0ZXJfaWJpX3dvcmsoKS4KCkZyYW5rCgo+IENhc2UgMiBpcyBmaW5lIEkgZ3Vl
c3MuCj4gQ2FzZSAzIGlzIG5vdCBwb3NzaWJsZSBpbiBMaW51eCwgdGhpcyB3aWxsIG5vdCBiZSBz
dXBwb3J0ZWQuCj4gCj4gPiAgIFRoZSBtYXhpbXVtIHN0YWxsIHBlcmlvZCBpcyAxMCBLSHogb3Ig
MTAwIM68cy4KPiAKPiBzLzEwIEtIei8vCj4gCj4gPiAKPiA+IFRoaXMgaXMgYSBqdXN0IHdhcm5p
bmcuIFN5c3RlbSBpcnEgdGhyZWFkIHNjaGVkdWxlIGxhdGVuY3kgaXMgcG9zc2libGUKPiA+IGJp
Z2dlciB0aGFuIDEwMHVzLiBKdXN0IG9taXQgdGhpcyB3YXJpbmcuCj4gCj4gVGhpcyBjYW4gYmUg
Y29uc2lkZXJlZCBhcyBiZWluZyBqdXN0IGEgd2FybmluZyBhcyB0aGUgc3lzdGVtIElSUQo+IGxh
dGVuY3kgY2FuIGVhc2lseSBiZSBncmVhdGVyIHRoYW4gMTAwdXMuCj4gCj4gPiAKPiA+IEZpeGVz
OiBkZDNjNTI4NDZkNTkgKCJpM2M6IG1hc3Rlcjogc3ZjOiBBZGQgU2lsdmFjbyBJM0MgbWFzdGVy
IGRyaXZlciIpCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVkLW9mZi1i
eTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gPiAtLS0KPiA+IAo+ID4gTm90ZXM6Cj4g
PiAgICAgQ2hhbmdlIGZyb20gdjEgdG8gdjIKPiA+ICAgICAtbm9uZQo+ID4gCj4gPiAgZHJpdmVy
cy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCA2ICsrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21h
c3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVy
LmMKPiA+IGluZGV4IDFhNTdmZGViYWEyNmQuLmZlZGIzMWUwMDc2YzQgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gKysrIGIvZHJpdmVycy9p
M2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiA+IEBAIC05Myw2ICs5Myw3IEBACj4gPiAgI2Rl
ZmluZSBTVkNfSTNDX01JTlRNQVNLRUQgICAweDA5OAo+ID4gICNkZWZpbmUgU1ZDX0kzQ19NRVJS
V0FSTiAgICAgMHgwOUMKPiA+ICAjZGVmaW5lICAgU1ZDX0kzQ19NRVJSV0FSTl9OQUNLIEJJVCgy
KQo+ID4gKyNkZWZpbmUgICBTVkNfSTNDX01FUlJXQVJOX1RJTUVPVVQgQklUKDIwKQo+ID4gICNk
ZWZpbmUgU1ZDX0kzQ19NRE1BQ1RSTCAgICAgMHgwQTAKPiA+ICAjZGVmaW5lIFNWQ19JM0NfTURB
VEFDVFJMICAgIDB4MEFDCj4gPiAgI2RlZmluZSAgIFNWQ19JM0NfTURBVEFDVFJMX0ZMVVNIVEIg
QklUKDApCj4gPiBAQCAtMjI2LDYgKzIyNywxMSBAQCBzdGF0aWMgYm9vbCBzdmNfaTNjX21hc3Rl
cl9lcnJvcihzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlcikKPiA+ICAJaWYgKFNWQ19JM0Nf
TVNUQVRVU19FUlJXQVJOKG1zdGF0dXMpKSB7Cj4gPiAgCQltZXJyd2FybiA9IHJlYWRsKG1hc3Rl
ci0+cmVncyArIFNWQ19JM0NfTUVSUldBUk4pOwo+ID4gIAkJd3JpdGVsKG1lcnJ3YXJuLCBtYXN0
ZXItPnJlZ3MgKyBTVkNfSTNDX01FUlJXQVJOKTsKPiA+ICsKPiA+ICsJCS8qIGlnbm9yZSB0aW1l
b3V0IGVycm9yICovCj4gPiArCQlpZiAobWVycndhcm4gJiBTVkNfSTNDX01FUlJXQVJOX1RJTUVP
VVQpCj4gPiArCQkJcmV0dXJuIGZhbHNlOwo+ID4gKwo+ID4gIAkJZGV2X2VycihtYXN0ZXItPmRl
diwKPiA+ICAJCQkiRXJyb3IgY29uZGl0aW9uOiBNU1RBVFVTIDB4JTA4eCwgTUVSUldBUk4gMHgl
MDh4XG4iLAo+ID4gIAkJCW1zdGF0dXMsIG1lcnJ3YXJuKTsKPiAKPiAKPiBUaGFua3MsCj4gTWlx
dcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1p
M2MK
