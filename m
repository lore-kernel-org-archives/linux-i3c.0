Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2DFC88E4C
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Sep 2026 09:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxmA5LGAKo81mu6h2HCK1FT+n+muc9OcVyQ5Qvkog1Y=; b=4RzipwPuijs0VE
	JFit+kGV7544q2wOfYE2LV5DUGih19bKY38URWTBG3ADJ176sIdzPomcfN+58NDXefmCPZqko0iz0
	NBQDUKBgf80Cf2eC2Pk7YrH1A7cxeTw+tUHyzUU2RSDsXo87OvLV6utM3+oJ4l4ImtQ+fLudQv8s8
	qt0OU8NJdmDgB6XDiQlHgN3N7RItFYelg3v7wF54qbd8iPZHpuSw1pD+rM/p4omQk67bzPL057fuL
	SMPY+xhZ4EDU34C2qannlH7yTkQIWxy+vGzrV3/yIder3AQpR3aXEsthYYdZNE88LfaM1K0Z0i0OD
	LiE11wpfHwb0nIzAXfnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xc0-0000000GH5N-06UJ;
	Fri, 11 Sep 2026 09:32:00 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xbx-0000000GH4d-2YeZ
	for linux-i3c@lists.infradead.org;
	Fri, 11 Sep 2026 09:31:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPsSv+zihiu1YDaiJYeuL3bUQ4aZJYW/D021aw6oFiE8iabmy3yJFe4NvgGcK4U3pSt/k8dCBMmWAzbE+Y0IyHAE1u8Z/ChwbyjqOpEKCrWQp7g0Ox+BRgHyOeJsSh0cxFKlEtuaAlPHWMmmbgXKHXGzoFBPpegriAiZfr0XhKP0DhDn49Ndlm43zUIkX72b+d9zhuSDrrFHMQkEWVHm3YAZDK/q6EPVnm+3AnBn3shyOfYkUEPKNd/LZhM1uf3dtFvouu1PElwrZAdAh+IlwyUycgQXdv21TVaVUVXMZn1C7oOoKX/aPw4a9e3qxL3rTL8acJNBWfeP2T86PixD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvkRtFiQXHvPhdL/HvpsSGO2y6XAa++TsbporI0BpvI=;
 b=oxlw3EK4vfbFYNHKCvmJnsvTQex2tPOKoT8BaB6nwuVSVgSwm5pUyqK8H45lHs0MfEvZ+n5y1T3GcOIVAbsvu41jSvGQVSWNGgj+lOpNF/vso/4705DRyUi1br2e/Ud70FdhB/G7mqSwqAMLOq0G3Ne/edvW41AF/MDy7srp6gP//OFqD0kIAK6prIfjTv/mApN5I4Whw9kMTRDsDW3qd15WrlEHDbsRoMxYNpaf3ETRvY3kBFZ0SmfWiB9JTEZg79J60oPLZ9s3LbaP35tuMFnJrrPSCjKeucVMyx3lUC5F3W7bCLoFhGh/FrjeQE3el65OwsnzGoDnYTeTHdA6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvkRtFiQXHvPhdL/HvpsSGO2y6XAa++TsbporI0BpvI=;
 b=DM4a9g7K5MjvcbkNFk6WK6roNHx01/8VFSOcewG1gNLyXuy4uFfYpl+YsmAWTAALVrlGLyLP8CzU+qywOSXI/bx+B5pkqa+mJd4ojddaxOktCt/f7b0/Pi5zejyKZ+XecUXRT6wIfjLod+IvflZmZgJ5nYSM5kRc3Eqq6fNhkHbZzYzl/s19nBxeMpjHhwaTEqbaBM0C9cma9wRBRjPy76RZ1Cf7HwUeyXMb02AUuGBXweTmUA2Kd2CJEu99jYu1vQEqRQFloBHUgetsRElhJRNDbBVn/BAWzTt8dzeE4alOzs9TJK5LG6kbzIXvxMqjOt2TAizvaQrpQVKbd8h5cg==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by GVXPR04MB11692.eurprd04.prod.outlook.com (2603:10a6:150:2e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:31:53 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:31:53 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [PATCH v18 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Thread-Topic: [PATCH v18 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Thread-Index: AQHdO2x1nNs0fs3RcE60iSGPwiIo0LbJKBqg
Date: Fri, 11 Sep 2026 09:31:52 +0000
Message-ID: <AS4PR04MB93625052401AF41C2ACC2D66FBBE2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-5-lakshay.piplani@nxp.com>
In-Reply-To: <20260903062108.2712296-5-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-09-11T09:30:30.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|GVXPR04MB11692:EE_
x-ms-office365-filtering-correlation-id: 92d8f615-31f2-4529-4b4e-08df0fe783a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|19092799006|921020|6133799003|18002099003|38070700021|4143699003|11063799006|56012099006|22082099003|10067099003;
x-microsoft-antispam-message-info: YaS8BMRSweQ/z5Vhff4uhAHWbYY9EDjN8m/r0MrdaUEYEBX46YM2V4JfH9gWdt74AzlIV5DUmYKEuxLo2n9y2ZzIoCxRcXAaJmfxZR9Ct7qcoKP3GbqOB8ul+q0dtf26ANgJZlk50RVJmPpI2eMsYIdtWeMWQRAs58Q1nfTYvR9sCdXYW9425CT4PQLAdMNw+ZyIdJJciUmxCR1fKNHCgAMbT6wBf6t3WSOz1IxRyj9ulxqFUI2K9ySnTP9+naJEpIf+PHkILFM9RsbiR0mIu6COOrfWtlCSHpPtGNg+eV94a/N2Z0pko5w58hfdxSkGGDj/BAmUuVskGQHBZ5lmF7pmnIZU+cdNGMMNEQBZSjw7UJm0mExIIgAo33ZU0/7KrbsFxsFgMePX16c1eP913f8lOEXvHSXOyc0l0oDj/d/HK7+K04DkT3fa3DuW57F8F+aytX5lQPBBLHt9uSn1HghS7gzjKHMCSQpOU/xfI0rM0KtfhcEYCpv7hMY+Q92qKSqnnWcCi9nPbTz0zei0N+50IhlmRW/q5DWVA/CA9Co4WYSKerJ9I3L4/16CPz27hywFFFmSlrqfArAUKmYccxbH72JzHfPueURtiy49r13KPIc70POwar2WmuCQkjP0S3p835OH3lYQPmJmI9hBa7Uyhomwu99MPChTAejox/L774NajVWxsz4QbyIK3Pkus2CE8z1ID2y/nK2Mr+WULF7vQSO/4PvQf4e2wvTBUDk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(19092799006)(921020)(6133799003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006)(22082099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXZLQ3JLSjhsVy9UbXZKZkFrVk9mcGFYRzJLand1RkRtM0xzZVF0ZlBBUkcx?=
 =?utf-8?B?Z3NYcS8zNTl0NmRrcW0vWWVDVHpDaXZLZS9ZWkJGc0tZbHpTOVhaTW1ua1ZP?=
 =?utf-8?B?Z0pXU2FSZmQ5ZFcxTUZtc3FEL0JiK29qQWszb0hsaGpjRFljZVRrQWg4VWIr?=
 =?utf-8?B?bGpTYnQ0MnBtOFVCR1p4UWZiamVzb3FJUXdJckVUNFZFVlNDaER6QmZKRDQ5?=
 =?utf-8?B?MVVQdVJxOWNUMVMxUHJYYWtXMUpvMDVxUzJLa0RIZEZjUnhJSWEyZEFtQmRl?=
 =?utf-8?B?WEVwOE9uZ3E2SVFESk9nZS8zdTZBeHFUeW5rY3VkL25LaXdtUmtqbm5WWDFu?=
 =?utf-8?B?VXpCQUp2STBJc2paaWlSM3dDQ1EraDl0NDBqZGlTdGozRnJmVGpHa2VBMWxT?=
 =?utf-8?B?Q2UzMlJYd05hMStGbUZSL0ZXWHUrZlhEVG5OUUZBMHo0Zm9MU0pUSWY0U1cy?=
 =?utf-8?B?NWVIZ2lsSWZRWVBhNUNVc1A0MVVMQnQ0ZWlpUjZudTNXYnAzb1lJb0lRSjZa?=
 =?utf-8?B?MDZHMmgwM25kbDFBRDQ0REJpUzl3OXZTSXgxWlkvdkJqTW96L3Fzc3A1clZN?=
 =?utf-8?B?bENrSTJDNEd4YW1vbDlKcGdWakVmS0lZU2NYbUFBd2xwR0VoSXh0c2FHcGx6?=
 =?utf-8?B?NDltb28zVDE3dnE4aHc2b0V6OEF3WkJCZUNISFpkRHBSbW1xUjdaQUVObkpx?=
 =?utf-8?B?TGtBUXg1bkRBTnpTNXBwcjRsN093ZVh6REgwWEZ4QjdJWXBqOExNcnppRFNJ?=
 =?utf-8?B?cVN2SzdwS3ZZUXVnd2JYbEpGaDNZdll0Z0xhdU9CbFNrL2d1NUpUb1orYlhp?=
 =?utf-8?B?dWEzbTY2UkVvZ2RmMXRrMjk5L3NRbU5HakEzRm03Tm1laWtMc0hoQ1Vjb0FC?=
 =?utf-8?B?M1dCT2d4U3FIZmtzeS9CNGpheUZNT3Q0ZlNkYjBIbFJwcjdUeHM0YlA2ZEcz?=
 =?utf-8?B?SVFuMkMvSHJzSnNSN1ErRmcxMVZ2OStaT2JLT2VDdnVvY3d4bGtNeWxqNWdk?=
 =?utf-8?B?blA4K2thWm9qRDQ5cWs0U1g3a2h3YTdqTXljNS8vaXRCRUNzaEpNMzZUOVJn?=
 =?utf-8?B?KzY2aUNQS29BdUhVeFRvOW54ZHNyL0p3QlZlUUt5Z1pWZU84NHRzQTJRVjEr?=
 =?utf-8?B?cnUrS01XT3BOelNnVWQvMEpYejZFVEFMaTM4d09RU0JYajFUdGJyNkxNV1Ri?=
 =?utf-8?B?RUxlRjUxUmJkSjZ3aXcwOUVCczlPVVZDbjJjUEN4bkFNQ2ZnTE1zOGZ1azIz?=
 =?utf-8?B?K042enU3OW9uK1gyKzFFZXdNamVZTDRwNWxaSm83Sm1PV0NxeHVuL0l3aTRv?=
 =?utf-8?B?ZjRqdHhZd3k1UG9lcTFROHoxK1FhMjB4dmtxVHFYZFRPSWxhMHFEMXp0cDFt?=
 =?utf-8?B?V3IyL0lia2NnME9nRHBsalN6UmV4TVdDQ3FBbURrclFCdW9haGVxdUFES0lp?=
 =?utf-8?B?RFpFMDFlUENpWHZxN2wyUllDeTNUdGt0Y0NidU5GQlBjeEJqa2VXRDBtMGpp?=
 =?utf-8?B?bjQzbGpZNFI4MERkSlVWcTljaFlLU2o1QTlqQ1NvODVYTmRzQXNKYzV0M210?=
 =?utf-8?B?OG1TbTg3bjUxSmIwRkVva3lLb2I3dzFoQS9yaXYxOTVidTJ5ZU94RTlldmpo?=
 =?utf-8?B?U0ZBRmhxRS8xUU5wTHNENVhRL3BHbjJhMkp1VGQyWFR6N3ZTTjBncmZBT05k?=
 =?utf-8?B?V2YvQjN2Qm5paWdFR1lnaUp5cS9iajdHT1l5MGRyVUdsV0hIbVpVYmpnakFv?=
 =?utf-8?B?TDlhVExFZWlsdGxiL1JvS01jTlNUWDJ0SzMvQ3FqNUk1bDcwQjVzbmg0Sloz?=
 =?utf-8?B?SllMQlhTWUlEK2p2dGR6MkpGVmdIeExQQ1JOT09vV3dIWEJJY0x5SXkzRkM2?=
 =?utf-8?B?Q1BCQTV3M05sdFdQYi9LWWx5VWltOGhvN0I4c0hMZkFrd24wYU41L3V0S2Vu?=
 =?utf-8?B?RUdTSlU3TDV5bXl6MElhYnY1Q1NZUFlsRmVXUVVBWVFQZWI4b1ZOc1oxaVRq?=
 =?utf-8?B?TTJiMHlQd0V6bW5yeGdrVjJneTJlV1p1RFcyVTdFZ1p3RGc3SWZ4UWVWT25I?=
 =?utf-8?B?TVA3Z2x5KzFoZjYvV2tvUTcrVWc2S2dnWis4Wml1S3IxWkVNT1pTVWNoNHB5?=
 =?utf-8?B?bFg2ZHlVK0RwUStab0tMWWprY1Ywc0FUdTNGcEdrUjZocnNYelJULzZjdzky?=
 =?utf-8?B?TXUzVWFKVDliaVdTcjRqb3FPZmxJMGpHcmlLLzVpdW9xVGZzTytJRU4xY0Ro?=
 =?utf-8?B?dnkwUUdnbllhS1R3SFBlS2RZTVE1amZkamJieC96Y25pQ0JaSXQzVjlsSXdK?=
 =?utf-8?B?SmRyRlNjSFZhVGhtS3ZiRExlN3FISXU4cU1sSk8vL0hiVW9xOUQ1UT09?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d8f615-31f2-4529-4b4e-08df0fe783a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 09:31:52.6212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2AfotHN/cJybQGHkMwJOw5y1Sp+QLud2hTp0qO/NCJOoTXKVuZdlopF4ehLTzbODl0n8W/HBSBldDqp40VdcQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11692
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_023157_655180_B728CE8F 
X-CRM114-Status: GOOD (  13.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


NXP Public
> -----Original Message-----
> From: Lakshay Piplani <lakshay.piplani@nxp.com>
> Sent: Thursday, September 3, 2026 11:51 AM
> To: linux-kernel@vger.kernel.org; linux-i3c@lists.infradead.org;
> alexandre.belloni@bootlin.com; krzk+dt@kernel.org; robh@kernel.org;
> conor+dt@kernel.org; devicetree@vger.kernel.org; broonie@kernel.org;
> lee@kernel.org; Frank Li <frank.li@nxp.com>; lgirdwood@gmail.com
> Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
> <priyanka.jain@nxp.com>; Aman Kumar Pandey
> <aman.kumarpandey@nxp.com>; Lakshay Piplani <lakshay.piplani@nxp.com>
> Subject: [PATCH v18 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
> and on-die regulator
>
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Add core MFD support for the NXP P3H2x4x
> (P3H2440/P3H2441/P3H2840/P3H2841) family of multiport I3C hub devices.
> These devices connect to a host via I3C/I2C/SMBus and expose multiple
> downstream target ports.
>
> All variants share the same register interface. The driver reads the target-port
> count from DEV_CAPAB and applies the DT configuration, so no per-compatible
> driver data is required.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Hi Lee,

A gentle follow-up on this MFD patch. Could you please review it when you have a chance?

Regards
Lakshay
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
