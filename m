Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7D5C47DB7
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Jan 2024 20:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJEoJx3E7JZSbzeBrh+mE6QXL1/F5Rh8l9PHf7Fp/Cw=; b=wVDgzyCMdbXtdx
	by93xRN8lWG2r+LEG3ayM9MOXUJUGsiclG2ULPmXa4OtIINuC70rPPCw2Q68Yi30TU+eLSmWO+Ij9
	vP/zjfVpzrf5GsBIlOSgRIywIpiRTC7mkEAaJSLG/VJ4YPIcZTItIwI6NSHx/hu8W/GdCmHQzY62i
	d4KmZCBGj8YuexWkWaSC8X2W3FImbHRWii7SRd5/XpgJL5twV9dbmCdVYd/xGGdcK45tRVLzBnP50
	JbKGiCzrgZk26f5jms3ivgLM/geuXZm4OUii8wnnirYV3CMSZ9nfbhulnB0an3q+ohCJqH6ZwYZFW
	APeXRVk0E2sp1oz+0koQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYmV-003mXP-09;
	Thu, 18 Jan 2024 20:14:31 +0000
Received: from mail-vi1eur04on0619.outbound.protection.outlook.com ([2a01:111:f400:fe0e::619] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYmR-003mX1-36
	for linux-i3c@lists.infradead.org;
	Thu, 18 Jan 2024 20:14:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4a0yNDzIcv2a/rCZNi119VZ1QmEmiaJQ69oHFlY2bHT6e2WC0m5GHaCMvw6LzI6SFYOuIqJJ0R6CcvQq//UefPWP07f6Lc8hBH1youpub0MSaJij9soMoC7x8DbKSHqynzXL1L5Dm31UjMrUuCJw/Nkku3KVLyjxH3Tr9iNYvwDG/PdcBA7c07htQ7bEOW31YQB7MGkiRyU7tJ+y4uGxE0BPiYvtGB+oEzZigNea0/nw3nE1zQh703JyMm8pItocg2gkOTc+kyLViXNcDBPZnkVWsQxgeFdBw6JnPCMxrSD/JfQT3FG799KixLXelmG18Ll7ZPhXUmM//rrCGb2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5sBQ3bIW518NjHmlQ39W/vxBk3FihyBIMCtZNqieu0=;
 b=hzyhoBRW61jKkLgNdak5d4Eaqfw8PYr7IOSbMgYRGEOBrBrVpePBCM6bgELO5q5UO3fdeq4qWqX0WEnWpcr6p+LsOpnOwgRgD2kc7W5l/KuzCY6ZACNqQsBNRyrVLfN0ahdJBKG/n7LyEUi3+8r0ILhwO+VQOdvZP/DgjiSvgthmB5/PmYRzm+SMf0c3tpXiyavtvKrbEyl5s7W3srXeR2UJ71P2OJqlelzPdWWWv3i/b/nHScH13rOzROSbd8XWWRjd/Jy8Qsx2RZWMv3y4jolbmmZyFZIi0RqsYQPPNYLwv7rFamGWVowmTXBWGig8m55MCrUhX39fEAhoaVhwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5sBQ3bIW518NjHmlQ39W/vxBk3FihyBIMCtZNqieu0=;
 b=NH6eKYLYuXa2hmvg2rc8lw8n+ZOV1ujQvEsm/vm3U1MBIF57vgbBpwP3lVhGj1F2MFb4o0vhQFMpOwvsWRbXD2AyrvaLnrUcnAG409Ge+2X/bAzHj8d75KimVN2aOpugbMIkl9WvLeg4dzuT52WHLf/foMdDQYGZ/5e+3uI+b0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6936.eurprd04.prod.outlook.com (2603:10a6:20b:106::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 20:14:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9%4]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 20:14:23 +0000
Date: Thu, 18 Jan 2024 15:14:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: imx@lists.linux.dev, Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"moderated list:SILVACO I3C DUAL-ROLE MASTER" <linux-i3c@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] i3c: master: svc: add support for read len bigger
 than 255
Message-ID: <ZamGmNe0KMbEHu+0@lizhi-Precision-Tower-5810>
References: <20240117225009.2931699-1-Frank.Li@nxp.com>
Content-Disposition: inline
In-Reply-To: <20240117225009.2931699-1-Frank.Li@nxp.com>
X-ClientProxiedBy: PH7PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:510:174::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: be3662e0-b435-4d9d-330e-08dc18620fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ihn2xCTv83KZf6Qy1nRybU0D58mJaag7+YdsA7oSZ0GUkz5FGED39YjRZvaB7Hy7bmYCQEnR1iBVC79jY9wFGYrG4yUb9hsFUNbQDU/uGSmy/mRGbMUuZ7kah7xCn/FPIPP1jnE40hSh/vZUihPLE+9th06W2lqGlNPM7O+nPBOPFU4BgGEHajxXQDNImQ67PPC4/Ud+PBHr8AY30+r81JuZuMR4DC4+51KlKc7kWjxwwPSLZIUJTYa5NnBe8yrNWtzJfUrRxc70Il/H18DFNhmI8S3k1X+CNdBmUDIjgRLBbrCkoppsnBR8Erdr7yiPjDZULW+A8kY7vbX/8JTXlNB8kbt4Tg/X4zwMJJX0oo2ZKP/FLKYOL1BZC7Ha73yWfHqgyyZ6sZ9Vr+sSTgqXFc/xYdt19o4hkWbMGUjcZoUQ9VDLiaG1smQwmZz0LIShqRCj3N1Ko/7Y4jvZDVbYGAfBwU7t5DUJlPL7NsAWYdm9rniK6mW7U1J2/GOCUCAKZe1k+IHyXVGMwCqSLxKDVX01A74uSpkGTLdp8llkk2sg1agQ/154wF1w4UM671PJucRzLeK9SXG1+83YyUis1upzs9CODMaf6Euc647r6cYV/0b3gEsSDF9x1HxZPwdO1kw7iNAbRUwRgAZQfj57eL038bSTvmEQfBqCubBz6FsTHN/8ynKHoknFBGOBd0IVqknLMdymKGXLogpg9CMJmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(86362001)(8676002)(8936002)(26005)(38100700002)(2906002)(83380400001)(5660300002)(478600001)(52116002)(66476007)(66556008)(6486002)(66946007)(6506007)(9686003)(6512007)(6666004)(110136005)(316002)(41300700001)(38350700005)(33716001)(135533001)(67856001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDI1bW91NXloRnRjZ1E4SGltcWxIbnpIU2kweU1Zdk1MS1hzNXZWNFVkZklK?=
 =?utf-8?B?bDZlcmtERE1IWjdOWTludXEzOHkxWlA0V3U2clBiZGdrMnRVTENRcS9veE5a?=
 =?utf-8?B?TXRJN3BCLzBTb0l1QTdMU3VXbzUvRFBocGxTTnJ6RDE4K0t5VzRsNmlUQUpz?=
 =?utf-8?B?SlhqVVk1SHV0TzV4aCtoMEhIcjFqVW1ZL01zM2lPV0grUXdYMUJhdG5ac2V6?=
 =?utf-8?B?SmVWNWNOWFlDcjNyQ0dXa0ZiTUtTc0U5aHo4Vy9JZG9nbG1BRVY4Z2I2U1V0?=
 =?utf-8?B?WGoyZWV5VVVTN2xRcUdhcTYzWWhQQnNqSi9FWVhQU285U0lCQTAwWWJvUDR3?=
 =?utf-8?B?R1NLNlpDSEVoMHBkS2tSTXMvdVhILzZqdGczd2xVYi95SmFjbTdDcGdGL2Fq?=
 =?utf-8?B?QTdEanFpL3BOQm9YVFZpamRMd2E3MnhidFJVNWNxUEFid3dlL2NWcllYQzhq?=
 =?utf-8?B?VE5kdmwrUCtYaUhod2ZpblJyRVIyNExxK3hWY0tzRDZ4WkV2MTFTbmIrOU5l?=
 =?utf-8?B?YkZ1cERWcmNFMC8xVkJsdmxoRVFFVThBeEFPb0JxdVpjSmdLOW5OV1hkK01x?=
 =?utf-8?B?bGFyQ3VSMGNDUk5QelBPRS9PamZ3WTZvNXBGSVFFNERXbFlsdDRxa0YycDdW?=
 =?utf-8?B?MkdaQklSUHRLRUNjMlZNRkZRWmZaa09DTjMxUnNCaU5KdUxzaXJIdjducjQy?=
 =?utf-8?B?bjlmcExWTWpqczBoK2daTndrMTNjdGFXdDN0Y3RFQ1I2WmdnSUFaajhLaVV0?=
 =?utf-8?B?TVJnckcxUVNaSlI4MkhxcDhSbzFvdTNiMjhtek40ZzFpQnZjOXNaK1FhZGVp?=
 =?utf-8?B?K0JIdHZiK1I2cGUwdWE1aG84aEt3QTRoTGkwcUk3N3lBZGtod1FvOENQblkw?=
 =?utf-8?B?a3A3SXhlMUxhVC90OFZsc1N0V2dieXhmZFlTclI1ZEpEVWVGbXZPRlJLSGVD?=
 =?utf-8?B?VVhYR2Fseno2bzVERUcxeDUrcXZ1Y3RuSktlVkJYYWhiUU9wblpuVzl5Mzhh?=
 =?utf-8?B?N1FEbUEyZHJUNUhoNzNTaDFORXY0YkhkNUNYOUJWNW1pTVhNU2pYdzVnaDFD?=
 =?utf-8?B?VXNlNlh0ZjYraGhGSWRnRzMvR3ZzSDYwYksxYUlMYXBPOHRLMW9ZNk1lcytm?=
 =?utf-8?B?WWtmS0dHN0VqVk9oTjJXaHBkM2lxUVJFTUwzbHVycUc3aDgxQXhXVFIyQ1Jz?=
 =?utf-8?B?UFV4ZjJINGtWenJ1QzdVQjZpbklPd0JnYXFweFo5STZyWDdDT0ZpTmk1Q1RV?=
 =?utf-8?B?aW9hV3E5dHNOU1llcXpCaUFtakJBWXV1Qko1d094VGJ2aHluZFJXOUlWbEFM?=
 =?utf-8?B?SC9vam5PYzR2aXQ3WC9sZFBWR2NqWU9Pb0hJeTBPcEZzdGRaOTA2WWFKL2ky?=
 =?utf-8?B?TENUVzZiV1NDWkUwZ1pLUFZ1K2RyQ2RBUy9OY0NmY2dUUDkxRmhhTW9JRVJM?=
 =?utf-8?B?eEpjNGxLZTRaSm5BY1c5Y3NBNmhDZFhjT3BQRlVSN3l1MXdKOGRnTU80WmFq?=
 =?utf-8?B?RFNlSldmZEl5cUg2cFVkMDJYOUg4QTh6K2VlUkhhajFDOHRsUVpRZThuYkhi?=
 =?utf-8?B?Z3dmN3l4SXB5NUp0d2h2YzNZK1dzWTY5NVpRc3dnRkM2OVZRTEdsOElDbnNX?=
 =?utf-8?B?ZHVMbHZLL2hIM202UWMwK2tjNFNmd2JmN1l5VllIZDdhd01MSWhaQjdTN2pR?=
 =?utf-8?B?V3F5WmNYRTRGdFBDNjdTbDlEYVA2QTlGR1lsYUxnVzh1VytSak1kdEp5S1N6?=
 =?utf-8?B?QnB6d0dxUlFPZzZqdkVpRU9wcjBsOTlyaTVqMlMzSXhUNUtjb0szQkJ1bUdJ?=
 =?utf-8?B?cnNzcUJvWXJCRGs3VmpOQ2xndU93MDUyY3UwVHI3cHczZnZFTGpzb0Rxb0U4?=
 =?utf-8?B?YTZKeGswWEdwZ2ZjWjExdlFQV3kyOGY1UE4yM1RhTnY5RVZUT2RNWVkxbm1h?=
 =?utf-8?B?SFMvNGwyWm1LS0ErVzJjVGJmdWdVeWxRSEQvRll6eHBuM0lZRmR5WDVPSGxH?=
 =?utf-8?B?SWhVVGdqZGExZzJHbVFMZS9yVWh0ZE1TdFRJblpRTjQ5a0tNRUhYU2owd3Fs?=
 =?utf-8?B?djVEdmxmOFdKSHhHNXZUU3hySktEdDJkU0RKUVJJWDF1eVh0S255TzFkUkpD?=
 =?utf-8?Q?V5sc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be3662e0-b435-4d9d-330e-08dc18620fb9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 20:14:23.3523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eMEJbX4v9V3yJlvEkJCgE/JraouShDEU7o3mvjmTin04bZf5S34NQBTmkiGyUgP76rIUJwOxIbQ61sh3Zhlhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_121428_020637_CCEC5BEE 
X-CRM114-Status: GOOD (  22.87  )
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

T24gV2VkLCBKYW4gMTcsIDIwMjQgYXQgMDU6NTA6MDlQTSAtMDUwMCwgRnJhbmsgTGkgd3JvdGU6
Cj4gUkRURVJNIGlzIDhiaXQuIE9ubHkgc3VwcG9ydCBtYXggMjU1IHJlYWQgdHJhbnNmZXIgZm9y
IGF1dG8gdGVybWluYXRlLiBVc2UKPiBtYW51YWwgdGVybWluYXRlIHdoZW4gcmVhZCBsZW4gYmln
Z2VyIHRoYW4gMjU1Lgo+IAo+IFdoZW4gbGVmdCBkYXRhIGxlbmd0aCBpcyBGSUZPIHNpemUgKyAx
LCBpc3N1ZSB0ZXJtaW5hdGUKPiAoUkRURVJNKDEpIHwgUkVRVUVTVF9OT05FKS4gU28gaGFyZHdh
cmUgd2lsbCBzdG9wIGZldGNoIGRhdGEgYWZ0ZXIgbmV4dAo+IGRhdGEuCj4gCeKUgiDil4TilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIAgIGJ1ZmYgbGVuZ3RoICAgICDilIDilIDilIDilIDi
lIDilIDilIDilIDilrrilIIKPiAJ4pSCICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAg4pSCCj4gCeKUgiAgICAgICAgICAgICAgICAgICAgICAg4pSM4pSA4pSs4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSkCj4gCeKUgiAgICAgICAgICAgICAgICAg
ICAgICAg4pSCIOKUgiAgRklGTyBTSVpFICDilIIKPiAJ4pSCICAgICAgICAgICAgICAgICAgICAg
ICDilJTilIDilLTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJgKPiAJ
ICAgICAgICAgICAgICAgICAgICAgICAg4payCj4gCSAgICAgICAgICAgICAgICAgICAgICAgIOKU
ggo+IAkgICAgICAgICAgICAgICAgICBXYWl0IEZJRk8gRnVsbCBhbmQgSXNzdWUgcmVhZCB0ZXJt
bmlhdGUgaGVyZSEhCj4gCj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5j
b20+CgpTb3JyeSwgcGxlYXNlIGhvbGQuIEkgZm91bmQgZmFpbHVyZSBhdCBjb3JuZXIgY2FzZS4K
d2lsbCBpbXByb3ZlIGFuZCBzZW5kIG5leHQgdmVyc2lvbiBsYXRlci4KCkZyYW5rCj4gLS0tCj4g
IGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgNzYgKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1t
YXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gaW5kZXggNWVl
NGRiNjg5ODhlMi4uNTgwNDdhZDM1Nzc5MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0
ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1h
c3Rlci5jCj4gQEAgLTk3Nyw3ICs5NzcsNyBAQCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX2Rv
X2RhYShzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptKQo+ICB9Cj4gIAo+ICBzdGF0aWMg
aW50IHN2Y19pM2NfbWFzdGVyX3JlYWQoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIsCj4g
LQkJCSAgICAgICB1OCAqaW4sIHVuc2lnbmVkIGludCBsZW4pCj4gKwkJCSAgICAgICB1OCAqaW4s
IHVuc2lnbmVkIGludCBsZW4sIGJvb2wgYXV0b190ZXJtKQo+ICB7Cj4gIAlpbnQgb2Zmc2V0ID0g
MCwgaTsKPiAgCXUzMiBtZGN0cmwsIG1zdGF0dXM7Cj4gQEAgLTk5NSwxNiArOTk1LDYwIEBAIHN0
YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfcmVhZChzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3Rl
ciwKPiAgCQkJcmV0dXJuIC1FVElNRURPVVQ7Cj4gIAkJfQo+ICAKPiAtCQltZGN0cmwgPSByZWFk
bChtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01EQVRBQ1RSTCk7Cj4gLQkJY291bnQgPSBTVkNfSTND
X01EQVRBQ1RSTF9SWENPVU5UKG1kY3RybCk7Cj4gLQkJaWYgKG9mZnNldCArIGNvdW50ID4gbGVu
KSB7Cj4gLQkJCWRldl9lcnIobWFzdGVyLT5kZXYsICJJM0MgcmVjZWl2ZSBsZW5ndGggdG9vIGxv
bmchXG4iKTsKPiAtCQkJcmV0dXJuIC1FSU5WQUw7Cj4gLQkJfQo+IC0JCWZvciAoaSA9IDA7IGkg
PCBjb3VudDsgaSsrKQo+IC0JCQlpbltvZmZzZXQgKyBpXSA9IHJlYWRsKG1hc3Rlci0+cmVncyAr
IFNWQ19JM0NfTVJEQVRBQik7Cj4gKwkJaWYgKGF1dG9fdGVybSB8fCBjb21wbGV0ZWQpIHsKPiAr
CQkJLyogYXV0byB0ZXJtYXRlIG9yIGVhcmx5IHRlcm1hdGUgYnkgdGFyZ2V0ICovCj4gKwkJCW1k
Y3RybCA9IHJlYWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTURBVEFDVFJMKTsKPiArCQkJY291
bnQgPSBTVkNfSTNDX01EQVRBQ1RSTF9SWENPVU5UKG1kY3RybCk7Cj4gKwkJCWlmIChvZmZzZXQg
KyBjb3VudCA+IGxlbikgewo+ICsJCQkJZGV2X2VycihtYXN0ZXItPmRldiwgIkkzQyByZWNlaXZl
IGxlbmd0aCB0b28gbG9uZyFcbiIpOwo+ICsJCQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJCX0KPiAr
CQkJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspCj4gKwkJCQlpbltvZmZzZXQgKyBpXSA9IHJl
YWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTVJEQVRBQik7Cj4gKwo+ICsJCQlvZmZzZXQgKz0g
Y291bnQ7Cj4gIAo+IC0JCW9mZnNldCArPSBjb3VudDsKPiArCQl9IGVsc2Ugewo+ICsJCQkvKgo+
ICsJCQkgKiBDb250cm9sbGVyIHdpbGwgZmlsbCB3aG9sZSBSWCBGSUZPIGluIG1hbnVhbCBtb2Rl
LiBGSUZPIGZ1bGwgY2FuIHByZXZlbnQKPiArCQkJICogY29udHJvbGxlciBjb250aW51ZSBmZXRj
aCBkYXRhIGZyb20gdGFyZ2V0Lgo+ICsJCQkgKgo+ICsJCQkgKiBXaGVuIGxlZnQgZGF0YSBsZW5n
dGggaXMgRklGTyBzaXplICsgMSwgaXNzdWUgdGVybWluYXRlCj4gKwkJCSAqIChSRFRFUk0oMSkg
fCBSRVFVRVNUX05PTkUpLiBTbyBoYXJkd2FyZSB3aWxsIHN0b3AgZmV0Y2ggZGF0YSBhZnRlciBu
ZXh0Cj4gKwkJCSAqIGRhdGEuCj4gKwkJCSAqCj4gKwkJCSAqIOKUgiDil4TilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIAgIGJ1ZmYgbGVuZ3RoICAgICDilIDilIDilIDilIDilIDilIDilIDi
lIDilrrilIIKPiArCQkJICog4pSCICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAg4pSCCj4gKwkJCSAqIOKUgiAgICAgICAgICAgICAgICAgICAgICAg4pSM4pSA4pSs4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSkCj4gKwkJCSAqIOKUgiAgICAgICAg
ICAgICAgICAgICAgICAg4pSCIOKUgiAgRklGTyBTSVpFICDilIIKPiArCQkJICog4pSCICAgICAg
ICAgICAgICAgICAgICAgICDilJTilIDilLTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilJgKPiArCQkJICogICAgICAgICAgICAgICAgICAgICAgICAg4payCj4gKwkJCSAq
ICAgICAgICAgICAgICAgICAgICAgICAgIOKUggo+ICsJCQkgKiAgICAgICAgICAgICAgICAgICAg
ICAgICBXYWl0IEZJRk8gRnVsbCBhbmQgSXNzdWUgcmVhZCB0ZXJtbmlhdGUgaGVyZSEhCj4gKwkJ
CSAqLwo+ICsJCQltZGN0cmwgPSByZWFkbF9yZWxheGVkKG1hc3Rlci0+cmVncyArIFNWQ19JM0Nf
TURBVEFDVFJMKTsKPiArCQkJY291bnQgPSBTVkNfSTNDX01EQVRBQ1RSTF9SWENPVU5UKG1kY3Ry
bCk7Cj4gKwo+ICsJCQlpZiAob2Zmc2V0ICsgY291bnQgKyBTVkNfSTNDX0ZJRk9fU0laRSA8IGxl
bikgewo+ICsJCQkJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKPiArCQkJCQlpbltvZmZz
ZXRdID0gcmVhZGxfcmVsYXhlZChtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01SREFUQUIpOwo+ICsJ
CQkJCW9mZnNldCsrOwo+ICsJCQkJfQo+ICsJCQl9IGVsc2Ugewo+ICsJCQkJaWYgKGNvdW50ICE9
IFNWQ19JM0NfRklGT19TSVpFKQo+ICsJCQkJCWNvbnRpbnVlOwo+ICsKPiArCQkJCS8qIElzc3Vl
IG1hbnVhbCByZWFkIHRlcm1pbmF0ZSBhdCBuZXh0IGRhdGEgKi8KPiArCQkJCWlmIChvZmZzZXQg
KyBTVkNfSTNDX0ZJRk9fU0laRSA9PSBsZW4gLSAxKQo+ICsJCQkJCXdyaXRlbF9yZWxheGVkKFNW
Q19JM0NfTUNUUkxfUkVRVUVTVF9OT05FIHwKPiArCQkJCQkJICAgICAgIFNWQ19JM0NfTUNUUkxf
RElSKDEpIHwKPiArCQkJCQkJICAgICAgIFNWQ19JM0NfTUNUUkxfUkRURVJNKDEpLAo+ICsJCQkJ
CQkgICAgICAgbWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NQ1RSTCk7Cj4gKwo+ICsJCQkJaW5bb2Zm
c2V0XSA9IHJlYWRsX3JlbGF4ZWQobWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NUkRBVEFCKTsKPiAr
CQkJCW9mZnNldCsrOwo+ICsJCQl9Cj4gKwkJfQo+ICAJfQo+ICAKPiAgCXJldHVybiBvZmZzZXQ7
Cj4gQEAgLTEwNDIsOSArMTA4NiwxNyBAQCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX3hmZXIo
c3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIsCj4gIAkJCSAgICAgICB1OCAqaW4sIGNvbnN0
IHU4ICpvdXQsIHVuc2lnbmVkIGludCB4ZmVyX2xlbiwKPiAgCQkJICAgICAgIHVuc2lnbmVkIGlu
dCAqYWN0dWFsX2xlbiwgYm9vbCBjb250aW51ZWQpCj4gIHsKPiArCWludCByZHRlcm0gPSAwOwo+
ICAJdTMyIHJlZzsKPiAgCWludCByZXQ7Cj4gIAo+ICsJaWYgKHJudykKPiArCQlyZHRlcm0gPSB4
ZmVyX2xlbjsKPiArCj4gKwkvKiBJZiByZWFkIGxlbmd0aCA+IG1heCBSRFRFUk0gaW4gTUNUUkws
IHVzaW5nIG1hbnVhbCB0ZXJtaW5hdGUgKi8KPiArCWlmICh4ZmVyX2xlbiA+IDI1NSkKPiArCQly
ZHRlcm0gPSAwOwo+ICsKPiAgCS8qIGNsZWFuIFNWQ19JM0NfTUlOVF9JQklXT04gdzFjIGJpdHMg
Ki8KPiAgCXdyaXRlbChTVkNfSTNDX01JTlRfSUJJV09OLCBtYXN0ZXItPnJlZ3MgKyBTVkNfSTND
X01TVEFUVVMpOwo+ICAKPiBAQCAtMTA1Myw3ICsxMTA1LDcgQEAgc3RhdGljIGludCBzdmNfaTNj
X21hc3Rlcl94ZmVyKHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyLAo+ICAJICAgICAgIFNW
Q19JM0NfTUNUUkxfSUJJUkVTUF9OQUNLIHwKPiAgCSAgICAgICBTVkNfSTNDX01DVFJMX0RJUihy
bncpIHwKPiAgCSAgICAgICBTVkNfSTNDX01DVFJMX0FERFIoYWRkcikgfAo+IC0JICAgICAgIFNW
Q19JM0NfTUNUUkxfUkRURVJNKCphY3R1YWxfbGVuKSwKPiArCSAgICAgICBTVkNfSTNDX01DVFJM
X1JEVEVSTShyZHRlcm0pLAo+ICAJICAgICAgIG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTUNUUkwp
Owo+ICAKPiAgCXJldCA9IHJlYWRsX3BvbGxfdGltZW91dChtYXN0ZXItPnJlZ3MgKyBTVkNfSTND
X01TVEFUVVMsIHJlZywKPiBAQCAtMTA4Niw3ICsxMTM4LDcgQEAgc3RhdGljIGludCBzdmNfaTNj
X21hc3Rlcl94ZmVyKHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyLAo+ICAJfQo+ICAKPiAg
CWlmIChybncpCj4gLQkJcmV0ID0gc3ZjX2kzY19tYXN0ZXJfcmVhZChtYXN0ZXIsIGluLCB4ZmVy
X2xlbik7Cj4gKwkJcmV0ID0gc3ZjX2kzY19tYXN0ZXJfcmVhZChtYXN0ZXIsIGluLCB4ZmVyX2xl
biwgISFyZHRlcm0pOwo+ICAJZWxzZQo+ICAJCXJldCA9IHN2Y19pM2NfbWFzdGVyX3dyaXRlKG1h
c3Rlciwgb3V0LCB4ZmVyX2xlbik7Cj4gIAlpZiAocmV0IDwgMCkKPiAtLSAKPiAyLjM0LjEKPiAK
Ci0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
