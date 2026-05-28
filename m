Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C33CD5BD5
	for <linux-i3c@archiver.kernel.org>; Thu, 28 May 2026 19:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Bjqtwz/3OeicpiuhNRxSjxUup2fy9ZYi44OO73bw/o=; b=IsAMlqmXmzvjd+
	Mt4CtrDVErUgNQ5rmk+h//teXeH0qisXiOPlv5YBpBon/GIPLDUSHM5RL14MMs08P2yjkgb/vS10r
	7D9i37ppz7NOjpUCoT2iIpTRcCfP/KmGo04jrmByAITmIlOzx5b0DCa2rMfF8N99jxmZGFPUbE9KN
	n1Dw1IEyLAumJ0i2svPMKgJLa3g3E29KqTuFDZCBFLHbICaDmKNEEndpyFf7g415ElEe/Uc1KgEKc
	XQF9EZjSRkwMdqfx7YbFAQaBHW1uSrhC6LMMO7LKUbWgN16QQ3JRg5WpS/u98DHoyV1WLRw8m5T9k
	1lOg/CCSO+Y+y2G3siqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSgAm-00000006GYx-0xEH;
	Thu, 28 May 2026 19:13:40 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSgAj-00000006GYc-2Mrc
	for linux-i3c@lists.infradead.org;
	Thu, 28 May 2026 19:13:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y59A1EPqnFV1sBVna/qDsqwGdP+q19oplR3xaxPnrFu2f26UG3vQdMvxv++t70ROmbNCe43cNUCv/lu/4mU2QOcQD+I2Az2PERWX5OvqHhJZMup0ZmQaVhTb/4kll+QjR5pID9+Naq35v4kYE0tHA9HFWTstd38YVfTOw3JkdaSzca/7uHj/fBwAr7wmzvVdTN+NUND/eG8HVSCo0w22zK+9V3MK83nAxVWNowWKKtX606WTGW2x6JPyrq4q0Hr0u/JLRHzdkh/6jH7wNxeoot3eD+qL5dDb+Sjh6dMtzKakQbIWLUWrBd8FB+jCg9j74kLj712DVo1564fphIISZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GObU5hniJSHGbGjwsqBZEjC8xNhjOEKHkTGTs7y4tco=;
 b=VrrdgPCwyx/tJTppGqhP9zN8CK0a+h7/vURJtY4Xo60GgnTPV1Oh+CcxtoJBNBxSyExtQqRkHjUN3gHJdl9smsT/wKOdHMBqfGPJslCHAvhRZfu42LTlLcvC2/hjCU/siCD8h+sIExOugcK2dyRRdws61hStf94DUzJZ/v60KfJWPWUiiggdhDlVB/HT9Fhuvkj12TkWp8OVRoi/tiw3SNQyyXtv/MiJAyZFIlXVQoD3+4PUfPx0gE3SrtjUQrT1nC8/CO2u3pajwg83gTpa9oSbjNtrcm2b/0JdYc3BeuS2r8PkXHKVam7Ra2BEFjjTRGEKQXsmigBea9cXbqfxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GObU5hniJSHGbGjwsqBZEjC8xNhjOEKHkTGTs7y4tco=;
 b=TYrX0nCeOoFz74kgSRNyENVjIiTvbHBpXojELHR4DljG+7bDXaAl1ZmsnzHrrgsNq7hLpdFv0WnePizXlg2vXDthfObWoJ7P7SruGFudmJKDFXx5UPoC6NGSK7iengmeV/pXB1DmkOWmI/zQgDeU6kybfp/L9FZnTGSa40IIA4k4imWGVe+LLa9mgF5CUqcU/+8WlQN61QnAGD0CYhut8gDLyM4rPx6gSewJCeVqOOxMI8uVQodg9jjWZv6uueuChb1yfTOznwCYiQ+ttpup1hgJu4iJC/Yr8ER5kbp7xKkGt9PyOYd4+EQUspj2N8el/SWjVL7cxvuHbIt4fXtNww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9007.eurprd04.prod.outlook.com (2603:10a6:102:20f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 28 May
 2026 19:13:32 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 19:13:32 +0000
Date: Thu, 28 May 2026 15:13:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 03/17] i3c: renesas: Restore STDBR and EXTBR registers on
 resume
Message-ID: <ahiT1YkbWNz9y4mH@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-4-claudiu.beznea@kernel.org>
 <ahCqF-OHFbV9b5ul@lizhi-Precision-Tower-5810>
 <560f3365-8a22-477b-ae3d-61e8f4103e83@kernel.org>
Content-Disposition: inline
In-Reply-To: <560f3365-8a22-477b-ae3d-61e8f4103e83@kernel.org>
X-ClientProxiedBy: SA0PR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:806:d2::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: fa34eb1d-8e75-4b95-f8dc-08debced3539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|52116014|366016|11063799006|38350700014|6133799003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: k6Fsh47EpymGXX2trh/u3Tkf9wUTHXlG+6m8hxxYpDnOYQRVR1Dm7WjafXMjxTW/PUig6KJcCVgOeBQbAsWUZFqgn4f/8GLbW4xtrPzrnh6yA2U30KwuSXE40HRbRQEzcRqzSM1USzc9yfEpS34FdNM0TRO+2BnWPB+dPBV/kbm4xfTyzYPuNijm0tdty7Grmav5TsQH3PkX26gEbqimllRxpZbEF0XVn6LV5u3Qvb30djyxr4Z/onboZET3TEAwFPPdyoVHLr2MwdLC7AJSzSPzK1Lg+0f+400HQAGtw6sMYAwDP4MPcQm1szUEcL/kHCI+Bl5gAxoMAnv/jqVjv+u4nsN4/eNoKPJ/Bk2doZ8Ec4XJ5wOsSeVnWA5SGJmEhet8+C2AbTKOLwgi+3F7Wd8BN7WXtoeUtp9YRtwpZCuC0sqEJqNVbYIGR0lAaKmFdFimyqs47E/xyeP+fqaW2OSbqvGvtTQPcBHE/1H4mjCavqUtIX20jL8BX+zTkEwW9+B+cCdHj+UaGstTF6+vUxqyIxZbdoINSsBJ7u/+dIROvnfGgdHE4Y9Ru0tkQ9+pgEQJbS/BqM3OnihvI3KsJUYwQgUck4YcbX+p7y3rfbw7ky2ALVXL6g0OTPANTEIEv5OC8JYTp5H+E8HFV/78jIBnXU8BNQxQbo8e2gDAVOxdryyNtq9Nm7RUskFTBpNYEx4lrQJuSxWulftyiUllSyRUrw6pXUy8IrwcVyxApXzU9vaRufB1lC9/jxEUTxcc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(52116014)(366016)(11063799006)(38350700014)(6133799003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlVCS1JvRmhZWlMwNnJENXVhS041TUh3eVo3dWRqZE8wV1d3OENaTUJWamgx?=
 =?utf-8?B?WHZzRWpYSERzRHJ6bkdNQlNDYXZtMWZaeldIY2xZc0V4cStuM0ZCMVl3Rlhq?=
 =?utf-8?B?aDZsNXdhYUloeGdzcVlRdGNWZit0Wjd3YXZnaVJOSGx0YVVGaUxkb2lQZjg5?=
 =?utf-8?B?Y2E2a0NUbFFrdURiUXhnekwzZ0xzVmg0MkoweUlwQ2k3T0VvUnlaSVlhOTZK?=
 =?utf-8?B?N24rSFFLSHN2Ylk0TGFFQk5wWE04WWJTL2pGQVBTcFBmMXE3UmFuN21mZTBl?=
 =?utf-8?B?NFZlejVKdXRtcEw1MEVyNDRtUUR2WW4zSUxiY1dmWmhnQVZZZEJwTkZlbWVX?=
 =?utf-8?B?U0lFN3hQK096VElpWW5aRXA0QlBnNGJvd1V6Nk5yOUZ6aFJoVGtmU0ZyVnRr?=
 =?utf-8?B?bTViQ0I2aThkRFNlREEwWnBZdHVmR3I0ZHVDZ1dOTCtxdFV3dGcrU0Y3NTVp?=
 =?utf-8?B?ZUhINitJVFY5dDN3OENTSmh3ZE5TTURPRUEyeUl6SWgwUnVHZ0ZZMDUzRVc1?=
 =?utf-8?B?bjRXM1lLbHQ2UVJoS0lnS1JlaHJZdXdmQWNQblgydDlGaDBxbktDUXFJdkZq?=
 =?utf-8?B?ci84VDQxREk5cnBleHhTVElkQ0UwSit2bFpDelBhNHZuSGR4dmNING9jVjFJ?=
 =?utf-8?B?VDVzNDM3RktSaWZYNit0c3M4NldHY2FZUnNlbW1aRnNPTFB0ZEp2WUFTQVpM?=
 =?utf-8?B?SXg0ZTQwRTJwdTZoUGY3VHk1WXZIVHJBSisrUlgrZmh0TXMxTlA2MStESDZ4?=
 =?utf-8?B?T01JKzRTYTJTQzRiMTViZ014bk00bXFUQjU1V0djNnVrZXhtK2hpWnhGYm5U?=
 =?utf-8?B?SnZvNk9ZV1htdmNlNkVvb01nU0w1bXRwcVRad2M1ZU01dG1VTG9KYlpVTDJq?=
 =?utf-8?B?TnlKRnJKNUpITzdSVmNZcnZ5RWNqd1pwU2k3SGJrajYvbDZtNmQ5ZE9YcGsy?=
 =?utf-8?B?ZlIrSk9NTEZMWmVLRkJiMW1LeWZzL1NBdXpUY1Y5dDVGejNGbGJKRkVoaWho?=
 =?utf-8?B?N25aVW5HVWJNYTNlZ2xMekJNQkE2alduSlpZdUpLWCtzRmZEcWJkd0tUdkc5?=
 =?utf-8?B?WDFYNW5vUG93eTVEZVIyNHMvK3BFTitzUWszNEVyQjZnalN2L24vVC9xUitl?=
 =?utf-8?B?VDk3RmViSEZyTWpmVFdGc0kybVI5Q0FNNFBZOGxQRDBMNkZxZWttS05uYW9w?=
 =?utf-8?B?eHZiN0c5MUU0a0RFZWVSdnNibis5QkNKdUJGNjZ1WmR2UkxGK1dRUXIzcy9Y?=
 =?utf-8?B?bUFtanBic05WNEN5L3pVc0pGZjZobWRxUk1TV2dQcERGNlM4c2YwNDQ5elZ0?=
 =?utf-8?B?RmZ0WGJsVzJ0b1djbWRJbXVjTlZzQ1NoL2R0V2ZjeFF0UFhuZ2tDNkF4NW0y?=
 =?utf-8?B?d1dkV0hweWhwd0RxSnhZR0w1bm1HOUlEUGlMc09tOWNYaW1YcStUMkxIeHZk?=
 =?utf-8?B?NTN4Snd1dmthOXpYakdYd3RpSm0yQVFCK09SVTg1eXpnZThCd3RxNGNPZU1P?=
 =?utf-8?B?aXJ0WTd3TElmMm5qM2FncktNcjNyY3lEajVpdDhjbWV4OEkwYWRiQWk5UFFz?=
 =?utf-8?B?SUxHY09ENFJhQXBJR0d3dTBxb3pyKzV5WXZuTUNMTHZ0QUkwZ1R5UGMwZUtr?=
 =?utf-8?B?SWJQdnE0OXVyeElURU54S0Y0aHFyR3J1SjZPMVNJMEdiQTc5QmZDMUl5alZW?=
 =?utf-8?B?ekUrUkg0YUlmKzJYQklVUExULzdNTXk4MTJSUFBFb0ZvR29rdnF2N3R2MHhx?=
 =?utf-8?B?dGxIWWw1Wm13QU5ESDNEbTZONHZzRkdxTU1saSs5VGo1SGlIclMwc0pPa25S?=
 =?utf-8?B?UUhDOEhwVHhGbGFma1Z4cTBRcEhrb1gwSHhuWXhuQy9OeE5SeEE4R0d2N0Zw?=
 =?utf-8?B?YWRDMmVMR3JvQllsY0l3dVhWY0JtZEdvckN2emxlekdaSGk5VS9Cc0oydURQ?=
 =?utf-8?B?dGNld281aTNyRkpSNFc4UG9pSkV0M1VEemo2bXozVi9hWFZIY0p4ZHpKMGhM?=
 =?utf-8?B?R04ySnF1MjJsZm9xQ29CYVNwMVV6MlFFb1o5RU1ZaGhhN2svZjRNMlVUcDNx?=
 =?utf-8?B?WDFKWG51dVVXaEtkNHpKc0tYV2x1MGJpWUtPbEJOT240eXE2cEhMblRZWWJq?=
 =?utf-8?B?cjJpRU55cXFZblgvNGlFWnM0QVlJMTFzRUNWWFVzOWlOTFJzekJTdi9FbGdi?=
 =?utf-8?B?OEdDSVI5Um9IS1R3bThZdVFVUy9MUHZTL3B3RnUzWGxoWmgrN1FyOGxPd2d4?=
 =?utf-8?B?OXVWNGlQL28rRW1lcXlCa1EwSkpNcFk1Sm9ia1pJd3pGbloyVTd6UjJLbkpO?=
 =?utf-8?Q?Ex+3/VgqOcOnOAbKuz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa34eb1d-8e75-4b95-f8dc-08debced3539
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 19:13:32.0727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBuDT/nzANppOWPTy5D/aHKAwDcfrA6JLAvS0NRsYWQPFDc1UNzb2LHzvnembMh2z82vuEJJ4pqZmHXQXOGl0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_121337_628202_34919550 
X-CRM114-Status: GOOD (  25.96  )
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

T24gVGh1LCBNYXkgMjgsIDIwMjYgYXQgMTE6Mjk6NDZBTSArMDMwMCwgQ2xhdWRpdSBCZXpuZWEg
d3JvdGU6Cj4gSGksIEZyYW5rLAo+Cj4gT24gNS8yMi8yNiAyMjoxMCwgRnJhbmsgTGkgd3JvdGU6
Cj4gPiBPbiBGcmksIE1heSAyMiwgMjAyNiBhdCAwMToxODowMVBNICswMzAwLCBDbGF1ZGl1IEJl
em5lYSB3cm90ZToKPiA+ID4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVq
QGJwLnJlbmVzYXMuY29tPgo+ID4gPgo+ID4gPiBUaGUgUmVuZXNhcyBSWi9HM1Mgc3VwcG9ydHMg
YSBwb3dlciBzYXZpbmcgc3RhdGUgd2hlcmUgcG93ZXIgdG8gdGhlIG1vc3QKPiA+ID4gU29DIGNv
bXBvbmVudGVzIChpbmNsdWRpbmcgSTNDKSBpcyBsb3N0Lgo+ID4gPgo+ID4gPiBUaGUgU1REQlIg
YW5kIEVYVEJSIGFyZSBjb25maWd1cmVkIGluIGluaXRpYWxpemF0aW9uIHBoYXNlIHRob3VnaCB0
aGUKPiA+ID4gc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlcl9vcHM6OmJ1c19pbml0LiBTZXQg
dGhlbSBvbiByZXN1bWUgZnVuY3Rpb24KPiA+ID4gYXMgd2VsbCB0byBrZWVwIHRoZSBzYW1lIHN0
YXRlIG9mIHRoZSBjb250cm9sbGVyIGFmdGVyIGEgc3VzcGVuZCB3aXRoCj4gPiA+IHBvd2VyIGxv
c3MgYW5kIGEgc2ltaWxhciBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZSBhcyBpbiBidXNfaW5pdC4K
PiA+ID4KPiA+ID4gRml4ZXM6IGU3MjE4OTg2MzE5YiAoImkzYzogcmVuZXNhczogQWRkIHN1c3Bl
bmQvcmVzdW1lIHN1cHBvcnQiKQo+ID4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVu
ZXNhcy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgIGRyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkz
Yy5jIHwgMTAgKysrKysrLS0tLQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9t
YXN0ZXIvcmVuZXNhcy1pM2MuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jCj4g
PiA+IGluZGV4IDE5MTc1NDljZjZkNS4uNmMyM2Y5NTZhZDJhIDEwMDY0NAo+ID4gPiAtLS0gYS9k
cml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwo+ID4gPiArKysgYi9kcml2ZXJzL2kzYy9t
YXN0ZXIvcmVuZXNhcy1pM2MuYwo+ID4gPiBAQCAtMjYwLDYgKzI2MCw3IEBAIHN0cnVjdCByZW5l
c2FzX2kzYyB7Cj4gPiA+ICAgCXUzMiBkeW5fYWRkcjsKPiA+ID4gICAJdTMyIGkyY19TVERCUjsK
PiA+ID4gICAJdTMyIGkzY19TVERCUjsKPiA+ID4gKwl1MzIgZXh0YnI7Cj4gPgo+ID4gY2FuIHlv
dSBrZWVwIGNvbnNpc2VudCB3aXRoIGFib3ZlIDIgcmVnaXN0ZXIsIHVzZSB1cGNhc2UgRVhUQlIs
Cj4KPiBVc2luZyB1cHBlciBjYXNlIGZvciB0aGlzIHdpbGwgbWlzbGVhZCB0aGUgY29tcGlsZXIu
IFRoZXJlIGlzIGFscmVhZHkgYQo+IG1hY3JvIGRlZmluZWQgZm9yIEVYVEJSOgoKVGhhdCdzIGZp
bmUuCgpSZXZpZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cgo+Cj4gI2RlZmlu
ZSBFWFRCUiAgICAgICAgICAgICAgICAgICAweDc4Cj4KPiBEZWZpbmluZyB0aGlzIG1lbWJlciBh
czoKPgo+IHUzMiBFWFRCUjsKPgo+IHdpbGwgbWFrZSB0aGUgY29tcGlsZXIgdHJ5IHRvIHJlcGxh
Y2UgdGhlIEVYVEJSIGluICJpM2MtPkVYVEJSIiBhdAo+IHByZXByb2Nlc3NpbmcgdGltZToKPgo+
ICAgQ0MgW01dICBkcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2Mubwo+IC4uL2RyaXZlcnMv
aTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jOjY1OjE3OiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRpZmll
ciBvciDigJgo4oCZCj4gYmVmb3JlIG51bWVyaWMgY29uc3RhbnQKPiAgICA2NSB8ICNkZWZpbmUg
RVhUQlIgICAweDc4Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fgo+IC4uL2RyaXZlcnMv
aTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jOjI2Mzo2OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8g4oCYRVhUQlLigJkKPiAgIDI2MyB8ICB1MzIgRVhUQlI7Cj4gICAgICAgfCAgICAgIF5+fn5+
Cj4gLi4vZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmM6IEluIGZ1bmN0aW9uIOKAmHJl
bmVzYXNfaTNjX2J1c19pbml04oCZOgo+IC4uL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkz
Yy5jOjY1OjE3OiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRpZmllciBiZWZvcmUKPiBudW1lcmljIGNv
bnN0YW50Cj4gICAgNjUgfCAjZGVmaW5lIEVYVEJSICAgMHg3OAo+ICAgICAgIHwgICAgICAgICAg
ICAgICAgIF5+fn4KPiAuLi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYzo2MTE6Nzog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEVYVEJS4oCZCj4gICA2MTEgfCAgaTNjLT5F
WFRCUiA9IEVYVEJSX0VCUkxPKG9kX2xvd190aWNrcykgfCBFWFRCUl9FQlJITyhvZF9oaWdoX3Rp
Y2tzKSB8Cj4gICAgICAgfCAgICAgICBefn5+fgo+IC4uL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5l
c2FzLWkzYy5jOjY1OjE3OiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRpZmllciBiZWZvcmUKPiBudW1l
cmljIGNvbnN0YW50Cj4gICAgNjUgfCAjZGVmaW5lIEVYVEJSICAgMHg3OAo+ICAgICAgIHwgICAg
ICAgICAgICAgICAgIF5+fn4KPiAuLi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYzo2
MTM6NDA6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhFWFRCUuKAmQo+ICAgNjEzIHwg
IHJlbmVzYXNfd3JpdGVsKGkzYy0+cmVncywgRVhUQlIsIGkzYy0+RVhUQlIpOwo+ICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn4KPiAuLi9kcml2ZXJz
L2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYzogSW4gZnVuY3Rpb24g4oCYcmVuZXNhc19pM2NfcmVz
dW1lX25vaXJx4oCZOgo+IC4uL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jOjY1OjE3
OiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRpZmllciBiZWZvcmUKPiBudW1lcmljIGNvbnN0YW50Cj4g
ICAgNjUgfCAjZGVmaW5lIEVYVEJSICAgMHg3OAo+ICAgICAgIHwgICAgICAgICAgICAgICAgIF5+
fn4KPiAuLi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYzoxNDUxOjQwOiBub3RlOiBp
biBleHBhbnNpb24gb2YgbWFjcm8g4oCYRVhUQlLigJkKPiAgMTQ1MSB8ICByZW5lc2FzX3dyaXRl
bChpM2MtPnJlZ3MsIEVYVEJSLCBpM2MtPkVYVEJSKTsKPiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+Cj4KPiBUaGUgcmVnaXN0ZXIgY29udGFpbnMg
Ym90aCBpM2MgYW5kIGkyYyBzcGVjaWZpYyBmaWVsZHMuIEknbSBub3Qgc3VyZSB1c2luZwo+IGky
Y19pM2NfRVhUQlIgaXMgdGhlIGJlc3Qgd2F5IHRvIGdvIGZvcndhcmQgZm9yIHRoaXMgb3IganVz
dCBrZWVwaW5nIGl0IGFzCj4gaXMuCj4KPiAtLQo+IFRoYW5rIHlvdSwKPiBDbGF1ZGl1Cj4KCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
