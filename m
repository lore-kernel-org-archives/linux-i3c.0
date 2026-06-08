Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047B4CD8C9D
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h0lX/7+mXhsQR/XGbm8X39wfYqp6msT4AIwOp0DwmeY=; b=QCuoJgnUZNGxsL
	MKpufb++r2U7pTZH2WiwINUwR9MWjEwtPrIWLRohwYdaLl1WnYA8K9j9stAJlpxV1elx81Txaoxch
	8mUDgM0IYQZ3tcClxkx1TcYI2zo9cvKuDIH4+evymgGObis+ReuM/hFl3AlqEx93AhRpAO2Uoto52
	YthEalBjmfu3Btz1qIe4PHpt1puT9fAhjcoCjL2EC0a9elYqPrgzFyOcOlRNbC4mEOgYAZv3Q6PuN
	ewETnmJzDd69m+cT8Pr25DklRQ8VvzoqMEJ19f86ryn8jbtmHWeTPLCbJ/rTZgB3TKmdPuZp4NLoV
	+WKhHKPuLPoHjiWF66Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdqf-00000004CiH-2fpl;
	Mon, 08 Jun 2026 17:33:17 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdqd-00000004Chj-0fw7
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 17:33:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ee4VPfIMPRhpbPAGcr6EMDOssAgfFzROlU5wurz4UJsbvL8RAh9I8DSnH6/MmiKKpXvt5cVPb8LuxL57M3dD0tjoSLnrPq2C5PrPnc2fSQAZ02WQxlAa/V44jBSdXDXC36FD3qLVdksmXfOZ/tE3uXPKoW1iOhOypdAWiw0gky4tp3r2xpML382Z1GwfIZVr3LAPGT45c0UCOIZVIUtnkLQ8Qta9fSEj47ta13Kz127LmImfZWeI59W5DyS30r48+gLHyjtXnLXPX1k0VmE9+ngIvqAm4n6zCfNwQzQ8nDNYpgHAmZUH6iIfPqRHFyaN3KmmAVuDtGERXe/SZTipQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OfWSg041fM+NFL5KybkcatZlJ/naYyggdgmJpNb8zc=;
 b=KeiXevgI+8l4yO5ruLMciyTo5oMdIzeJTytWZRTMymKzJTsp60dgP1mZs29+wgksm0NmWD7/UZYJMnmPyUtMLox1sUPLJeSBpkPlqJVGfjlUzPSxP5zYdw5fbPJoVgwJM8RmPqCEqBMX/4wKX/aoRwMds3foRtFlTF8b3knSuxparqZDVGcjgHtaOROHpjNwlAULfHQNOJmvvwwX1MdzMKy1OLo5M3O82jdzJcORh4igrnL0CxOY2VCuzh2BriO6kQl8TRCtaRWh65BW7HO6AI+6UByurK4bLA9F7H0MfWA3sLsQPYguQcRLLeyHYmYJbzPvcq/B7a8DwdUmj2V9dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OfWSg041fM+NFL5KybkcatZlJ/naYyggdgmJpNb8zc=;
 b=rdFzj5tn4dvTy/qYoxDgHxXMw8gWxoyCHZnHeYcrv4dmt6ZjN2GIHLkku6ue6m1qCU9IGjOcszFABkWXQKwN1HwZJ1k+l68pBhiQLhFgmXEiRNNjZiotcqTE64mTVv0C+FGN4jCdxKDUasp5IiOknSxyeOL4UF8PtoJo74NZBhJwH+Os1VzSOpg6qm7+JWZ09S2YSN9Y914mHsp3eFj5BsHByBoRypk18xBuDV1bA/L0lU7vrI2qJOFAusuUpbrn9XR+4P5eDxbD2vTdf8OtMpRyALeAZLQ5Xe0P2PuEMuxGYc5n5b+SP7ari6M185R/wCqIDRHwM0Uc3XOTjj/4kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7095.eurprd04.prod.outlook.com (2603:10a6:20b:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 17:33:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 17:33:11 +0000
Date: Mon, 8 Jun 2026 13:33:06 -0400
From: Frank Li <Frank.Li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/7] i3c: mipi-i3c-hci: Ignore DISEC failures when
 disabling IBIs
Message-ID: <aib80opvhKCILTKr@lizhi-Precision-Tower-5810>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
 <20260608075801.16111-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260608075801.16111-3-adrian.hunter@intel.com>
X-ClientProxiedBy: SN7PR04CA0084.namprd04.prod.outlook.com
 (2603:10b6:806:121::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d55a377-31f7-403a-b4aa-08dec58402e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: cjT0LSjyh6c/r+t1YBYLws0b5dVfobiytb+/QqRBPx2Wch1uOiX3z2EeXSSCQO8xp0nmxxq68Ud6bUrAF/dwBvgFdvcTBxSb+wT5xw99gtkzTU2LKUbJ21dogZz20H6RmsCl0Xfv13ApfPP1goo/d24IFOb2J90oJQdx/e4cRhoxIL9zh0c3YwREMiu5lMDjuiuljpysPCOtIN6dt43AQ5BhpPPChm2f3INTNvsV2SfBmgmNKbERBp34BmxpJ5gM7mlLv7BT9PRd0/fe9cPGFSdZ3Ksy8TLfXwh3QV8SvD+UKKfJ2MKcnTNVbiGT3CEWGE/HRO1tDrMzHUXEs03oTdo61fg1Yn2D1caRHcqw8Uo62DAfDsPfLmD0+OHAWUYgt2gTDXF4DHGNbnTGw/bSC2h3WhpoWiN8Mod9VBkEt4yrLeyfeAwy33NhMaSbgOfwtJvJr90HrmYA8Oot6mhyukDaa5h2kYF2WCMA3CNz1GctVr8cS/IcHHv4MVIv2pOuh+357qED9G/DJ8tAD8xszCqIWw2cICdtN6dKfaCrxBIgArKkcKH7Mlw6oh2XrdjS5ATK5JKRoS7UD1EIS9t2dS8puboIvHeFT2bvYdM8wK3c1V9c3K5e1cNW8PlF89qXEbTnGTytzAgFJoWaJe/Q/rE4fCN+2+VEez3JvrZF2e/e68SwRk9kW7rjBSm+QZ0e
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEFCY1FwaWYvMDBkRkNIYWtKU3RHSmcxSEhYTURjYzNuM0VLYXExNTVHNzdL?=
 =?utf-8?B?Ly9RNk4vMWRWZXpJVzVYOHZQNFFncXZmbXhBVDhkaGdqcFVmREVzVDhyMkJn?=
 =?utf-8?B?NFdpTld1WTBYQ2o4aUp1VmNWdzRWNmpZTHZBZ0tTaDVTa0psU3BvMGtla1ZB?=
 =?utf-8?B?YUNjUHUzNXRoczlvRko5YXZGWFQ2WXJ0aVcrNjdhTTVudFRSQnl4R3d3c3hU?=
 =?utf-8?B?dFRMc1JsMjI1V0x5VGR6VjVkZ2tGUmN5VnJDeWliSHlMaEJtYmdPUEpVUjNk?=
 =?utf-8?B?ZWlHQWlTSnhUZVJjbEttc05BK0ZsUS9JK0s0OW5PZ3p4RHZVZHdEK0pLQXp6?=
 =?utf-8?B?QXJVTW1HU0k4bVdhNGZEanZNNVFSVkwwYjgvMU5scTZPVWdzRlBqd3Z1TDhS?=
 =?utf-8?B?emk2VWZXZmNsbmVoNzhvVGRRbWJ4eGZxRWZJUjhFR0M2c1AyeS8zWUdvNk85?=
 =?utf-8?B?VUhCWDFxUjFmMHg4Tk9BL3NMWDVZWStNdTRtRjA3NFVzK3NxaW53VTU0YUt5?=
 =?utf-8?B?eVRnblJKOXNPVkNENTh1U0JMbUhSa0tGZEtEdTZ6bG9lVE5vVWtrMi9OaDZr?=
 =?utf-8?B?aGE3L1QvcXRnTTJZY21TMlNKSHNhdmVYU3FjKzRnbzlHWEw4eUZYZS9SdmZt?=
 =?utf-8?B?RTRXTzIwdXdjUmMrdkNiUVFaOUVKYXdHRzZ4RHRmNDNlQVozY0k3dFhRVVBH?=
 =?utf-8?B?eHdKVklzR200TnQ0VThuamJYS2hTaEVVMGhpR0V2UXpvbEF2Uy9FRkZDbHJW?=
 =?utf-8?B?TGRxeFRtZldsMDh2T2pEdXZQS3hCdUJ5bHRjamVSSWxhRk5xUVVHeENXNkRD?=
 =?utf-8?B?bE9abnJKQW5iaFA5REdPK041M1RPd3dGNDJDZWgzTmtBb29GQVZZaFZQOFFy?=
 =?utf-8?B?RUpEeGRaNGdaaHY2WUIwVjZVa1NzWGtTb3BwTHVXdCtaa2JXelUydWFSb1pQ?=
 =?utf-8?B?SUNWMXEzeFM0elZtUGw4RmhkMHd3eGk3UTFLUXJxRWtKUXhZc2JrS0pVdWtI?=
 =?utf-8?B?Z1dKK29iaEFHNVpaQ2JRUkhpT1piNVYwNVZRN1FpUHo2NEdTT1hwcmhFMkZv?=
 =?utf-8?B?cDRMNjlmajdSVHZyVjdMTWZKTk5NQk5SZDhLWFd6Sjd5WjVlazdrRUI2MWtl?=
 =?utf-8?B?MWhvb3F5TUt2TjN0bXVWWTBTOU1TOTA3OXNhZ2xrcUJEWW8rT2FMVTRMMzhn?=
 =?utf-8?B?S29ic2hqTkFFN1NoY1FvMngwMTVtWVhHc0NGaWhDZXl4M1ZsaVJBRXJWNzUz?=
 =?utf-8?B?Uk5oc1YzVG5ZcCtIUTlJM0xjRmhyU0NFZmF3bHdLaVE3bmxKeHZHbGtEaGVi?=
 =?utf-8?B?Z1JDYWFGZ3pNT3lWeTRsdUdZRk45d0ZPaWY4RWJXKy8zdHdUQ3VERVoreUNt?=
 =?utf-8?B?ck9VN0FiQXUycU1VMmJhcUM3dHovSGdZT2NsM0RsNDF2VGgrZEdPZ2dGU2c2?=
 =?utf-8?B?Tmk3ZC8rSzZuajNDeXhZcDk1RWc2d3YvSUFtMjN3NWpReTNmTlVMRGFxNmVl?=
 =?utf-8?B?NG1MeU1wNGNzc3dka3p0Z1VDMmtFcEF2UVZnUHdnWDh3OXdobWxwdWEvemRy?=
 =?utf-8?B?ZHRWZ1l1bkRTcG5CMU9oZFljNHZmKzk2VTBKcFdwakJ5N09NK1VVbGxyR2Ri?=
 =?utf-8?B?OThFUitZSUhpSnI5RW5WVlgxeTFCamFFajlPYlJxTU5FOGRFcDNHUUpLUlNZ?=
 =?utf-8?B?dUQzaGZWckVNVHFRbGhzMUJFRThicXlvYmx1NFdUbXJDUkdqSWo4OENoU3E5?=
 =?utf-8?B?VVk3MDI0SmZuQTNJZ3lteXBVUW1UcGc1dmgwc3NpQ3MxZEtJWkpDUmFsUTNS?=
 =?utf-8?B?MUtuaDZOdlIyME1nZjdjRElnV2JhNEwrNnNBSTF3czJ1UnpCelZ4dnhKTlN0?=
 =?utf-8?B?Q25kQUlTOFI1dUNaREFtVEF5OEgweXNNMVYxZmZhdDkvaUUxZmR1NEMzTnNw?=
 =?utf-8?B?Qkt0ZENKRDBsVmpKODdQODBqWkdFL3hkTENma3pFSThmZ3g1eEQyb3dkWGNr?=
 =?utf-8?B?SzA1VWgwdS9hL21Hc0E5aUNNdURHZFR0eEw4R2xIRTJzNTIvYXBFeDZBS2dR?=
 =?utf-8?B?RVdReG1tM2RtYXpkRTVTL3cweW5wUlVxU2M4aDY2cTYwdnRHRGNUc2VuaVdU?=
 =?utf-8?B?L05zSDRybHJuSXo3VjgxUG1vdnZ2WXF6YXR5NFpzU0ZrcUxiZlBzOUZKVzkw?=
 =?utf-8?B?VzkrMlNFVlV4dnBGekVZbFZPRUhiQW9jNmtXSjNsNVNNcmRSb28yUE8vT2JT?=
 =?utf-8?B?eDE3MzRQRHRkS28vamNDWkFKanlDV1pSNndWU1VYdEM1dTdoMWNjcUMwdmdz?=
 =?utf-8?B?S1hyeWdMbVVlcHhINjJENnZucHpKU09GekhhTzNPMXY2YkZiNmVGVU5MMnoy?=
 =?utf-8?Q?68VP25wYYCWWiXs18q/+AMYbQvi0LKN04Rz8U?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d55a377-31f7-403a-b4aa-08dec58402e8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:33:11.0549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kscj9BOSx55HEdOlXWYXdIqeb3rloJCpv92xwVoX63sVzt/GGMhovNPAs7bQHIPp2T5o3mzO7qJE23W4XqD+myV6mZMzXUEMxuF+H3Z0hliIryts2X/M0enBbPiICejV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_103315_208016_CB7FDB38 
X-CRM114-Status: GOOD (  21.44  )
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

T24gTW9uLCBKdW4gMDgsIDIwMjYgYXQgMTA6NTc6NTVBTSArMDMwMCwgQWRyaWFuIEh1bnRlciB3
cm90ZToKPiBEaXNhYmxpbmcgSUJJcyBjdXJyZW50bHkgcmV0dXJucyB0aGUgcmVzdWx0IG9mIHRo
ZSBESVNFQyBDQ0MsIGNhdXNpbmcKPiBpM2NfaGNpX2Rpc2FibGVfaWJpKCkgdG8gZmFpbCBpZiB0
aGUgdHJhbnNmZXIgZXJyb3JzIG91dC4KPgo+IEhvd2V2ZXIsIHRoZSBjb250cm9sbGVyIGhhcyBh
bHJlYWR5IGJlZW4gcHJvZ3JhbW1lZCB0byByZWplY3QgSUJJcyBieQo+IHNldHRpbmcgREFUXzBf
U0lSX1JFSkVDVCwgc28gdGhlIHRhcmdldOKAmXMgSUJJcyBhcmUgZWZmZWN0aXZlbHkgZGlzYWJs
ZWQKPiBmcm9tIHRoZSBob3N0IHNpZGUgcmVnYXJkbGVzcyBvZiB0aGUgb3V0Y29tZSBvZiB0aGUg
RElTRUMgY29tbWFuZC4gIEF0Cj4gdGhpcyBwb2ludCwgdGVhcmRvd24gb2YgdGhlIElCSSBpbmZy
YXN0cnVjdHVyZSBjYW4gc2FmZWx5IHByb2NlZWQgZXZlbgo+IGlmIERJU0VDIGZhaWxzLgo+Cj4g
Tm90ZSwgZnJvbSB0aGVuIG9uLCB0aGUgTUlQSSBJM0MgSENJIG5vdCBvbmx5IE5BQ0tzIHRoZSB0
YXJnZXQncyBJQkkgYnV0Cj4gYXV0b21hdGljYWxseSBzZW5kcyBhbm90aGVyIERJU0VDIGNvbW1h
bmQuCj4KPiBNYWtlIGkzY19oY2lfZGlzYWJsZV9pYmkoKSByZXNpbGllbnQgYnkgaWdub3Jpbmcg
dGhlIHJldHVybiB2YWx1ZSBvZgo+IGkzY19tYXN0ZXJfZGlzZWNfbG9ja2VkKCkgYW5kIGFsd2F5
cyByZXR1cm5pbmcgc3VjY2Vzcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBIdW50ZXIgPGFk
cmlhbi5odW50ZXJAaW50ZWwuY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFu
ay5MaUBueHAuY29tPgoKPgo+Cj4gQ2hhbmdlcyBpbiBWMjoKPgo+IAlSZS1iYXNlIGR1ZSB0byBj
aGFuZ2VzIGluIHByZXZpb3VzIHBhdGNoLgo+Cj4KPiAgZHJpdmVycy9pM2MvbWFzdGVyL21pcGkt
aTNjLWhjaS9jb3JlLmMgfCA4ICsrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIv
bWlwaS1pM2MtaGNpL2NvcmUuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29y
ZS5jCj4gaW5kZXggMWUxZjA1YWZmMDkyLi5mZmZiYzE3NzVlZjkgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPiArKysgYi9kcml2ZXJzL2kzYy9t
YXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+IEBAIC02OTcsNyArNjk3LDEzIEBAIHN0YXRpYyBp
bnQgaTNjX2hjaV9kaXNhYmxlX2liaShzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYpCj4gIAlzdHJ1
Y3QgaTNjX2hjaSAqaGNpID0gdG9faTNjX2hjaShtKTsKPgo+ICAJX19pM2NfaGNpX2Rpc2FibGVf
aWJpKGhjaSwgZGV2KTsKPiAtCXJldHVybiBpM2NfbWFzdGVyX2Rpc2VjX2xvY2tlZChtLCBkZXYt
PmluZm8uZHluX2FkZHIsIEkzQ19DQ0NfRVZFTlRfU0lSKTsKPiArCS8qCj4gKwkgKiBUaGUgREFU
IGVudHJ5IGlzIG5vdyBzZXQgdG8gTkFDSyBhbmQgRElTRUMgdGhpcyB0YXJnZXQncyBJQklzLCBz
bwo+ICsJICogdGhlIElCSSB0ZWFyZG93biBjYW4gcHJvY2VlZCBldmVuIGlmIERJU0VDIGJlbG93
IGZhaWxzLCBzbyBpZ25vcmUKPiArCSAqIGVycm9ycy4KPiArCSAqLwo+ICsJaTNjX21hc3Rlcl9k
aXNlY19sb2NrZWQobSwgZGV2LT5pbmZvLmR5bl9hZGRyLCBJM0NfQ0NDX0VWRU5UX1NJUik7Cj4g
KwlyZXR1cm4gMDsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIGkzY19oY2lfcmVjeWNsZV9pYmlfc2xv
dChzdHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYsCj4gLS0KPiAyLjUxLjAKPgoKLS0gCmxpbnV4LWkz
YyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
