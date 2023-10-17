Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C7ECDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VuHk1WkcaVna6TujmOEPP33M+qZrVLCE72zaILHHZ4M=; b=zaAjDDKC7G9giT
	9UKio4MXxg6lP2yqdH6sKeOX+BDQ6dQknhOBMTA7auWISOBbb72CjIefynINkocmvwUyoYNA1JPUF
	O7HYkXYC7IqIwe08icKJqe3YW8EhXyIw5AZ5lyauvWXSoQw9/Giw9Dqwn1HduzpcsNi+Ni1q3RIKw
	AmKxLr93EU5664O5/r+Q/8aq4BLHDAqz7/SIVXOqTk4g6QSglE7vFF9+/FlaWCc20xElD5oyXDLoS
	i82vVeg6x6uji07ybitFOavNogp8Gn2T7ffxhw/3q2wI8PLpq+yDl8A4izJuCANZGMmBSdY63Kb7H
	PxowuNBsuRRRjS2lLT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslK7-00CYUW-1L;
	Tue, 17 Oct 2023 14:45:31 +0000
Received: from mail-vi1eur05on2061d.outbound.protection.outlook.com ([2a01:111:f400:7d00::61d] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslK3-00CYTg-2w
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 14:45:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgVdW0bh8J/xDirMsTcAJG4tcJ5nehSdX/mygfW59ZEFG+oTPMEn0HlZdBn+WUZHGZwdyMrx/0vaO0ixbIFgsjRQKV3uuTy8wjBdSRA1uZWmuge7P4qInYfJ5rkqU+XGy9313l70Lf9+sjXZThuVg7Kgn8/ehYFSrNjG8fD5na9yudRYNVH5QpvC/ImJJ9oArG90x4j7yPAvspHgrvg+wGtzrgQ9KmcsjFHMoScZHwoqEjdSg/LHyspzzof06AbV0UF02vuOv6zxn1Ys5nN/cxSOluBlX3AgZZ3rQsbkXWPGqptTCQOxmvEzBNub+Uy9PhFKhlcTRpz+fb1bmu4A7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPf5pEmwysBeUII9ydWPD8bHPHFBDv9RRxnkkVqeTJg=;
 b=XJK9xLVM7GWs0cgjntxJVSbV9hozA2G10edsSMpVfr+qesnQcTpE2DhxsgZ09LAdlXnldAm7xiNoXlOzBk51xs843X+UYllaDgkn9ExPoJARKJEJ6iWtWF2R9bG/1YNTPPL6o5KgU1r1raLTHiE7vUAQmyUNOkftJ6Bt/k7JXwADY0hvOTZ2TxBY6cC7ukYD9W0TbhmHj4donC5drdC2z9hf7p3X7qrO99P+OhrQ0Ur4w9GchsyRqmspl5KKv5UNyFVx2JusBjin3gazfzoCqNwoMYNlw5t1+vnIKujCjGtjO9daTuCLoEkUKIHQ5fmqlfvIdD9t4T8TrqwdVJbgQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPf5pEmwysBeUII9ydWPD8bHPHFBDv9RRxnkkVqeTJg=;
 b=lJL3l/2at4hPBfvaOf1AHsf+h1XuqURnsEhiJ3lcUGl4NPPyT9YuHqUdGMLAJtiBoTGzXshpiSbToF5UNhYWMzJltO5pAVh2FNfGaeL8pIcGpkBwAQ+shC8IYnkF6nEoxKIWzQlH6BX811ZnNWXfIy49VDYJY+w+27rhKqko2O8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB9570.eurprd04.prod.outlook.com (2603:10a6:102:24d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 14:45:20 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 14:45:20 +0000
Date: Tue, 17 Oct 2023 10:45:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
	joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 6/6] i3c: master: svc: fix random hot join failure since
 timeout error
Message-ID: <ZS6d+mANtuhoAcuX@lizhi-Precision-Tower-5810>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
 <20231016153232.2851095-7-Frank.Li@nxp.com>
 <20231017163335.16770af2@xps-13>
Content-Disposition: inline
In-Reply-To: <20231017163335.16770af2@xps-13>
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PAXPR04MB9570:EE_
X-MS-Office365-Filtering-Correlation-Id: 149b80cd-e53f-4c3d-5170-08dbcf1faf77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RRpbrGGsov52htAgP4O3ZTOWUgcgNVM+OCBAzqLGRpq2pstUKmmCjGpKrbhQ8HPt07wyJmQBtHWGvv5yT0+I1ZkAd7hX1NWI0/f9l5Lj6njgE2K2NZsd9pgdQz+4efsSfZy+nKDzf2cZhTOhfHWX+/GeK/aOJFec3DO5jSaTOQ3zOv2NCwHqnurKoC6q8DQG5q4fDDlhk0wWPp7K6qWSSaJ/KNjKTrrdZbnroDNJve96PTU3bG0jV6EHuH/3V0VT9rzD3aKiF201DKVDUqMxaj38G8PiKcWjMs8nnc2tW+tA5fgV5F51QSxu62vpsKpo7T09gUWx0ciJX5xk4zkOVYQEyUfO5TeFfdF7cHP8GGk9/SiItlfbkME7egdo/d6fWi17GNRMRlv6HV9Ulfe0CHqVivmPX+jGy/axd5d/5pwTENBoa1hLYtDWhUOsFbeS9Qbxf0rRNAtXmyzK+Kiju3c8ESUiSjZWYX//ATJFonHWgpg7mdD5sozS2R5lONEYNNaV51GOU+qxKy2Lc2A/bjKmGpAzTdVNC6SXobHVO6xvPQdOf5upw4gmjBN+nr0Q85vsDSktQFojQxkzegcT44kTXLhrhav2Gtv3UnFzsvjORR0Y6svNTPECiikKzlMomVzb88ycbLTo7TwohuLWGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6486002)(478600001)(6916009)(66476007)(316002)(66946007)(66556008)(66574015)(52116002)(26005)(6506007)(2906002)(6512007)(9686003)(8936002)(33716001)(4326008)(8676002)(5660300002)(41300700001)(86362001)(38350700005)(38100700002)(83380400001)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THRza0NnbU9LSUVFMDJLdSt2R29KRWRVOTlnTk80ODNpTEFsNXRNeXovRVVQ?=
 =?utf-8?B?RmRBWkxSUndxTms2UjUrUHdEWTF3QnNUa3hWaVJkOFdEQnFaeVZDWnEwblUy?=
 =?utf-8?B?a0JLQjBsK3F4OEN3UlZ5SlBhSml5VjNsWDQxSDhDVk0vK3RUOTlJc1JWL1BB?=
 =?utf-8?B?Z0dWM0NLZjFhSWRSajFzbmJVTkdQeGlUWmtGV0daU1VYQWdTVHNadi9VUzll?=
 =?utf-8?B?U2VwbVlYZ3oyQU8xbzBTbEs2ZmltdWdFOXY5MUE5aGlYUTkwNjdFQmJ1cTJx?=
 =?utf-8?B?WCtzSlRlQXgybmpxR2pMN2hLeXY0RkR4ZjhEeDRqMEdIMWUvVVpyU0x5ZDNJ?=
 =?utf-8?B?b0VzU3NNLzlBdUpBTThqN0ZRNTNjODk2N1JUaXAvS2pOVnJPREN5LzVnYjhV?=
 =?utf-8?B?RUlpUS8vK25GWTZVT2hLK2ZjTVJ4MWpNM29PUFNaSTdKQitCM2MwdXRLa05N?=
 =?utf-8?B?RE8zNGhmdXdVRzJYRURhZ1Rtb1hrTWpGbTM4Z013THlGaUR6R0lIS09qRHM1?=
 =?utf-8?B?Y3RnWThnSnpSYWo5WXNSWWJuV0dMQTZSN296V0dPUzA1RGlNUzJyeXV3bkZ5?=
 =?utf-8?B?bFVJL25IUVpRcElCWlFDTGRSMUI2UTd0ODM0WWxHdDNiRkY4RTBpT09pdkwy?=
 =?utf-8?B?RFhjdTJxVXZJblFlaFgrbHJhdXBndXpwWERKSDVBZjZ4cXI1NzRrUlV3VUtI?=
 =?utf-8?B?L2JROFhPZzEweGtaZE1JT0NaVUQxL0pkWmo2UDJ5SWJScE5WVm9PL0ZwbVR5?=
 =?utf-8?B?VlVMZXhCUk8zd2duUTlobkk4bzNpOEs1MzF3ZC83VjVsOXFEZDlrdW1jV0tt?=
 =?utf-8?B?bitZK1E3YmlYcjA5azkxVytpTUFoV0xDK3RCNGFXQVNvL2lHenE5UHZEemFp?=
 =?utf-8?B?cWxLUmdpRWNaSjVFTGJJdnRVL282dW4vRks2UlVPcFg2QU03RUt6WTdSK0VV?=
 =?utf-8?B?QzJRa3M2N3BKUlU0M2pGa3ByZVc1QUhDUmtVYjlzWkxuT2dpekU2Q0d3eUxJ?=
 =?utf-8?B?eS9tWVlsMnByN2pZZVJCTGcxRFBOcW5TNkFwdmVDdWxyakdiYVBaK1JmVHUw?=
 =?utf-8?B?VXZmclp5QWQrTnA0MkQwbVIxOGdDWnBxbnh2U3E4NzQ3ZXN2RDBCZjVNL0or?=
 =?utf-8?B?T3MzSmN1Ukp3R3JIZGtnOUdnVG81WHNEbmhSaWx6M0pxME9iaUlnUG16YXpk?=
 =?utf-8?B?YUNxZXBuRHZGY2NYNXUrNEU1MTU2YkowcVVCK0YvWjlMcTF1TmVVY3AxdHpV?=
 =?utf-8?B?ZmhUamZyeWJqdTR4UVh2ZHZWMUlwc3JWWTZUdHA5NlNFSUxlMSttaW85L09B?=
 =?utf-8?B?QVEwUzRlVWFaOFlybGZZR3VpL2RVREIwZ0taTlVVcUxmTjc0bnh0c2Q5UnJQ?=
 =?utf-8?B?Umh3LzVPQ0p2UnEvN2Nhblh5dVIvQ2xaSUQ4TmJhMUl2bWhoeVR1OWJDaFpk?=
 =?utf-8?B?RzNaVDh5bHAvZVFScUgweDZxZTRlNG1YcVRTaVRPUFBycGxPeXFtRjdCY2lv?=
 =?utf-8?B?TTk3UHQ2dmN3L29hQ1I0cE4wc1llZ1lMWElsQzNKWTg0UVV2dWE4ZW45VFZC?=
 =?utf-8?B?LzBHVDY2d3lhdGh5MVVZK01xLzhJSkozVmdUNnFjdFVUS1o1aGRnakZNL3o3?=
 =?utf-8?B?MjZpazA2VXFzK2hMYnlUWVBwak1qVjlGQXg2S1VLMEpoMzJUMXBHWlpwS1VC?=
 =?utf-8?B?OEUyYmxNM2I1NGtNNkVFWno0aThhTk8zd1JBdUwzSzdiWW42VHphcHJrdUtU?=
 =?utf-8?B?UzBPSW9TMTAyYkhyNUdvV3dxanVhYWdvbE02TmkxMm9wdFhZdm1kem01Y2Qy?=
 =?utf-8?B?MDNtaXFmSGtTUU15SG5lZDRTQmVDbEVxVm9qOC9iTkY1SEJBK2dySmxteTJU?=
 =?utf-8?B?YUE3eGxsMTRzOVpRL2MzdTlzQWFIYk9vallwbUMwc1UrVzNyV0RzNlllWlk3?=
 =?utf-8?B?ZjQ3UVBySlBTTVVCeC9lbnp5WTV0YlA4UWxIM01pd2wzZjZGZ1dDL1MzczNL?=
 =?utf-8?B?Mi83OWxocTVOdU8rOWRWOEVHYUZTUmYyMStjQ1dURFFWSFZKQUZoeFk4bDJD?=
 =?utf-8?B?RGRiNWxJM0NlcTEzRzVwbTBPUlllQWFzMEFlM0pzRHYyLzVVblZmay80UmpP?=
 =?utf-8?Q?QXihsfdRN+8i0txdVwqYbv5PQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 149b80cd-e53f-4c3d-5170-08dbcf1faf77
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 14:45:19.8730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvdDKIBJCwI4tGQmKCjsBDQUtD7qOma2BQn/8JjvszwwKF/cNCiHu89pymJlDkURS4yhTkr5mf0Zbwik32KJ4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_074527_955039_0640242C 
X-CRM114-Status: GOOD (  26.21  )
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

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgMDQ6MzM6MzVQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSBGcmFuaywKPiAKPiBGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTYg
T2N0IDIwMjMgMTE6MzI6MzIgLTA0MDA6Cj4gCj4gPiBtYXN0ZXIgc2lkZSByZXBvcnQ6Cj4gPiAg
IHNpbHZhY28taTNjLW1hc3RlciA0NDMzMDAwMC5pM2MtbWFzdGVyOiBFcnJvciBjb25kaXRpb246
IE1TVEFUVVMgMHgwMjAwOTBjNywgTUVSUldBUk4gMHgwMDEwMDAwMAo+ID4gCj4gPiBCSVQgMjA6
IFRJTUVPVVQgZXJyb3IKPiA+ICAgVGhlIG1vZHVsZSBoYXMgc3RhbGxlZCB0b28gbG9uZyBpbiBh
IGZyYW1lLiBUaGlzIGhhcHBlbnMgd2hlbjoKPiA+ICAgLSBUaGUgVFggRklGTyBvciBSWCBGSUZP
IGlzIG5vdCBoYW5kbGVkIGFuZCB0aGUgYnVzIGlzIHN0dWNrIGluIHRoZQo+ID4gbWlkZGxlIG9m
IGEgbWVzc2FnZSwKPiA+ICAgLSBObyBTVE9QIHdhcyBpc3N1ZWQgYW5kIGJldHdlZW4gbWVzc2Fn
ZXMsCj4gPiAgIC0gSUJJIG1hbnVhbCBpcyB1c2VkIGFuZCBubyBkZWNpc2lvbiB3YXMgbWFkZS4K
PiA+ICAgVGhlIG1heGltdW0gc3RhbGwgcGVyaW9kIGlzIDEwIEtIeiBvciAxMDAgzrxzLgo+ID4g
Cj4gPiBUaGlzIGlzIGEganVzdCB3YXJuaW5nLiBTeXN0ZW0gaXJxIHRocmVhZCBzY2hlZHVsZSBs
YXRlbmN5IGlzIHBvc3NpYmxlCj4gCj4gCQkJCQkJCWNhbiBiZSBiaWdnZXIKPiA+IGJpZ2dlciB0
aGFuIDEwMHVzLiBKdXN0IG9taXQgdGhpcyB3YXJpbmcuCj4gCj4gSSdtIG5vdCBzdXJlIHRoaXMg
aXMgdGhlIGNvcnJlY3QgYXBwcm9hY2guIEl0J3MgYSByZWFsIGlzc3VlIGJ1dCB0aGVyZQo+IGlz
IG5vdCBtdWNoIHdlIGNhbiBkbyBhYm91dCBpdC4gUGVyaGFwcyBkZXZfZXJyIGlzIHRvbyBoaWdo
LCBidXQgSQo+IHdvdWxkIG5vdCBlbnRpcmVseSBkcm9wIHRoaXMgbWVzc2FnZS4gTWF5YmUgYSBj
b21tZW50IGFuZCB0dXJuaW5nIHRoZQo+IG1lc3NhZ2UgaW50byBhIGRiZyBwcmludGsgd291bGQg
YmUgbW9yZSBhcHByb3ByaWF0ZT8KClRoZSBrZXkgaXMgbm90IG1lc3NhZ2UuIEl0IHJldHVybiB0
cnVlLCBtZWFucyBJQkkvSEogdGhyZWFkIHdpbGwgbm90IHJ1bi4KCkZyYW5rCgo+IAo+ID4gRml4
ZXM6IGRkM2M1Mjg0NmQ1OSAoImkzYzogbWFzdGVyOiBzdmM6IEFkZCBTaWx2YWNvIEkzQyBtYXN0
ZXIgZHJpdmVyIikKPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiBTaWduZWQtb2Zm
LWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvaTNj
L21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgNiArKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIv
c3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4g
PiBpbmRleCA1YmNhMzY5ZDY5MTIuLjE4YmMyNzdlZGM4YSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gQEAgLTkzLDYgKzkzLDcgQEAKPiA+ICAjZGVmaW5lIFNW
Q19JM0NfTUlOVE1BU0tFRCAgIDB4MDk4Cj4gPiAgI2RlZmluZSBTVkNfSTNDX01FUlJXQVJOICAg
ICAweDA5Qwo+ID4gICNkZWZpbmUgICBTVkNfSTNDX01FUlJXQVJOX05BQ0sgQklUKDIpCj4gPiAr
I2RlZmluZSAgIFNWQ19JM0NfTUVSUldBUk5fVElNRU9VVCBCSVQoMjApCj4gPiAgI2RlZmluZSBT
VkNfSTNDX01ETUFDVFJMICAgICAweDBBMAo+ID4gICNkZWZpbmUgU1ZDX0kzQ19NREFUQUNUUkwg
ICAgMHgwQUMKPiA+ICAjZGVmaW5lICAgU1ZDX0kzQ19NREFUQUNUUkxfRkxVU0hUQiBCSVQoMCkK
PiA+IEBAIC0yMjUsNiArMjI2LDExIEBAIHN0YXRpYyBib29sIHN2Y19pM2NfbWFzdGVyX2Vycm9y
KHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyKQo+ID4gIAlpZiAoU1ZDX0kzQ19NU1RBVFVT
X0VSUldBUk4obXN0YXR1cykpIHsKPiA+ICAJCW1lcnJ3YXJuID0gcmVhZGwobWFzdGVyLT5yZWdz
ICsgU1ZDX0kzQ19NRVJSV0FSTik7Cj4gPiAgCQl3cml0ZWwobWVycndhcm4sIG1hc3Rlci0+cmVn
cyArIFNWQ19JM0NfTUVSUldBUk4pOwo+ID4gKwo+ID4gKwkJLyogaWdub3JlIHRpbWVvdXQgZXJy
b3IgKi8KPiA+ICsJCWlmIChtZXJyd2FybiAmIFNWQ19JM0NfTUVSUldBUk5fVElNRU9VVCkKPiA+
ICsJCQlyZXR1cm4gZmFsc2U7Cj4gPiArCj4gPiAgCQlkZXZfZXJyKG1hc3Rlci0+ZGV2LAo+ID4g
IAkJCSJFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHglMDh4LCBNRVJSV0FSTiAweCUwOHhcbiIs
Cj4gPiAgCQkJbXN0YXR1cywgbWVycndhcm4pOwo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
