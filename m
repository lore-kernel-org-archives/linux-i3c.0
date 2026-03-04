Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32908EFCE2A
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Mar 2026 18:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zQfGwhRKiU8jcnJ7fCilymN/DgT64gfRHfpHOc+88zo=; b=t7TXt4Zzu+RKacGxH1mfX1K77J
	xMUb7H1uzdfDiN+Qsc/ooRaMdhToABSSBBeQWPk7M83kWA5y1OR3gVLxlFFk+a5VOZoW3NOgHEoat
	eq8mCXXzhs6Zp0DJ4It9RjNSxVOlXLU1ecyEA+gWDrlR7f4gML/+n4jSAtYF1y+169+jr4zyfmL5q
	P8ssTCfWIM/Ewoss85yvZtZS4IyxZpL+/CqyiDKzjU6yCCIuuIr/KLooQaJXbQCLAlPBqt2rYSkXJ
	FdQs8iYj7cEOoPnMwInNqeL7hhUoKA7J9b7PTPJs0tGtmNYOoAeDmTix5bBJMaEAJ1QSynnp+IHpe
	es4Poh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqix-00000000JpQ-3tDV;
	Wed, 04 Mar 2026 18:13:31 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqit-00000000Jos-3qMO
	for linux-i3c@lists.infradead.org;
	Wed, 04 Mar 2026 18:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772648008; x=1804184008;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h+qz+oWw+K3laABZw5dSN8N6KUe2lyHsKqt7nvbN2t8=;
  b=f/MVCm1pe2EC7f/9FnuCKpvAgW1CTGEcQD0Xx9hCV4jlmkgV4C7sbhOj
   Chrk2faBgxj4YTmtCNaUgb37gja9fnbwZDBGEHbzc2YvzzHPUzXIP4jOw
   7xGIZXRLlMYMBnWVN4TSzCeld6jMdoJLFS2eDfCY0TgQyEiygqU7HchzV
   VK81xRyQjuxmqklufc1Wj7bhZNBA0iKVyWxp3YxDqs5OmvFOoCrgHZXJA
   qA65E3MJigyLw2bgL2tWRIVB9l6crShpdmUtMCvE24Cpe7rMmOd/+TTYK
   IDM3kk8XShdRKmb/J9GdRzJzZg/CH99nBT6s0BCWOXeiNV7Cd0wD5zi+Z
   A==;
X-CSE-ConnectionGUID: dcZqF6BGQ3Czi9hTvz9M2w==
X-CSE-MsgGUID: HWCEYRg1QAKATglpVAtFGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91108881"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="91108881"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:13:27 -0800
X-CSE-ConnectionGUID: OWMwylXVQReKWz1DffnYMQ==
X-CSE-MsgGUID: fiH3ixILQf+kyRqFp8HPMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="221359155"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:13:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 10:13:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 10:13:26 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 10:13:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q69Xvt0fsfVvEm4GnntL5EAwwXS4QLT32wxRDr2zQVJV2/QxYb34QcmEFHj8lzfobbaCJv1Np2pMV0DUntjDrdsQK0hTpJFOq+i/8lrSim8NictAfzBs/NZYkKF0knQcQOXj3UhT8j6FeUGuYZPBvNDPkQPZrfUAH9RWUtksJPZcjKS+Z4s+gKx/PDBbkaD5tDRDrZyjoHVryeY6DW1/xSK2jTelFESQDArlphTXsz0Z6bH6DU54XF0oaCtvsb+aNqrpxwI9FkyAkurqKHC+3bVXS9B1LQNldUCxgioCe2QR4sUQCn//XFI5KYgznHuJUmlpUop3n7oEi0KaC/cCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FpzUPfZwRPfuKYy7ks0AO35Nw2wtmzxFU9S0odMayQ=;
 b=TfiFfwbS+wkKR8G3yMRjBoQ+bJFUM/B4FlRlsf0uPeS+YLOmVE0FUYwKfWpm+aKsUhqIMjbauQbaSESwJ38MOYafYwk0sL2kSu3xWm3vZBm0U0qpvy6AUaZ/AWZ07ck93oclN8uS5sIqR/njDX7Yin7wz3W9WIhJo7IovVBcd7L6ZAEdJwGnW5TAZsH7yNv1CtZQhSdqLcB4y08Cih5wVTlbsHQ6VWOoUWy7nOduZtfni93Vlqo7p/F41erQd50jJsxOJddoYdXsv6BdSLKythWm2vT9cTmdc/TlpEuFCOiSSv6dCokwU9kXyLYgOqPFuugKear7TJIp16bjgP2vcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB7052.namprd11.prod.outlook.com (2603:10b6:510:20f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 18:13:20 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:13:19 +0000
Message-ID: <f86a088d-b11c-441d-9436-96f3f1cddd6c@intel.com>
Date: Wed, 4 Mar 2026 20:13:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] i3c: mipi-i3c-hci: Fix handling of shared IRQs
 during early initialization
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-12-adrian.hunter@intel.com>
 <aaHJfRoutBmihGjR@lizhi-Precision-Tower-5810>
 <91727532-d899-40ad-a59f-2344e0f1d2ca@intel.com>
 <aaXiokObGlvMzI_o@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aaXiokObGlvMzI_o@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0085.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::17) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB7052:EE_
X-MS-Office365-Filtering-Correlation-Id: 307ee839-67c8-44d4-84ce-08de7a19b6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: YVO16/FwSMAqF16BUEKAS3G/hwBTSo1BbFeXgt0ab4IbehlkuVIIWKQ0sXmE7WmQ3Yk9xZyjDLVXvAu186SPVEr5tBeYCBxtgK8LDp4wj4xBrOg8Ubu3HXrGNdx9dR4QKQau5sw07rigndajkIruFnvFxAhQGC8n2WKl4j/AmDuLgXoa4DL/B3le7dHFUj7J6PpoyoU30Brj6C+atarS7pLpQxouUd956xojUTIkK/gLUGLuHJIFSdIapzrNzs9X6nAfs+5hIHd2U2SOvsyXDvCtZKC9nymh9OP6zcnwdBekUlynsE8E/hc3tt3vBZs1bGpcptqqlpZpxAvgIIX3mYrrIEV1l5fPQ+2udNyS3I1b52tPx1N1QCfvYVc+haV/+7vpIb4CwhzvNduhEuniOzPALiqd1EmlB9ZRYWrRmC90NzNletTWcqrItySH9g2hzEfH558LL0s2y2W0KtN8Y2bJbJLN74fCzYweHiU1ZLme7aixI9iBFHRLqe1nScNlO5pmSJRaOZS4emL80nkEIbFPVzDCg3K2BOtbGfHQny5Gc/3X2182aKj/YkdatB1kJO5zB3p2vc3Qo9kBkTXhpV1HnNsbMqudsY5gjoR4sbLi04XbEKZzjy85w53aMMOQl3ZGh6/tMsRlQ2REOMESwSLYAsgIgUlgYq+w7DQ9wNBCkcH8oxeCrpNsjhTk2lfh/qTuF1qB96TMi+rTN0QG+KQRyW5ALP+BiE27ki09CPw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXAzOURZZWNWUXFIb3c2d0NLeHltZU9oT3lTcUYzZDc5cUh1enVadVZRR3RW?=
 =?utf-8?B?ZklpUWZrVS9MSDczYUw4c0l2Rms4Qm5NNjNkRjA0N3ZOOVNrd1FXMGdLdnUx?=
 =?utf-8?B?M3FJRFowUFV6eTlrd0dMMFdwQ3ZaU0tQN0ZoTS82dlNEdU9yWnhsa1g5eU1E?=
 =?utf-8?B?cmxLUTFodGxnL0F5UjV6L3ErZjN6TytzVlBkWGhVVFQvZGlMUmZMVGQzU3lS?=
 =?utf-8?B?Y1AzWkNhdzR6cVdrM0MvaytlbFpPVzRQYXBpWGJHNnE3YjQ3SFFENnAwNDYy?=
 =?utf-8?B?Q1ZVMEt5WkxkNlY1cCtLT2htSVN6WDd6ZUx5Z3VJK25Da01LdkRFRnVSOXBi?=
 =?utf-8?B?YU5nTmZyNGRZSGJsdEdqdmhoc0pScS82YTVBNnl2QjdlQ0RGcFlBWU8yQjhK?=
 =?utf-8?B?a0RVN1daQzdQekhwM05zZGN6Y29lUjZVVXhmSEpHTDhKUUNhRTI5VFFQYlBR?=
 =?utf-8?B?T2hHZ21RWTUxV052bWZGOTZXTDN1TTkyK0ZOSmp4L1Y1NlZCcWRLckFEK0Qv?=
 =?utf-8?B?ZkovM3kwRHVMbkY5UnlsbVNyMEY1VWhSRkFyQ2diNDJOZFVDckF6bEpXNElP?=
 =?utf-8?B?ek8ybkF3K0FqSktTcm50T1JxS0ludEszbzA5T2pvSzVIWmhaMVY2bXkyZkFw?=
 =?utf-8?B?aVN4KytjLzlxVUYzRDQ0ZWFIaXNJTThvbTNXZ1A2OGlnSGtUZ0RkZEplbkNq?=
 =?utf-8?B?VlhjMXIwR0hsZWpqWWNjUnZkTFI5N1lIQnJaSEJoY2xlRGVkOU9JYWRwM2RL?=
 =?utf-8?B?MElPbFc3WFArOVhZVlU2Z1A5OGFRRTBPOE9nVlhZeXhiazBJNWhibnlyM0Uw?=
 =?utf-8?B?Y1pxZ3NVSUhsMDVHUHdEMnVmZmd5QXZsTzhRVUlHeXF5SGJ5UUdOazdzeHJr?=
 =?utf-8?B?S2ZTZ21OT3ltZGJHVjhwSlI4eCtxeEZLMXBMaXdEbzBLRi94bUVubmsvQXRF?=
 =?utf-8?B?blpzcUxnL0p5SU1Dbys2VHphMmoxbDNNSDk4bzRlZmFnaVpCV2o5OFRrNEMz?=
 =?utf-8?B?TXRGNWR1d0JvN0ZVdW1XczlOVXBBQ1FJQWxzTzA0ejlwdVhBN1FGaElWN0xO?=
 =?utf-8?B?dFBDd2xmUjRzL2J0aHRycDR3V1lOV0YxYmhKYkl6Mm42Y1UvaXBweCtmMnYz?=
 =?utf-8?B?U3lNb3lXbEFMV0FxVFJER3VhNUxsSFM2Rnk4RWxucnlRQ3UxUUtlUVlyR2tT?=
 =?utf-8?B?Zzl2cUJFVlF2QTI5RFBubk1OMkN2M2Q4T2hlbU0wN2dHN2VFNXdacW5ONUFU?=
 =?utf-8?B?ck1jNXVRUHlNVlZBM1NlSlEzWHdwS0RsdkloOEQ2MUxkd1pvN3RPdE5ZMy9P?=
 =?utf-8?B?dEFhU1dEd3VlQzAyR3Qwb2MyTW9kUThyL2N5RWdnVWFWTEwrRWdIMDJuOUV3?=
 =?utf-8?B?TEdkT2FoeGJNaXhmeGtpZkd1Tms3TFNxcFFFOU56NmJzZUE3YUplUG8wcTZZ?=
 =?utf-8?B?YVdTd0hjTUxneTFWYWRsemVhazhOdzZ3bWlVem5GTGphcDF0ZUVaaVIyTlF3?=
 =?utf-8?B?MmZDNFh1QWxTS1BWUXFSU1VLbjJIVGNFK1plTmF5dHZkM1Y2NTZBK3FzNWdO?=
 =?utf-8?B?Y0h5M0QzMng0TEFiNVNKNHNyQUJndVNnY0NUL2FreHJMVzdkak1LUU5JQXk0?=
 =?utf-8?B?M0lPenZmZmxwYTBPOUxhOEprQWxwTVNiTk8vcUQ0ejAvV3hTREY5MWovZzVk?=
 =?utf-8?B?MnJ3KzhZOUU2b001TDZVcmpFQ3R2ckFEZ0xZNWQvdURSV0ttOVdtUk9DM2Vj?=
 =?utf-8?B?RGtKdXhwZHlGWjNXaDZqWHVDN21wOWJqVWp4TnY0VGhnRGdjQThObGo1ZmJo?=
 =?utf-8?B?UUlrR2hzcUtQTFBNc1lWOWZBOU1CM2NmamViRFVibHd1NjcyREV4aFQybHp4?=
 =?utf-8?B?STk1LzN0QUNqTFRwdEFGSkptdFAwNURHYTVmbjEzd0RYbzA2cmx1RTcva0JF?=
 =?utf-8?B?ekt0RnlTMmZDaGJ4SVFhaUNYbjJ5OXJKT053bDRYWXF5QjNWN2lJZDZUWFpM?=
 =?utf-8?B?Z2F6bTRMNlBjTWZzU09EVFFncGJuYjNudXc0emlJTytVYUpmR2FKRnhnRjF4?=
 =?utf-8?B?SW9ZYWRQeG9RVWtoZGJodXVsUHVPRkE0cjhwSERXOC9YbmlJSVVnbTBMUFZ5?=
 =?utf-8?B?QTNtTUlTNEtMM3lTZlNZVk5hMHZtZXpBL09qeitYKzMzZnp3T2lOV1VRVWc1?=
 =?utf-8?B?ZEJPcVRZNFcxYk1mY2hGOFF5cVRWL0R5Nnh1d3ZYMUxGcGQ1MjJUaThOcFZm?=
 =?utf-8?B?UjlnaklFTkRBNDNVemIxN3cwQ0VGU1Qvbjllc1NWSUVtbjk3WkZleE5XYmxO?=
 =?utf-8?B?UXFwVFlDMkU3ZXJ4cHBrcitoNzZvYkRFaHJkZ3czOGtyUEpVcUlYMGZkNEpo?=
 =?utf-8?Q?q21RChvbzIx+JPoI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 307ee839-67c8-44d4-84ce-08de7a19b6fc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:13:19.8493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFgxgQ0L/TREk7JlFUHBminLzE4L1XN3xytKeCKZ2z+9Nvr4+P7RRD/EtoMIYIbT4fk5g2ql4iTZEgD7vH10yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7052
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101328_055371_9A8FE208 
X-CRM114-Status: GOOD (  28.10  )
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

On 02/03/2026 21:18, Frank Li wrote:
> On Mon, Mar 02, 2026 at 10:43:53AM +0200, Adrian Hunter wrote:
>> On 27/02/2026 18:42, Frank Li wrote:
>>> On Fri, Feb 27, 2026 at 04:11:48PM +0200, Adrian Hunter wrote:
>>>> Shared interrupts may fire unexpectedly, including during periods when the
>>>> controller is not yet fully initialized. Commit b9a15012a1452
>>>> ("i3c: mipi-i3c-hci: Add optional Runtime PM support") addressed this issue
>>>> for the runtime-suspended state, but the same problem can also occur before
>>>> the bus is enabled for the first time.
>>>>
>>>> Ensure the IRQ handler ignores interrupts until initialization is complete
>>>> by making consistent use of the existing irq_inactive flag.  The flag is
>>>> now set to false immediately before enabling the bus.
>>>>
>>>> To enforce correct ordering around transitions of irq_inactive, add
>>>> explicit memory barriers: place smp_wmb() before updates that clear or set
>>>> the flag, and add a corresponding smp_rmb() after testing it in the IRQ
>>>> handler.  While kernel I/O accessors already provide ordering guarantees in
>>>> practice, adding explicit barriers makes the intent unambiguous and correct
>>>> on all architectures.
>>>>
>>>> Fixes: b8460480f62e1 ("i3c: mipi-i3c-hci: Allow for Multi-Bus Instances")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>>> ---
>>>>  drivers/i3c/master/mipi-i3c-hci/core.c | 16 ++++++++++++++--
>>>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>>>> index 741f543aae68..2909e3d35d8b 100644
>>>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>>>> @@ -152,6 +152,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
>>>>  	if (hci->quirks & HCI_QUIRK_RESP_BUF_THLD)
>>>>  		amd_set_resp_buf_thld(hci);
>>>>
>>>> +	/* Ensure changes are visible to interrupt handler */
>>>> +	smp_wmb();
>>>> +	hci->irq_inactive = false;
>>>> +
>>>
>>> I think you should use atomic_t, which already consider barry.
>>
>> No, atomic operations do not provided barriers by default.
>> This is very much about ordering.  Making sure memory changes
>> will also be seen by another CPU when it sees irq_inactive = false
> 
> Okay thanks. But I am not sure if it necesary because reg_read and reg_write
> already include dma_wmb();
> 
>>
>>>
>>> Frank
>>>>  	/* Enable bus with Hot-Join disabled */
>>>>  	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
>>>>  	dev_dbg(&hci->master.dev, "HC_CONTROL = %#x", reg_read(HC_CONTROL));
>>>> @@ -184,6 +188,8 @@ void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
>>>>  	int irq = platform_get_irq(pdev, 0);
>>>>
>>>>  	reg_write(INTR_SIGNAL_ENABLE, 0x0);
>>>> +	/* Ensure changes are visible to interrupt handler */
>>>> +	smp_wmb();
> 
> reg_write() include dma_wmb() before write register,  If you want to make
> sure write 0 INTR_SIGNAL_ENABLE before hci->irq_inactive = true.
> 
> smp_wmb() is not enough, which just serilaze between two core's access.
> 
> need dma_wmb() to make write 0 INTR_SIGNAL_ENABLE happen before
> hci->irq_inactive = true.

DMA memory barriers are primarily for synchronizing CPU and device
via memory without registers.  In this driver (and most drivers), the
actual trigger (or doorbell) to notify the device that memory is ready
to be used, is a register write - in this case, to the enqueue pointer
in the OPERATIONS1 register.

This patch is primarily to cover the case where the interrupt handler
gets called before initialization is complete (because it is a shared IRQ).
In that case, the driver's data structures like hci->io_data may not be set
up, and the interrupt handler incurs a NULL-pointer dereference.  So
the ordering is about ordinary memory use, not DMA.

Nevertheless, in V2, the memory barriers are dropped in favour of a
spinlock.  That required unifying the different spin locks, but the
result is simpler to understand, I think.

> 
> Frank
> 
>>>>  	hci->irq_inactive = true;
>>>>  	synchronize_irq(irq);
>>>>  }
>>>> @@ -592,6 +598,8 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>>>>  	 */
>>>>  	if (hci->irq_inactive)
>>>>  		return IRQ_NONE;
>>>> +	/* Ensure irq_inactive is read first */
>>>> +	smp_rmb();
>>>>
>>>>  	val = reg_read(INTR_STATUS);
>>>>  	reg_write(INTR_STATUS, val);
>>>> @@ -779,10 +787,12 @@ static int i3c_hci_runtime_resume(struct device *dev)
>>>>
>>>>  	mipi_i3c_hci_dat_v1.restore(hci);
>>>>
>>>> -	hci->irq_inactive = false;
>>>> -
>>>>  	hci->io->resume(hci);
>>>>
>>>> +	/* Ensure changes are visible to interrupt handler */
>>>> +	smp_wmb();
>>>> +	hci->irq_inactive = false;
>>>> +
>>>>  	/* Enable bus with Hot-Join disabled */
>>>>  	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE | HC_CONTROL_HOT_JOIN_CTRL);
>>>>
>>>> @@ -970,6 +980,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
>>>>  	if (ret)
>>>>  		return ret;
>>>>
>>>> +	hci->irq_inactive = true;
>>>> +
>>>>  	irq = platform_get_irq(pdev, 0);
>>>>  	ret = devm_request_irq(&pdev->dev, irq, i3c_hci_irq_handler,
>>>>  			       IRQF_SHARED, NULL, hci);
>>>> --
>>>> 2.51.0
>>>>
>>>>
>>>> --
>>>> linux-i3c mailing list
>>>> linux-i3c@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
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
