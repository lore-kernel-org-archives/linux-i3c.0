Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236B7C47258
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jan 2024 22:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G3rVbuRSAsSYRg4TcJ8Z8ZNRhLh7ZEM6pIUaURJNKhk=; b=gsP6QX5aOok+2q
	wyL30BwlZd25y7H5p05AqPP4WD+ryscPp3uFwBUjtbOV4ibh5BHeDQiK8SlUAlE0nvvVj8yEsJhp+
	2VfIA2d5/Ra7MV4FTsuQ29qpq/GfMr5NXzbGB4CgeJ/GwkhbXFxExwVXBlKOymvs+CxlVrejOyQHg
	bhVEqhlq/wuFZ4pXf12qOsPRMeGFB18D6qXuyjptZLdy4J7rJ8GXXK/0qxcRMgE9nqVF70j5jUefa
	Jku3Pfcy0DFhvwUepG0xIYxwvUjc/Lx/CY+s8zCu0hHMfdu7ct1tsGW4eg6qLD0Vg8YIYrjnPeGCE
	PFng+ra+vbFVzp5IDmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQEk8-000zeR-0m;
	Wed, 17 Jan 2024 22:50:44 +0000
Received: from mail-dbaeur03on20600.outbound.protection.outlook.com ([2a01:111:f403:260d::600] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQEk4-000zcr-2S
	for linux-i3c@lists.infradead.org;
	Wed, 17 Jan 2024 22:50:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpQXnHykO7PcqPtkAsa+Vod+EOKVStsr7e6P1w8001NPk71jp3PI27q4CWdf4gsntk6QtmDMwySWi7AmRUzjS8snwZI/BiHvVPVBAl2Be/Q3I973d7bvOpvGDAFhouxqzk1XaL+nKpb9fXp/+ZiV2ben5lsVNPX+4g1OITXA4kVydVk/jI/NVLKBMyR62fJ4gQyLvkkVDa0rHqlcCVYB/ZHMj00O/mh394MZR5RR2vpDuEHzKd3pDPKSPbHWwd0S9vcu28Tl84czDFjcdc4y9Fol/AbNNWhFznLoYyhIEjgYtyLfxkGBURcC9J4+yS148WSIqQQYl46ek3nwA3h+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOtJ80JffkOgKKh0YsiAty6fMdEIu6BMNilzlP9Ml1Q=;
 b=gZgg5p+8juWVErVDL1yMs4UxLgtqm4pwhKruhdDCAXC7PcPrngRclHKnFlUZDyUW3LZEBAuRNB2rneRXM1ZzLtoX6YSzUV3ymcUbZ3q17XzmbZVMHhly7UtEDN8LVy4jDo5fuuAVZwvoWRDd3tY6itMUIWl+F8GMrkOAULh8A1vwRRPRkw2+miOUxXxKBvrAHD29JuOHfvDpEGNyyePZzaSpAsYj5TUN769ylkpVrXqCbGvowtgd0DvuRgKuMNVKXvh/GyNFjVjlvF7BcSj3jzKgN1mdGJ0vX8VkTlKOVtf3yWO7RycmpkBnVQTyyfrNJqKG83UioG4zOHUPFSAxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOtJ80JffkOgKKh0YsiAty6fMdEIu6BMNilzlP9Ml1Q=;
 b=d3WE/Y9xc0Bm1ZX1zsl52tlMD+yd3o60pW/UPKxAqyYhvYQfk0QAv7EWVG2GglewgW/KbEBjHxNehEEzj6d2MAEhDpMFxuY+mDIk3zdKjHz0dL0pWsJ7ha3Z2EEE5MX1rVqwSO7N1dOMPoqS3OYJdCqOkbgpgJuzM/Quy+ws79c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7714.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 22:50:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9%4]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 22:50:27 +0000
From: Frank Li <Frank.Li@nxp.com>
To: imx@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org (moderated list:SILVACO I3C DUAL-ROLE MASTER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] i3c: master: svc: add support for read len bigger than 255
Date: Wed, 17 Jan 2024 17:50:09 -0500
Message-Id: <20240117225009.2931699-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: 56823d9f-eebb-49f4-0e37-08dc17aeb2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Et8ZPyxUH+7YaOWaymfsCYF4SRUbvhKqlqoGu4+44XE6GBck5vGxNVC3YQSTP//av8gDH60immdoDKlj5nVoKfP4MwhaMx54ULny/bOnnNZmPRzEU4o3tX+3m1dzGombjvXnbQF5OwfdAxAYh+DKU9aB4fTFvyq2zOARDZRp2Skgk5YJMWN1Ndn0lwXpjBl4XkXrPePctuyuMhSCn+kh7vYte0XbW+1KmLuWtK2DacnZjIBlSXi8kivzjX3SkFXFRZ5sWxADdvBNBXjR1DwGxG690TyvgVW139C0Zfpz2TPyYt6jqxMKxHKwVNVsFGHAYFgIIQcWzQd6oGNPDBDGt8pcGSmVs/YeK9y5BJEGWATVlWrnQ0FGgknUDz1YJNjNBlmrb+NHQo3LFbdPWmpcYO5cHwMOM9thPsDeoq3SSCjKZXOv+GQfRdP/pqgISdaZLiYmzO2uuO0v15SLKigCi0wm1Uof4Xce/H9QzHEivF87Xt0zrVHKs41snadpmUZiNXjtsakMpaHE8Wk2tuUYR6t8XluOHnJqPA0GW8HCrfEtYMCbU9VQrFvv0OacCE5JSNAHwyOrxiRecx7g/YA5NqmJ+CES8IdCcgrOepsV1GZ2458QV8OuTBLDZtrmQAontOVqhKm3RqKKRTmRMek6n66j6YSBkwYgxYzTOlxHir8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(366004)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(8676002)(8936002)(36756003)(2906002)(41300700001)(86362001)(38100700002)(38350700005)(5660300002)(6486002)(52116002)(2616005)(6666004)(6506007)(26005)(1076003)(478600001)(83380400001)(6512007)(110136005)(66946007)(66556008)(66476007)(316002)(135533001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2dFRmMwVlllazliQU9XRERDNzBNK1g1TXpoMC9HdG5GREk5YlEzUG9JR08w?=
 =?utf-8?B?cVhreVREejJ0MU1lclJhRUxndHZveEV0UTFwNGJYa2hZMlNpa1BJeWQ3V2g2?=
 =?utf-8?B?SE9HcmpzWDVGY2FzOGoyZUFra3FHYmFvRmZwRTNSWEtPaWl4QUZ6NXFaMUFK?=
 =?utf-8?B?MTcvK3Z2Z2s1Um4xZTRBYVY1TlJwZUl4WG9ZeG01YUVmRG8yWC9Va3hKbUVW?=
 =?utf-8?B?MGVLRGxxMFNGWVc1bXJtOFQreXNKVWZyQ3dSMUdUeGpIbVNVRWQ1OUx1SHVD?=
 =?utf-8?B?RlVmdDVSTDZab1Yybk1JZVZkbUFIcFFyTHhVc0dOSU9idUdhT3BFUFMwY2VY?=
 =?utf-8?B?cnY2YTRVWDlMTkQxTXF6Zk5STWFCODJqUEhZaG1kamU5ci9WMTl3ZG52NjZS?=
 =?utf-8?B?OXFVNXJXT1R1bkhaeUo1MjNUTUM4eXkwZ2VUamwveE5RcnJ5NjNmT3Rsc2RH?=
 =?utf-8?B?dEhwazNhMDNTdXpKdjg3YUxjT0w5SG5HcW5oMVNnL2x0Nm16ckkwcEUyTGVL?=
 =?utf-8?B?dmxDc1VkMVNHdGJsWktaOXJaMENvVkYrOERKblNycElJeG8vQU9DQXppaGx3?=
 =?utf-8?B?WnlnVmNNbnVwNzYyNndDYzQ1U2xpTE5PcUNBckJETTlKYkdmNjVFSFlHTzA0?=
 =?utf-8?B?VG9jSTdDaXVVNksvaE12SVlyQ2VVZWRIWVg5VnJYTkNDMHUrL2g3M004OTRj?=
 =?utf-8?B?eDRCa1c4OXpMd0Evc0R3UVRuaGxqRG9PZWJvWDllY2VteFZCWUY2cUVZZGhC?=
 =?utf-8?B?UXV6UXVBTm83bHZLbmlVczZyMzk2OWtIRGxQQnUwbnJETjRJT2FsaVVlOUhv?=
 =?utf-8?B?NENSVkF4YVpkSytQRUM5bGdiUzVCSU41U1NCTE03dG9ZRk1pUXM2QXhra3A0?=
 =?utf-8?B?QjJuVFA0djMwa1E0c1pwOXFkSlBwZnAyZmZIUmwyMnl5NGhqcGdTQXlhekpz?=
 =?utf-8?B?ZFA3Y1Jud0ZjU2RSelpmSWJneG95SG11UE5oRUx0Vjk4RWIzRERMRXJOaTRT?=
 =?utf-8?B?WjlscHN0VURKUzJ0eGZvdHcrbFRTWW5jNWN6aGcrcEx5VkhndWlrTmRRSTJU?=
 =?utf-8?B?bGVSc0J5aTJSODQyQmQ0ei9qelVreGpOR1k2ZUUxdndiWXQ2RERVT2FCQ2ZB?=
 =?utf-8?B?aUJWQnBkRUxkNDBYOTVqNjAzQjZESEwyQ3Y4MmF3Ym9seXRHRGhvSFlXTFhH?=
 =?utf-8?B?YjVUSDRvbysxK1RrRTlhbk42U096UnF0S0hPMGRVU1hLNTZnRzVpanJVblM2?=
 =?utf-8?B?Ty9WTXZCbEhVUHdBYmVRdVpFSUMrT09EVjRwUlpaQU9UZkZ5bUlreEFKeGkv?=
 =?utf-8?B?ZVdBcXNGZG1EZ25lUmFYeGZ6UXRuT1ZGcTMzQnkyU1FUTW1WS2h1eldraXJW?=
 =?utf-8?B?bjFjTWNrNUlKdk03WUs4MEgwaTRyanZYcit5Q2R3eHg4WWRDemV5OTdLd1pV?=
 =?utf-8?B?L3NzR2E1ZmtWNjBTM0FMOUtmVFcvK01UNUhzZXd1VGd3M1A4NmV3ZGhVSWhK?=
 =?utf-8?B?ZjM2QW4xcDNSVjJlNFJIeXFvU3pwMmR1M2lJODI1bW14ZG1DbTJmNUhEN29E?=
 =?utf-8?B?MnhQcGVJUVJ2Y1d6OG9GT3BCYmZUc3NXL2VDOWd5b2VaWndpRHhjYnpNcmNl?=
 =?utf-8?B?ZVBuOGxWaTdneXFiV0g0d09qczZzcXNFOGR3MEJBNzd6QzB2clB1Vys2Q25q?=
 =?utf-8?B?UGdmSWFaWHJsbGYvVkJLZ3BvaUNDRjhqZVFiWlUweXk4OUlTdTJQN1VLM0Vh?=
 =?utf-8?B?dThmLy9vZEd6QUw5ajh4VHBBdkRuUTQvMG1mV0g4U1IwZGh2MUV2TS92K2lx?=
 =?utf-8?B?Z1c5OW1KYUowbHpLTWUwU2FNOUw2LzlkTWgxRjVkRnJlbXgzbUdHV3h5MVg5?=
 =?utf-8?B?aTA2WWlzMXBzdHZEVDRLV1NKNUk4QTk5cHdQK1hZQVRoc2VjbTI2NzV5LzNT?=
 =?utf-8?B?V0szZjRXcWVZY0FMWDZ1eDYvL05JSUtCUVlaTUFUL3FBdnFBWUo1RngzVDZG?=
 =?utf-8?B?SXIyTHV3bmRnUVZFZDJ2bFlQUzV5TFc4OUVwY043NFNMRFFBVzVKMklqRVlW?=
 =?utf-8?B?T2tYZUZSMS9taFE5VmlVbGhpL1g3QmwxZU9EbFlTYUlRS3BsRmx1VXBSUnB3?=
 =?utf-8?Q?e/yJ2aJ1S8SNTh18jwOn+8NyN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56823d9f-eebb-49f4-0e37-08dc17aeb2e7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 22:50:27.4826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXhD9QJDnHgEKJq4JopFiF3it0FGFSfFjmDS9j6SCupR4LOXs4+HxKHCaDcL6JAdQrSPUkYqoFxEczKYQq3qXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7714
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_145040_823914_BC625AE6 
X-CRM114-Status: GOOD (  14.85  )
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

UkRURVJNIGlzIDhiaXQuIE9ubHkgc3VwcG9ydCBtYXggMjU1IHJlYWQgdHJhbnNmZXIgZm9yIGF1
dG8gdGVybWluYXRlLiBVc2UKbWFudWFsIHRlcm1pbmF0ZSB3aGVuIHJlYWQgbGVuIGJpZ2dlciB0
aGFuIDI1NS4KCldoZW4gbGVmdCBkYXRhIGxlbmd0aCBpcyBGSUZPIHNpemUgKyAxLCBpc3N1ZSB0
ZXJtaW5hdGUKKFJEVEVSTSgxKSB8IFJFUVVFU1RfTk9ORSkuIFNvIGhhcmR3YXJlIHdpbGwgc3Rv
cCBmZXRjaCBkYXRhIGFmdGVyIG5leHQKZGF0YS4KCeKUgiDil4TilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIAgIGJ1ZmYgbGVuZ3RoICAgICDilIDilIDilIDilIDilIDilIDilIDilIDilrri
lIIKCeKUgiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKUggoJ4pSCICAg
ICAgICAgICAgICAgICAgICAgICDilIzilIDilKzilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilKQKCeKUgiAgICAgICAgICAgICAgICAgICAgICAg4pSCIOKUgiAgRklGTyBT
SVpFICDilIIKCeKUgiAgICAgICAgICAgICAgICAgICAgICAg4pSU4pSA4pS04pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYCgkgICAgICAgICAgICAgICAgICAgICAgICDi
lrIKCSAgICAgICAgICAgICAgICAgICAgICAgIOKUggoJICAgICAgICAgICAgICAgICAgV2FpdCBG
SUZPIEZ1bGwgYW5kIElzc3VlIHJlYWQgdGVybW5pYXRlIGhlcmUhIQoKU2lnbmVkLW9mZi1ieTog
RnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Ci0tLQogZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1p
M2MtbWFzdGVyLmMgfCA3NiArKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2
Yy1pM2MtbWFzdGVyLmMKaW5kZXggNWVlNGRiNjg5ODhlMi4uNTgwNDdhZDM1Nzc5MSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKKysrIGIvZHJpdmVycy9p
M2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKQEAgLTk3Nyw3ICs5NzcsNyBAQCBzdGF0aWMgaW50
IHN2Y19pM2NfbWFzdGVyX2RvX2RhYShzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptKQog
fQogCiBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX3JlYWQoc3RydWN0IHN2Y19pM2NfbWFzdGVy
ICptYXN0ZXIsCi0JCQkgICAgICAgdTggKmluLCB1bnNpZ25lZCBpbnQgbGVuKQorCQkJICAgICAg
IHU4ICppbiwgdW5zaWduZWQgaW50IGxlbiwgYm9vbCBhdXRvX3Rlcm0pCiB7CiAJaW50IG9mZnNl
dCA9IDAsIGk7CiAJdTMyIG1kY3RybCwgbXN0YXR1czsKQEAgLTk5NSwxNiArOTk1LDYwIEBAIHN0
YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfcmVhZChzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3Rl
ciwKIAkJCXJldHVybiAtRVRJTUVET1VUOwogCQl9CiAKLQkJbWRjdHJsID0gcmVhZGwobWFzdGVy
LT5yZWdzICsgU1ZDX0kzQ19NREFUQUNUUkwpOwotCQljb3VudCA9IFNWQ19JM0NfTURBVEFDVFJM
X1JYQ09VTlQobWRjdHJsKTsKLQkJaWYgKG9mZnNldCArIGNvdW50ID4gbGVuKSB7Ci0JCQlkZXZf
ZXJyKG1hc3Rlci0+ZGV2LCAiSTNDIHJlY2VpdmUgbGVuZ3RoIHRvbyBsb25nIVxuIik7Ci0JCQly
ZXR1cm4gLUVJTlZBTDsKLQkJfQotCQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykKLQkJCWlu
W29mZnNldCArIGldID0gcmVhZGwobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NUkRBVEFCKTsKKwkJ
aWYgKGF1dG9fdGVybSB8fCBjb21wbGV0ZWQpIHsKKwkJCS8qIGF1dG8gdGVybWF0ZSBvciBlYXJs
eSB0ZXJtYXRlIGJ5IHRhcmdldCAqLworCQkJbWRjdHJsID0gcmVhZGwobWFzdGVyLT5yZWdzICsg
U1ZDX0kzQ19NREFUQUNUUkwpOworCQkJY291bnQgPSBTVkNfSTNDX01EQVRBQ1RSTF9SWENPVU5U
KG1kY3RybCk7CisJCQlpZiAob2Zmc2V0ICsgY291bnQgPiBsZW4pIHsKKwkJCQlkZXZfZXJyKG1h
c3Rlci0+ZGV2LCAiSTNDIHJlY2VpdmUgbGVuZ3RoIHRvbyBsb25nIVxuIik7CisJCQkJcmV0dXJu
IC1FSU5WQUw7CisJCQl9CisJCQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykKKwkJCQlpbltv
ZmZzZXQgKyBpXSA9IHJlYWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTVJEQVRBQik7CisKKwkJ
CW9mZnNldCArPSBjb3VudDsKIAotCQlvZmZzZXQgKz0gY291bnQ7CisJCX0gZWxzZSB7CisJCQkv
KgorCQkJICogQ29udHJvbGxlciB3aWxsIGZpbGwgd2hvbGUgUlggRklGTyBpbiBtYW51YWwgbW9k
ZS4gRklGTyBmdWxsIGNhbiBwcmV2ZW50CisJCQkgKiBjb250cm9sbGVyIGNvbnRpbnVlIGZldGNo
IGRhdGEgZnJvbSB0YXJnZXQuCisJCQkgKgorCQkJICogV2hlbiBsZWZ0IGRhdGEgbGVuZ3RoIGlz
IEZJRk8gc2l6ZSArIDEsIGlzc3VlIHRlcm1pbmF0ZQorCQkJICogKFJEVEVSTSgxKSB8IFJFUVVF
U1RfTk9ORSkuIFNvIGhhcmR3YXJlIHdpbGwgc3RvcCBmZXRjaCBkYXRhIGFmdGVyIG5leHQKKwkJ
CSAqIGRhdGEuCisJCQkgKgorCQkJICog4pSCIOKXhOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgCAgYnVmZiBsZW5ndGggICAgIOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKWuuKUggorCQkJ
ICog4pSCICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg4pSCCisJCQkgKiDi
lIIgICAgICAgICAgICAgICAgICAgICAgIOKUjOKUgOKUrOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUpAorCQkJICog4pSCICAgICAgICAgICAgICAgICAgICAgICDilIIg
4pSCICBGSUZPIFNJWkUgIOKUggorCQkJICog4pSCICAgICAgICAgICAgICAgICAgICAgICDilJTi
lIDilLTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJgKKwkJCSAqICAg
ICAgICAgICAgICAgICAgICAgICAgIOKWsgorCQkJICogICAgICAgICAgICAgICAgICAgICAgICAg
4pSCCisJCQkgKiAgICAgICAgICAgICAgICAgICAgICAgICBXYWl0IEZJRk8gRnVsbCBhbmQgSXNz
dWUgcmVhZCB0ZXJtbmlhdGUgaGVyZSEhCisJCQkgKi8KKwkJCW1kY3RybCA9IHJlYWRsX3JlbGF4
ZWQobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NREFUQUNUUkwpOworCQkJY291bnQgPSBTVkNfSTND
X01EQVRBQ1RSTF9SWENPVU5UKG1kY3RybCk7CisKKwkJCWlmIChvZmZzZXQgKyBjb3VudCArIFNW
Q19JM0NfRklGT19TSVpFIDwgbGVuKSB7CisJCQkJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKysp
IHsKKwkJCQkJaW5bb2Zmc2V0XSA9IHJlYWRsX3JlbGF4ZWQobWFzdGVyLT5yZWdzICsgU1ZDX0kz
Q19NUkRBVEFCKTsKKwkJCQkJb2Zmc2V0Kys7CisJCQkJfQorCQkJfSBlbHNlIHsKKwkJCQlpZiAo
Y291bnQgIT0gU1ZDX0kzQ19GSUZPX1NJWkUpCisJCQkJCWNvbnRpbnVlOworCisJCQkJLyogSXNz
dWUgbWFudWFsIHJlYWQgdGVybWluYXRlIGF0IG5leHQgZGF0YSAqLworCQkJCWlmIChvZmZzZXQg
KyBTVkNfSTNDX0ZJRk9fU0laRSA9PSBsZW4gLSAxKQorCQkJCQl3cml0ZWxfcmVsYXhlZChTVkNf
STNDX01DVFJMX1JFUVVFU1RfTk9ORSB8CisJCQkJCQkgICAgICAgU1ZDX0kzQ19NQ1RSTF9ESVIo
MSkgfAorCQkJCQkJICAgICAgIFNWQ19JM0NfTUNUUkxfUkRURVJNKDEpLAorCQkJCQkJICAgICAg
IG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTUNUUkwpOworCisJCQkJaW5bb2Zmc2V0XSA9IHJlYWRs
X3JlbGF4ZWQobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NUkRBVEFCKTsKKwkJCQlvZmZzZXQrKzsK
KwkJCX0KKwkJfQogCX0KIAogCXJldHVybiBvZmZzZXQ7CkBAIC0xMDQyLDkgKzEwODYsMTcgQEAg
c3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl94ZmVyKHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFz
dGVyLAogCQkJICAgICAgIHU4ICppbiwgY29uc3QgdTggKm91dCwgdW5zaWduZWQgaW50IHhmZXJf
bGVuLAogCQkJICAgICAgIHVuc2lnbmVkIGludCAqYWN0dWFsX2xlbiwgYm9vbCBjb250aW51ZWQp
CiB7CisJaW50IHJkdGVybSA9IDA7CiAJdTMyIHJlZzsKIAlpbnQgcmV0OwogCisJaWYgKHJudykK
KwkJcmR0ZXJtID0geGZlcl9sZW47CisKKwkvKiBJZiByZWFkIGxlbmd0aCA+IG1heCBSRFRFUk0g
aW4gTUNUUkwsIHVzaW5nIG1hbnVhbCB0ZXJtaW5hdGUgKi8KKwlpZiAoeGZlcl9sZW4gPiAyNTUp
CisJCXJkdGVybSA9IDA7CisKIAkvKiBjbGVhbiBTVkNfSTNDX01JTlRfSUJJV09OIHcxYyBiaXRz
ICovCiAJd3JpdGVsKFNWQ19JM0NfTUlOVF9JQklXT04sIG1hc3Rlci0+cmVncyArIFNWQ19JM0Nf
TVNUQVRVUyk7CiAKQEAgLTEwNTMsNyArMTEwNSw3IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0
ZXJfeGZlcihzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwKIAkgICAgICAgU1ZDX0kzQ19N
Q1RSTF9JQklSRVNQX05BQ0sgfAogCSAgICAgICBTVkNfSTNDX01DVFJMX0RJUihybncpIHwKIAkg
ICAgICAgU1ZDX0kzQ19NQ1RSTF9BRERSKGFkZHIpIHwKLQkgICAgICAgU1ZDX0kzQ19NQ1RSTF9S
RFRFUk0oKmFjdHVhbF9sZW4pLAorCSAgICAgICBTVkNfSTNDX01DVFJMX1JEVEVSTShyZHRlcm0p
LAogCSAgICAgICBtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01DVFJMKTsKIAogCXJldCA9IHJlYWRs
X3BvbGxfdGltZW91dChtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01TVEFUVVMsIHJlZywKQEAgLTEw
ODYsNyArMTEzOCw3IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfeGZlcihzdHJ1Y3Qgc3Zj
X2kzY19tYXN0ZXIgKm1hc3RlciwKIAl9CiAKIAlpZiAocm53KQotCQlyZXQgPSBzdmNfaTNjX21h
c3Rlcl9yZWFkKG1hc3RlciwgaW4sIHhmZXJfbGVuKTsKKwkJcmV0ID0gc3ZjX2kzY19tYXN0ZXJf
cmVhZChtYXN0ZXIsIGluLCB4ZmVyX2xlbiwgISFyZHRlcm0pOwogCWVsc2UKIAkJcmV0ID0gc3Zj
X2kzY19tYXN0ZXJfd3JpdGUobWFzdGVyLCBvdXQsIHhmZXJfbGVuKTsKIAlpZiAocmV0IDwgMCkK
LS0gCjIuMzQuMQoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
