Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F75D58E7D
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Mar 2026 08:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RA+S5+6euO/X3PC48fOKql1ARD6oPfDcJxyK/y6vM60=; b=w+GIVDs8strsDPUKnS97d7IUv5
	t64bM9XjElnpPzjL9FB03jIGFTJrEfYb2nrzQAECZg+m4mnrugZh3WEz7cXDoNQMoPw+2S4bGWyzB
	fppcjX/0FlLo1QLE0QVDZMt2im1qq4vMghLjPXZP7jXMu/8MpKbLovaATGbdXvQqvTkT4SB04/gOk
	2q4IH/pAQhSwm6/Zud3n9jaCbBrG0mzNTT0p3VDlvC0kzYBQplli0V1BTypzshfhKaddX7L8fBjv7
	YexQvwCpG4uWbxEmO3O1khJH635P9yyN8bdXSOFqMvsWZ1Wdmf51IdfFqBUKnAcWlLC5Zp7H0kA5S
	0Zw23v0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwysm-0000000CXZD-0Ml5;
	Mon, 02 Mar 2026 08:44:04 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwysh-0000000CXXf-3Bmi
	for linux-i3c@lists.infradead.org;
	Mon, 02 Mar 2026 08:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772441040; x=1803977040;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xMfA+3VFvGjniH2fj0sIn63jcwQTYzQZ/PyvCn1XGPo=;
  b=DuxB9PTJOE8fXVWP2jsQ7XCFa/wFVSKO9av5LLPvXteY4BjjG6/FgEtC
   EJmFMpMGhNJF8GTiGJ+OUgxvPbFLl8dwv3u8nQE2FdcUOQT1nPCmOF2SJ
   OxldZ/nCBePgxVOZyU3ZtU2/mZvO/zruUUPWG9MPPZTDPA1YuQ4Hgy3Zz
   Zz8Azcirvu1S1zvB86G++frFJD2aF+2Va2ENNmwjJx30eqnbtFSOK7KtH
   e5UXLPSmRCQ4IXH0uzm5GVaIVb7/ehCk9Q2fcJR3Cg4pAODbjW6UhYByO
   dvW6wgMwCrdyNfPjd+ccYuyhgAcU0IPDicJu8rnapMIHBIVKMA59cWCAT
   Q==;
X-CSE-ConnectionGUID: guMmoSFrS/uWTLNOj9fefg==
X-CSE-MsgGUID: RPr4bcvwQaSGg85vDytm/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73406701"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73406701"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:43:59 -0800
X-CSE-ConnectionGUID: P9sxmeICRlSO39+1g6cCUA==
X-CSE-MsgGUID: zHCqmOqTQX6ft5xR53opxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="214829295"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:43:58 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 00:43:58 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 00:43:58 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 00:43:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZS+g7nwJB48Y8fto4SwYEmOlDPKTm01MRoWNseVoFlD31F3IHrZEzqZpAU4doDTY6avlaNbp2icpJ+lZI4Mf46ZuqAls1Gn15FIUazZZLhNB2XgxbsXN8//qSvm3w8/rkxhy1unA79+t3QD2BgnPXy9/NmuQVYNZtmNbVqE2CDJRCzKJ1F3g/JOdykzezgilorxgbwg9N4af4dhOVAA3vjXFGNyTtxz7402/+idsknUiHabLhfAK/epVYcOvIyjfl0rmmAghv0Gc97C01VKGdT72MtHMODL56CmjZCwt9np3m2RN/DNX7rBJ4UXQWSKF/wGc4VPKkQHq72sPXWnvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5rdC1tQsANspIabOHMFsO05FavCT4qNFZf5smxqaTQ=;
 b=nepAFszOY3gYhiDr7JFMXYp7RfvhfEZydqqGS6gZMLUsl+mfzTxcfc4e3XJLiOmvkFxs/gsXlk2f/zQwgpFlVcdAgmSWzhmK7lUtg85ae3ee2OM1niK9C9c5KpX6FbcmQHWK/bogOjRALNYG1mUAmqZHCRhgMfJ7AG/1Kf2foxUPZmnAVbmlfjxliXIvWhDjk0+r6mbzL34TfCW1SACCHotXOxGa4+SMo0Vt10qoalnOH6oSFIhWZkStro3/tmpTq+WsQKRSoUNG7x4+Amw1rHScFDazZlOIEPPw6oDCeowpTjGfDaE/r7V5kXN2yt7klrU81KQKQXGXegH6P5kT5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPFC60125F65.namprd11.prod.outlook.com (2603:10b6:f:fc02::4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Mon, 2 Mar
 2026 08:43:57 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 08:43:57 +0000
Message-ID: <91727532-d899-40ad-a59f-2344e0f1d2ca@intel.com>
Date: Mon, 2 Mar 2026 10:43:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] i3c: mipi-i3c-hci: Fix handling of shared IRQs
 during early initialization
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-12-adrian.hunter@intel.com>
 <aaHJfRoutBmihGjR@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aaHJfRoutBmihGjR@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0171.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::17) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPFC60125F65:EE_
X-MS-Office365-Filtering-Correlation-Id: d12a97a2-4e45-4ada-b78a-08de7837d76a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: GHMchhlw+Nk8JzJgogPPUXDl3+x1eynEUclLnUeSZX5ZmisIpP4h1MA5ZRdWP+chQDS3bl4ImEPpCWHnUmebQJ72P2q9UYJprbj7vD1MVzpltGDZNYxE9RVxVJw/A7y/jV9JvwUENyXyFxe+0iHhTYaAe4pBoZUirCYizK177UQGC0MkBibGgmEeYNiRgmtegHOdUBbwbjWUCarMPQ/3lPKGPckB8kf5pJZX2RIpGdpw9FO8B2MRMQLeIydXmRTDQwG2PPokfMQYLTkYrm4lJKo63Qur5KEi6k6V0nkykz3FgxP0DqD3pw0PoEqj5PmEUoZtIAJizTCMLZzOvO+OtfvOQzZseAukuKycbUqwR5h0ycVploBffQuGf3mPiNz+qrtLxNkVaoEZdGSZ7uwrlLTzT6Kp7EVUImDhFbII/FbrNb7MeIl0rSt8/UzfZOjBlXp6kohVME8xZsHBMAgm0+8WWJMeROkVW+v4uzezUJWrk2eAm8s75/VRDzkumXrFYkCNDt5MIsGwSw1CH7ADa5KqFUyNK3bJOQ4byYK/RdyLZAG1USPzfFSDYXeEUSuubBS1dCeWrXhFTk7FCsbtR3M4/VmU/kx6Lpn7ucsIyYCZfSLtfYEyrx50miFXzFeGgi5fLFkJNoXIXY/6hZ6nztGSYm+Vi88+v8GXWrvmfQlr0sfMbioLcos68f19p4Vt9B/poTI/iV1Cp1aIbleOP3vkksqaXsj/bXXKZf7J7/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajVLN3MxaUl3MUp5SGlmUjFPVTZWdzdkZmszZmM4SjJ1S094NHphb3ZkbFhz?=
 =?utf-8?B?S2Q0Rm5QZzdqMUYyK1Ara01hN3VrcjdVNVVqV2R4akI4bVhkemRsSHNjU0M4?=
 =?utf-8?B?VTUvTHozeC8rNjlmZUpLeUQvOStFb3hWcWxpcXFtbEtseEQvZnZxR0kvdkIw?=
 =?utf-8?B?ZFMwNGE5bXRHdG9PQi9kZldCQ3NGZzZyNWxKd25teTRpcWt5Z2pQMElSNllJ?=
 =?utf-8?B?WmNlZ1FqZzRaZnhJeHJvLzBjSis1bE1ZVitMS2x0aTBiRVJQZkFFcVZGbGl2?=
 =?utf-8?B?OVlrYlJMR2pTMHc1VGdIVm1DYXowTkVpS1FsZndtLzh2VlhUbURWaURkWFdH?=
 =?utf-8?B?anMwTCtwbXZiOWNCVUxYMWRtck1LQ00rVUxMRnBYYVJQQXYwRXl5UGFkdDRN?=
 =?utf-8?B?TDFKb210TUVTVmxoQzh4RTBPdEZFNkd1WlRUTTVackJkQW8rcjBwT0NMeVBD?=
 =?utf-8?B?dVZyVVhRVmdDdkQzY2lCZVlicTl3VTU4eE5JODVjbjdKU1FYN1ZtWEZLVXJm?=
 =?utf-8?B?UEhzWkI0ZWw4NUp6aXE1ZmtpcDJTYkt6OFFQaVc5dklkcXFDbU5zOHZ6MDU2?=
 =?utf-8?B?RS9lTUduOWIxWTFkZlVocmVPT2E1SWtIZnhQbUdsMnZGYXZUNFNEbHdiZzhW?=
 =?utf-8?B?SlNhbVA3RlNtTEhRZnZMZWllL3c5WDIyNEtDWjRNNkoxVTdKRG4xVGI3N1du?=
 =?utf-8?B?L3N1MldiTVl2VnAwV3pyNkNUNUJWMmpwTGxTeG81bnlGb3h0eklDSkJYWDl2?=
 =?utf-8?B?amphcjZWVkVGOGE3NXlRcXlhUDZQMTNqdlNQaU1BT0ZtYXFUK0NmeS9KeGVn?=
 =?utf-8?B?STQ5WjRXZWVVTnZob0VUZHdqajJHTkxIdGRCdmNsaDQ0WnJtNjBoYmVTR3Fo?=
 =?utf-8?B?MnFieldZOWVidHUwbVRUQ2oxbi9VRzZPaytmcVp0SmZGc2xJUjlybjlPOHhi?=
 =?utf-8?B?SjYyRGVmeUJNQzZKTEova0xDOTJuUFJwUW52OU9MQk1ucWNqUHAxcWJOY294?=
 =?utf-8?B?UkNYcWMyVVc3KzVDQnRGQjcwRTVQT3RBaDNaVll2N1BrWE1VczM1dk5PWWkv?=
 =?utf-8?B?eVFEQXp6b3A2bURpNEppOWJETDg1c0pYWmFEZHdCWmhKdzZiTEd5MGNuUUVi?=
 =?utf-8?B?Y0xtdnE2OXpUb1Z5Qk0wWFdNZFZJUjFvcEcxQTR1WUtKVjdFZlpZWFh2bXZ0?=
 =?utf-8?B?VlgwdEU3MGV4MDYxcktDTTVIbGVNUVNGMmhwRHl5TlFnZm5WMzhZUHlIU2pZ?=
 =?utf-8?B?dCt4UmZJbEloenk5aXVtc1dQMDRFSTEycTAzNG0xaEE1dDRXVndDRUpwSWJy?=
 =?utf-8?B?Nm1tQ1JBQ0QxWjUvR3FoVEFzQXBmdERFWnl0QmdUMy9LOWc5L01OVzRLMzBW?=
 =?utf-8?B?azVxaTNlU1VOT2lyL1o3blkzNnFGdXkwNGt0R05LNTRLNkpVY2pJNlp6TzBY?=
 =?utf-8?B?MlhsQ2NLTTNPYzJOaFdlWnN6bkFEc0Z5bnJwTjVVR0lCMy95bU1MUGtQOTE4?=
 =?utf-8?B?amY1OEIwNG9RMHZZM1J4UkhxY2hsSUpnZndJMW5tZTM2UTVrMTFpdG5MU2JW?=
 =?utf-8?B?NVRwYkpwWDNjczVYRGNnbTRhZFJENld6b0dRUU1HUHBZekM3VnVja2pQNVpz?=
 =?utf-8?B?YVZIVFBpaEhQNE9EZlhSVVRxaEdKb3MvY0hSSW9BRHA1d3pqVnJ6SldubVFx?=
 =?utf-8?B?MWVvdlRFYlR5WHpzQXUvRkVia0lVL1I4enRaTmV0aWdUUDJQdUh3ZU1tR29Y?=
 =?utf-8?B?NGpZY0pkemdnWGZyZG0vbHBaci9Oc1BzcTBaM3FFUHZLNVZTUzRtU2VLTVFR?=
 =?utf-8?B?SFN6dkNmTElFUVhaWVpUQS9XaUhSMjJEZDUycm9nWCtaYlZkWDlRbEJIQmpx?=
 =?utf-8?B?ZWdBdXZqNmd0R1JuZ01rZHlka0dKbCtDbVYybGw1LzJjN3ozZ3BtMzBIemVJ?=
 =?utf-8?B?M00rdmFZek1yMXArc054VGdIM3k0UU1SR3VIZkxmZnJPRm84NWt0NzNEb1kv?=
 =?utf-8?B?WkZrdEhLWktIR1Q4YXhEdEFOQngwdjdzNExtajYxbnkwUnVKYTg4Z1J0Z2pi?=
 =?utf-8?B?ZTNJblRrVG5lQVFLeFl0cUo1ZC8vY3lxNVl3QVdwampuRFpWVWUzK1RsLzVn?=
 =?utf-8?B?Q1diOVJRL0VKTkdxemtBMkZDdWRhZHpYOHlsS211ZUVXaDlFdldWWVFteWxF?=
 =?utf-8?B?eWZPdTNZM2tubTJ4UTFGYzF4MHM3NS8rQWV2bXhKRnU3N2tMNHRLcEY4UVBB?=
 =?utf-8?B?b3V4WmN5cUlZUTJxOFVIenJ3M0VNODM5ZVFzcnBlYTlkSEdtWi8xVHJBQXJD?=
 =?utf-8?B?d1JSNXJaRXJyZ29GR2lndFJPNXl5TFUvR0VsbFpldm5aaFQ5bHhWdlhZcGNX?=
 =?utf-8?Q?Kmcxd3TmpslItcvY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d12a97a2-4e45-4ada-b78a-08de7837d76a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:43:56.7935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gf8HbXOhw2RicQWa/xch8iY77ENGhVFVAVOvaoaJNR6G9aGS30mTJVwkz9faDIfv18cdPhhTQ/Ebdi+DZrItg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC60125F65
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_004359_868696_9ED3AD8E 
X-CRM114-Status: GOOD (  21.53  )
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

On 27/02/2026 18:42, Frank Li wrote:
> On Fri, Feb 27, 2026 at 04:11:48PM +0200, Adrian Hunter wrote:
>> Shared interrupts may fire unexpectedly, including during periods when the
>> controller is not yet fully initialized. Commit b9a15012a1452
>> ("i3c: mipi-i3c-hci: Add optional Runtime PM support") addressed this issue
>> for the runtime-suspended state, but the same problem can also occur before
>> the bus is enabled for the first time.
>>
>> Ensure the IRQ handler ignores interrupts until initialization is complete
>> by making consistent use of the existing irq_inactive flag.  The flag is
>> now set to false immediately before enabling the bus.
>>
>> To enforce correct ordering around transitions of irq_inactive, add
>> explicit memory barriers: place smp_wmb() before updates that clear or set
>> the flag, and add a corresponding smp_rmb() after testing it in the IRQ
>> handler.  While kernel I/O accessors already provide ordering guarantees in
>> practice, adding explicit barriers makes the intent unambiguous and correct
>> on all architectures.
>>
>> Fixes: b8460480f62e1 ("i3c: mipi-i3c-hci: Allow for Multi-Bus Instances")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master/mipi-i3c-hci/core.c | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>> index 741f543aae68..2909e3d35d8b 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>> @@ -152,6 +152,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
>>  	if (hci->quirks & HCI_QUIRK_RESP_BUF_THLD)
>>  		amd_set_resp_buf_thld(hci);
>>
>> +	/* Ensure changes are visible to interrupt handler */
>> +	smp_wmb();
>> +	hci->irq_inactive = false;
>> +
> 
> I think you should use atomic_t, which already consider barry.

No, atomic operations do not provided barriers by default.
This is very much about ordering.  Making sure memory changes
will also be seen by another CPU when it sees irq_inactive = false

> 
> Frank
>>  	/* Enable bus with Hot-Join disabled */
>>  	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
>>  	dev_dbg(&hci->master.dev, "HC_CONTROL = %#x", reg_read(HC_CONTROL));
>> @@ -184,6 +188,8 @@ void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
>>  	int irq = platform_get_irq(pdev, 0);
>>
>>  	reg_write(INTR_SIGNAL_ENABLE, 0x0);
>> +	/* Ensure changes are visible to interrupt handler */
>> +	smp_wmb();
>>  	hci->irq_inactive = true;
>>  	synchronize_irq(irq);
>>  }
>> @@ -592,6 +598,8 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>>  	 */
>>  	if (hci->irq_inactive)
>>  		return IRQ_NONE;
>> +	/* Ensure irq_inactive is read first */
>> +	smp_rmb();
>>
>>  	val = reg_read(INTR_STATUS);
>>  	reg_write(INTR_STATUS, val);
>> @@ -779,10 +787,12 @@ static int i3c_hci_runtime_resume(struct device *dev)
>>
>>  	mipi_i3c_hci_dat_v1.restore(hci);
>>
>> -	hci->irq_inactive = false;
>> -
>>  	hci->io->resume(hci);
>>
>> +	/* Ensure changes are visible to interrupt handler */
>> +	smp_wmb();
>> +	hci->irq_inactive = false;
>> +
>>  	/* Enable bus with Hot-Join disabled */
>>  	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
>>
>> @@ -970,6 +980,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>
>> +	hci->irq_inactive = true;
>> +
>>  	irq = platform_get_irq(pdev, 0);
>>  	ret = devm_request_irq(&pdev->dev, irq, i3c_hci_irq_handler,
>>  			       IRQF_SHARED, NULL, hci);
>> --
>> 2.51.0
>>
>>
>> --
>> linux-i3c mailing list
>> linux-i3c@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-i3c


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
