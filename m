Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B97C43458
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 03:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DONNeSygdEIKzgBMQMHYWeyYXwuwHLzBK73wDloh3YQ=; b=avJywsshsCVFKk
	D4LNNGupob7x8stDP88hCDjUQEvto9+VQ1CmvvYE7mECZKkpAUhRedxNaH+sHkohet57OEZiC6iAh
	ue90zK8xnV+O6eTf7cORYLo+Rp991SZpR0GrutS7YosmGphzIX+xG3itPvZSZz26rGGp9D4HNRWg5
	DSkAj+pzIBY+HdYqx6DGCytlnmdm8rludv+j1QmO7c5O4bJUVEgofBMuSnresq3f4Nq8x3DjSWzGv
	7UtIXCKVMMotGC4IOkR0+KuSy/m7BSANHHRJA6ctHZedur5VuQK1q+C18Nm5tCbY92qaK+zTbIz8M
	mh/+Y0a77mvnRA7dP0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfZw-00000000vSf-2LKV;
	Thu, 09 Jul 2026 03:37:36 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfZu-00000000vS9-1J0z
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 03:37:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQFz3okyiiUMkwKq0JRnVih78R4RLg6yvn1icwsCypDX72dJgGb00txPGGQM6+ycGLbZck4Rzw7+uL8ml0DD7nIYRuupb6sR5qRnqNNkZnw+fH3A8P2UExIEXLcd7cmyJsyU5WDYzG9njiQKZn5ZL1KKfZV+J0m41oZE0Z6sycrj7aWiXk+k1chE34tRNdk3Smhwwf+nFLe3vCPeeNoUcz8T51j9lWc1Fi9kQzGjXtZy1nJKwx3Av7zNETZHB1S2YXunBBeuxkSChhwdYyHufMmem8n57+nJ1vosqHTnV2BrXIE/nVYH4pU0zZpAyco5luw+POd+G+2r1MBypOZb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Da3lwKNokylrbRQO/e92tRizUcPKDTbA8VxSKVb4bYk=;
 b=Z+jcIwlx7z4jZ6100UngvmhybcLUkveeebPiRGZWCoXQagED+8ctEexgm1VX6+mzI4/7L40t6Q/BTvCcdN0uguOJACR3wOvnDxo3sTvD9u0jC6Mln82mZo9oJr4DshUMwBj59+AAFyxqeU5qkd4tDvpebSbOsHxv9Ub+uNC2kkh5N7BFWtmHZ3NPj4RqC/tv+I5QAwboi1U4OLtNQ2Aby2Qgig9RWAzhME0bX11VQwH8qZ66VizXyDduqDTwZJFF9ndSoQ3uLNPmZi8J7j9asT7UZ9D0ef8V807FG9R4DnpKW944ndPNulTFU9ogAcmVI2zaoKb+cxsFd5zQVbnDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Da3lwKNokylrbRQO/e92tRizUcPKDTbA8VxSKVb4bYk=;
 b=V+wuiOqQqyOsxnohjDDiyyFEq9raGkhiBq89vU2DI4bsERIZcLIlLURiy/32Ig9RRuBl7kcCW+JSDuyE99C4JPKMvbvUdcOkGct+r/Oh9S7QuNW8UGLMXSSFWTSywqswp21WK2gHXNEvDq67nKxoSwDuKNd1G8JLEWyQQXoCzk5lzwjgyfb8/L9TypYHoixJ/X50Yism5UBpANC0y3BOQ8tlkqD/7PVRN6UB6CUiZ/nJ+OmNBggQfgViDNTdGPUpSUVTR0L8EpforoxXb4aIbHUH9euBIvuOW1kzjInIcNylBqihFmcxBj7VSVtjfmxTGXiXcPutZ0mZ5Z8trUiM+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 03:37:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 03:37:29 +0000
Date: Wed, 8 Jul 2026 22:37:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "NG, TZE YEE" <tze.yee.ng@altera.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jorge Marques <jorge.marques@analog.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v6 5/5] i3c: master: Add optional_bytes for
 variable-length GET CCC validation
Message-ID: <ak8XbBwHsI9QgEhA@SMW015318>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <2e07dc944eab1c4358be1da87fa5000e711ac8bd.1783493868.git.tze.yee.ng@altera.com>
 <ak5mMbPlO8dCxH8R@SMW015318>
 <7ffb03e1-0f06-48af-ac9f-57058641429e@altera.com>
Content-Disposition: inline
In-Reply-To: <7ffb03e1-0f06-48af-ac9f-57058641429e@altera.com>
X-ClientProxiedBy: PH8P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: f545274c-2629-4b9c-d85f-08dedd6b66d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|7416014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: rMdobeVju1ArpCU1iXl4GdTl+OEvQCjDcoUKS9bwpwyIEru6K5ktUHzHFvAVTOir0BTyvyybkWLsHvDRLC+lQZgCDckOzpQgI3+pOtfDGwyie9hfDTdQVKquT0sc++IYaDYcAlhoWNFXjcURacho+mnqiNimi6woW6IgXmuXRhTnFG3k3S0JtP8eKylUfw+XrUFy5A58YsJH8zg+SbDglALSRFYuaGZ4vk2RfRGlvSoZyogaEhtGfD7yFu3TEcRmjUplzeXtSb3T9lj4l0fhv7BAKIhgIKxWP/csdLw2fxrf1JhGdjypoYhgAOPYAtM5Yd9e8tcyZelBfSxuVcnKKKe/mh4Mfvd3aNrhfuyPfnoq+pCnLmG6luAjEifZDrUqM7KLvyozrVXGwmPcX4wmKSKRB3fJjwDcBnOyX/aUcrZtrlJKtR1lrNu2EDJc7gvGqfd5k8FCK0INmNPgXuTfu4eyDJLkUDPcdScXpErIWkb6BabIenZJkYTbIw8oOwdnnhGTpoim1W5fiODlytHqsLpSdhbDkOIhgEP+AxuSFucOjRT0MxbNKVva8YFccmzg7aVdXf+3exWN7b4VY0bi3XLuGJob56PAKnsbale7zYj3flh8lqIz2cv9TYp1cGKIRy142QaeMGg2cvbSXcq84acVauBJy/4QncJO+aVndMk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2tyNEUxdUxpQnpUVjRpVG4yMkg2a1dwZkhwbnQ3bzlMdzh4Q3pOVXhsVjkz?=
 =?utf-8?B?N3dOVDNYYmRWNmJBa0dpcU1jUXFvYmcwSHZDQjQ1T3g1ZlZXd3dKQTBJSlFW?=
 =?utf-8?B?RFJUUis0UHFxejZQa2NwTFJ5ZGFZK0VKRXNnOWhtN0V6ajNyb2NHMXM1WDZW?=
 =?utf-8?B?NkIvRDhSNjVmN042Qlo3K3N0ek9FQThGMlBDbFd5dGNMeVdPdUNKY1hLU2Nj?=
 =?utf-8?B?VmZXY2RyRnlZMGNrcElMWnE0bzdCOGo2NWdmc3dYUGs1MzBSaW9pNkZIRnpW?=
 =?utf-8?B?dG1xcjNXT1J5VVRpZTZYZzdCNDhML0d3YjJNRjF6dUtJZE81VFZVd2hBcjhh?=
 =?utf-8?B?VWpJWTdRclJnaHZzMTJLakJmR2dHS3c1YUpWMWhpZ0VKUWZ2Z25zS1BzanRl?=
 =?utf-8?B?M2JMZ0Flc285NkZ5eVBkaGpVOTQ3T0lwcUNpRGhPK2FFM1UrY0hlYVIrNHdG?=
 =?utf-8?B?cTZXVXAydjZva2dqRE1FdG5RR1hJd2pmc05wdk9hZ3BYblpMNE5IdjlkeXI4?=
 =?utf-8?B?eWFTOWtOZW5SakxiaVRmeEFoYU1IdTNsQ1lYSnlJUU5xWWp0OWdoSHhMNHZ0?=
 =?utf-8?B?K1Y4aktFWUR2R00vOHZoRy9VaVVvQlNialUvU0E5T0x5cUgwalh6U0FIRStp?=
 =?utf-8?B?dkVsWUE5VGFyVUt0aXQvbnlXUTEzd1lydkMvYkowVHhJdEFYSStqSWZDYkd3?=
 =?utf-8?B?d2E3NVlNblY1TkVqemVxdmljN3ZkWDlPckt6TmlwM09zY1BLeHRPbDV1QmpI?=
 =?utf-8?B?bmc4THRJMmJuU1VrVUpUb0tjdFg0bTJGckdtOUQ5ZWl0eDQwT2RXUjEvekpO?=
 =?utf-8?B?ejhROVl1M2toMFl2NStQTUNzNEJtUWVvMTVZc050QzZtQVdwZ05FWVpZUVpR?=
 =?utf-8?B?ZlpDMmdxNnFkUnl1TE1VeERXTThPbUNsMVBOaXBIQWJsSWtLWjJtNEpYZUc2?=
 =?utf-8?B?S2duakw4YWdscUZvNWtDdU1xbE43U1BHdE96c0J3L1BNUm1vMGFLUWQ0dWg3?=
 =?utf-8?B?ZFVLa0Erc2h4Y0VWNTRUbysySzhIamRaUnBtZkZUS0hMellLckVnQWVmRXV3?=
 =?utf-8?B?Y1I1WTZBQVhhR0xzVmNnRklPYVhPTDRsRTBmSGJ0UWtXOG1SVTN0aDJhYTN2?=
 =?utf-8?B?TU1MdVpyOTRXYmVMZFp4WDJnRS8xUHVmcEFxUjMyUWQzSEhlNW9jRWhpcCtZ?=
 =?utf-8?B?Q0VWa0ZQY0pwTDE1RjNMRUlNOVpyQVlubng3cXhWSFZ3RnA0T3pxKzdVaG5U?=
 =?utf-8?B?NWFSTVYrOGZtMFVhNVkzVnVXRnYvZWpMcmNWRmJPQ0QxL2ExRDdjSkFCUys4?=
 =?utf-8?B?TVdNRVJmQTRhd0VBTGwyaUYzSFZYSUlzMWNKWWdjUTcrRjR1QTJYNTVobFgv?=
 =?utf-8?B?dml1QVdXY1FUWGsyaHpVME5UbERZZ1JTTVJTakdLVEhEdG55c0hrM0hCc1RY?=
 =?utf-8?B?U0JlTlExeUdJS1lTa1p6Q3ljN0ZDZHk4SUVZYmxkRGVUeDNxSCtLMnJYNnll?=
 =?utf-8?B?M2FFajd0L3BzQTlVYWdVQ3l3SUN5VFpUOGwxakh5QkdxWFJiZVNMUVN2bUNr?=
 =?utf-8?B?RWo3ZllTd2JBWXZZbDV3WlBRMUgxMzF1Zkx5K0ZkMjZBUHBNeUg0R1VzMk1N?=
 =?utf-8?B?UEJFK3lEcXl2eDg2RXpFTDVyc2VjNmptbThkM21ZaHM5NG5QS3hhenYrKzVT?=
 =?utf-8?B?THVSUXVQZVNtSEhUUlN4cTJJN01RU3pVRGpRYUpCTEhCUVVkbWpTSndEKzN5?=
 =?utf-8?B?bWc1TGNsK21hQUhOSit3MSt4bkNld3pmdkNCTU9DZ1pJVjd0K0tlZS9maFZv?=
 =?utf-8?B?YzFQNytOaWhXa05wczR3UWNMMUdFV0RLN05yU21YUUE5cytYWG4yUEhZejRq?=
 =?utf-8?B?YkpLY1p0V1hnMm9zb0dYS3FOZ25LamN1YjZjVDYrWTkzbmpKMGtTZTNpOVpM?=
 =?utf-8?B?WGE2eUJMVTRnSzJsNHNqT0IzZDdVR3FPNTl6dTdYTWd6MG1TblF0R1NIbHVT?=
 =?utf-8?B?elhjVkxwV0h5dSszZlkrMmphWWxQQ1d3b0tla1FsdEEyb2ZIQmE4QkNkc3Z6?=
 =?utf-8?B?OHc3Y0hoOW12MzA2Ylk5K0tZMUN2K2dlUU1UMi9NT1p0VEJ6N1QrU3p4MGdo?=
 =?utf-8?B?L0VqN3hESXcyUjhxTmRzS0RrZUUyNUgzbm5Bc1hMSjBCaGlOWUNwWXhLeHAw?=
 =?utf-8?B?WWdVazArc0ZLbEJYbGl6UUVKdkt1SVhWVlBKYWEybWlJdW02K21QOVc3Z1pN?=
 =?utf-8?B?amFGWTUwMXZTMzFUblJnWGdCdWVCbWFobytnZ0xMQ3lVeWg4aXF5eWpoWlBk?=
 =?utf-8?B?Y2thc2NzQ2JJMVBQSE1jQjBUYXhJRDBRWW1VcmRhaDE5VUpiejFwTSszeDdU?=
 =?utf-8?Q?2f2u9sG/PrHOVjNSYCmK5vjaI+xqCRoOwp2aJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f545274c-2629-4b9c-d85f-08dedd6b66d2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 03:37:29.2631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+dYjVZ+8dWuh72wFKTLrUBYlnNQdDVhNIz0oaYFvD5M0sPxeo+/1ccSn0VMJ2Bqfb7VyciUIpGi9IKiEYJANPEbgYCFLW5vshKsIh/PqZEvVhyfBtX+7Le5Q1QF5cs7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_203734_499601_4001BB95 
X-CRM114-Status: GOOD (  33.71  )
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

T24gVGh1LCBKdWwgMDksIDIwMjYgYXQgMDI6NTY6MzdBTSArMDAwMCwgTkcsIFRaRSBZRUUgd3Jv
dGU6Cj4gT24gOC83LzIwMjYgMTE6MDEgcG0sIEZyYW5rIExpIHdyb3RlOgo+ID4gT24gV2VkLCBK
dWwgMDgsIDIwMjYgYXQgMTI6MTc6NDFBTSAtMDcwMCwgdHplLnllZS5uZ0BhbHRlcmEuY29tIHdy
b3RlOgo+ID4+IEZyb206IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAYWx0ZXJh
LmNvbT4KPiA+Pgo+ID4+IEFkZCBvcHRpb25hbF9ieXRlcyB0byBzdHJ1Y3QgaTNjX2NjY19jbWRf
cGF5bG9hZCBzbyBjYWxsZXJzIGRlc2NyaWJlCj4gPj4gdmFyaWFibGUtbGVuZ3RoIEdFVCBDQ0Mg
cmVzcG9uc2VzLiBHRVRNUkwgYW5kIEdFVE1YRFMgc2V0IG9wdGlvbmFsX2J5dGVzCj4gPj4gYXQg
dGhlIGNhbGwgc2l0ZS4gRXh0ZW5kIGkzY19jY2NfdmFsaWRhdGVfcGF5bG9hZF9sZW4oKSB0byBo
b25vdXIgaXQuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gTmcgSG8gWWluIDxhZHJp
YW4uaG8ueWluLm5nQGFsdGVyYS5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogVHplIFllZSBOZyA8
dHplLnllZS5uZ0BhbHRlcmEuY29tPgo+ID4+IC0tLQo+ID4+IENoYW5nZXMgaW4gdjU6Cj4gPj4g
LSBTcGxpdCBmcm9tIHY0IHBhdGNoIDMvMzogb3B0aW9uYWxfYnl0ZXMgYW5kIHZhcmlhYmxlLWxl
bmd0aCBHRVQgcnVsZXMgb25seS4KPiA+PiAtIFNpbXBsaWZ5IHZhbGlkYXRpb246IGRyb3AgcmVk
dW5kYW50IGV4YWN0LWxlbmd0aCBjaGVjayB3aGVuCj4gPj4gICAgb3B0aW9uYWxfYnl0ZXMgPT0g
MCAocGVyIHJldmlldykuCj4gPj4gLSBDbGFyaWZ5IEdFVE1YRFMgZmFsbGJhY2s6IHdpdGggb3B0
aW9uYWxfYnl0ZXMgPSAzLCBhIDItYnl0ZSBzdWNjZXNzIG9uCj4gPj4gICAgdGhlIGZpcnN0IGF0
dGVtcHQgbm8gbG9uZ2VyIG5lZWRzIHRoZSBmYWxsYmFjazsgaXQgcmVtYWlucyBmb3Igd2hlbiB0
aGUKPiA+PiAgICA1LWJ5dGUgcmVxdWVzdCBmYWlscyByYXRoZXIgdGhhbiBzaG9ydC1yZWFkaW5n
Lgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9pM2MvbWFzdGVyLmMgICAgfCAyOSArKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLQo+ID4+ICAgaW5jbHVkZS9saW51eC9pM2MvY2NjLmggfCAgMiAr
Kwo+ID4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9p
M2MvbWFzdGVyLmMKPiA+PiBpbmRleCAzYjZkM2VjZDlkMTIuLjEyY2E3YzkyOWVlNSAxMDA2NDQK
PiA+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ID4+ICsrKyBiL2RyaXZlcnMvaTNjL21h
c3Rlci5jCj4gPj4gQEAgLTkwMiw2ICs5MDIsNyBAQCBzdGF0aWMgdm9pZCAqaTNjX2NjY19jbWRf
ZGVzdF9pbml0KHN0cnVjdCBpM2NfY2NjX2NtZF9kZXN0ICpkZXN0LCB1OCBhZGRyLAo+ID4+ICAg
CWRlc3QtPmFkZHIgPSBhZGRyOwo+ID4+ICAgCWRlc3QtPnBheWxvYWQubGVuID0gcGF5bG9hZGxl
bjsKPiA+PiAgIAlkZXN0LT5wYXlsb2FkLmFjdHVhbF9sZW4gPSAwOwo+ID4+ICsJZGVzdC0+cGF5
bG9hZC5vcHRpb25hbF9ieXRlcyA9IDA7Cj4gPj4gICAJaWYgKHBheWxvYWRsZW4pCj4gPj4gICAJ
CWRlc3QtPnBheWxvYWQuZGF0YSA9IGt6YWxsb2MocGF5bG9hZGxlbiwgR0ZQX0tFUk5FTCk7Cj4g
Pj4gICAJZWxzZQo+ID4+IEBAIC05NDQsMTEgKzk0NSwxOSBAQCBzdGF0aWMgaW50IGkzY19jY2Nf
dmFsaWRhdGVfcGF5bG9hZF9sZW4oc3RydWN0IGkzY19jY2NfY21kICpjbWQpCj4gPj4KPiA+PiAg
IAlmb3IgKGkgPSAwOyBpIDwgY21kLT5uZGVzdHM7IGkrKykgewo+ID4+ICAgCQlzdHJ1Y3QgaTNj
X2NjY19jbWRfcGF5bG9hZCAqcCA9ICZjbWQtPmRlc3RzW2ldLnBheWxvYWQ7Cj4gPj4gKwkJdTE2
IG1pbl9sZW47Cj4gPj4gKwo+ID4+ICsJCWlmIChwLT5vcHRpb25hbF9ieXRlcyA+IHAtPmxlbikK
PiA+PiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gPj4KPiA+PiAgIAkJaWYgKHAtPmFjdHVhbF9sZW4g
PiBwLT5sZW4pCj4gPj4gICAJCQlyZXR1cm4gLUVJTzsKPiA+Pgo+ID4+IC0JCWlmIChwLT5sZW4g
JiYgcC0+YWN0dWFsX2xlbiAhPSBwLT5sZW4pCj4gPj4gKwkJaWYgKCFwLT5sZW4pCj4gPj4gKwkJ
CWNvbnRpbnVlOwo+ID4+ICsKPiA+PiArCQltaW5fbGVuID0gcC0+bGVuIC0gcC0+b3B0aW9uYWxf
Ynl0ZXM7Cj4gPj4gKwkJaWYgKHAtPmFjdHVhbF9sZW4gPCBtaW5fbGVuKQo+ID4+ICAgCQkJcmV0
dXJuIC1FSU87Cj4gPj4gICAJfQo+ID4+Cj4gPj4gQEAgLTEzNDIsMTAgKzEzNTEsMTQgQEAgc3Rh
dGljIGludCBpM2NfbWFzdGVyX2dldG1ybF9sb2NrZWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJv
bGxlciAqbWFzdGVyLAo+ID4+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiA+Pgo+ID4+ICAgCS8qCj4g
Pj4gLQkgKiBXaGVuIHRoZSBkZXZpY2UgZG9lcyBub3QgaGF2ZSBJQkkgcGF5bG9hZCBHRVRNUkwg
b25seSByZXR1cm5zIDIKPiA+PiAtCSAqIGJ5dGVzIG9mIGRhdGEuCj4gPj4gKwkgKiBHRVRNUkwg
cmV0dXJucyAyIGJ5dGVzIChtYXggcmVhZCBsZW5ndGgpIHdoZW4gdGhlIGRldmljZSBkb2VzIG5v
dAo+ID4+ICsJICogYWR2ZXJ0aXNlIElCSSBwYXlsb2FkLCBvciAyIG9yIDMgYnl0ZXMgd2hlbiBp
dCBkb2VzICh0aGUgb3B0aW9uYWwKPiA+PiArCSAqIHRoaXJkIGJ5dGUgaXMgbWF4IElCSSBsZW5n
dGgpLiBVc2Ugb3B0aW9uYWxfYnl0ZXMgdG8gYWxsb3cgZWl0aGVyCj4gPj4gKwkgKiBsZW5ndGgg
d2hlbiBJQkkgcGF5bG9hZCBpcyBzdXBwb3J0ZWQuCj4gPj4gICAJICovCj4gPj4gLQlpZiAoIShp
bmZvLT5iY3IgJiBJM0NfQkNSX0lCSV9QQVlMT0FEKSkKPiA+PiArCWlmIChpbmZvLT5iY3IgJiBJ
M0NfQkNSX0lCSV9QQVlMT0FEKQo+ID4+ICsJCWRlc3QucGF5bG9hZC5vcHRpb25hbF9ieXRlcyA9
IDE7Cj4gPj4gKwllbHNlCj4gPj4gICAJCWRlc3QucGF5bG9hZC5sZW4gLT0gMTsKPiA+Pgo+ID4+
ICAgCWkzY19jY2NfY21kX2luaXQoJmNtZCwgdHJ1ZSwgSTNDX0NDQ19HRVRNUkwsICZkZXN0LCAx
KTsKPiA+PiBAQCAtMTQxNCwxNCArMTQyNywxOCBAQCBzdGF0aWMgaW50IGkzY19tYXN0ZXJfZ2V0
bXhkc19sb2NrZWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLAo+ID4+ICAg
CWlmICghZ2V0bWF4ZHMpCj4gPj4gICAJCXJldHVybiAtRU5PTUVNOwo+ID4+Cj4gPj4gKwlkZXN0
LnBheWxvYWQub3B0aW9uYWxfYnl0ZXMgPSAzOwo+ID4+ICsKPiA+PiAgIAlpM2NfY2NjX2NtZF9p
bml0KCZjbWQsIHRydWUsIEkzQ19DQ0NfR0VUTVhEUywgJmRlc3QsIDEpOwo+ID4+ICAgCXJldCA9
IGkzY19tYXN0ZXJfc2VuZF9jY2NfY21kX2xvY2tlZChtYXN0ZXIsICZjbWQpOwo+ID4+ICAgCWlm
IChyZXQpIHsKPiA+PiAgIAkJLyoKPiA+PiAtCQkgKiBSZXRyeSB3aGVuIHRoZSBkZXZpY2UgZG9l
cyBub3Qgc3VwcG9ydCBtYXggcmVhZCB0dXJuYXJvdW5kCj4gPj4gLQkJICogd2hpbGUgZXhwZWN0
aW5nIHNob3J0ZXIgbGVuZ3RoIGZyb20gdGhpcyBDQ0MgY29tbWFuZC4KPiA+PiArCQkgKiBvcHRp
b25hbF9ieXRlcyA9IDMgYWNjZXB0cyBhIDItYnl0ZSByZXNwb25zZSBvbiB0aGUgZmlyc3QKPiA+
PiArCQkgKiBhdHRlbXB0LCBzbyB0aGlzIGZhbGxiYWNrIHJ1bnMgb25seSB3aGVuIHRoZSA1LWJ5
dGUgcmVxdWVzdAo+ID4+ICsJCSAqIGZhaWxzIHJhdGhlciB0aGFuIHJldHVybmluZyBhIHNob3J0
IHJlYWQuCj4gPj4gICAJCSAqLwo+ID4+ICAgCQlkZXN0LnBheWxvYWQubGVuIC09IDM7Cj4gPj4g
KwkJZGVzdC5wYXlsb2FkLm9wdGlvbmFsX2J5dGVzID0gMDsKPiA+PiAgIAkJaTNjX2NjY19jbWRf
aW5pdCgmY21kLCB0cnVlLCBJM0NfQ0NDX0dFVE1YRFMsICZkZXN0LCAxKTsKPiA+Cj4gPiB3aGVy
ZSB1c2UgcmV0cnkgIT0gMSBjYXNlID8gaWYgYWxsIGlzIDEsIHBhdGNoIDQgaXMgbm90IG5lY2Vz
c2FyeS4KPiA+Cj4gPiBGcmFuawo+ID4KPgo+IEhpIEZyYW5rLAo+Cj4gVGhlIHJldHJ5IGNvdW50
IGlzIG5vdCBhbHdheXMgMS4gcmV0cmllcyBpcyAxIGZvciBHRVQgYW5kIDAgZm9yIFNFVCAocm53
Cj4gPyBJM0NfQ0NDX1JFVFJJRVMgOiAwKS4gbWF4X2F0dGVtcHRzID0gcmV0cmllcyArIDEgZ2l2
ZXMgMiBhdHRlbXB0cyBmb3IKPiBEaXJlY3QgR0VUIChzcGVjIMKnNS4xLjkuMi4zKSBhbmQgMSBm
b3Igc2lkZS1lZmZlY3RpbmcgU0VUIENDQ3MuIFRoaXMKPiBmb2xsb3dzIEFkcmlhbiBIdW50ZXLi
gJlzIHY0IHN1Z2dlc3Rpb24gaW4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMzgyYTdj
MmQtMmU5ZS00YTgzLTk0ZDEtYjkxNzkyMWQ5MWYxQGludGVsLmNvbS87Cj4gcGF0Y2ggNCBpcyBz
dGlsbCByZXF1aXJlZCBmb3IgdmFsaWRhdGlvbiBhbmQgdGhlIGNlbnRyYWwgcmV0cnkgcGF0aCwg
bm90Cj4gb25seSBmb3IgdGhlIGZpZWxkIGl0c2VsZi4KPgo+IFBhdGNoIDQgaXMgc3RpbGwgbmVl
ZGVkIGZvciB0aGUgY2VudHJhbCByZXRyeSBwYXRoLCBHRVQgcGF5bG9hZAo+IHZhbGlkYXRpb24g
YWZ0ZXIgYSBzdWNjZXNzZnVsIHRyYW5zZmVyLCBhbmQgcmVzZXR0aW5nIGFjdHVhbF9sZW4gYmV0
d2Vlbgo+IGF0dGVtcHRzIOKAlCBub3Qgb25seSBmb3IgZXhwb3NpbmcgcmV0cmllcyBpbiBzdHJ1
Y3QgaTNjX2NjY19jbWQuCgpPa2F5CgpSZXZpZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54
cC5jb20+Cgo+Cj4gVGhhbmtzLAo+IFR6ZSBZZWUKPgo+ID4+ICAgCQlyZXQgPSBpM2NfbWFzdGVy
X3NlbmRfY2NjX2NtZF9sb2NrZWQobWFzdGVyLCAmY21kKTsKPiA+PiAgIAkJaWYgKHJldCkKPiA+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pM2MvY2NjLmggYi9pbmNsdWRlL2xpbnV4L2kz
Yy9jY2MuaAo+ID4+IGluZGV4IDI1MDZkODNiODI1NS4uN2FkNjc3YmFmNzYxIDEwMDY0NAo+ID4+
IC0tLSBhL2luY2x1ZGUvbGludXgvaTNjL2NjYy5oCj4gPj4gKysrIGIvaW5jbHVkZS9saW51eC9p
M2MvY2NjLmgKPiA+PiBAQCAtMzQ3LDExICszNDcsMTMgQEAgc3RydWN0IGkzY19jY2NfZ2V0eHRp
bWUgewo+ID4+ICAgICoKPiA+PiAgICAqIEBsZW46IHJlcXVlc3RlZCBwYXlsb2FkIGxlbmd0aAo+
ID4+ICAgICogQGFjdHVhbF9sZW46IG51bWJlciBvZiBieXRlcyByZWNlaXZlZCBvbiBhIEdFVCBD
Q0MgKGZpbGxlZCBieSB0aGUgZHJpdmVyKQo+ID4+ICsgKiBAb3B0aW9uYWxfYnl0ZXM6IEdFVCBD
Q0NzIG1heSByZXR1cm4gdXAgdG8gdGhpcyBtYW55IGZld2VyIGJ5dGVzIHRoYW4gQGxlbgo+ID4+
ICAgICogQGRhdGE6IHBheWxvYWQgZGF0YS4gVGhpcyBidWZmZXIgbXVzdCBiZSBETUEtYWJsZQo+
ID4+ICAgICovCj4gPj4gICBzdHJ1Y3QgaTNjX2NjY19jbWRfcGF5bG9hZCB7Cj4gPj4gICAJdTE2
IGxlbjsKPiA+PiAgIAl1MTYgYWN0dWFsX2xlbjsKPiA+PiArCXUxNiBvcHRpb25hbF9ieXRlczsK
PiA+PiAgIAl2b2lkICpkYXRhOwo+ID4+ICAgfTsKPiA+Pgo+ID4+IC0tCj4gPj4gMi40My43Cj4g
Pj4KPiA+Pgo+CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWkzYwo=
