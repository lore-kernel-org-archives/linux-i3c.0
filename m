Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20631CD5BC9
	for <linux-i3c@archiver.kernel.org>; Wed, 27 May 2026 10:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LHNOWaDSD/DNQFLqgcUvNubzCvBju1pPM2ohUP0hRmw=; b=pex1EpAxvtH+AjPtxtrze69/+s
	VRKZRMQEA6xy8/Wb9q0OJV8/gOTfuA4pA5EoYv5vHC7TH7zose7/XSMRxJ2bWBszDZokw7aYwU3MM
	r3mUMDZUAmm3jjhUc09zfqnpUZjiamUOfDmO4R5N3FcIjxI459GY3BJmd4vQrnVfALY1eMkA2nu59
	eijyxl+O81ih4AWyRLv4WctG1dh2KWFxTKk+Ag/3w3X7tbfiFzR6CBGL1+KDBpmtE6P83ZCrQi8nn
	EOKNKkVU2zARkkUorNJoAnheaKeb4R1v8GSrtnTDOdbA3treGE/x6FWuqaF1ll8fuw+zZ7x7ozX9t
	+uiM7h7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBnp-00000003xJa-356R;
	Wed, 27 May 2026 10:47:57 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBnm-00000003xIi-4A0K
	for linux-i3c@lists.infradead.org;
	Wed, 27 May 2026 10:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779878875; x=1811414875;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uz4QMmBBjmiLn3jvsOqINEX2Qz79CcmM7uoPiwkPRoo=;
  b=Bzz5+klXAPr7B5FggBH66R2fDII+nf/MTAb0cpSn3Ms+xonNLyyyNxYq
   ZqEWQb909sZsK63B5RrKporo+ISFs9P0spnSys0RcjsXN2IuGVmK+SSJQ
   SgCOhVV7pvtijntMUXhgWvf597aomS0xtg5XJ7Tw170uKAb0egpVU4h88
   13v3VolzColyUEOhtp+8u2BpXYOWF3wwrFvxTE3PzpqCVaFVj06q5BEMX
   UQhnCdrpGukTqJiGkrRTUo8PhRzd72j2A2qR2aKaLMoOZOfjKefDFudID
   N36MXPoNg6Oep53sr4UgZDYEElQYk2YAIGSjY6hQ4kSlaz3u9/yb+QWqf
   Q==;
X-CSE-ConnectionGUID: 8O4XuT87Qj6epkW5FR2T6g==
X-CSE-MsgGUID: E9JZ2VYvRN2+8pCdI2wvoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80554304"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80554304"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 03:47:53 -0700
X-CSE-ConnectionGUID: kWzUcLP+Qy+uFD0OgII39A==
X-CSE-MsgGUID: 9PUn6I9sS1ONfKNyS5DgXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="242362253"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 03:47:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 03:47:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 03:47:52 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 03:47:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMoY62HR2NIuY+iL41dbWQydXzFEZJEYc4Inh47w22VYS8X197VvKV5k/H6JRqGURVUiC4oM+9nki1ET9+64BJPkELfqiQlnZDUwowAilkViboaBByKQMbSOy9ySo86swjcMcHIxmTHuRKSQc3CCQR6vyE8VVX0zps4pIaot4zO8AGlaesVDcKAW+sG5CtGkxTg10UAKebYRnmlsnm+5TDKbXIxfPz3o2euhgMQKS7QeGHnn/rZkxL6tOLHLofiAOvqLfVUcmXsyWueFLHW3s3HiSV8Xwbqc8KRQCHtBIMOt5ESVfUqja1sAMtTTc3cf9THKzbZJ63r/DdEQ4NBK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y16teXvhf9xNKpy2A+XeQO9nGm7Uo9hOTgW9axkLEr0=;
 b=YCws23+xjsgGq2qfEWnOgLte+PJgA6n7RBTFIy7iNHM7OQAkUMJxTi0c2jMutFFw22L67xsDLCKHvOLoZpfsp6avGGNQ00Ypb+mymUDpDtJ0KnmJLaZDKqX8kegZIo8QFWsIfnSIHbR725FXF6VuMj/3aX7i0M+jbHhDfCHY4SRGp19qJ5shdYtM8bQaLZGJWRlv1FBC1VXOUAl4FpHV+cg7A0NiqWwxNZFmGK5J+N9LuvP+zVxgPy+2+7W/Iz3zhJaTxmwEIUKgnwWOb0MUQWIw2e+wF5xYajQ+ItpHXWzwwy5q9s4ENQdLwncUEq3D6uVnAsXvmCr/pLA2olkv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 10:47:45 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0048.019; Wed, 27 May 2026
 10:47:45 +0000
Message-ID: <3b0071bf-b82b-4a5e-8a3f-59a7ad165beb@intel.com>
Date: Wed, 27 May 2026 13:47:40 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] i3c: master: Defer new-device registration out of DAA
 caller context
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-7-adrian.hunter@intel.com>
 <agNXuQDsj_bHSA7s@lizhi-Precision-Tower-5810>
 <01df8e0e-9041-401b-ab73-634701c4acdc@intel.com>
 <agTK5tMCHdLEezCR@lizhi-Precision-Tower-5810>
 <417993a7-4a4f-4ba5-a815-aab63ed03a3c@intel.com>
 <ag9PyMLhhwYJ_yRB@lizhi-Precision-Tower-5810>
 <de8f3e0c-200e-4da2-9f8e-7321d2b23717@intel.com>
 <ahCnrlfZZFPI4C_s@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <ahCnrlfZZFPI4C_s@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0218.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::21) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|BY1PR11MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 846ada23-079e-4198-9da0-08debbdd629c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099006|6133799003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: G4GnYhQjkMr2Rr8LX+Ar9R7kY1osSFM7LJdJf2adoDjT/xFe/jAzt+UPm1otgHV+/JBFwqi8IlCfH2qlOl0QK3pfPNpex5fpkFWuannohR4SW35nmXd5qPLn2ueFnRbPTONy8VJa0V5GfGJm0gByQTNK2cuoI3ZQ4kfkh86ylDyZ1GYEc7nk64bs+U5CVR9QkLzht06+D8OBE1ZtEvZ6yGsczh8fgpdugn7FBfrN8VMmTI3XzKJRKSya6Bns6/7rFHYaCFp+Aad7WgkM0mti92j4VhwIQJxO/bIkLMjMsBorhzcBVze5WhhjeoqOKZ7fEnEQ823BKAeQH+9sDMqUXwG2DqgEnbiTNV2WmBI8aXaXMom/oEfjMaetuT+ZVwdUXztzC2hHy/2fNeK+dwbt8vPJ2OFKaLiBmvsCdux0Ab/9YMsbh+EqJk4jQJoeKqbsfYk/TXSUjoeQfwPS/Glxqlw/+zXHSCnwAQI2aPb41HeScearZU0U5wRyx62PuoRWHmYngI1dKbiHqDtl8T3xwAmHrhvmxUQqywmYMWWdfm1qSkeJXY/+zSEjH92GIGzElrSx/T0N32SvXwLxgaDY8hSrryjQNsSrLdu5CzPzVL683/7vhec5+EPXfsLIHiAmp/MR2VSNub1GchzBRNIHMZght2DdMMg2oTOf7O4ny+DsV24QIbX0aYf9zz9a19APShYQ19XufUkwoF4ezfja9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ankvR0xNelZBNWFRVkZZR2svNjRTcmRwYnE2KzdHVlM5N1JBK09LWHhuR1No?=
 =?utf-8?B?NGpmSUd6OHFualIvNGtmaWhXcGE5YXBGSDkwY2dQUlhuL0lvL0ZIdkpnbTRH?=
 =?utf-8?B?ZjZNa2hZd3FVVzNDQjBNVi91M0srZkxvaWo4UUJucTRON2Y4U1JGNU9PRVVl?=
 =?utf-8?B?NEtwNlJVUmUxd3p2SWdKZDRDL1I4Ujl6VklURmtBVlA1VEt3Mnl1RldhTDdY?=
 =?utf-8?B?TitTc05WcEUyNWxZWnpvZ0VTU1pGU0VHQjNMN1VTc0FDUkJoYjkxTlNyL1Na?=
 =?utf-8?B?WXVIWllKaDJsSS9vcEpCbjQ1VnNnUUZzRDJlVHNnYUZjRXErb0NGVS9Xb0sy?=
 =?utf-8?B?NkFPOUhSZXRuMUswQzJIRGtndFh2MFZKSzNrWVhaNTJLYnMxQ1F4WjZYS2s5?=
 =?utf-8?B?bG5reFV5Q0svRjFFMTgwUmhQdFRGTThUZ0xrWk9YcklwQjYrKy9pbCs2aUdE?=
 =?utf-8?B?NXpQYXo3OEp3QnJGSXJKaU9meTJMc0RacGdxbVB1WS9wcFVESzhmOUZMUGta?=
 =?utf-8?B?QVcxODRhcDRkdVljV2VWZTJJRUtsQjdsc0IycjJMNy9hTXFSbU9sdlZtUXds?=
 =?utf-8?B?YVlGYzNCWm9NTUxGOHlQc1A0bXExMHV3YVk3ZUNPN0hxbW9WTDlpeEFFTURM?=
 =?utf-8?B?TXNBWGU5cmdhczg5RGhucEZJaC9WaEVVUlN3dHZRazkxS3YrZ3E4L1pJNXZZ?=
 =?utf-8?B?WkRIRHdxTXNkQnRTUUQwR2Fkd2VEeDlCNXdwUitzT29vMWdRNzVGM0Q3S1U5?=
 =?utf-8?B?enJYT0c5bE5ic21aMzlHSFRHek1sd3JXazk1amM1SUQxOTBNSlhyc1pncnAw?=
 =?utf-8?B?TFJRejRaNHFMK3phZ295U09NVkhUZDBuYnlMUnRNNXdmKzV4anBEakhxdjRr?=
 =?utf-8?B?dDNYVVJMNXRhc1NUTWFYeE1Kblc2Tnd4aWNiQmFObHNXUXJTeFBrNFRuR1pm?=
 =?utf-8?B?T3FDNUUrdmVHbzU3MWJwbFRBRUhoNEM1UEg0K2xZSFNTNFNCWGFQcWR3dGIr?=
 =?utf-8?B?UWFLUTNla1Y1M0dCUjhWZ2JiWE1FcUk4a2lSbUpacTBoR2JiZ3gyZDcrakFG?=
 =?utf-8?B?czVmQUErcTJuS2wvU25pQmJIS1pKUW5sUjkyZzZHZEhRdU1mV2NlN3BSZ3NY?=
 =?utf-8?B?VGN5a0ljYzd0dEI1ZEtmclpvYTNCVk9YTDlLZFU3WXRLUmtCNUZoOFgvSEFG?=
 =?utf-8?B?VFNERWEraklIT2RXQVV3YlpBeXdYZXVWcVNiTXVRTUVSZlkraGZqMCtWT2E5?=
 =?utf-8?B?MlFqL3lmN3ZtbndnYkVGMlZWL3ArckVubXRzUUl6VndMUktUSVVOTGFWYW80?=
 =?utf-8?B?ZmlvUzJGQnRpdWdKeVN3NzdPMGdMUTJDaTE5NlpxMnJPM3hyOGVFYkJJUFkv?=
 =?utf-8?B?c252SWRweExuVi9BWTB1NGVWOGVENGlubmwxTUs2Vld0Q2daUURXUURyMUFx?=
 =?utf-8?B?OFpKT3A1K1BXNDE2MzJrMHRZemtxL2VUQ0tYRS9SbVJUTGRHVGUzeFNxN2Ix?=
 =?utf-8?B?cmUxNWl6em9ISkp1WS96VzlsUHF6aTdtaktiQVo3N1VoTGpYWVJzVXVISCs0?=
 =?utf-8?B?V1lmWEJXVHhSK2VyRlVxaTFvSEF1U05kdm1heHo3MHNXeHpycEk5ejh4aitD?=
 =?utf-8?B?M3p6MzJLR0xqZkNHVk5ubGN5YzJ2Qi9JbHRyR1pIUU0rSktjbGp5YzFqdUZv?=
 =?utf-8?B?QklMUFRRTlFDZGtPSlJ0Y1NGZlI1U1pNUjRoc0s3ckV3a3FIcnAzTUJzak9M?=
 =?utf-8?B?cGEyZjRWZThFSWp1OFBnS1AySkFYUmZoMHJXeGRyblRGWE4yQUdCL2hhVmpT?=
 =?utf-8?B?d1dPZXpHZ2NaMjJVT3hBL2lpbkdhV3FLWSsxSmJVVzVDTXY2TGhJQ3dHRjBC?=
 =?utf-8?B?dEMzcGdWSHdyZ04wRWVLeFpPaXd2Nm0ybnVwaUtQc1VPa25yVGNCc2JpV3FR?=
 =?utf-8?B?VERWcXB3MUtVTENoNThmWEtoVXNhaW1RbmFCRGZKbkVFbGxnQlA3S29KOWRQ?=
 =?utf-8?B?aHpoRERnN0xXZ29jMHlVWWtkWUZMa3lUQWx2MENDTjB5S0t3TmNZYVVscVU1?=
 =?utf-8?B?eHJ0am44TDhvdFF3RlF6RUk4NURWUVVqWjk1RUwxU1M2L2ttLzdnOUxDaTFU?=
 =?utf-8?B?WEh6M0hkSGFVQk9CTUZNaHF0aWtJR0Z5U3RnZ2JnLzVGcmM5N0xaTGxGTzN5?=
 =?utf-8?B?Tk9HTVV3SWNyOW9UemdPSFkrUGxzc0N3UkRiYUZ6T1N3ZU9Vb25zWWNzS3RX?=
 =?utf-8?B?elVXMmg3Y1p6TjlWWXdJVG92MnZ1M2ZieldVY1ZTOHZ1STlBR2t4UjZwcjZV?=
 =?utf-8?B?UjRrNFJhQjlyWFdMSnFsV1BjQ1ovMmZMSExyNTh0bThVNDVjTmkyZ3FuWWN5?=
 =?utf-8?Q?vxedgy4IhOpdZoWA=3D?=
X-Exchange-RoutingPolicyChecked: N3C3F1qmXmyBmgM6iJEJcRdbbeutjK3wdUnGYZmzWkVVLTGQ6Kg71f4vt8XvFZLAliK8fxr/ELZlxRzy6HEJJCP1UnrwKKhBNl7ogljH7/qGVHmG4DjOG1Si9zGDaoXnR6OgFmH/vNq63VuzcygpPxI1sXoVfC+l8YCUr+paiRYOp1LN+t/cV0NuFmAXW6p+CyotdSBAwExK6dr+cjKfXlN4x9oenK3HEJIZrYDSo3nYKORt+kWxKBWwDjmtPAWC4nAZNOlpJ7/UOX1nr1Z/eD2ZEPl0jgR8zEspqaZBc7X1Oe5cItjYR4q3SMUMkLRu7PjwgH9JG+4oOk00I/DvqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 846ada23-079e-4198-9da0-08debbdd629c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 10:47:45.2795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4lekB1R4n5+4EbV6ogAaxuEkdE1HD1RKI763isiEupnnkWjeXYpWz2DecmZhweSi4wKXUDs41s5KMBNJNeQiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7981
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_034755_085628_08C1BE97 
X-CRM114-Status: GOOD (  19.07  )
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

On 22/05/2026 21:59, Frank Li wrote:
> On Fri, May 22, 2026 at 07:52:17AM +0300, Adrian Hunter wrote:
>> On 21/05/2026 21:32, Frank Li wrote:
>>> On Fri, May 15, 2026 at 07:42:20PM +0300, Adrian Hunter wrote:
>>>> On 13/05/2026 22:03, Frank Li wrote:
>>>>> On Wed, May 13, 2026 at 08:45:55AM +0300, Adrian Hunter wrote:
>>>>>> On 12/05/2026 19:39, Frank Li wrote:
>>>>>>> On Tue, May 12, 2026 at 03:17:30PM +0300, Adrian Hunter wrote:
>>>>>>>> Master drivers may invoke i3c_master_do_daa_ext() during resume to
>>>>>>>> re-run Dynamic Address Assignment.  As well as assigning addresses to
>>>>>>>> any newly arrived devices, this restores the dynamic address of devices
>>>>>>>> that lost it across system suspend, so it has to run as part of the
>>>>>>>> controller's resume path.
>>>>>>>>
>>>>>>>> A side effect of i3c_master_do_daa_ext() today is that it also
>>>>>>>> registers any newly discovered I3C devices with the driver model
>>>>>>>> inline, via i3c_master_register_new_i3c_devs().  Doing that from the
>>>>>>>> resume path is problematic: a hot-join-capable device may join the bus
>>>>>>>> during this same DAA, and registering it immediately would push driver
>>>>>>>> model work (probing, sysfs, etc.) into the controller's resume context,
>>>>>>>> where the rest of the system is not yet fully resumed and the
>>>>>>>> controller driver is still partway through its own resume sequence.
>>>>>>>>
>>>>>>>> Decouple discovery from registration: add a reg_work work item to
>>>>>>>> struct i3c_master_controller and have i3c_master_do_daa_ext() queue it
>>>>>>>> on master->wq (the freezable workqueue) instead of calling
>>>>>>>> i3c_master_register_new_i3c_devs() directly.  The worker performs the
>>>>>>>> registration only when the controller is not shutting_down, and is
>>>>>>>> cancelled alongside hj_work in i3c_master_shutdown().  Because wq is
>>>>>>>> freezable, any newly observed devices end up being registered after
>>>>>>>> the system has finished resuming.
>>>>>>>>
>>>>>>>> i3c_master_register() also routes its initial post-bus-init registration
>>>>>>>> through reg_work, using flush_work() to keep probe-time behavior
>>>>>>>> synchronous.  This keeps a single registration code path and ensures the
>>>>>>>> worker is the only writer of desc->dev.
>>>>>>>
>>>>>>> why not direct use hj_work?
>>>>>>
>>>>>> i3c_master_register_new_i3c_devs() use of desc->dev is racy, so
>>>>>> i3c_master_register_new_i3c_devs() must not be allowed to race
>>>>>> with itself.  Having it only ever run via reg_work achieves that.
>>>>>
>>>>> Sorry, I have not understand these, Can provide some detail?
>>>>
>>>> >From i3c_master_register_new_i3c_devs():
>>>>
>>>> 	i3c_bus_for_each_i3cdev(&master->bus, desc) {
>>>> 		if (desc->dev || !desc->info.dyn_addr || desc == master->this)
>>>> 			continue;
>>>>
>>>> 		desc->dev = kzalloc_obj(*desc->dev);
>>>> 		...
>>>> 		ret = device_register(&desc->dev->dev);
>>>>
>>>> This is done under the shared i3c_bus_normaluse_lock(), so there can
>>>
>>> i3c_bus_normaluse_lock() may is wrong, suppose it should be
>>> i3c_bus_maintenance_lock(), register new devices change i3c bus's
>>> hierarchical structure.
>>
>> If device_register() probes the device and the probe tries to
>> access the device, won't it deadlock if i3c_bus_maintenance_lock()
>> is held.
> 
> Okay,
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Thanks!

If you have time, there is still patch 2 of the patch set to review ;-)

	https://lore.kernel.org/linux-i3c/20260518115520.98335-3-adrian.hunter@intel.com

> 
>>
>>>
>>> Frank
>>>
>>>> be 2 or more instances of i3c_master_register_new_i3c_devs() running
>>>> at the same time.  They might all see desc->dev is NULL and then all
>>>> of them try to initialize and register a dev for the same I3C device.
>>>>
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
