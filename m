Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4380EC982FD
	for <linux-i3c@archiver.kernel.org>; Thu, 24 Sep 2026 05:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wb9sQxC+qccEBVr77v1KgpOTE+Yud6VMKtUSMmAfrE=; b=T8htpUkgbfxIx7
	enr+zYCwmF5qC9vG5vdO0augTfmJjolB/+NSg0xhHgSb671NO3pQJvioWbM+4TFYeKvyVIA2n+7vd
	r9QxxYUvwA/EmaWyyg1az64N3vqDgCxdTJNGzWHSySyHOHLyA3ZKY9lDs5giyjuT1ly5Jei1jdlCE
	IU9XwELNvn15o5UrDxRpWeDX6p82RHDuVbc9uf6dB1IXrRmiOpIUb7TtgIV8Cw66VutrAXC0mWBaf
	HSvMLqKbsKv0hC67wJQgQeEBs4tG4FjbuTnMD7QcpQKBsNO1K+UrcW3ri2G1bJESS/Nda/oFaplXE
	qy49sHYx7wLJ63AUJIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cBl-0000000A4nM-0F5j;
	Thu, 24 Sep 2026 05:40:09 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cBh-0000000A4mg-3FCQ;
	Thu, 24 Sep 2026 05:40:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DW9N1Jw1aQ/9Xlu1guRJB29IO20KOl0i1Ql05Ncxwh+6PPwLCUxs8aMu0SaEuLWo3RSp/vFl+qsA56rBGuDkixJ0et1dxOD6UgqHHOskwrVU9bxiBhIpWvf1K7y2EqxpxMihflh3aWfp58w8uBXZTJbmkfwWfVlfx3MhhHcEaB7zOz7qcA2i/eNPkS7AKtC2JV1IDhFWrndjy4B461JZ46dDTWnvTEBrhGI1c1twIvzYBxJ6OFzbHBY9DHisljut96g6tWITQMwpZnnHJrP3Gb2CM1jMA3LbhFhqlpN9q7HUNyXo3KkHsTGxDnmnWjK1V/pnzxoaDbnHSuUlIY/mkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUpTgJrcXv83j0/tX9SIs+HxxrEvTLZCcNRsYAiIREw=;
 b=u7QeFtjQ3OQbI6yzpcJ3fJ6C0+rdBlB/R9fimCsAmpbf7xCvO5Wh3EqPUO1CCuyk1k/uhy/YH+fOe3dOEtC534wD6N9lqjLTEie/e2tA5umezkYoCq93UfHVXqQncvndOiC22SDs4LCkf6SnmNAG94UqDzG+CTMphJHN4xc9Vl4BCnDJ7QwTZzrD+grLad3g67Sn4qSZ6RKc4glqgvdOfPXtbylhbs8fZCa1V9ySgaNY4s7Nvr21md0AmExh2MCiE9PTC9tVQhH81qakc9g2jDrmQDN93+Iy82J43xloqFRjGJYkvwbKxZQjtTQFZJqrgst3c+hx6hLIoc6XJZCg9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUpTgJrcXv83j0/tX9SIs+HxxrEvTLZCcNRsYAiIREw=;
 b=Cj7C+X6TdolrGLwtk1aBY4+hWohQHc8ljlZwtEvMNHGlVKCl4Ic1j77simtGvRFz/k59IGeyXxfJGTsDJ6x/UaqjcLj7SK8gNfyJcKaJzUqogVHEPOvu+fgdHQNg/ytiO4a2aLK8trzlsGyfdtJn10noTGtd84xNbXLqI3bgCLwAssUwzvQgzv5uxBpaPUOTZiPdg+szYSpYupjt3K1T4PcEsTrwaOas9npZM05/IU+9TFYunB2DJrMuhWRqznl0q48MJenD+T9wX7gfLh1R0uNmlsVw99N79FSofn9A9OPfi7oph6n/vcju7ZbzaOeA03qCOuHNcJgoISPlAYBWRg==
Received: from SEZPR06MB7237.apcprd06.prod.outlook.com (2603:1096:101:238::10)
 by SEYPR06MB6432.apcprd06.prod.outlook.com (2603:1096:101:16f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 05:39:48 +0000
Received: from SEZPR06MB7237.apcprd06.prod.outlook.com
 ([fe80::f1cb:15dc:b764:fa22]) by SEZPR06MB7237.apcprd06.prod.outlook.com
 ([fe80::f1cb:15dc:b764:fa22%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 05:39:47 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: =?big5?B?pl7C0DogW1BBVENIIDEvOF0gZHQtYmluZGluZ3M6IGkzYzogRG9jdW1lbnQgdGhl?=
 =?big5?Q?_AST2700_I3C_controller?=
Thread-Topic: [PATCH 1/8] dt-bindings: i3c: Document the AST2700 I3C
 controller
Thread-Index: AQHdOgYGnk2AFkBmnEiGGqUqF4qN8bbCsC8AgBBTkwCAClXCyw==
Date: Thu, 24 Sep 2026 05:39:47 +0000
Message-ID: <SEZPR06MB7237179374D186C39384D9808B812@SEZPR06MB7237.apcprd06.prod.outlook.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-1-19909e7cbd7e@aspeedtech.com>
 <20260907-imaginary-economic-oyster-57cdd6@quoll>
 <20260917154754dd1eefbe@mail.local>
In-Reply-To: <20260917154754dd1eefbe@mail.local>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB7237:EE_|SEYPR06MB6432:EE_
x-ms-office365-filtering-correlation-id: b1255929-eea2-46b0-78af-08df19fe3eda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|56012099006|4143699003|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: qCT/bNKY7v61lYPeTF+cD6m+ed7mHCDVDKOhZUXcB9XC7pog9FTqCJlA6XUADlciWqUtzPWjpsUVMcruylc1neY7kerTvmocmRroNBMJzPSBNWmmq8WOigbhyLuuM6Cv5tO0N/RbmDa9PLCxMvL0UlKeqa//Gw6ZWlDIr1EEq8I5TDF6u6jnCEKeR4SA3CuUt6ZYauo0n5dNINR2yV28Yq14gbPDwBPkiqorUtWq4raag8dnCE+sEdwG3NNO5ARKhuAno1q34pHXI27CGWcsmWMjDserkvAUhid8ilOfs1Z9PGXFQB54dpDtpOY0U93AeemyriOd8ZGzMuw7DgKT1OIMdnELWVxOcpj8samFw7xiOOCYl7kv3ECURcWIyOVO15L3MPnOC8BoVZnJexf60Ik9g7KSXcmjTMatbR/K2f8LgRW60b1jT92I6BHDlpYqnMCQlHPbVuIXCx/PdbtizY5bRylmphRXrjQ2zwCGwr31QHHeHkcfUWujKO6JKFNiXYD2pYVssyPfMW0zLdvUJYMuDh5IvJ15WjiYvZobsix/breZWdMGIiwyTbfyf0W1w9shPSRbMQXJdNHPVUi3ymDKx+V/0aWaG5MBSsxk7glwcGWoZ0EPxMxJp/okHR1mjoO+f234q69ECj0YuIK5OEjOhHfUBjPf1BU2CLTfAV2142NZXzB8qOZeoh7EA3CBY/+mlkgfjLkPO1LM7uDqoy+TH1BcG7gFY6MJrKJJ+q4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB7237.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(6133799003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?eC9CSzF5ZEQ4aThQUXJQbXIrUXVRcm5SYkFKNFhvYkt3WFowR1Vzb2c3eUR4S0Fo?=
 =?big5?B?UUlSdWlBZWgwYVIvZFQrKzBLRWZ4Smh3M2I2Uzh1cjFuSHUyMVBpcGVJZ3dVMVh6?=
 =?big5?B?Nm91NkdFT25NWGdGVXdNQW9sZlBDZU5FSDlBaWNlOEZVaWp0K2U3b05VcmFpZjR2?=
 =?big5?B?NEJoRzgxWEZwSmpMVi81NjU5aFpLTnQ2RmdUL2wzdm9EbitWR2kyOHkrMWdoMytt?=
 =?big5?B?c2Z6MzYyeGxZRUI3NlMzTGdaZjBndmYwMTB5dkNGTkgveklhTGg3cXRkckdhdEpl?=
 =?big5?B?MHg5ZnRNZjJnK3d2b2dFZm1IaElQNG5rblZQVE5ISlNNbXNyRlBKdjQxV1BaTFh2?=
 =?big5?B?K1ZUaFhXbVRINjBNcEpsb0FTa0tydHhLSEZ4cmxOUktUdVphWGVHWWJXWWV4akNv?=
 =?big5?B?bXNyRTFuTUZJeE14bWE0ekFWaU12LytodzlBVjM2NkFwempXRmo4S3B5aUhpY3pa?=
 =?big5?B?ZlViajF0Uk9UNldtWW1XUEd5OC9vUjRXTzR1T3lZZmZkWFNwN0k4aFNhUzlIWGVH?=
 =?big5?B?UkFlZjZHRkRldi9wZE53SSs4UE5BaUt4QkFmUGhjcm1pRWUvamd2LzNwUHd3SjFi?=
 =?big5?B?aHQ0aVR1ay96UjQyck5sTGprRDNjc2tPN01IZXlESTI3bUZwUHQxVVY1TFZGd21T?=
 =?big5?B?NkJ6LzBwbzVSWVpoR2IremcxZTBYeUpWVGRQSktPLy9kSTRaRnRTWm5EQWxRZEVK?=
 =?big5?B?am95WVBJbitjSUpTbzJYVGU4TXE2Nldsa083QlRUNEJjUW9jUkliMFpKS2I2c2RM?=
 =?big5?B?ZHFISDJhczFPRks5SEtNOTAzWVM0cTNieldCajZMMGpxb0IrTGdLLzlna0JrTWRh?=
 =?big5?B?ZzZuSkt3L3NnMkUzVlYxWUt1MVozYmZIb04vQTdNdUJkTW1nSkVlZ2UzcnkrYjJ0?=
 =?big5?B?UHVxTjNCeHpoYnlhd1YvcmF4dmRtZ2U2cFRKeGtmSFFWbzEwZWR6NnlpY0FhS0lC?=
 =?big5?B?cnRRODF3a3JHaEdBTjNEa0V6cHh6dkt2TElMZmVuVjBkY1lwTE15aWdvU0FJWnFI?=
 =?big5?B?ZHBNNGtMckVBM1J2eFpESWdCYThpNjVtRVlNU01hL0lRaWU0N1RGL2lLMFIyUlRS?=
 =?big5?B?Z3NBcEd3U2NIQmowSjRZK1JGYlFxVWdDUUVOd2t5cUF3OU1CMFBuSk5wK1VSeUZk?=
 =?big5?B?RzUrOE8zQ09YbEdLSlhEd21CRWkyMWN1WG1VbUNOZXJSK2wwUW1SZXgrVzA5bjRp?=
 =?big5?B?TzYzNzhkRFVHWmNobE1RMUhGT01pWDNiRzU5ZjhYOTRTeWxrTkRRK1pHbENrZm5T?=
 =?big5?B?ekxoYkFXQkJjYWk0SFRiZ211NEZwT3U4QkZ0ajJ5ZEFnN0M4aTJObnJlOFhtRFht?=
 =?big5?B?bms4UUUzbzErYjl0UEdReWFPMlNUTlR0alZzM2cyVDFLUmhzV3cxOHJmbC9KcU1m?=
 =?big5?B?ZkkrQmJhZnd3d0RWaGNUWUhDKzVnZjBxSnl1a05XMWYyNjVaK1NBTXU2NXc3Qkcy?=
 =?big5?B?UHV2dzMzNjBiWUFuSngxWFVTcjd2Znh6aXdpTlR0U0xXQnArTGczcXkrWlFqY2hT?=
 =?big5?B?Vk9pL2NSejFQdGdNMDEvS24rRlhzSXFkd0xRNzFoc3hvNExLTXRYZkhFcWZnNHBj?=
 =?big5?B?b212c20zN1VUQjFFdHYzY2JvYnJVOVhFOCtiS2FFSWVzR0FYTmRSOFNwMHJUN1E2?=
 =?big5?B?emtydG1JcE5oc05oM3ZLSWNENlBiZkI0YnBWMkNuZ1JOR01pSTB4TnptSC92N21L?=
 =?big5?B?NzFWUExDYU45YnRFQVR0bmN5UU9ROUsvUWI5Q3JBN2RDUUsvYmJvRWRCT3VmM2gz?=
 =?big5?B?M1hpblpOVVI1bk1SUnVBeDErbVN5cXdHTU0yZnpxTk15VWlXTFovUWNJSks0ZlFP?=
 =?big5?B?QVVVeFBQemNiVGdOaGh4TloxWGZhUGZDb0ZWNG5qZ2NoZHo4VVNSdnIyWnc2Y3U5?=
 =?big5?B?eGdaeTB4eTFuRTQ1eml1cDlrMHNsMjRGMUdSNi9vZ2J5VjBFRTNzbVhhZFZVanZl?=
 =?big5?B?RHdkTzVJZlhCZVFTZGZqcEFJK2RzSHk2TEJPRnNtQm5ZbXplV0JyNnBnYlhwa21h?=
 =?big5?B?VG84UjVwYzRrRzlSZzg4NG0xQ1JjUkZXRG9tMjZZZDV4NWxHRzI0eGZtL0NBWVoy?=
 =?big5?B?aUZpSXluWExxMUp4anNvV1V6U3MxN01lWUdoeDVvTlYyVlRHMGZ0TU5nRUVldDhN?=
 =?big5?B?N0R4VXQ5SUNnK3ZRTlQ4bzJWSzRiNHhiV0V4NTR2a3g0TFJLUjRWUXZEbHBQMS8z?=
 =?big5?B?QWk1bXJjb2VwM2FBRXcwM0hUSGNTdz09?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7237.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1255929-eea2-46b0-78af-08df19fe3eda
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 05:39:47.6472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ytHyXVfHq4kD1u6f2y0yXpNb8yZGpy9YWPbqT32EnF6vmjMq9EFXnERTfPslSHeM/MTmQwUKNa4VqXDPu8cAu5zUsgMD+hGYO8QAQG1lJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6432
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_224006_114349_123735C4 
X-CRM114-Status: GOOD (  12.79  )
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

> I guess we need to make them generic. Probably nobody needed them yet
> and not all the controllers will have support anyway.
> However, I would like to make sure we get enough commonality between
> controllers that support setting the timings individually, can you
> check?

I went through dw-i3c-master, i3c-master-cdns, and the AMD/Xilinx AXI
I3C driver. Every property in this set has a direct counterpart in at
least one of them:

- Open-drain and push-pull SCL high/low: dw-i3c-master has
  SCL_I3C_OD_TIMING/SCL_I3C_PP_TIMING (high/low count each); the
  AMD/Xilinx driver has separate SCL high/low and OD SCL high/low
  registers.
- SDA/data hold time: the AMD/Xilinx driver has its own hold-time
  register computed as a percentage of the low period; cdns has a
  data hold delay explicitly there to meet the MIPI I3C tHD_PP
  minimum "regardless of PCB balancing", their words for the same
  board-variance concern we have.
- tCAS: dw-i3c-master's own comment says its MST_FREE register
  represents tCAS in pure I3C mode; the AMD/Xilinx driver computes an
  explicit tCAS minimum from the spec value.

None of the three expose any of this through a DT property today.
They either derive it purely from the bus rate, or hardcode one fixed
value per compatible (cdns's data hold delay is a flat 10ns baked
into its per-SoC match data, the same default we picked
independently). So there's no existing naming convention to be
consistent with, but the underlying quantities are clearly common
across implementations, not something specific to our controller.

Thanks
Billy
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
