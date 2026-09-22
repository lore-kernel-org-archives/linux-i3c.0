Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FE1C98302
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Sep 2026 18:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZ2EY9SoHM7Biwe8WV73bkLGrX6E1W2vrosSY6esKLs=; b=BVB1cC827Oc+OL
	OW4Gcm3SCrGlB2pXWBf3bmU2AIFCIpZdLRSBhUYfASaGQpOitUH38ofRxApmrC9O+EJDT+0HdA8W3
	oe0TS3TDpsApFpA4hTC1+0wQuJQEZxo7keNwjhBaRFrdnlkLv0uObg83w2dvKqECXYVHGCFseJv7M
	pGf9jvvBhnYmKNT8ANxtEABzrqu3w5jo4qNQe9OnazZFWfGqT64sO7bseqEbO1Ipe12n+N+VWJvSv
	Z6NtLGqQ4++5VEXkeCpBC2HkjlZCWgaCNK1UAP8tKDTdQ9DyYpP3BHGsZh2kmw1sDmEnqHL6patqW
	fmJGmQ2kdd4b0W9vztJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95Nc-00000006K6a-021P;
	Tue, 22 Sep 2026 18:38:12 +0000
Received: from mail-swedencentralazon11013042.outbound.protection.outlook.com ([52.101.83.42] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95NY-00000006K63-40dH
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 18:38:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKASaD13Ss0UsDiZa3kDR+Qdyrm+VY37X+PHAybp8Lua6JNp4XfR639+j7NQNbUU8p9/+ne/FuKTPy7O1AwjKMG79NVTY4nVVM0SsbeToSrHb1oAJW/q2sjiEap+PG5ze7KaKwXSpvPaX87x7j+vT7o70GwrVTKtfGVRqqKSNName3KTxni4+orRiOTqQmXGn5e/weToiE/cOBrzfmIutWf4V1UM4G6HayETi/CADuCGvsiABC9rcNDytZ8KEYNPSg6XW57fJ4V+9wJjmR1+yvv4pjMJtoo4XmjcQIN68wpb6cQcbN1TVzsQRdFy6s0hgCITVxz6foOsLFbdHfvAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBOENwhF1JG8GSzymhn7Ez36BnWNCh+3OPvVOYENtdI=;
 b=Dv2QkSG46DLx9sk39uXnPGqKMtmjrtyCOS756Kwf9dDXLqmAuuY58j/7GbnTe1IwuhrkfYRQkKk+8bLVbhbG3ekNgpVSH4VDUG6mYmheJ8nVckrJsRqHWNVx8hqW94lC+YbWvhQxf2a+cKw42OxNgVMmZlwF3iVF0EMu6/6rLkA19+6Zl7G9IusGec1xrA+hFTvSh3gAke21xXMD/z5F6bXaQ9sZlPB/WOZrF/YVuL6KaMbYSJEt8hle05tedEMKnigk1BV1v8VfcQ1xt73UKBrkPimzmJo4Dcb7V4Ts316fjfSjCfJjIWxtpv1Wt9cl+ueXZV+V6ELIl4PBPIqwpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBOENwhF1JG8GSzymhn7Ez36BnWNCh+3OPvVOYENtdI=;
 b=JOjaDvwETJC9w1hFx4WeMJJFQCNQR/aJtMOqGiRYk/dn5FGFfFLyHPb58/EAhH/PTKmPjg6OM2GkcO+A6u1pWC1Lq6nWUsaCZlCvrZY5I861+mGpxo/rOH5e8AIZveR0ZOb/azE6bM/MqAJNa3VLkD4B6Suf662cQ0W671r446k0oI+pID940E3EIqqO2jAr7OBpZMYhHP853QZekByu/yG3c3jD0s2Gl75FIpsTmGntANvP0jhCB+92OXtVlzjFnL8wICNMlUHpCgGt5GYwYYY/vE8uORj8W1Zc0yjOzUpi7mkA8WvAPb3tE6uSrrkZcUNUDo3M2qkoQtyiTJZyWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7481.eurprd04.prod.outlook.com (2603:10a6:102:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 18:38:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 18:38:04 +0000
Date: Tue, 22 Sep 2026 13:37:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	Lakshay Piplani <lakshay.piplani@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>,
	=?utf-8?B?546L54Kc?= <wei_wang@realsil.com.cn>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUkY=?= =?utf-8?Q?C?= PATCH 4/4] i3c: hub:
 Add Realtek RTS490x I3C hub support
Message-ID: <arLLAEsNiGyb_OZf@SMW015318>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-5-zain_zhou@realsil.com.cn>
 <arF6ifEpWAlO10B3@lizhi-Precision-Tower-5810>
 <1453c25fb1fd4db1a928bf83e72187f9@realsil.com.cn>
Content-Disposition: inline
In-Reply-To: <1453c25fb1fd4db1a928bf83e72187f9@realsil.com.cn>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e6fc91a-b607-4fe5-ed58-08df18d8a324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|19092799006|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /NjK3Md+kQxK0smXhwHScItyvR543JD+L9cyFWUhouI1VaERYBonJiy1/PVQfZar1cu6mVwZ4NXO9OwBW9O+a7gOK11IzipW28K5hH+IdG9BGxmG/vUaoc42lI6lAAiP4BjvxCn7J4mGUL4uESt91bQO9SuzBNVNVTD53jklK083OoA2nF9LLU7zKLpS4hrsauGeZ0egwqYXNrnlSfFRc6eptpuW/FaevwyzZEMKPexJhy7vQ0kiXodLdCZnpGwu55MnUQ5oQcepdLavNbTitveChtkFwTo9dI8EozAnhxYOrml1C1sou2Ms48MvU6JF2rs+kJHS2rmZYDx49XV860TRUD8hX0SMRrWflNDK5ujCtDilRngDdtsLS71sBsQuJLh/FvjKxciRG/pGh1k13hBe3O08inOnwkPxUY/nd38AP2/yzlQRSBj3wEX/2VtohlXe7Kf1T7mikhxooP0QuDNuSSMO9/3tGy87NyW6KDDg32++CieWgWXG8bThD7NdGK/pNXHvYm1vribEnA1gX+DhDJMQpHaA3GS+7mtN2Y1AN2tIrsO8cJHHypN+IIrDK6qBMdjVi5Xx8r93jZxm46Al+aAIBO04ek6r2Z81XlQLc5D3gNeFBM8/ooqssMESq5FA0fan9Asdn0JIkgYtammii8zV5KHf94v1pUcvX8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(19092799006)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUFMeHJOS1NvY21CMVN5aURYTGhRb1Zyc042L044UjNubGxGSHh3aUZFeHdS?=
 =?utf-8?B?QmZhMnlYSkpDbHg3WDhpZit4TU9OU24xcWdWNWhrWGFxTEthcHVtNmZZY3NY?=
 =?utf-8?B?THFMeGdlN1d5UFRZZkRWWVg2dUdWakNMRHlIRlRZaHQ5UVdxRkt2MDI3RzY2?=
 =?utf-8?B?VFdPTkxMMmZDWTdlUnFTaktVMmFGZlY3V0tqSnY1VzByTG1ZYUpKaUdzTldt?=
 =?utf-8?B?L3A5U2NCRWFJNHFkK3NFVThhZ01GaFRtb1Jnc29taDgzbkppRUxZaExxVURj?=
 =?utf-8?B?SWg4Tk9paUlvaHBZK2I5cUM5YzZnWEVYWWdpMSsrakZ1SFFTZ1RzQ1Q5VGlp?=
 =?utf-8?B?MkRzVzZGQ1hBYm1uNTUyclZBbGV0bVAxK2JMZ3Y3aUZoS3dwZG90VnNPNXBJ?=
 =?utf-8?B?YVVLT0UxMkt4YU5GcDNKZ05PUE9WaFV3OEZQSkhPckRuaVo1eWJXNk9VTjdi?=
 =?utf-8?B?Mm9wbUpXa2pRU3NiNmh4b3cyeTB6MmN5dG5hNVYwOUdWcDFyUXdXZ2NXcjk1?=
 =?utf-8?B?K1NNaW53Q3E5TXJWVndteTdKRUpzWHFvWXErSzJTUjNrMTZPVm5DSGxxeG9Y?=
 =?utf-8?B?ZTBZR3dFd2RHR3QrUEhCNTJHQTFxdnI2dFVNWTkzamFEeThQS01RdU41UzNR?=
 =?utf-8?B?UWl6OGhOTWxncmp3VXNITnVSVnJ4dUhjNHV3S2U2dnEwV0Qzd0hsOVlPSjQz?=
 =?utf-8?B?MzNUdkM2S213QnlSRGN1S2xEN3dROUN0QkE4Y2U0MlF3WDlMVGIrZXBJM0lk?=
 =?utf-8?B?KzhFaGhNbTZ3WG80bDdDcjVUbjl3dHVqSnZnNzNoK3FBeVg4TThUdWVBSm5U?=
 =?utf-8?B?c1IrZExSaUpKY1NwcjMvZFV5bmg0N2tFajhVdkQxKytHOStycFZvQmY2dWdM?=
 =?utf-8?B?RkcwQ3RyaVBISXZ1TFpFdjZjQ3NUTGJGZFZ4ektKbVI0Ni90TzNKaDRIRjlq?=
 =?utf-8?B?dVhqSUozUVJOcStUT2M2VFh5bFc4UWc0MGlrcHhlaSs3NHFjSGZmUXcrRC8y?=
 =?utf-8?B?UjhpdHpmemFZUVdDejRHdVZUamt6aHpLbk1uUzY1d0M4bThZQ2JpYVBUS1Nj?=
 =?utf-8?B?MFBFei81cmdHTmdqTXFsbU9FWEl2NmVzaVJFc3JLZ21CZVlQeHMxZmZrOGNC?=
 =?utf-8?B?azlQTW5PUDNqMWlTZWtHdXR2cW5KU0N5S0Z0cEt4Qm9DczVnMndNZTFLaTVH?=
 =?utf-8?B?Rm05OWEzYkovRnU0SExBcVhjc0ZNU1l0bnh4NzhCYzFkYTZZODduSWZyOG1K?=
 =?utf-8?B?Rm52bFdpRnpSRUdBUUtSSUxXZVZDaDlZSFozMitZSGt6bUhXOTBWTEx3RnUv?=
 =?utf-8?B?eWIyQnhsb1VSZExLY3orbEY2eXZ0bk8yUzU2MzJnVWJjOUkwNUM4QTBmMEE1?=
 =?utf-8?B?Mi9KdGVmY1RzOVJRU2N4a0tXbEdOajRYdnRFd3lVMEkwdjVrcjV4Q0xMeVZ5?=
 =?utf-8?B?LzZtWC9IU0NOZ1luemZxV25HVWNETlR3WU5rdGZaTmpzSGk1ZDloYXAvSXgy?=
 =?utf-8?B?R1pqVHNudnU5Tlc4c0ppVUV0eUlxcm5PL25tUG54djJsaG53SmI1ajU1U0Vv?=
 =?utf-8?B?TUJDUzRwY2JYdzBkZ0l1VzF6eklTbTB1SnJHU1RsSkNuTVJwV0g2ZkZ1MnYw?=
 =?utf-8?B?V0U2aFpQT3gwU0hubFRkcWY3Q0xNdVJYcVNZcUQ1MWxUclJhNklmSGtnS3J6?=
 =?utf-8?B?Rllhc0M5N2xaUmZmeUg4SGtCOFE2OTJBblA1cUFiR01ydS9WNUlCYmpObU9T?=
 =?utf-8?B?L05SSnFRTDZyRlZIN3ZoTDJWbWxGNlFoWnBMVlZtcEM1V0FCZHA1VVFRWUVm?=
 =?utf-8?B?T2U0K1JCR3pBTXlRQWhTbUdvcUFMcHVwU0huTG1hblFNVEJSQUFsbW9LNld5?=
 =?utf-8?B?a3hjWEtCRmlEanV1UTdCdEZKL2FZWWEwRkRqc3E1ckdjQjFYY2pPTi9ZZkI5?=
 =?utf-8?B?ZXRoWDlKUkduMUlTZHRFUmNwTllZNEVGZDRXY0FrRTREL25ES1hZaFBxVzRo?=
 =?utf-8?B?ME5uWHQrNGhjd0ZWU0t0M0Y4WHFJSzhUWjVmdjB6c2J2L0U5SkVtNkQwSnQ0?=
 =?utf-8?B?NkxsNUgxV2JRWElQRHA0aFZDOVdOMkF5NDQ5STVlL25XazBCZ2RxYzI2Y3Bh?=
 =?utf-8?B?WVN6MFRsT2FaZTQ3U2RoK2U3QStOeGxtOHRuZEtGcUl0ZUEzNzVmUHdwSzlw?=
 =?utf-8?B?S2ZjZXJ2ZFR2cW43Zkt4aXZDVDk3L1NTVHNsMldtaEVaTDQzb3FyakhXcGx0?=
 =?utf-8?B?blUzYkoxSjN2ZlVQM3BIbUo3UlJURWdQUGhldWxQck5YOXNHSHR5UHlPZERC?=
 =?utf-8?B?S083Ui9nT21Ca1RvdEU0cXNTcE9nYmRGejFGL1h0MmhKMDRHcFd6eFY0Mm5p?=
 =?utf-8?Q?NHVS7n+rxZuH15vvhyPgZsBACJ0O6H/pLt/cA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6fc91a-b607-4fe5-ed58-08df18d8a324
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 18:38:04.2354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPYRuGIgxiu6rYG+/mX/FRgXn4n3BQ44fogZD5FAMSzvoA8dA1BD/oJ49F3X88Os5UtUWmDkfxKLTlpOYaanPb9MSAsX8GjRw13OY9ev5ZTy60T0N4ejU9LowMciwSE/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_113808_995731_124FDD0E 
X-CRM114-Status: GOOD (  12.99  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMTE6MTc6MjhBTSArMDAwMCwg5ZGo5a+FIHdyb3RlOgo+
IE9uIE1vbiwgU2VwIDIxLCAyMDI2IGF0IDAyOjQyOjE3UE0gLTA0MDAsIEZyYW5rIExpIHdyb3Rl
Ogo+ID4gVGhpcyByZWdpc3RlciBpcyB0aGUgZXhhY3RseSBzYW1lIGFzIFAzSDJYNFguIENhbiB5
b3UgZGlyZWN0IHJldXNlCj4gPiBwM2gyeConcyBkcml2ZXIuCj4KPiBCb3RoIFAzSDJ4NHggYW5k
IFJUUzQ5MHggYXJlIGJhc2VkIG9uIHRoZSBJM0MgSHViIENvbW1vbiBBcmNoaXRlY3R1cmUKPiBT
cGVjaWZpY2F0aW9uLCBzbyBpZGVudGljYWwgc3BlY2lmaWNhdGlvbi1kZWZpbmVkIHJlZ2lzdGVy
cyBhcmUKPiBleHBlY3RlZC4KPgo+IEhvd2V2ZXIsIHRoZSBjdXJyZW50IFAzSDJ4NHggZHJpdmVy
IGlzIGRldmljZS1zcGVjaWZpYyByYXRoZXIgdGhhbiBhCj4gZ2VuZXJpYyBpbXBsZW1lbnRhdGlv
biBvZiB0aGUgc3BlY2lmaWNhdGlvbi4gRG8geW91IG1lYW4gcmVmYWN0b3JpbmcKPiBpdCBpbnRv
IGEgY29tbW9uIGltcGxlbWVudGF0aW9uIGZvciBkZXZpY2VzIGJhc2VkIG9uIHRoaXMKPiBzcGVj
aWZpY2F0aW9uLCB3aGlsZSBrZWVwaW5nIHRoZSBkZXZpY2Utc3BlY2lmaWMgcGFydHMgc2VwYXJh
dGU/CgpZZXMuCgpGcmFuawoKPgo+IEJlc3QgcmVnYXJkcywKPiBaYWluCgotLSAKbGludXgtaTNj
IG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
