Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6958DC0032E
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 14:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWxq91ZzDLgjkX6wA93krBqdAcIjOl0H4sDGXtIsxXk=; b=34PW44sKEWTjeM
	CNXjnEeR2ZCIXgwt3WL+BhcyLi7RODs3clElFGy7XcfzAQdCA6CCZqs8rlG//MYLXFKLcEnqYgeAR
	srnEceC7MnU7Q6DoWAkGrdQ4cZY1UMPXamjwbcHS5TlbBRkK+wLJ2f3cQkFu+fGgLE/5CulIiMzxj
	nzv/krR14bAb5gTQjObghO5B0+C1Py9b+PhHypZhPr4+KYiRDmcDv6ofKS4oZTqN684EOEtb+DrDZ
	wFMETvDO2FlZe4O8zP9IxiuxUXqlXiF5icmzUzgcwrVAFLGvwtsqDibcyl01hXakWRoodivlUK4RD
	Grcg7F2eipWCeNpcqG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqLJ-002TWO-1H;
	Fri, 20 Oct 2023 14:19:13 +0000
Received: from mail-vi1eur05on20601.outbound.protection.outlook.com ([2a01:111:f400:7d00::601] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqLG-002TVZ-0O
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 14:19:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnNA9ZbGaaUWl4NaTlSzDsq37ONbTl6om7RXpGsUelrcD51hy6vq5ftleRYNsSH/FVefZ0Ffmjrp8LDhfX1xrqiGFc75rIayyf+WpGMjjoQZPbAuO4KhU18P8Vo9Xpek8KEa0l9miv7sUnuO9cKSoi0bs1sKmCdP7ETmKDnEF854lGBsSq4AX3H9H1lR4GQCC4BtntevkNJiQME1iFuPzQ1ODvg2PypgEAWkrB+rLtJQnLZFqhKNxvVnjd1njrPZpuq/w2WlUDkTUBs+wZdHbO93oWmK0OmRm+CCfxZ+57TTyFLvp3+LGHTl732f1ZkVMit7dwHJncxOdKQZmLjtSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhoPxG6wRCNe1W0w6x7WTuNoBxrj/Qn9Z2kElRwpkrk=;
 b=lwAxb0i4kUHo7xHt5mitC40I/WmDDmhFEZ6YuY48omHMvAof7inuWzX2dRXFWywpMIxrBF9j2f1r4LP2mSM/a8+a98d4cZ7kDU4LV2zCwE+FWCx0c7DRdzFDbzKOCTOk9088h8qwOAHhh4JR+mdrnMnpnEU6db9yQBeblF3HiEtlrdG1Pbxzl8Eyn6SexaqWrGcjxu9M//rJCk0AI+VftJieqY+H9jk52sR1AwZrQjmdtlYvSZP4DS9IMk7z8TlfBdhGJYKDroFFVYxyHxT6HiJ6n8ETnh1xRSg/Oncw+YJZzSNvk7GiQR4KR2VE8I6soG0txNg1LpMyqlvcHVfHeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhoPxG6wRCNe1W0w6x7WTuNoBxrj/Qn9Z2kElRwpkrk=;
 b=r8KAmNyc0epj5nOMp+66e3iW2EFf/bnKrFtHQheLJRciki7F7uYYTuqooOltklZGjirX3tKC52tIlDVL1Zzur/WnBDMMSCSZSD9xEGgLzojhkfyoNY+ie4xgZZfnItkQ9at16YOG/jMLop/lzz+biN07R3tkhqZT9Ffx65BaRco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM9PR04MB7619.eurprd04.prod.outlook.com (2603:10a6:20b:284::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Fri, 20 Oct
 2023 14:19:01 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 14:19:01 +0000
Date: Fri, 20 Oct 2023 10:18:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
	imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 Resent 6/6] i3c: master: svc: fix random hot join
 failure since timeout error
Message-ID: <ZTKMTwU6cVAfGCKG@lizhi-Precision-Tower-5810>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
 <20231018155926.3305476-7-Frank.Li@nxp.com>
 <20231019084452.11fd0645@xps-13>
 <ZTFNvrsSoHOS3P2g@lizhi-Precision-Tower-5810>
 <20231020160645.67e678ee@xps-13>
Content-Disposition: inline
In-Reply-To: <20231020160645.67e678ee@xps-13>
X-ClientProxiedBy: BYAPR07CA0053.namprd07.prod.outlook.com
 (2603:10b6:a03:60::30) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM9PR04MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: c68eab64-2003-43a9-7f06-08dbd1778208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Db9yeFfPQ8NoaH0TTtYQlR3154Fom+TNqmP5WIn9OEFGHeB9a3srbhm2QGJLzYBzdC/9PsaRhoVCY72Ca1SJC+Z3MTZ1vV4EicedH2FIOOo6cd2gm2C98MyuAfPinzB/eAc2d7ya/Y+hnmWw3ctJ0SH0P17X7jpWYmsJrQ7QLThITOaiUYHsvZRUdCHg62EOn99J7WS3uzTu1PaqS0sgWKk/eyYAbwK0XnaB3h7yPAU8nEY9H/SZrDxXqXAUM0rZTd7bA6wHGFlEYWKCGBAkR+982s9qLybSsm1WSWizdv+oWNOie1ZKPPSRwfZsvSEpaLpzB5OtINS8YuG45RpU56ctBEiHOhn1ThppMLUdonVFCzDOYgGWYVDGv8HAFKNPAqQJcbfgrf6Egiwv4zLa32JvxJyW359pr7VKu1dn5pUCVaDi8GSwXsjS3+SPzKnmCRdMeIxAV5R2KFq7fY2q9/kGk8sUsOt1wn0VXRAFUisMKOSz3jpPtK3ZQ3uljrZTKjreArGOIE4qSXSDoRoNVtT6/KyIAI4VkZopoCA0t7qT83Yi1uDeDdU6IM3z18byQ/kcaa313Mxju6XUuil+RK7RE/Sb+K6K91exnS26TzrsXMubv2gNce+Nc7Mde5BP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6916009)(38350700005)(2906002)(6486002)(5660300002)(8936002)(8676002)(6666004)(4326008)(41300700001)(38100700002)(66556008)(26005)(86362001)(66946007)(33716001)(316002)(478600001)(6506007)(9686003)(52116002)(66574015)(66476007)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmR6VlRxL0VYVW45aVFmVmM4UTIxb1pHN1A5OW5xN2VWWFMzTHJsWGgzTGp2?=
 =?utf-8?B?K3lZdGVyZGE1NTlTRllmK2FYWXhoYTU4bllkeVJMNDduT3l5ek0wV1ZmeFhm?=
 =?utf-8?B?MEt6RW5jOTBuOUk5OEhvRjFoWjNNa3A4OGJ5amtmRmhqWlFCNHo3OWRQelFO?=
 =?utf-8?B?dW5Hd0tXOVIwV0JjWnBLR3M1OEY2ZFFxdHduc0IxVjVqTnNSdGtGNFFMYXQ4?=
 =?utf-8?B?dWdQRlRFWHk3dm1GS290RGY0RVlvSXNpcWRIemkwclRHVFViSHQrV0ZXL3J4?=
 =?utf-8?B?d0QvMjdvblRndjNpVGw5ekowQnNWZzg2QUdZRFdHZWsrdWIvbVBxY2U4SUlz?=
 =?utf-8?B?M0pGenFiYXhaRHQ4d2pzSk9HTFJWeXFnMFFsaUVQMEVkNHlBWU91clF5cUY0?=
 =?utf-8?B?TXZ3NDFwWHhnL0o0ZjdlbWt0dFVER3RBNlk0eC9HYjlKUkwxWlZsWUpSeU5t?=
 =?utf-8?B?Zy9MWVEwbmZrNGY3bUpzYjBJdjYwMlB0UEdyTExaUlVremtRVzhIWmNPSzQ1?=
 =?utf-8?B?eFlJc2krNFdVeG9lUDBsbW92RzFqc1R4ZWxnRDNWWHFLUUJkcDJGbGZlNTVp?=
 =?utf-8?B?VlA1dnAxaU9FMEVVdVYreGVZbEdlL0lXTTNybGN4K2grVE4zQk1FV3NPQVFz?=
 =?utf-8?B?OGZFTEtMK2R3bjZuZHVVdTdaUGJZS2s3RjdObFhOVnFyanJoWXNMMlc3cGNY?=
 =?utf-8?B?WmpjazQ0OXNQSldjTk5ZNjNkcUtueXMreHBWN084aFJGK2txMHNnVGg5ZzN6?=
 =?utf-8?B?akF4R0dXUnpxNE41UU45R3dGRjRIS3lqVDdJNGxrdVE2MHJmZ05KUllTVmNW?=
 =?utf-8?B?K0NwS29nWEZ5bkxnaGxDMDVXRW5XMjJzQWZHWlNXWGI4R0hGSXBXOUNmWDlC?=
 =?utf-8?B?Sllsb0RhdWxYQlVxblcrSmw5UmozR09EZm5ZdHljZ1VnMzl4OVpsMk1LN3Zl?=
 =?utf-8?B?QzBWdDZPVEl4Wmp6dE1LM3FxN2srSm1pZHhvdm5VWTFBQWpSWWNvZThYRVlN?=
 =?utf-8?B?Y1JOclFMQUdiQnBZOThVcTc0RVdybjltVlUrRjNvNXJ4OFhwVFUrZ0pUV0lB?=
 =?utf-8?B?cVdMZUc3VlptZkk5UkRGT29NL3duRmtxbnQxRXlUQjArZE9lUXlyVzhCc1BJ?=
 =?utf-8?B?Q2RHbDFycGtrR1RHMFY3S1JlbmpsSWtsZllzVm9zV3Jpb0I0c1BkMlljV21W?=
 =?utf-8?B?Z1pnUmZ2cXBRWno2NHhiUW9hRGJrSDh6SURxTitFc1VZTSt0VTJteVpXVU45?=
 =?utf-8?B?YnFTSTl6Ynowak95aFBLNENFNmptWUlrNDJmekx1Y202Vlp0MFMrVWtkZEZK?=
 =?utf-8?B?dU9EbFFsYktNMjk1cS9iQURkbTdTTzFLSVAxazU1NURWVGtYK1ltUHBqTmdq?=
 =?utf-8?B?TVBUNzJUcVJ2dXhJT3d1NVp6N2NDQkhZYXhHZXNoc0V1YzVlMkw2UkNnOGZQ?=
 =?utf-8?B?bUNZSmpPVnF1ZWxST2hHN2RZY21aUFV5cHpsTUwxZ3dkSHl4OVpWYVRaZEJV?=
 =?utf-8?B?UG44KzdQaVU3WTBOSlMxK3d3Y1I4OUlLN2N6Mk5HS1puS0l1Q2hPZzd3bnJJ?=
 =?utf-8?B?QUhnWFF5UENwNjZOL2ZUcVBUWG1KcktJT2cwUVhkTi8zTFM3a1Vydm9WZnRt?=
 =?utf-8?B?RTF0QnUwNUtGVHpBby9DVVgzV2Z5c0htTUZ5TjZKNnZJZmJoaUhzVm4vRmxZ?=
 =?utf-8?B?VlNqV092L242QWxyTzlzV0VVZzNJMGNCRnBTdEs5cGNCK0hxL3FsY2ZpZGp3?=
 =?utf-8?B?NkxKMEV5R2h4SXE3WE0waXhJcUdNVVlZNDBNZXI2QUZTbkx3UFd6THoycDR1?=
 =?utf-8?B?eXRIMTFwSHdjSXphalo5SU5RcUVLK0VGQ01GZHdaZWdBTnBJQmJBTUVOb1Iz?=
 =?utf-8?B?VzF2OC8waFM5cjhWa1hGRGZSaVFjVmdFa0hucTBTdE1ocmE0ZVJUczRkc2cv?=
 =?utf-8?B?eUptZ0djczRzaUhEYmxSOFJYcGVMekZHRFBad1F4TU1KWUwwZnhGNS90M3By?=
 =?utf-8?B?S1NQeTlVWWVXdHIxZTVDb0lBMnRWUExxY2hLS25INlc4QytXQUhBMTBtY0lO?=
 =?utf-8?B?SmJjc3JORDR1SnFqdFh1U2lheDl2K2lPVUJwcmJKcGoxT0RIRlFJdWRVTWFV?=
 =?utf-8?Q?0ViM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68eab64-2003-43a9-7f06-08dbd1778208
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 14:19:01.7527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wp/fO9057pPOvppddgSbBl+KysH6Qi0mW8KfHOG59+WMFQGjidMuWddNOh1HYXC/HsRNVLOhUkLCtrKXH0XAqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7619
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_071910_394778_D872548B 
X-CRM114-Status: GOOD (  35.50  )
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

T24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgMDQ6MDY6NDVQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSBGcmFuaywKPiAKPiBGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFRodSwgMTkg
T2N0IDIwMjMgMTE6Mzk6NDIgLTA0MDA6Cj4gCj4gPiBPbiBUaHUsIE9jdCAxOSwgMjAyMyBhdCAw
ODo0NDo1MkFNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gPiBIaSBGcmFuaywKPiA+
ID4gCj4gPiA+IEZyYW5rLkxpQG54cC5jb20gd3JvdGUgb24gV2VkLCAxOCBPY3QgMjAyMyAxMTo1
OToyNiAtMDQwMDoKPiA+ID4gICAKPiA+ID4gPiBtYXN0ZXIgc2lkZSByZXBvcnQ6Cj4gPiA+ID4g
ICBzaWx2YWNvLWkzYy1tYXN0ZXIgNDQzMzAwMDAuaTNjLW1hc3RlcjogRXJyb3IgY29uZGl0aW9u
OiBNU1RBVFVTIDB4MDIwMDkwYzcsIE1FUlJXQVJOIDB4MDAxMDAwMDAKPiA+ID4gPiAKPiA+ID4g
PiBCSVQgMjA6IFRJTUVPVVQgZXJyb3IKPiA+ID4gPiAgIFRoZSBtb2R1bGUgaGFzIHN0YWxsZWQg
dG9vIGxvbmcgaW4gYSBmcmFtZS4gVGhpcyBoYXBwZW5zIHdoZW46Cj4gPiA+ID4gICAtIFRoZSBU
WCBGSUZPIG9yIFJYIEZJRk8gaXMgbm90IGhhbmRsZWQgYW5kIHRoZSBidXMgaXMgc3R1Y2sgaW4g
dGhlCj4gPiA+ID4gbWlkZGxlIG9mIGEgbWVzc2FnZSwKPiA+ID4gPiAgIC0gTm8gU1RPUCB3YXMg
aXNzdWVkIGFuZCBiZXR3ZWVuIG1lc3NhZ2VzLAo+ID4gPiA+ICAgLSBJQkkgbWFudWFsIGlzIHVz
ZWQgYW5kIG5vIGRlY2lzaW9uIHdhcyBtYWRlLiAgCj4gPiA+IAo+ID4gPiBJIGFtIHN0aWxsIG5v
dCBjb252aW5jZWQgdGhpcyBzaG91bGQgYmUgaWdub3JlZCBpbiBhbGwgY2FzZXMuCj4gPiA+IAo+
ID4gPiBDYXNlIDEgaXMgYSBwcm9ibGVtIGJlY2F1c2UgdGhlIGhhcmR3YXJlIGZhaWxlZCBzb21l
aG93LiAgCj4gPiAKPiA+IEJ1dCBzbyBmYXIsIG5vIGFjdGlvbiB0byBoYW5kbGUgdGhpcyBjYXNl
IGluIGN1cnJlbnQgY29kZS4KPiAKPiBZZXMsIGJ1dCBpZiB5b3UgZGV0ZWN0IGFuIGlzc3VlIGFu
ZCBpZ25vcmUgaXQsIGl0J3Mgbm90IGJldHRlciB0aGFuCj4gcmVwb3J0aW5nIGl0IHdpdGhvdXQg
aGFuZGxpbmcgaXQuIEluc3RlYWQgb2YgdG90YWxseSBpZ25vcmluZyB0aGlzIEkKPiB3b3VsZCBh
dCBsZWFzdCB3cml0ZSBhIGRlYnVnIG1lc3NhZ2UgKGlkZW50aWNhbCB0byB3aGF0J3MgYmVsb3cp
IGJlZm9yZQo+IHJldHVybmluZyBmYWxzZSwgZXZlbiB0aG91Z2ggSSBhbSBub3QgY29udmluY2Vk
IHVuY29uZGl0aW9uYWxseQo+IHJldHVybmluZyBmYWxzZSBoZXJlIGlzIHdpc2UuIElmIHlvdSBm
YWlsIGEgaGFyZHdhcmUgc2VxdWVuY2UgYmVjYXVzZQo+IHlvdSBhZGRlZCBhIHByaW50aywgaXQn
cyBhIHByb2JsZW0uIE1heWJlIHlvdSBjb25zaWRlciB0aGlzIGxpbmUgYXMKPiBub2lzZSwgYnV0
IEkgYmVsaWV2ZSBpdCdzIHN0aWxsIGFuIGVycm9yIGNvbmRpdGlvbi4gTWF5YmUsIGhvd2V2ZXIs
Cj4gdGhpcyBiaXQgZ2V0cyBzZXQgYWZ0ZXIgdGhlIHdob2xlIHNlcXVlbmNlLCBhbmQgdGhpcyBp
cyBqdXN0IGEgImJ1cwo+IGlzIGlkbGUiIGNvbmRpdGlvbi4gSWYgdGhhdCdzIHRoZSBjYXNlLCB0
aGVuIHlvdSBuZWVkIHNvbWUKPiBhZGRpdGlvbmFsIGhldXJpc3RpY3MgdG8gcHJvcGVybHkgaWdu
b3JlIHRoZSBiaXQ/Cj4gCgogICAgICAgICAgICAgICAgZGV2X2VycihtYXN0ZXItPmRldiwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAg
ICAgIkVycm9yIGNvbmRpdGlvbjogTVNUQVRVUyAweCUwOHgsIE1FUlJXQVJOIDB4JTA4eFxuIiwK
ICAgICAgICAgICAgICAgICAgICAgICAgbXN0YXR1cywgbWVycndhcm4pOworCisJCS8qIGlnbm9y
ZSB0aW1lb3V0IGVycm9yICovCisJCWlmIChtZXJyd2FybiAmIFNWQ19JM0NfTUVSUldBUk5fVElN
RU9VVCkKKwkJCXJldHVybiBmYWxzZTsKKwoKSXMgaXQgb2theSBtb3ZlIFNWQ19JM0NfTUVSUldB
Uk5fVElNRU9VVCBhZnRlciBkZXZfZXJyPwoKRnJhbmsKCgo+ID4gSW4gc3ZjX2kzY19tYXN0ZXJf
eGZlcigpIGhhdmUgbm90IGNoZWNrIHRoaXMgZmxhZ3MuIGFsc28gaGF2ZSBub3QgZW5hYmxlCj4g
PiBFUlJXQVJOIGlycS4KPiA+IAo+ID4gSWYgd2UgbWV0IHRoaXMgY2FzZSwgd2UgY2FuIGFkZCBu
ZXcgZnVuY3Rpb25zL2FyZ3VtZW50IHRvIGhhbmRsZSB0aGlzLgo+ID4gVGhlbiB3ZSBjYW4gcmVh
bCBkZWJ1ZyB0aGUgY29kZSBhbmQgcmVjb3ZlciBidXMuCj4gPiAKPiA+IFdpdGhvdXQgdGhpcyBw
YXRjaCwgc2ltcGxlc3QgYWRkIHNvbWUgZGVidWcgbWVzc2FnZSBiZWZvcmUgaXNzdWUKPiA+IFNW
Q19JM0NfTUNUUkxfUkVRVUVTVF9BVVRPX0lCSSwgVElNRU9VVCB3aWxsIGJlIHNldC4KPiAKPiBZ
ZXMsIGFuZCBzb21ldGltZXMgaXQgd29uJ3QgYmUgYW4gaXNzdWUsIGJ1dCBzb21ldGltZXMgaXQg
bWF5LiBNYXliZSB3ZQo+IGNhbiBmaW5kIG1vcmUgYWR2YW5jZWQgaGV1cmlzdGljcyB0aGVyZS4K
PiAKPiA+IEFuZCBzdmNfaTNjX21hc3Rlcl9lcnJvcigpIHdhcyBvbmx5IGNhbGxlZCBieSBzdmNf
aTNjX21hc3Rlcl9pYmlfd29yaygpLgo+ID4KPiA+IFNvIEkgY2FuIHRoaW5rIG9ubHkgY2FzZSAz
IGhhcHBlbiBpbiBzdmNfaTNjX21hc3Rlcl9pYmlfd29yaygpLgo+IAo+IENhc2UgMyBjYW5ub3Qg
YmUgaGFuZGxlZCBieSBMaW51eCAoYmVjYXVzZSBvZiB0aGUgbmF0dXJhbCBsYXRlbmN5IG9mCj4g
dGhlIE9TKS4KPiAKPiA+IAo+ID4gRnJhbmsKPiA+IAo+ID4gPiBDYXNlIDIgaXMgZmluZSBJIGd1
ZXNzLgo+ID4gPiBDYXNlIDMgaXMgbm90IHBvc3NpYmxlIGluIExpbnV4LCB0aGlzIHdpbGwgbm90
IGJlIHN1cHBvcnRlZC4KPiA+ID4gICAKPiA+ID4gPiAgIFRoZSBtYXhpbXVtIHN0YWxsIHBlcmlv
ZCBpcyAxMCBLSHogb3IgMTAwIM68cy4gIAo+ID4gPiAKPiA+ID4gcy8xMCBLSHovLwo+ID4gPiAg
IAo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgaXMgYSBqdXN0IHdhcm5pbmcuIFN5c3RlbSBpcnEgdGhy
ZWFkIHNjaGVkdWxlIGxhdGVuY3kgaXMgcG9zc2libGUKPiA+ID4gPiBiaWdnZXIgdGhhbiAxMDB1
cy4gSnVzdCBvbWl0IHRoaXMgd2FyaW5nLiAgCj4gPiA+IAo+ID4gPiBUaGlzIGNhbiBiZSBjb25z
aWRlcmVkIGFzIGJlaW5nIGp1c3QgYSB3YXJuaW5nIGFzIHRoZSBzeXN0ZW0gSVJRCj4gPiA+IGxh
dGVuY3kgY2FuIGVhc2lseSBiZSBncmVhdGVyIHRoYW4gMTAwdXMuCj4gCj4gVGhpcyB3YXMgc2tp
cHBlZCBpbiB5b3VyIHYzLgo+IAo+ID4gPiA+IEZpeGVzOiBkZDNjNTI4NDZkNTkgKCJpM2M6IG1h
c3Rlcjogc3ZjOiBBZGQgU2lsdmFjbyBJM0MgbWFzdGVyIGRyaXZlciIpCj4gPiA+ID4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJh
bmsuTGlAbnhwLmNvbT4KPiA+ID4gPiAtLS0KPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
