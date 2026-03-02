Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F293D58E7D
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Mar 2026 08:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gpP5O9TpesMjUNDLR5rMrMIUIOSN8Z5mVMDgKMiCrbk=; b=bCOBt8FZPHTj24MoGPoednwudK
	/V2EYKCP5XRjB0JVip/HpvtmdrSLt+NPgXq1ZbZgCUvjFDymTG0QEFVdHt7CrjuWhkl739kK4r+6L
	riRKSCU6VnVPOVJXy+pWZ20Qa7WZWR9z0D3vaBzm7yZrXTMTfGNbwQ5IOvyHm466V1KI+wO1+NoRJ
	BT8jD0xjGOJztnKTLw/hWC9dm9xyLLoY/TtIg0UsmkL87153BtG678YIPX2uo7hZeRSSx0ioseero
	Qm6C/gXCAdGkySHqB2S1LFDx8pjdefZQwfVD3bNYBGM2n3WrlFlWurByASXp4c2LqJITI9Mrk7wQ2
	1roiGahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyrW-0000000CXHV-0gGx;
	Mon, 02 Mar 2026 08:42:46 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyrS-0000000CXF8-3Z3d
	for linux-i3c@lists.infradead.org;
	Mon, 02 Mar 2026 08:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772440963; x=1803976963;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gMln8kgvkoabdmeW/ViEsoKVL6XRTXYy/yCooZy2s+M=;
  b=kYKUG/8mrCCUtBFblvDHvgfa1hAKDQOeqnFYv5qPUfYTax3j8+4DiGZC
   FXxhGo4xu2F5i9drkRYDJIyPQWGkdQe2GZatvvIJrOwKtoDe5bQ44xG7C
   9EI3Cd0Zd06HTpJP81EHXxdDc+dfXp9SokuMA4QI9lPQTekS5TzeHEgzZ
   VHfvPhxoajgIApx8HQR1/rOm2LMhdFiIwd8I2iKFPb225yv8SzAiZaxoz
   ugAYx6fUJ31J1Dr4Bpp3rIMDJVy+AAAKZKFethjW0A/nZVIXf3MvjndU5
   1cObNVjvTN/k8tA5NwVEYVP10oc+Rquji83rT4Wx0y/gmXwbFYzc/ybP3
   g==;
X-CSE-ConnectionGUID: NBf8pmepRMiBThrmm3GP+A==
X-CSE-MsgGUID: NlSa3iJmTRuFKVpgokpiyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="61012664"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="61012664"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:42:41 -0800
X-CSE-ConnectionGUID: 7/cfHBkoQWmlfMqxjlTCtQ==
X-CSE-MsgGUID: YOjYU9f7TQ62HcqaS/KeLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="222082354"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:42:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 00:42:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 00:42:40 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 00:42:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auTHDTRV0R/NW/2GTNfFwvf60U8UDajMOmYagwBgYMRYOkWe5DsPEjWT1sRaF2TVltc5KhsuqUKvKrXqec3bAKsAgmhBWYbg6Vg4Tq4pxHJT5CwkzmbBkcBETC9v3BpqrbTjwbs7L/K7A8NrL0zI+G9PmHN35cy6UiGMSTxFLpf7bzLVUfgvtk8F/ZE3Mvl7yBL1qUhVTdma8nxRjRZXfYBJWkT45eHC1SzUW7o7p4OFXFhqoZCcIRyG5w4oA8V2MffYv9EaEe4A82Dq+Jkh/eiuhRmN/3UMdjw+VT6vc4Mt9kk57Mdr9vtBoZZENQ6IIGLaJlVVQ7mYoqefbwePbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oKbTALX9lMyqWQy4p7N6AON/jlMB7sUSoPzsKOT0HI=;
 b=BHAD79hh46+sXmYsXFO/dNVAIo5wWQ8sVnpYh6uN7Chc8kLL5JEN3wLmFjV7H0WzFNyFYYQBaCCfYvzIOD5kkolmN3Au8XBiVJUx3zo4RrVB7t0noHT+4IoSZwJRRMSGQ6c7y6igB2ReKgWUyvWAhEt2mdy6kZ9JuKSwlPwe9AEYd0JK4caZsN4zV4fy3Oyli50Jn8SLF1EVHHchQcoIWiLxA3am3hwaZnshu2PNSbUB/aBCPSDOP3Wa1nw4/hIa5JtvVDx58UzhVYM31TnITJF5XdTNoogdRNTqMe2VP3AG2Il3LXHi/X2MSo/HFBnTYcWSXquY7sO3+662nVRXtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPFC60125F65.namprd11.prod.outlook.com (2603:10b6:f:fc02::4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Mon, 2 Mar
 2026 08:42:38 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 08:42:38 +0000
Message-ID: <626942e0-0bcc-4ca7-a69c-d1e3ef7dc6aa@intel.com>
Date: Mon, 2 Mar 2026 10:42:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] i3c: mipi-i3c-hci: Fix Hot-Join NACK
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-3-adrian.hunter@intel.com>
 <aaHATkkm-4WThkHe@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aaHATkkm-4WThkHe@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU7P191CA0027.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::29) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPFC60125F65:EE_
X-MS-Office365-Filtering-Correlation-Id: 9607d333-b21c-441d-1399-08de7837a8c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: VdDNVqcgeDoAU42b215WqpyCHG1qXFp81bEjKemhylMSG7mX2nwwg1CJY7TacckVH4FWSdelFZW8iYVlUAJGNjw7m9w/gL9yUBF3zUQVcXF6xYqfndipTfXwyWsr175dEIgTTS/QDTJLeQ5NvHJK9Q8tSAfaQ8JjRSq3iSJnUjA3KA25lJkSvat4www4TvMAH0jegh8cpNdjM3DAOO/NVKAlQcU+/xuf6qzyVqQizHh71fjOmw0FvKmCWnJj8U27HVp+miTdJz3qPPb9h4c5ep4vEPjjwNThhiC20cplkWJ63Vx718cLP1+dak0tE+1Hz/PzwVm/94nCRrzB3x/Nj2mskvIU1PA6q5fZ9BoI977leg9poz4ss72dRGgwOyI/WSNgUionpkHaVlbVWfgecOzq12MppN8TdQsknO0rff1iWD1D6XTVNbY6aLNQzZzR3XNDCBCPuNYZ//1Y21HdF/RI2NBI39HfV76cIHoucVcoq4rxwfPUfP21mKdDU6XoP4RqBj+mjAu+wzpNdgEGmB2iKTIaO/LRTo3FaeDusT1iDT2Ny+pF9QC5K5jzkUu/ZccPjk6AsuVu+BwVFdASh3YIaz5NS/yZrihaLfVdRhOpHj3jRIUVfnU+kVB8v0y/OI1JFcrpWk1nxvWUOSRyYeXhqrzT0ygzNXYEqsd/HHNnY8kgPDWpgwvkj3CpXrnmOZ5iNvU9zl3SkimI+lA91/FgN5d5XKyyZZd8mL3MSuA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVNUS2w2d1hXQlhBMndRaXlrS2pwSGlaYWVpMnlqenk2djR1Sk5sUW9mb2VS?=
 =?utf-8?B?UFhxSUJ0b3ppTVE4NXdnSW01c21jay9YUEdsLzdVU2dGSmR0N0RnQWNoMDNF?=
 =?utf-8?B?cHRoeWhIT0ZLTXowRFdKT0F0RzRkQUxVandKcnFHRDVpVDAyT0FLOTdiM05S?=
 =?utf-8?B?cTUyNWd3RnZWMVZWUmd1UFh4Q1BSQlQwODUvOXplR2ZVS2d0MUQybitBMmhp?=
 =?utf-8?B?TC9vbUNhcDd4eVBLYzcyNnF5dm54WHdhdEdpV21RTVdvSGhMa1ZWLzFCQUxZ?=
 =?utf-8?B?MnV4a0NVejg4TVVkcVI0Y2Vyck1XZHBoWDRueFlpQ0J2RkdQakVoZ3RXMW5F?=
 =?utf-8?B?TTRCYTZWTmFxUnJ4cnVCRWdRRFV3UkdEbEpNZnV6LzdNRUNQeGpiSjlwNHpj?=
 =?utf-8?B?ZHNPdERxSlo5UTkxcWNEUEs2WVkyWXd2QlhHQlM1ZFpwNWNNQU52UVRXdVlX?=
 =?utf-8?B?bVREMEpHK2RKUVUxNkpNZitTMEJuODBUa3RpcUwxcHp1bnEzOTgvNU1OMTh5?=
 =?utf-8?B?VkdWOHl4SFFUMmZ0enA4UE5hUjRGeGhlWG1vMFNjd2l4OVJ4cGk5V1N1TUY0?=
 =?utf-8?B?SUFtQ2pPWU1wVmlZOG9WSWhoQVd2SHU0NUlmTUoxUGZNTEp4SnFuT0JIN1Y0?=
 =?utf-8?B?MFNRZUZPU0JoYWRkSGdTa1JpemxRL3RGc2dKbXgyWisvWFNTb0JMeUNuYkp1?=
 =?utf-8?B?TkdvcTlJVDdhTkwvY25uRkMwcnVsVm1Qa1pOaTJDSTNIa2xKbWp0NU1EK2lJ?=
 =?utf-8?B?UVRNUXRZRHl2dHFSNWxaYlJYdVlqRGp1cWQ0ZFRTU3U4VXhaTjVBT0o3SUtq?=
 =?utf-8?B?cXFpWm5HVWVMbU5URklvb2NPU0xtZ2c3VUF5aWhoRWV2bEVkU0VIV0RvekZ3?=
 =?utf-8?B?ejBtYVdBajRESXAycFJGZk8xcXM1RGIwd0JRa053U3ZpaVlYSFFkeEJqbHNG?=
 =?utf-8?B?bWNIRlU1aFRqRDlTUHFpZWxzaEJod2YzM0tIL3VzQ0swbjdWN0NOcDVwTjNJ?=
 =?utf-8?B?dnhiWXlKTmdWV3I4ZWpNcHNQNXJsNTd4SXFxVjlobzN0MkI0dkxWT0NNakVt?=
 =?utf-8?B?MW45QmdjcWNuc0JlR3k5V1JHemRnQ1ppbit6N0RnZE5jZU41Y3g1V0RiMitF?=
 =?utf-8?B?MWZhSWNxUll5N3p6d0orSHp3bHRpeTdRQ0tnOTlaeUhKdm5aWS92UXcreDhU?=
 =?utf-8?B?eG1mZGQrRzYvNUpOYTBDT0wxR3d0M2xEdVlmOHhNSU5yZGJ5VkpWREx5bkxK?=
 =?utf-8?B?K2NSK1QrT1VibGt6Zi9sYlRBRmkreVYzajkxSzg3Y29MOFhmTVZ1WS9tYTNk?=
 =?utf-8?B?OC8yWFhHVnVNejR4QXBBSy9ZTm1HcmZuTEJ0c2VVNnpaT0tJbTBBWVZmTXFM?=
 =?utf-8?B?alg2Z0hlTWR1NVYvbmZsanorTzBHazdBK3FqTlI3Tk9RamJ1YmJiZzQ2SktS?=
 =?utf-8?B?VGE1VERTYUFwZHFKTTJpU3RtY3RHTXBZdDBqVnRyb283WEZlQmp2S2I0WFdC?=
 =?utf-8?B?UGY4Q2RMUURTSHYrM0FnaG1ZWXV3R0tLVTBOVmNoTTFaa3hXT1JzRkYrYTZn?=
 =?utf-8?B?NGVERlpLcVAzMklsZ0JjWWtHUHY5WmVvd0xML1FqWWNYZzAyZzdPamlBem5Y?=
 =?utf-8?B?ZHZKWkNzZWd5RjR5VjZ2ZHIyRGJpTVM4TkRYV3lBa1lFbGRjZG1HZGIvNG0x?=
 =?utf-8?B?bXc4TVBtRXJ2YlU2UVRtMHFJSzNUemVtWnl1b2RZTWY3MHNRTi9BTFk3MEpy?=
 =?utf-8?B?RFlxa0RJejFVOHg5ZjVWNEsrSkt3MU9JRDlQbndpQTcybWU0ZDF3dW5aQVlE?=
 =?utf-8?B?dzNRTFU1b2N3dTJkZDZSNkprTE1wUDFzd3RhcEtRU1RsZThVMnZ2RlpON1J3?=
 =?utf-8?B?OWs4TmE2RFdENWZ4MGxGbHAvbFpKNjBBTFYyRnJONVN2cy96LzVabmJpOVZz?=
 =?utf-8?B?VUZ4eEtDSEdRZkZNN3NhNWh1ZU5GWkJISHphZXFlbUd4bmlCYWZYczJrYWkw?=
 =?utf-8?B?OVhZMThVWlVFN3UrNFYrT09PeHE0Y29CSHpDS3YyWFRxbTJXK3JPMEdsOXRy?=
 =?utf-8?B?N1IySlg0NkV3K2wrdU9zdHkzMzZaQ2hpZ2dmaXlKOFV4UEVCV0tVVFptbUcv?=
 =?utf-8?B?d0tGRE5mYVNVWnRwOWZ5Y2hxbjFBenhESmlhRUE0QjNGL29rYStmV0NvaXRB?=
 =?utf-8?B?bVNvdlFTY2lXL085WDFQZUNlRW9CZEU2aTlZa1UxQ2FaZndyNEVadDVqZjQr?=
 =?utf-8?B?QWtOMjc5eEV2R0xEYy9qVWJiSFBzeGc3WkpFQzQ4UTl0Wlg5TlRqWmJFb0JH?=
 =?utf-8?B?dzNFOG9mNko0REpOWGlWU1E2ZHFJb3JzQm1JSVY1ekZDZ29zMXc3S3VaaGVq?=
 =?utf-8?Q?HfkXlv/1srbKzj3E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9607d333-b21c-441d-1399-08de7837a8c4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:42:38.6328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J40wtnLuHXqQrM8XyEiBHa+GV86zkwNac3pZPwDiouHoxMTZUtoiVyEj94yhBEN6iw7JlnwBKdabwVgKRzfYZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC60125F65
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_004242_912557_55B28FDF 
X-CRM114-Status: GOOD (  14.26  )
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

T24gMjcvMDIvMjAyNiAxODowMywgRnJhbmsgTGkgd3JvdGU6Cj4gT24gRnJpLCBGZWIgMjcsIDIw
MjYgYXQgMDQ6MTE6MzlQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3cm90ZToKPj4gVGhlIE1JUEkg
STNDIEhDSSBob3N0IGNvbnRyb2xsZXIgZHJpdmVyIGRvZXMgbm90IGltcGxlbWVudCBIb3QtSm9p
bgo+PiBoYW5kbGluZywgeWV0IEhvdC1Kb2luIHJlc3BvbnNlIGNvbnRyb2wgZGVmYXVsdHMgdG8g
YWxsb3dpbmcgZGV2aWNlcyB0bwo+PiBIb3TigJFKb2luIHRoZSBidXMuICBDb25maWd1cmUgSENf
Q09OVFJPTF9IT1RfSk9JTl9DVFJMIHRvIE5BQ0sgYWxsIEhvdOKAkUpvaW4KPj4gYXR0ZW1wdHMu
Cj4+Cj4+IEZpeGVzOiA5YWQ5YTUyY2NlMjgyICgiaTNjL21hc3RlcjogaW50cm9kdWNlIHRoZSBt
aXBpLWkzYy1oY2kgZHJpdmVyIikKPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4gU2ln
bmVkLW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+Cj4+IC0t
LQo+PiAgZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgfCA2ICsrKystLQo+
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIGIvZHJp
dmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPj4gaW5kZXggZGJlOTNkZjBjNzBl
Li40ODc3YTMyMWVkZjkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkz
Yy1oY2kvY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29y
ZS5jCj4+IEBAIC0xNTIsNyArMTUyLDggQEAgc3RhdGljIGludCBpM2NfaGNpX2J1c19pbml0KHN0
cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0pCj4+ICAJaWYgKGhjaS0+cXVpcmtzICYgSENJ
X1FVSVJLX1JFU1BfQlVGX1RITEQpCj4+ICAJCWFtZF9zZXRfcmVzcF9idWZfdGhsZChoY2kpOwo+
Pgo+PiAtCXJlZ19zZXQoSENfQ09OVFJPTCwgSENfQ09OVFJPTF9CVVNfRU5BQkxFKTsKPj4gKwkv
KiBFbmFibGUgYnVzIHdpdGggSG90LUpvaW4gZGlzYWJsZWQgKi8KPj4gKwlyZWdfc2V0KEhDX0NP
TlRST0wsIEhDX0NPTlRST0xfQlVTX0VOQUJMRSB8IEhDX0NPTlRST0xfSE9UX0pPSU5fQ1RSTCk7
Cj4gCj4gQ2FuIHlvdSBjaGVjayB2YXJpYmxlIG1hc3Rlci0+aG90am9pbj8gc28gbmVlZG4ndCBj
aGFuZ2UgaXQgd2hlbiBhbmFibGUgSEoKPiBpbiBmdXR1cmU/CgpUaGlzIGlzIHRoZSBzaW1wbGVz
dCBidWctZml4LiAgVGhlcmUgaXMgbm8gbmVlZCB0byBjb25zaWRlciBmdXR1cmUKc3VwcG9ydCBi
ZWNhdXNlIGFueXRoaW5nIG5lZWRlZCBjYW4gYmUgZG9uZSB0aGVuLgoKPiAKPiBGcmFuawo+IAo+
PiAgCWRldl9kYmcoJmhjaS0+bWFzdGVyLmRldiwgIkhDX0NPTlRST0wgPSAlI3giLCByZWdfcmVh
ZChIQ19DT05UUk9MKSk7Cj4+Cj4+ICAJcmV0dXJuIDA7Cj4+IEBAIC03NjQsNyArNzY1LDggQEAg
c3RhdGljIGludCBpM2NfaGNpX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPj4K
Pj4gIAloY2ktPmlvLT5yZXN1bWUoaGNpKTsKPj4KPj4gLQlyZWdfc2V0KEhDX0NPTlRST0wsIEhD
X0NPTlRST0xfQlVTX0VOQUJMRSk7Cj4+ICsJLyogRW5hYmxlIGJ1cyB3aXRoIEhvdC1Kb2luIGRp
c2FibGVkICovCj4+ICsJcmVnX3NldChIQ19DT05UUk9MLCBIQ19DT05UUk9MX0JVU19FTkFCTEUg
fCBIQ19DT05UUk9MX0hPVF9KT0lOX0NUUkwpOwo+Pgo+PiAgCXJldHVybiAwOwo+PiAgfQo+PiAt
LQo+PiAyLjUxLjAKPj4KPj4KPj4gLS0KPj4gbGludXgtaTNjIG1haWxpbmcgbGlzdAo+PiBsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
