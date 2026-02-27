Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A97FEFB6C
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SfGWMnRXYSxWpw9Xq1vZKjIHf/zoKomuyp6L3mcGc8=; b=rCSGjRUItJbLuT
	gM9pbriPg3JfVx4h6Kpp3wtnPB3R0vqGnCqLn0nbYmBqtIOO8BuImAjXAyDa9yFHNXf09WHdOdKin
	eeZ2dJ2s19VpbLNLIBP9hQ6G1C+k9axnR6KqHwT+lXlL0000Xg1vG6exXibZKlj9Oxb44QOOSSjBn
	VCI0IGYGEbUZvLG8/eguttI3BWGWSF5P526jbVsxmcyAGcdQUAnAU93v4UcobnThvZ7L6xRFaTd45
	32sTwmpPQ68fob7sl7DanbCpTY2wYrRdpVaJzzLC2bGZrNh9sctAoRTCdaaXtSBxhxAzSx+cqtkpu
	YI63o6eQ7kmILIC1sbUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0JW-00000008hzx-0c7M;
	Fri, 27 Feb 2026 16:03:38 +0000
Received: from mail-northeuropeazon11012001.outbound.protection.outlook.com ([52.101.66.1] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0JT-00000008hzB-1h49
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 16:03:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRFGKR+YJygkWJphZJnFoP3FRP+genNMTTBCEM44f+LsTjiRVNWMAQdbB3jB3aopfuASHLdS8dZGAnqwcqetoTQwqs6gEZmOQZ1WtzJcu67dDmGRj66/Pt5gJAo3bH3xe37OgihQcLlsoxVkd/nxOLwC062s8JmE+zN1Sd3YSbi4/ZXzsqnn1NjbTMEfQ689zrSzGLuuDn+nU6c9rxGtNPdhmm2MWb49ptIN+6CbCew8c6L9kZChU5QiWQGkOU2BHD2/UFYqVcY9nsuNcYJtVTrXp1t0Dc7/6rlBz9DQPjxxlgC4I+nqW+LE78d+ACkPctJzAAXYReL7OG8KkX08cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8m0Zpx+9F5Pg1WBZhd3k4dh7xDh9KV4Izr3mR95c0w=;
 b=jFibh6CWwjMBPGQf/I6J650iLKOBowe357WzkS+UnxxEQ0dQyFJ7xB6K31iV2TMWp2RuWlM2KF8+OSCUZ7pC7w2NPjp+/F6rKnQgUUCWesRVr7fyRtL6TBoJNecykgPLDSVU0yTcE59mrFnS1tDnkl98MVel/zzRx7gP2RfTmxoz7fHYIuNUBDRat6EtQ7jVzGwLyjzJxUmMEtuZVMF9FDScoo4CFDh8Z36W2e9OJHIyxN/02+/OUggYK5uUbHGMWN/oj04sRusHNHMDL1Lcj7Cj7xWX6DliDRMqz2DPZi5mjhID0eNtzXO/CYBBnIhandVItzMackFra0/7TwVvdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8m0Zpx+9F5Pg1WBZhd3k4dh7xDh9KV4Izr3mR95c0w=;
 b=O3QF5FiFzNtAr10ie7xyhKsXO0N6PPON4cdpZUWpN0dxVqSfgakb9jVp0vuBekjdSo2hKO1FWkDzPXfvhBNtq1b1j87aOCMmiMOw/gBDOlcLrOGMsQgbPJwGywV2P/s1aIlPKXnCNWRtkTiPN+p92Uq9SzMEnf5JFmvJySsYRUn95eyysOq0Z+tc1x2pLy8YLqZ7+k2rMyT9SWKtiseVmA7v+AmVWPPa6Uol6nqWXvCu5qE8Jc41Jp4qn6FK8G0m+Cf9WUk/CkGs++2hnWfwNzK+24MJVvL9SDi9aP1uvtbzNAc41993mG5RfxsfJWtIPQEzJBx3wyjpqSueYgwsfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AM7PR04MB6856.eurprd04.prod.outlook.com (2603:10a6:20b:108::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 16:03:31 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:03:31 +0000
Date: Fri, 27 Feb 2026 11:03:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 02/12] i3c: mipi-i3c-hci: Fix Hot-Join NACK
Message-ID: <aaHATkkm-4WThkHe@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-3-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260227141149.184980-3-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0096.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::23) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AM7PR04MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dfec80e-e519-40b6-a2ab-08de7619c088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: 7VoDo5+6pnfYe38hDU1P0hQmoB8+F4z4ppdRI2lUrMwZ2o3DTZEx2oDldzepMh4mCQy0Rx2Qv9yicY9KQy4hnLdEm2Wz05lC/7Llzb9LLIxiI+BZT9ClkAzvzpSLM2wGn0t0xw7r9BOrNaIbarxuVUcuYAVjRbiYc7r8xIMqooc+ngeWbK4N7uh34Gvtbg1HC66TwuXUlzs5GdOJ+86PaZYFcPZi59qWLPbRBeobxbt/SVbg5TO61FYUoKJlUjkUZQDAG7mKoGA8HftoenNdIPJe4BEGxStb0DYB5hd+5MnEfab1qzmLUBn07tzSPuIV0YRE2rEiJnzXlffy6fYmIEAgewHGvtFUlXFNXSotjZN/8l0LjLLwkG0lnRnopgW/LE2XgvbFumIxWaUNjLmD4NqoUK+I6z3EaCi7lXSx/CfBGbK5pEN7TxbNrSNpYi8WJeIdWpDp2+jv2qE+wLia27NMrTh1SOOXutF4PPhadlfpaEwgMPc9CUeQP6QKuiKPxuSVj+2yYL7c87lXHCjnBa7FhJx/E1+qwC0sWyF9ePyvcDp4V4M8cum11v13Dt2cr542GOCu+ByYHmpkhZN5JwirytNGPknJe5aQ39KVlqJaYhJuQ3cY/4QJKDHBRZA2rkBz66LDI/9s3EXWUqbdN6gMQTX+IsB3+mlagMRuvowD2ZKgBfiVWmnwk6uABbjt02jkDrQVQoy6jtAYx8eXhMRHs/w3xNiloCN7hO5l30NlEAmB/AF8SBpogMOnyK7ALh95vSxD0Q/8A1LpVJIKyiMXwoWRWJ4YL4a2g1SA0ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aERoL3B6VjJNNnFXbnFwQ3JqRTc3STRvK21ldjE2Ynh5Uk9PeWZySnI3b2F2?=
 =?utf-8?B?NTZaZGtpbSszMFBXU3FzcVd6bmhGazUzYVB0WXpSZEJIdG1nU1RnSFhQZUtH?=
 =?utf-8?B?WEpiWmxhOENOV0cxZHlTc2dIRVlrdFpWUUE1bmt6THdCSEdIa3dVUklLZlRo?=
 =?utf-8?B?T1ZDSkVnVUdYdkZSOHhyQ2dGb3VkZ282alhDRmNnZlRpS1pRRVRMVHVNOHow?=
 =?utf-8?B?WGtxellLWGFTR251a1BqQ2xTN1hlNEJOeU8wSFkrYUVXU1lJeVUzZDVub05S?=
 =?utf-8?B?N2JKREVvZitpMUdIaUpzNStQNXJmZXF3aHFVVG5ER3pjU0dXYzF5ZEx5SHht?=
 =?utf-8?B?YUZNWlZObjF6VGdGYlJlVjdxVmxzYytSa0hjOWtSMmVRRmRlV0d1MWY4NnU5?=
 =?utf-8?B?WHV1Z2FQTU1JTjlueHpJazVIT0Zhd3FFYkpUaHVJWFBrVVJKQkpQaDhZYUU2?=
 =?utf-8?B?aXVqT3ByNWZ5VGVsZGRlVENndXBlSDZDYVU4TTl3ZE9VY2RKbmlsV2tlN1VU?=
 =?utf-8?B?VGU0S2NxRnJKdisya1Y2RFhvOGRxSWttdkNvQmZMNGh0TUs3QmhvTzBkem9z?=
 =?utf-8?B?RlFVOFptQXdmS0FpQUl3SDMvbElHN1dDaElRdkswRnFuaklYdWxHdFdHcFBx?=
 =?utf-8?B?SnR0RllTRUtUeTBQNk93dTRJblZ1cGpOd1lkc2JYbk1XQjM0cXowL1FvV2xp?=
 =?utf-8?B?aGVnZ3hPWnNPYXRaRXRhb1FrQlZCQzh5dVhtTG9oNWZiN0dWSWh4bkFZeHox?=
 =?utf-8?B?YkZndGtsU0x6VW5UUDFBRE9idWR6OXEwdHZXSGJnMm9tNFY4aS82ZHdUWVdk?=
 =?utf-8?B?WW04OTlqdVJCQ3N2SlQrTVZhdGFmK3F2akY4L09KazkvdEJWdEJxamxieGxC?=
 =?utf-8?B?TlFYZXNZOU5XdXJCdEs1Z1ZlTnZzSFl2aEFGUDgxWkFPUmNVeUFoMXpNTE5w?=
 =?utf-8?B?WUIwWHVJUERLUnp2Q2xHbmJ1Y1owMlRBeHF0bmk0SjR1dUFJREFUdkFLMGVY?=
 =?utf-8?B?SUZ0T2FoMUdBQWdwZVFwb0pMK1BNV29JVlJmYk1LejRJWlEzYWVlOTZCalpu?=
 =?utf-8?B?RDNYWWtsSzhiZVhqLzQyR0I5clpGeUtHU3ZJdURoeGMrQy9vS1drcGhkc2Fq?=
 =?utf-8?B?YjhtOFcyKzVUN0RBUnJxTGphY2IybzBMc0FkSlgwR3UyZnhGZ1Z4aDd0YTV1?=
 =?utf-8?B?ZzFCZWpkWUt0TTREenZzblNnQ3NCbDJPSkwyZFBYc2czRVBSZUIzSDh2dGND?=
 =?utf-8?B?NVd5dTlkMVVFNW1PU1VVcHYwVWs3T201bUFPRzhMdFZkeTljR0xNakZnYmM1?=
 =?utf-8?B?L29RZ21qZTlvbWl0MzFQdVpNb2g2b0RjOGg1cDZvaTY1b2RBaTNtNnFMQ010?=
 =?utf-8?B?Si9jS1RENzQ5N1p3MWNrM1hDaWlQWDBKcHVMUHNrSHRYZkREWTAwVUJoMEhn?=
 =?utf-8?B?T0taSUczVXh5bm9hR0tWRmx4Y1VLa3cyb0hIQzRldlVZNDBPOVU3SFpsVmNV?=
 =?utf-8?B?U3V1Vlo5MWdOTVhMK1dxeThJbzJIcEEyaVVVNktsZkVUZ3ZteGIycDhKYnNu?=
 =?utf-8?B?bkx0L25GNm85NGdDbDcwZ2NmSmRXTFZrUlhDMldEUVNqVTFZRkVrV1poMVFr?=
 =?utf-8?B?bnFiNjFmM2ZWY2VSaFpFdEdPUjZXMUtRU1F5UWVDaGExc3VQUFFjL3EraXQy?=
 =?utf-8?B?THpsK1p6ZmJyc3ZzSWZqNGEzWVBXWUdTVStEMGNaOTRZNEhuMkdTbUE0bWg5?=
 =?utf-8?B?M1RxZERLQkpTTGhnQVdYVmwwbTVaYXVTZWdKTzFYVWJLY1dIYVYwdHFTd1ZZ?=
 =?utf-8?B?RDcxODVVcDMyU0lJOVZMc3F6UkZKc1RiMzRpaGpaaWtmRWlBYkQ5MUZIbU9W?=
 =?utf-8?B?WUVxeFhPdXV6NjFLTU1NQ1JMZmE1dXRndDZCdk42K3RIYlQ4aVJXbElvWGIv?=
 =?utf-8?B?Kyt1eStURmNhbG5IZGd0TVlhOEgwaWpFV2VaVWFlWmZsZnZYY2hCaWNNK0NM?=
 =?utf-8?B?WXRBbzR3a3VmREhpK1hobFp5Y3JFUi9WYm42MHVtb0FJS1Y5eUJDeFlYdjM5?=
 =?utf-8?B?MHJ3ZnEvRVNNdnZYcnVOZ05BNi8ySFpXNG1qdUVKc1llOUt5SVp3MjBCZ3JV?=
 =?utf-8?B?WldZZGkyajkxcERNMlZsdlViNHI5K1k2cERxcEc2OHJyelg5S2FpY2lBUFFB?=
 =?utf-8?B?TDRiOUZzaVh0cTlvWkp5L1hsY2tHcEs2VWp3Yi9ZcE00SEk2TmJ1UUVCZ09D?=
 =?utf-8?B?cHJ4bXAyenI0OUhIQy9LUXNGeVY4WmRYekVnc2VaL2cxVTk0V1pWOWV1UlBk?=
 =?utf-8?Q?Aku3MQ6qn4Yug4R3wR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dfec80e-e519-40b6-a2ab-08de7619c088
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:03:31.2501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FA3s+bpH7xG4rdgEOUJIyLBAk4QEE1QaYVTOewJds85qfZO+u8Badg6osE2xA9kMEgZqdr6pt5A28IFRXvRBSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6856
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_080335_444068_CD27C875 
X-CRM114-Status: GOOD (  17.64  )
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

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgMDQ6MTE6MzlQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3
cm90ZToKPiBUaGUgTUlQSSBJM0MgSENJIGhvc3QgY29udHJvbGxlciBkcml2ZXIgZG9lcyBub3Qg
aW1wbGVtZW50IEhvdC1Kb2luCj4gaGFuZGxpbmcsIHlldCBIb3QtSm9pbiByZXNwb25zZSBjb250
cm9sIGRlZmF1bHRzIHRvIGFsbG93aW5nIGRldmljZXMgdG8KPiBIb3TigJFKb2luIHRoZSBidXMu
ICBDb25maWd1cmUgSENfQ09OVFJPTF9IT1RfSk9JTl9DVFJMIHRvIE5BQ0sgYWxsIEhvdOKAkUpv
aW4KPiBhdHRlbXB0cy4KPgo+IEZpeGVzOiA5YWQ5YTUyY2NlMjgyICgiaTNjL21hc3RlcjogaW50
cm9kdWNlIHRoZSBtaXBpLWkzYy1oY2kgZHJpdmVyIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwo+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYyB8IDYg
KysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMg
Yi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+IGluZGV4IGRiZTkzZGYw
YzcwZS4uNDg3N2EzMjFlZGY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBp
LWkzYy1oY2kvY29yZS5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9j
b3JlLmMKPiBAQCAtMTUyLDcgKzE1Miw4IEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9idXNfaW5pdChz
dHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptKQo+ICAJaWYgKGhjaS0+cXVpcmtzICYgSENJ
X1FVSVJLX1JFU1BfQlVGX1RITEQpCj4gIAkJYW1kX3NldF9yZXNwX2J1Zl90aGxkKGhjaSk7Cj4K
PiAtCXJlZ19zZXQoSENfQ09OVFJPTCwgSENfQ09OVFJPTF9CVVNfRU5BQkxFKTsKPiArCS8qIEVu
YWJsZSBidXMgd2l0aCBIb3QtSm9pbiBkaXNhYmxlZCAqLwo+ICsJcmVnX3NldChIQ19DT05UUk9M
LCBIQ19DT05UUk9MX0JVU19FTkFCTEUgfCBIQ19DT05UUk9MX0hPVF9KT0lOX0NUUkwpOwoKQ2Fu
IHlvdSBjaGVjayB2YXJpYmxlIG1hc3Rlci0+aG90am9pbj8gc28gbmVlZG4ndCBjaGFuZ2UgaXQg
d2hlbiBhbmFibGUgSEoKaW4gZnV0dXJlPwoKRnJhbmsKCj4gIAlkZXZfZGJnKCZoY2ktPm1hc3Rl
ci5kZXYsICJIQ19DT05UUk9MID0gJSN4IiwgcmVnX3JlYWQoSENfQ09OVFJPTCkpOwo+Cj4gIAly
ZXR1cm4gMDsKPiBAQCAtNzY0LDcgKzc2NSw4IEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9ydW50aW1l
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4KPiAgCWhjaS0+aW8tPnJlc3VtZShoY2kpOwo+
Cj4gLQlyZWdfc2V0KEhDX0NPTlRST0wsIEhDX0NPTlRST0xfQlVTX0VOQUJMRSk7Cj4gKwkvKiBF
bmFibGUgYnVzIHdpdGggSG90LUpvaW4gZGlzYWJsZWQgKi8KPiArCXJlZ19zZXQoSENfQ09OVFJP
TCwgSENfQ09OVFJPTF9CVVNfRU5BQkxFIHwgSENfQ09OVFJPTF9IT1RfSk9JTl9DVFJMKTsKPgo+
ICAJcmV0dXJuIDA7Cj4gIH0KPiAtLQo+IDIuNTEuMAo+Cj4KPiAtLQo+IGxpbnV4LWkzYyBtYWls
aW5nIGxpc3QKPiBsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
