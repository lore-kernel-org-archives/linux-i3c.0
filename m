Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DA5CD4F3C
	for <linux-i3c@archiver.kernel.org>; Mon, 18 May 2026 12:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LmCOebRITreAt5DgO+MZmveW4fotAcsQ/AAqhkvjYhw=; b=Klt44ap9Kabb+9BG/rmLh2KgHK
	31bcC8qwV8KE7CcjRJvi/RY6TPkeeDFnZ7mam7Ir+ujm90syaN7rHoHds5uVNnV1MCTyl6SecJhGl
	UCZisBQEReRBNvJAc6uvsumyKftmMeUUoZzmo0DfIuWTDo/6p3+dv21BfZ4uZ5xIhgF4F3yMpPfNA
	MTngXVIEnndjtWcwb4naNaMkVecljvbKeF/P+kk1PIEFv5Scnsyoqf2OTByPgz4bMPyYjJ5k2iir5
	CnDN6QRrp0DgrSpiGor2n2AqYJr2sGH0LyCdYMNLKQAmf7J1/ys2biJrQ+Gn17rvawxaFcj3hNCeO
	ht+Ix79Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwi4-0000000FYcY-2tOl;
	Mon, 18 May 2026 12:04:36 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwi2-0000000FYbp-1EHm
	for linux-i3c@lists.infradead.org;
	Mon, 18 May 2026 12:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779105874; x=1810641874;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xPKrvNwuUklm3j4HFUs1wB1mKK5fU+IBd77JELyC4aA=;
  b=RDTHBzDItcnsk+vx0e4uiakO5re1QcTO82XVnVJtSENGyeEzlckB7TAi
   GSeI+OUHXd5ORm6HWJ45W23QEfJZ5jaaJ1eE5QoztQO79APPmx11jyDR8
   PVszX2gxZlVoEs4/5Cn+wrZVHFbCyZxAmkPbu025fUA75R3BiFG3FyM0n
   CtV5hhn1bHOEiMLuiLx7BsjOF8l0VdstutajclgUs4Bqjd9Xr2lpP6l/o
   Qzn+1v3bK5HTSW/+A2ghjUD3WN+ShE13gkmqniOkYYjYmQNFZHgnEiM5K
   5Ltlqa91F2V5MOxXnMu5q00bTKqGsanjAoHB/R2XoG//voE0xoLCGlZ3I
   A==;
X-CSE-ConnectionGUID: l3IlEO05QNCZzCqFSgnkuA==
X-CSE-MsgGUID: yWHVcQn9Q6ytgJOlzMZv4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90536939"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="90536939"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 05:04:32 -0700
X-CSE-ConnectionGUID: uZHao09ARWSp9vRUu4dJcg==
X-CSE-MsgGUID: s2YAm9uvQFiGw7LAtjkSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="236402892"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 05:04:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 05:04:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 05:04:31 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.30)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 05:04:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfcvrLoW6fJ0ISffvrUjLeCQe5qRGfro0BZ20n0+GTfp9U5Xe9mUq077j9wduw0+R2bgynOyl4CFYA8+tM19jHv7ECpd6yHd/P4iLXp/0QPLsMYvLNsyhJ5cU1VJgEXOXiIgymUjndq64H640YfW8P/YPVkcF2kYcQ4p6Ruu08d4HSbcLSbSae7mEzYwc3EOUAS44u+53rjXaZ06TVZ4XcV2lwAy7IDDpCAj4mGnDYLdWjwzi31BgABn3NOyf1kiLUfT9niOzenrZxkg8D4xm9atT1GEM1OmuQgJ+WqotdZ65VZB5LvqDtJtTTG9gg7K3ubWZYDevYj/w11nWHHnnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8pKio2JehPMIPaYXGS889PtX9bIpBGGqhDdWcAausg=;
 b=aJWXyRL1vjr19Q1pXJlwjR1BH2gZNI5p9tgurjaL2idY4atTSMW85cJaWEK3zuO3jTqe/gqD5NfbZ+qVpSCe9LW1ucke532YgmjzvUoJBKFrdb4XgGl4OGtmyjGdsz+1AmqCpZdmzRoIV80cjQnzOwzllgOroSNbuX7zFsNMj6ZLA2V2Us3wxFAxSCoRBOZvSR41WMJDhaOFu4qu9VimderNzbVhdaoz9hZDFj74OyDOykoobtot/ur8hetQpfQfU7nryUnvMj0aKHshoy6zyFyHflDPciCq73IaVMlSyN8veIr7QekxJO8bpYHKmhD3PpqE5j4ZxKNr5ufabCjP8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH0PR11MB5125.namprd11.prod.outlook.com (2603:10b6:510:3e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 12:04:28 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 12:04:28 +0000
Message-ID: <316208bc-f430-4f04-b81b-6fbabce3adcc@intel.com>
Date: Mon, 18 May 2026 15:04:22 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] i3c: master: Defer new-device registration out of DAA
 caller context
To: =?UTF-8?Q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
CC: Frank Li <Frank.li@nxp.com>, <alexandre.belloni@bootlin.com>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-7-adrian.hunter@intel.com>
 <agNXuQDsj_bHSA7s@lizhi-Precision-Tower-5810>
 <01df8e0e-9041-401b-ab73-634701c4acdc@intel.com>
 <c179bea5-0efd-0691-92d4-66bcf50f9d8c@est.tech>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <c179bea5-0efd-0691-92d4-66bcf50f9d8c@est.tech>
X-ClientProxiedBy: DUZP191CA0052.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::15) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH0PR11MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: de5dfa60-b716-4556-b9f7-08deb4d59c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: UuCHO71WnumGv0XAm9+vMD4RaGBv1IGyygSA6zDsZ/4K2CT7R0KoTxap6AidHV5j7Ax+EUPbBJwioqJcS7I5BWCGc0jxoR0Bc3fScasB76ZuhVu4AH4YumJhaWTj8mEu+QzRy48Fs2H0WgbtqQaBzCNfITcggVNxEcoN1G0uM9wkgy56JYswPcj51TdLh99H9JUE07j25JkjzKWVyV7nipQPdJu7YCYD6Wua+El0frzubtCeGijvQW9Fgv/UD8Q0gDWoiAAN//kuO5batADFRfvvTuVAz5HK0kk5jt/3vtFaWalmpbgi12/7URugjxYR3e7RBKxJnXK6ZrsoWjz6vFvCWwDMxPyjdEnDII2hiH9PkspYoH3ub4BINTL5wnIeVs9iJhPCRsy8O6cEqayT1g5nFabzhEsdazjuutsBhnuUyBUj5UoR+eq9AAi9KtbIOHw/DOEWMz8w3frUyM6t1WumhHlVnVIrII8bkpvvRYp71ncpzEYgkmSdxtYrqs3FgXzARVyLLUlfHwPGHNvy3LX3gBbjxTNEyF32AKcD4YN7JxPWRIj5YCwGqwrNVsE0pIhY8RznBh9v9Ndbqi3iNziY1Xymtz0r6i091jFiDKVuLHQZ8qZjpc1zCY78jLwXouOMx9jw7zsj1by9ZM2CH9ffHRPr7MLqosHifGDRLvLxRvkAr4/UBwyPG+jmRSDI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0RhTDljYWZQZDR3Si9uOEFCTnJIZEs1VDYyYitjc2JyMjZTa0JNZTBuOWo1?=
 =?utf-8?B?MGlnQks5QytZRDB4R1UySTJSeHAxcUxwODFpS2hVNzVCcXNHQS9YNGpzOFJ4?=
 =?utf-8?B?SU04emkzNDRpd1p4OWpVRnNJbkdJeFdKSVpRa2MrQzduTytDc1RVRHU2cUVz?=
 =?utf-8?B?UFZUc05sYUVwSnlURE5hWHZIYXdGTjc1eVpsR0RzSHd6N3ZFZEhRcHQvUSt6?=
 =?utf-8?B?akgzSUhUeStvYW1Da0FlQkMxZlZZYnhWdEFjcG5mUHY5OFAwVlo0VHZIaS9B?=
 =?utf-8?B?bTY0SlNMOGRYcmVmMlFMNzJKTURJdHV1blZvUWsybGhPUHQ1RzlmQi85OVp6?=
 =?utf-8?B?RDIvYTJjaW12dHZyaXJ6OUVwRnZzbk1Sdk5MSlducGlwSFp1NmlycDJTVkhk?=
 =?utf-8?B?VXF0cnRMTEw1cElaUUhoTTB5b1pLb3l4VVN6amJFT25UNW5qT252THhpYmxa?=
 =?utf-8?B?NmRwWXZEL3VubGJhcXdaVWswM3Mrb2dBNDlLdEQ2SzlGeUswUFFJbXhCemVr?=
 =?utf-8?B?N29xUGF6dzJQN1haTERSdjRBN3FzdS85dTRaUjlJbXdkdEhTRUhaNnNFT3dt?=
 =?utf-8?B?SnB5Y3hmZFRKb1E2UmttcjE3TUJRNExtUTFNUHpmalpscmJrQlRiV04xanF0?=
 =?utf-8?B?dTNQaWV4dU43OGl0c1RNM3Z6dlRGM2lOL25aYVBOVjRkTUp3ZFJpZTlHK0t6?=
 =?utf-8?B?cDdxei9uZmNKak02SVgveVlFam1QZ2lqSmxTRXVqZ1RGVDdqdFQxai9XZzd1?=
 =?utf-8?B?eDZLSEMwaTk4YnVLK2pOVTkxcE9LTFFMVUZTcFlFckFZR29CU3ZNK0p1dFZN?=
 =?utf-8?B?M0JWQ0srTXJkUkhKWEI3Szg1Q2YzUlVIQ2xNdVJCS2gydFhhSkxwM3NXRDFl?=
 =?utf-8?B?bTJZZEdrV2ZCSHQ1OWRCYVZIQTQwTmN5L1FKWGhReDlaNFpzUzR2VVZZcHMv?=
 =?utf-8?B?NFU1Q2lTOXJCZ3IvNEdRdGNkSUFRSXBWZnJLTzB4TUtoM1FrTnVDZEVhV2hx?=
 =?utf-8?B?bmM3c3JqenRlWWxEdHlNeURrLzI4Nlk2ampsQjRCeEFMdVI2NHVCSXE1QTdN?=
 =?utf-8?B?NUh5UHJ3eDZrUXlCeVNJSWVNUW9LZStVWnhzZkRYNjA4bzBOb2tHbW4xZE9D?=
 =?utf-8?B?ZzQzS2UxTFJ0d0lSQmsrclpvUHpOT0U2V25sY3ExYzd2a2Q1MUNmY0lPUlNv?=
 =?utf-8?B?VjdGWW90cUVsa1JRVXBmZHhhNk1lb3ZMN1lBZHNyR0QxOVA4OCtEM201TGJ0?=
 =?utf-8?B?dlI3cy90U2czRkNQN1JtNFVqa3dBVTQzMy9WZ3NINkJUL2xmdWZwSklpLzFT?=
 =?utf-8?B?SW5qdERxZ2YyQ0dGa2tZMUt5VjhnTFREWTRIaWd2M2FSRnlFQmRvdEt4TFVs?=
 =?utf-8?B?cWdETExCQ0ZDc2lHMUdoOGV2YzB1d1FiZXFkSWRVVkxRYkt0QTFucHNwekVp?=
 =?utf-8?B?R3k2dWFPTkVaNnF5Sy9hN1hsZUgvY2ZndWNUMHdIVEpDSG1zeW0yWGRDdHlO?=
 =?utf-8?B?ZXBEbzVqWE4zcXJkbCtKenFnMWgyOHVIU2JwNnR0TTdndU9WeEd3THVFVWpD?=
 =?utf-8?B?eU1DQXJDVGxacE42QWFvbUpmZjhRbFlvS2lremNFSFgwTmpETVRWZnkrVXJI?=
 =?utf-8?B?NFBTQUQ3dzgxUFNKNm1nSzlXYUt6OGJYL2UrZnYvZ2x0Sm83cmQ4MGNPRC9s?=
 =?utf-8?B?N1FRSkhKYUNMZUY2dWJucC9KWHV0dWgvL0V3QmVYQWt4Q1M5WDJwSzdiQ2ps?=
 =?utf-8?B?bWZOZzdXNjN4Q1VXcE4xK0RmNnM4Q3hJeVRLVWZvcEFYT08rbkVPUThYUnY2?=
 =?utf-8?B?amNtWU9nWDdTUURYZ3p3YXBRUHZ0RTFITmtDRDhMTmwzZzNSK2tMU0ZUTnJw?=
 =?utf-8?B?K1dUUHBZUzFPZG9JNXRsUUU5ZWt2T2liRi9vTkdCanZVMHJhRnAvbE9FM0Nn?=
 =?utf-8?B?MmNtcDNWdzhyaTQwQWl6T28wNDl5cFJZdWc2TytVMzgwUllMWldLVmxobllr?=
 =?utf-8?B?WWJIV2UraTV4WDNXeGtaOUhtTXdEL09LMFZKN0l1N2tsNFMvR1BZTlFwSldt?=
 =?utf-8?B?QVpTcjBuVjY4b3MrTENwZ1ZVdTd2Tmo1SEhBM0xZZnMzSnRkZjdGT0NiWitG?=
 =?utf-8?B?M2ZGSHJZdUVuOGlTazFodXpLOUFsUTEwcEpleXE5aFp0c1N6bkZIWjFDTWpk?=
 =?utf-8?B?WTI3ck9xUWZpenNSck5oUHBYWHNJSkx3MFliNnkxbGprN3BZYytERTBOYjBk?=
 =?utf-8?B?eFErcEp0TjZ5VnNRSDV2dURCM2VjZWtuYVJzTmxDUCtxRVM3TXlzQ1BtalBp?=
 =?utf-8?B?cEFlSjllVnRxa0RuOWlZZjNDVXhlaXJ0QzF0cmR3aTFXbG9wNWNmUEZUQ2FV?=
 =?utf-8?Q?1UtAMQ9IvzZh0tyc=3D?=
X-Exchange-RoutingPolicyChecked: iEQp4VdJXzqO7LsXlLLP9nWBZuioFIWks26uvLQH9sRCIYE+p4E7l4uHVK8PXz3lFfA4AEt9lAE3LLmx5ffRbb5peIR82s6uFa4WSKgULMZsQnIdd3qNqhpD7yy4HXfzZxre15784A16rztE1KZrAAUJWNfuw7McGEW5Rec+TOrhn7RkAJMOPqug3T12ytpkzmtvLPPSXgU696ywc0xO+sLYIXiECcdBRTiZaT22sbxeAowQLqWUZ8enNXKBXNgZdJpOm5l9qIfOxUTpQ0LTtGds4XBa23mz5vijUgkUyJYmH3JQTaCs+TvnMBTO3t/OqI2m8O8Ew7AH+goz3EM0PA==
X-MS-Exchange-CrossTenant-Network-Message-Id: de5dfa60-b716-4556-b9f7-08deb4d59c56
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:04:28.0695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RroZYixUqrMEkfSidi4oeUDyxDdshaDHDCvBVjBlDvNQuQHtaCYXYGCxSApuX59boUUaFeO/csPG+LRh8nFqJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5125
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_050434_353248_1A39DF59 
X-CRM114-Status: GOOD (  15.86  )
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

T24gMTMvMDUvMjAyNiAxMzoyMCwgRGF2aWQgTnlzdHLDtm0gd3JvdGU6Cj4gCj4gCj4gT24gV2Vk
LCAxMyBNYXkgMjAyNiwgQWRyaWFuIEh1bnRlciB3cm90ZToKPiAKPj4gT24gMTIvMDUvMjAyNiAx
OTozOSwgRnJhbmsgTGkgd3JvdGU6Cj4+PiBPbiBUdWUsIE1heSAxMiwgMjAyNiBhdCAwMzoxNzoz
MFBNICswMzAwLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+Pj4+IE1hc3RlciBkcml2ZXJzIG1heSBp
bnZva2UgaTNjX21hc3Rlcl9kb19kYWFfZXh0KCkgZHVyaW5nIHJlc3VtZSB0bwo+Pj4+IHJlLXJ1
biBEeW5hbWljIEFkZHJlc3MgQXNzaWdubWVudC7CoCBBcyB3ZWxsIGFzIGFzc2lnbmluZyBhZGRy
ZXNzZXMgdG8KPj4+PiBhbnkgbmV3bHkgYXJyaXZlZCBkZXZpY2VzLCB0aGlzIHJlc3RvcmVzIHRo
ZSBkeW5hbWljIGFkZHJlc3Mgb2YgZGV2aWNlcwo+Pj4+IHRoYXQgbG9zdCBpdCBhY3Jvc3Mgc3lz
dGVtIHN1c3BlbmQsIHNvIGl0IGhhcyB0byBydW4gYXMgcGFydCBvZiB0aGUKPj4+PiBjb250cm9s
bGVyJ3MgcmVzdW1lIHBhdGguCj4+Pj4KPj4+PiBBIHNpZGUgZWZmZWN0IG9mIGkzY19tYXN0ZXJf
ZG9fZGFhX2V4dCgpIHRvZGF5IGlzIHRoYXQgaXQgYWxzbwo+Pj4+IHJlZ2lzdGVycyBhbnkgbmV3
bHkgZGlzY292ZXJlZCBJM0MgZGV2aWNlcyB3aXRoIHRoZSBkcml2ZXIgbW9kZWwKPj4+PiBpbmxp
bmUsIHZpYSBpM2NfbWFzdGVyX3JlZ2lzdGVyX25ld19pM2NfZGV2cygpLsKgIERvaW5nIHRoYXQg
ZnJvbSB0aGUKPj4+PiByZXN1bWUgcGF0aCBpcyBwcm9ibGVtYXRpYzogYSBob3Qtam9pbi1jYXBh
YmxlIGRldmljZSBtYXkgam9pbiB0aGUgYnVzCj4+Pj4gZHVyaW5nIHRoaXMgc2FtZSBEQUEsIGFu
ZCByZWdpc3RlcmluZyBpdCBpbW1lZGlhdGVseSB3b3VsZCBwdXNoIGRyaXZlcgo+Pj4+IG1vZGVs
IHdvcmsgKHByb2JpbmcsIHN5c2ZzLCBldGMuKSBpbnRvIHRoZSBjb250cm9sbGVyJ3MgcmVzdW1l
IGNvbnRleHQsCj4+Pj4gd2hlcmUgdGhlIHJlc3Qgb2YgdGhlIHN5c3RlbSBpcyBub3QgeWV0IGZ1
bGx5IHJlc3VtZWQgYW5kIHRoZQo+Pj4+IGNvbnRyb2xsZXIgZHJpdmVyIGlzIHN0aWxsIHBhcnR3
YXkgdGhyb3VnaCBpdHMgb3duIHJlc3VtZSBzZXF1ZW5jZS4KPj4+Pgo+Pj4+IERlY291cGxlIGRp
c2NvdmVyeSBmcm9tIHJlZ2lzdHJhdGlvbjogYWRkIGEgcmVnX3dvcmsgd29yayBpdGVtIHRvCj4+
Pj4gc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciBhbmQgaGF2ZSBpM2NfbWFzdGVyX2RvX2Rh
YV9leHQoKSBxdWV1ZSBpdAo+Pj4+IG9uIG1hc3Rlci0+d3EgKHRoZSBmcmVlemFibGUgd29ya3F1
ZXVlKSBpbnN0ZWFkIG9mIGNhbGxpbmcKPj4+PiBpM2NfbWFzdGVyX3JlZ2lzdGVyX25ld19pM2Nf
ZGV2cygpIGRpcmVjdGx5LsKgIFRoZSB3b3JrZXIgcGVyZm9ybXMgdGhlCj4+Pj4gcmVnaXN0cmF0
aW9uIG9ubHkgd2hlbiB0aGUgY29udHJvbGxlciBpcyBub3Qgc2h1dHRpbmdfZG93biwgYW5kIGlz
Cj4+Pj4gY2FuY2VsbGVkIGFsb25nc2lkZSBoal93b3JrIGluIGkzY19tYXN0ZXJfc2h1dGRvd24o
KS7CoCBCZWNhdXNlIHdxIGlzCj4+Pj4gZnJlZXphYmxlLCBhbnkgbmV3bHkgb2JzZXJ2ZWQgZGV2
aWNlcyBlbmQgdXAgYmVpbmcgcmVnaXN0ZXJlZCBhZnRlcgo+Pj4+IHRoZSBzeXN0ZW0gaGFzIGZp
bmlzaGVkIHJlc3VtaW5nLgo+Pj4+Cj4+Pj4gaTNjX21hc3Rlcl9yZWdpc3RlcigpIGFsc28gcm91
dGVzIGl0cyBpbml0aWFsIHBvc3QtYnVzLWluaXQgcmVnaXN0cmF0aW9uCj4+Pj4gdGhyb3VnaCBy
ZWdfd29yaywgdXNpbmcgZmx1c2hfd29yaygpIHRvIGtlZXAgcHJvYmUtdGltZSBiZWhhdmlvcgo+
Pj4+IHN5bmNocm9ub3VzLsKgIFRoaXMga2VlcHMgYSBzaW5nbGUgcmVnaXN0cmF0aW9uIGNvZGUg
cGF0aCBhbmQgZW5zdXJlcyB0aGUKPj4+PiB3b3JrZXIgaXMgdGhlIG9ubHkgd3JpdGVyIG9mIGRl
c2MtPmRldi4KPj4+Cj4+PiB3aHkgbm90IGRpcmVjdCB1c2UgaGpfd29yaz8KPj4KPj4gaTNjX21h
c3Rlcl9yZWdpc3Rlcl9uZXdfaTNjX2RldnMoKSB1c2Ugb2YgZGVzYy0+ZGV2IGlzIHJhY3ksIHNv
Cj4+IGkzY19tYXN0ZXJfcmVnaXN0ZXJfbmV3X2kzY19kZXZzKCkgbXVzdCBub3QgYmUgYWxsb3dl
ZCB0byByYWNlCj4+IHdpdGggaXRzZWxmLsKgIEhhdmluZyBpdCBvbmx5IGV2ZXIgcnVuIHZpYSBy
ZWdfd29yayBhY2hpZXZlcyB0aGF0Lgo+IAo+IFRoaXMgcmFjZSB3YXMgaW50cm9kdWNlZCBpbgo+
IDNhMzc5YmJjZWEwYSAoImkzYzogQWRkIGNvcmUgSTNDIGluZnJhc3RydWN0dXJlIikKPiAKPiBC
dXQgc2luY2UgdGhpcyBwYXRoIHdhcyBleHBvc2VkIHZpYSBzeXNmcyBpbiBsYXRlc3QgNy4xLXJj
IHZpYToKPiA4ZWEwYjYwYmMwMGQgKCJpM2M6IG1hc3RlcjogQWRkIHN5c2ZzIG9wdGlvbiB0byBy
ZXNjYW4gYnVzIHZpYSBlbnRkYWEiKQo+IAo+IEkgd291bGQgYXJndWUgdGhhdCB3ZSBzaG91bGQg
cmV2ZXJ0IHRoZSBzeXNmcyBhZGRpdGlvbiBmcm9tIDcuMS1yYyB1bnRpbCB0aGlzIGZpeCBpcyBp
biBwbGFjZS4KCkkgZ3Vlc3MgaXQgaXMgdXAgdG8geW91LiAgQSBjb3VwbGUgb2Ygb3B0aW9uczoK
CS0gc3VibWl0IGEgcmV2ZXJ0IHBhdGNoLCBvcgoJLSB3YWl0IHVudGlsIDcuMi1yYzEgYW5kIGJh
Y2twb3J0IGZpeGVzIHRvIDcuMQoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
