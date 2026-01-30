Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A28D6103B
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jan 2026 07:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MWC4PeHm7DsJrj63jAQVypY3WRS12HggyYy1j24Njnc=; b=EtK3g167H8Wv9ftmgPOnbeEFE7
	5N0q8PA3cQr3aaz2eXIJBdjaXD2HnSfJeEshzCI/YyqJ3vURfaVEw7d65nu/IWGYBRna2g5G4/N4V
	BVeLF3LvYs2btzF0/6BhOA4N/ZizH2tmuOjx/W2TgLHLNrKfbRUYPov/wMc5uA2rF91bqh12TfVmK
	m2+i03y57nyM+S+3AAydTzipldN1POt+zPHXRqjBixutJN5TeJcDV9EJjh073pJickx4ewv77n9nC
	y9vQFkrjmysOPnOeRWqYA7ZmhEyg4DILiML15tbK4EHc3IHVSC0Venjycr6385X0ryqM4BH9IW3YY
	vAJ6HRJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliUp-000000017JX-0ush;
	Fri, 30 Jan 2026 07:00:47 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliUm-000000017JB-3byA
	for linux-i3c@lists.infradead.org;
	Fri, 30 Jan 2026 07:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769756445; x=1801292445;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C+2weQo6YmdFfMUwj5foN8ghHCnKcIaPK5CvhRc3m/g=;
  b=gomkKqhlUfVvYXm7g2d+OxEQd2ZBssAikryRi03MOWoJ4TqtCJCKXneb
   DWxa/T7g0io8KX6MPb0jUf8ceZbepzQlbsb6IcBqY14T9h4JeuLYo+x3M
   lAzDBXs1aAZoHyrQi8v8oWrImRfmoRpIARqjoNq4f0BpBVfLuEivpmofa
   kq0qVeybFTQgCV/KHMaScpk6dXq7fvEM/9DXX9iCGDPyLqY2AZFylmGsB
   gN0MqNZ0DJqhgAExLoxdYknZeqwdYyw8FUTEFc0iJyueC3y14bajAG/UM
   BGUM3MO2TCKIT55EdXZNggxpZRa7HeQOzJyrBwkY5tlQxf6tGOv11S608
   Q==;
X-CSE-ConnectionGUID: Pw+UF6EkQwucMIHM8tO1FA==
X-CSE-MsgGUID: gIKcTqPISnC7omlub5+skQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70910964"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="70910964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 23:00:44 -0800
X-CSE-ConnectionGUID: 8BwEThfQSdG4PWuSnMY/UQ==
X-CSE-MsgGUID: nUvkagQmR5uAreHhde6Duw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="208380635"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 23:00:44 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 23:00:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 23:00:43 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 23:00:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGoIBH8DgNb6y2WI5j/rawDm5Giaf68xAG3U2044F3CH/TLEy1fdDuH652CvkR2e6m3nRP6aIw1fyLfp/ByzwcBjQf3c/eMWA04dWzwDeK0vBHuGQo5+dU4TYopjjBs11eQDeLSfTdYNRCqFxpw/X4mESl5ubnqgsxRsW19JW4mxCBSgONrYmgOOnkhfq1+jyfBnu0mf+q2OjMt8OXYEKrT200pm/h0u5p2Oitd/GBQRsgWZ6LzWsDN+6CO3IP9aJ+gR2aHyCG99qiYzybiI1fFuSQ9BSIRaxEEqLTdxJeYsdg42EWcVXs8n2jcoCfco4T6JSSnCBfTayBHZLWVh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3LvbuNDy7MYvJTv6xWf6Gc50exDgi2o9Ktx/1DUIlI=;
 b=G2kJjrtL8S0hvJ0l1O79Tz4rcbpTBedSZ8goxjmQWzuFdCW4cIOI1QePxdGRajClfGZUdVAvC43tKN1MvnWcOi5oDLU6fK1obkq5+Icgc21nOgU8aGv085z9SpXiOJkN1qqBAr+6rL+n2oI7p7QsO0Ki0FAosZBEcsLFKcmHT7vW45Jwd9G2gUpb14CCXW3Ic5Qyf6TYIHdOGAv3L0bvF+JPhUE1zZAkF2hOCA9ZzITWaOdlRtrKLzd2U3Ro9Y5RYhEnbOgtYTaM4oJJd7IctveyzTEzVVsrt8bC7iQPgrHl+io187sJsfVbvIKkXsz7EFj2iWv9hS3wrp7POmwyvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SN7PR11MB7044.namprd11.prod.outlook.com (2603:10b6:806:29b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 07:00:37 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 07:00:37 +0000
Message-ID: <a8a608c8-c6ce-415b-ac02-db1246edb15e@intel.com>
Date: Fri, 30 Jan 2026 09:00:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] i3c: mipi-i3c-hci: Allow parent to manage runtime PM
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
 <20260129181841.130864-6-adrian.hunter@intel.com>
 <aXu8TiFpMiIVk5Iq@lizhi-Precision-Tower-5810>
 <dd681a97-de37-436b-b09e-5173c1de2f24@intel.com>
 <aXvKZK8tTnCDGzth@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aXvKZK8tTnCDGzth@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DB9PR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::22) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SN7PR11MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: b1548bc3-07ac-4366-2e72-08de5fcd4578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzAxV2lnQXpCZHNQbHJRZTI2Zk1jYzhMeHBGZkYwKzJRSFpiRWJPMkRGZlJo?=
 =?utf-8?B?QUpVZ3ZVSDJDY3dtc1BqL1JGbHBicU9NSUJiU2p5RFZvRjNna1Y3TXd0QzM3?=
 =?utf-8?B?ZUpqWlVSL3VEQUlwTVZSNXdqdE5wYnk0Y1lXdXk2UjRzZy80SVlPdDQybFRT?=
 =?utf-8?B?SzhYWkR6NlJISnhJTWE0MFRBMGJMVUgrQ1Vvd2dYT25sVTNDeG9DOWpLMlNx?=
 =?utf-8?B?RnF0YUtLS09ZQ3g3OFltOGZRUCswc2JkV1Z2K0liTEVVOFVDbDliR1VxZnYw?=
 =?utf-8?B?TC9nQlJFVGt6SUpodjhiV1Y0ZStDTnhoZlptaHladnArMGpFRVZuajJmUkU5?=
 =?utf-8?B?b1lPbmpTTUdvSkpjM2Q0dXFVUFp6WmtIdENCcjBOVnVqTmVFNjM0ZkVhVENa?=
 =?utf-8?B?cGZja2VHbExUclh5QzJ6V0FmNDJXNkQrdG1UQk5SakkxZXlqSTJDbktSK1F1?=
 =?utf-8?B?Ti85NUFFWEc2MHNTRE12QnZ0Y29qYjZVQTNMUWFndnZHS2w1ZDFFTEIyR0pK?=
 =?utf-8?B?NjJFWFNXbzF3NTJjNXlNZmwzNkxGZGNhNXV2dDhaaG9WUGtESDdMUXRYTFV1?=
 =?utf-8?B?VnVIbVZnV1BlS3ZRNFV4QmplQjZONHBycTN2b0JzdEthOUdtT01BWnZ5cGN1?=
 =?utf-8?B?cENhd0lIWWI5cDAvTUU3eEFkTE9uZjlaMXdVSVFFM1pxeWo1Y0ZaNjRjQ3Br?=
 =?utf-8?B?RGFTM0tWRk1QcThudGd5S2VhQVlhU1dvQmt3OUp3NFpUbUtTbDlhY2JrVVNP?=
 =?utf-8?B?anhjR2pKaG0zTm1oZjVPMVdTK0ZUaE5pK3hBeTJmYkZPSEk1ZHF6cEpwN1lD?=
 =?utf-8?B?ZGdsRkVQM0Znc2huRjVrenZrYS92V1NmUDBITWZnUUhPVVZmS1pOWmNIakFV?=
 =?utf-8?B?d3JqNndhN2hLTHlNTVRnekVibzVscDNRNnNvaVhsMzB0TU9Ceis2eG9Ebk1L?=
 =?utf-8?B?Q053UEI1SnBuRU5XaktjY09vdndOTTUvN0xscUFXeGxLWm9iSWZyVkZvYVZP?=
 =?utf-8?B?Skw0UEtKYzMwNmt3ZllFZUliazJBNWU3NHZuT1dVMXU3dG5XSkVvMytFd2NS?=
 =?utf-8?B?NnNmc1haUjZDMEpJUFdtZHFDTU53UTFSU1luNFl1VXF0SUVnRUlpdlRpWU9i?=
 =?utf-8?B?ejBVNjV0K0R5OWxEOFIvOHBKcGp3YUVVbHRiSGpDd1R5b1VEQmpuVFdacTda?=
 =?utf-8?B?aE4zeUNER1Y1L1NqWE1xbUt4MCtTazlzSVpra3d4Tnh3bWhnTHhyYW82N0dV?=
 =?utf-8?B?YmN3ZWptZlB2Mk1CV0loK2s0Tjhqb0pvREhpR1BuckVYUjBMcmxURjMxa2d6?=
 =?utf-8?B?MkxjVEFjMHhiUk1zQWxBZFVOZEJld2J3NDNqQ05kbmFpZXFZc21nYkdqTDhT?=
 =?utf-8?B?VS9iaDBOUk0wYVhhYkxNZXFBRG1MQVdrU0hacE9KMDB6cjFub01MTUNmT2Rv?=
 =?utf-8?B?RUNkZTRWS09lUWRteTNxN1AwdmRnVzNUdk1PTlNNY2FSTCsvcHA2K21oRVhM?=
 =?utf-8?B?aThMSXFZeHl5OUV5ck14L0tpSHBPMW5DTWlsUEpmRlNsejU5RTNRdnhVT01y?=
 =?utf-8?B?N1o1b1haQmtkRmNlbWFuREpSWlpDcTIwcjljZlVZS0hIbmVDT25YTVAxNGhh?=
 =?utf-8?B?ZlBxZC9jUWVaQ3luR1hJaWNoaFpBaDhHL3BWNkVTK2NINUFBUmJwVGI0eUpC?=
 =?utf-8?B?ZWJxeDNFNWtDa1MwMVNNNjdlc3dRZjRMUHY4cWJ2SHIwaXBRWmxDclA1ZXZF?=
 =?utf-8?B?Y2VPQ2ZpbFJZdHZWMnAxT3ZXSUpnN3B5ZlN4VEp3ME5kOGV4NzloQmZ0YTZD?=
 =?utf-8?B?WWc3T2JUL0N0d040a3l5cWhRQmI4WlFkNVhCU2pVRm8rMmcvVjhYNlFub0hr?=
 =?utf-8?B?K1haZEt1SGt0bDMwNklzdTBSN2prZG5yS1VmejJiRkpucFNYdkJxTlE3UkZB?=
 =?utf-8?B?MGpJUS9WdjJ6V0N1aEhPODl6bE1JNndkRUgxc3hWTERYZnZSdTQ5dnRuWDRJ?=
 =?utf-8?B?UGhxNmhKSDFwUzRobG5PeS9kU1ZkQWh3OGFEaE5GeVRTcXZSSk9JcUxVdjRu?=
 =?utf-8?B?RC8wK3BpdS9uclpCbWJnWldHNi9QVXdiWUQ0bkdxTGo2NVNjTUpjWndrQmpk?=
 =?utf-8?Q?am4A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1RYRHVueXRrbHI2NFFSSU92RG1zVGE0bUhHZmQvTS8vMzVLZWU3cHA0SUF3?=
 =?utf-8?B?NmJZam90Zk5nYnp3bUdBWWdxYkNFV1Z1UHFvaEExdXUvY3BkNUNSVHJyaTY2?=
 =?utf-8?B?ZE1MNlVJNCtuQUZSNzJaS1ZOMDQ0cndQWWNhcGkvMDdZQ000QWFGTnFkZUtx?=
 =?utf-8?B?RjNNcEJHZFkxQnhIRzBKSXFZd1BNU3E4bklKaDVwNDhmTEcvOEdHL0hydVRz?=
 =?utf-8?B?TjdBYkV6akdVdlFXelByNHpQT2lsdTZYUno1T29kMktqbmlTUkxrRXJZTEFy?=
 =?utf-8?B?WWxIRmU0OXVvL0o0a2lJUDVxYktOTkVTVUthYXk4YVF5cld2bjlxRGtPNlQ4?=
 =?utf-8?B?TWdueTZuV3FqblNSTlBSVWt0ZWpiTXJWT1BwNWVydGl1VFFPSTBzZk9mMFFQ?=
 =?utf-8?B?WG1sWkFHa2NLTXFPb09ld0JyTU5SZVl1dmZpUERPd0VFQWhZNWhGazZ2cXdi?=
 =?utf-8?B?U04wODk1V3hOREFZeVBWbW5ybm5sK3FMbUc1R0hLbWJJVzY5akRvckFEZGhF?=
 =?utf-8?B?dUJWcVowSERFNzlJWlczbkJDRW55RXlFZWRQU3FkOGdCR1J4RVhxNjdoZytt?=
 =?utf-8?B?WkdpMmdGd3lqcExJN210eG5WYm1HR1VDU2dLaDNGYlNGYzNSVGJOMW45ZHBW?=
 =?utf-8?B?N25SSExIcmxKVENPaWVyU0RpTjBlaVpBMWVMb2ZnYXNpcDIrOXlyd2RXeFU0?=
 =?utf-8?B?QzhIanRyMHEzRTBSS3V2dzZtUXZtMjZsdElGaWNqSFVBN0I5TTlmM3FFM0pB?=
 =?utf-8?B?RFNKY0tzT2gyK3g2YnFtVGJmNlFQMG9GNVUzT091dDM3ZENkZkFxN1RBcnEz?=
 =?utf-8?B?MVNWajU4OXNFSDUxSStjRTlYcGM3RjF1N3h3MElGd0phRUkwUURHQzdpeWVH?=
 =?utf-8?B?Y2JScjBpd0RJdUFNTWk2djYvMEZjbGlQcnZBNkhJS3ZCSlpTOXV2L29ReXdn?=
 =?utf-8?B?bUZYeTIxUlZpV1ZWSVNlTlU3ZGFUcVlLZmxDLzdZU2tJa3NJdUprTWdvcWdu?=
 =?utf-8?B?OGtRNmtFQW96Z0NrQkRMODJ4WWh3LzMrNHFEWEYyUUgzUE5jTW5nZndTVXJX?=
 =?utf-8?B?L3Z6Q0VZblBaVUFUcmVzWlBGODFLUUNhLzBETnBYaWNFRVJJUGl3S01DdWRR?=
 =?utf-8?B?bDh4UzNiVktpZFFKQXNtdElyR1R0aSt2V0xCbFI4WDlVQlMzcVBiWlVBQkFo?=
 =?utf-8?B?bVNQRjk4TXhBc0tOM0orTGR3S1pmNGJHUzRsQUsrMGk5RkxPTnJLUFYyb00x?=
 =?utf-8?B?RU5mQUovcUNMaklyL2lQVVBDYUhmODNlTTRidWMvaHR3djYydU0vM2JYRUtH?=
 =?utf-8?B?Qk85N2ZpVDNhaldVOFFzM1VycC9Kb1YzdW80ZE5qRUxOVGxxS1U4dDhrVHFS?=
 =?utf-8?B?Um9adWFQcmJnNXpVOGVkbDJ4K0JkTFlyOVkxYktkOGpYMHk0SWRJaTIwQk51?=
 =?utf-8?B?K29LemdNbFk5dDhEZEgrUGhsSlV0SENabVBtMUFGUms0ZTJJQ2VkVWlIN2Vm?=
 =?utf-8?B?Z1VvOTV0YVV6MmhMTG5xNWphUU9nMmNaWjZ4cTJybWRUTS9YcndBcDRucVNN?=
 =?utf-8?B?MmVqZW9aZmExN2FGSkR4RzZFQXJRakpaTWpXdzF0T3VLTVNVckRhWDBJZ0Nj?=
 =?utf-8?B?Tmd3T29yNUt2REduY3I5YUxhVE9HK3BJY2NVaDFOVzkrMk1HYkpMOWN5ZG1i?=
 =?utf-8?B?Q1VqS29yWUV0SlcyMGZSUFJuRlVBWXpzNWNUUWhPLzhiN01qbFJVVlpoMEtp?=
 =?utf-8?B?V0ZwTlkxcENxaEU1d214am05dld0dzZoaFFyUkU5VGtRZHVydWpUL3JzamdO?=
 =?utf-8?B?d1NjYmtOenBlYkdYaWFTcjJCMTEvNEM0QU1lMzJGVW96c3NJMG9PeGN0aVVO?=
 =?utf-8?B?QjhSK1ZGKytlWUh2VEI3Q3ViVkE4aldTUzdmNVE4VldoajROeTBPVFlHZjVX?=
 =?utf-8?B?RHBOK1NNQy9KUUhxVVJzNWxiMW1ERVhsQmZZZGVibjVyUlRrbU9hbkF2REQ2?=
 =?utf-8?B?VzVqdTg4eTBtZWt5dFg4c0o4SE41cVk1a3RMV05SRGFuWm9ESnlTeTM4SERM?=
 =?utf-8?B?RTM5Z04zZEtoLzJYTWJGK25pYm1YVnh3aCsvbmUrY3E3bE9lZVBYaFI1ai9v?=
 =?utf-8?B?T1AyeitlcDN4ckRtK3lyWVpuSGJKUlJ5SWI4YjdRV3dtaGlUNWZDSlM4ZHgv?=
 =?utf-8?B?cnAxQmd4UFc2L1pNL2kyTzMvRENDcWtRR1d3Z3c5ditpUStYMmRKNnV3Z1JW?=
 =?utf-8?B?SjlSWlh5SW5IMGdaTTZONWlwRVh2RElyajc1clIweHhwTUl1QTQzbU9CUXV6?=
 =?utf-8?B?MGdBWnFhK0haRTFaN0l5ZGVMQVA0dG4vRzNvUWRFdFhJeXk0L09odz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1548bc3-07ac-4366-2e72-08de5fcd4578
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 07:00:37.4425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JaQh8PwQUWQ4/dh4RbNEI9q0k5HW940W6YCCssu+ItGcMPlm51gud12z4LG7zKEQ2+qPEODHLmEvAgxzciwzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_230044_941990_24AA8FBD 
X-CRM114-Status: GOOD (  20.77  )
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

T24gMjkvMDEvMjAyNiAyMzowMCwgRnJhbmsgTGkgd3JvdGU6Cj4gT24gVGh1LCBKYW4gMjksIDIw
MjYgYXQgMTA6Mjg6MTRQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3cm90ZToKPj4gT24gMjkvMDEv
MjAyNiAyMjowMCwgRnJhbmsgTGkgd3JvdGU6Cj4+PiBPbiBUaHUsIEphbiAyOSwgMjAyNiBhdCAw
ODoxODozOVBNICswMjAwLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+Pj4+IFNvbWUgcGxhdGZvcm1z
IGltcGxlbWVudCB0aGUgTUlQSSBJM0MgSENJIE11bHRpLUJ1cyBJbnN0YW5jZSBjYXBhYmlsaXR5
LAo+Pj4+IHdoZXJlIGEgc2luZ2xlIHBhcmVudCBkZXZpY2UgaG9zdHMgbXVsdGlwbGUgSTNDIGNv
bnRyb2xsZXIgaW5zdGFuY2VzLiAgSW4KPj4+PiBzdWNoIGRlc2lnbnMsIHRoZSBwYXJlbnQgLSBu
b3QgdGhlIGluZGl2aWR1YWwgY2hpbGQgaW5zdGFuY2VzIC0gbWF5IG5lZWQgdG8KPj4+PiBjb29y
ZGluYXRlIHJ1bnRpbWUgUE0gc28gdGhhdCBhbGwgY29udHJvbGxlcnMgZW50ZXIgbG93LXBvd2Vy
IHN0YXRlcwo+Pj4+IHRvZ2V0aGVyLCBhbmQgYWxsIHJ1bnRpbWUgc3VzcGVuZCBjYWxsYmFja3Mg
YXJlIGludm9rZWQgaW4gYSBjb250cm9sbGVkCj4+Pj4gYW5kIHN5bmNocm9uaXplZCBtYW5uZXIu
Cj4+Pj4KPj4+PiBGb3IgZXhhbXBsZSwgaWYgdGhlIHBhcmVudCBlbmFibGVzIElCSS13YWtldXAg
d2hlbiB0cmFuc2l0aW9uaW5nIGludG8gYQo+Pj4+IGxvdy1wb3dlciBzdGF0ZSwKPj4+Cj4+PiBE
b2VzIHlvdXIgaGFyZHdhcmUgc3VwcG9ydCByZWNpZXZlIElCSSB3aGVuIHJ1bnRpbWUgc3VzcGVu
ZD8KPj4KPj4gV2hlbiBydW50aW1lIHN1c3BlbmRlZCAoaW4gRDMpLCB0aGUgaGFyZHdhcmUgZmly
c3QgdHJpZ2dlcnMgYSBQb3dlciBNYW5hZ2VtZW50Cj4+IEV2ZW50IChQTUUpIHdoZW4gdGhlIFNE
QSBsaW5lIGlzIHB1bGxlZCBsb3cgdG8gc2lnbmFsIHRoZSBTVEFSVCBjb25kaXRpb24gb2YgYW4g
SUJJLgo+PiBUaGUgUENJIHN1YnN5c3RlbSB3aWxsIHRoZW4gcnVudGltZS1yZXN1bWUgdGhlIGRl
dmljZS4gIFdoZW4gdGhlIGJ1cyBpcyBlbmFibGVkLAo+PiB0aGUgY2xvY2sgaXMgc3RhcnRlZCBh
bmQgdGhlIElCSSBpcyByZWNlaXZlZC4KPiAKPiBJdCBhbGlnbiBteSBhc3N1bXB0aW9uLCB3aHkg
bmVlZCBjb21wbGV4IHNvbHV0aW9uLgo+IAo+IFNEQS0+UE1FLT5JUlEgc2hvdWxkIGhhbmRsZSBi
eSBoYXJkd2FyZSwgc28gaXJxIGhhbmRsZSBxdWV1ZSBJQkkgdG8gd29ya2luZwo+IHF1ZXVlLgo+
IAo+IElCSSB3b3JrIHdpbGwgdHJ5IGRvIHRyYW5zZmVyLCB3aGljaCB3aWxsIGNhbGwgcnVudGlt
ZSByZXN1bWUoKSwgdGhlbgo+IHRyYW5zZmVyIGRhdGEuCj4gCj4gV2hhdCdzIGlzc3VlPwoKVGhl
IFBNRSBpbmRpY2F0ZXMgSTNDIFNUQVJUIChTREEgbGluZSBwdWxsZWQgbG93KS4gIFRoZSBjb250
cm9sbGVyIGlzCmluIGEgbG93IHBvd2VyIHN0YXRlIHVuYWJsZSB0byBvcGVyYXRlIHRoZSBidXMu
ICBBdCB0aGlzIHBvaW50IGl0IGlzIG5vdAprbm93biB3aGF0IEkzQyBkZXZpY2UgaGFzIHB1bGxl
ZCBkb3duIHRoZSBTREEgbGluZSwgb3IgZXZlbiBpZiBpdCBpcyBhbgpJQkkgc2luY2UgaXQgaXMg
aW5kaXN0aW5ndWlzaGFibGUgZnJvbSBob3Qtam9pbiBhdCB0aGlzIHBvaW50LgoKVGhlIFBDSSBQ
TUUgSVJRIGlzIG5vdCB0aGUgZGV2aWNlJ3MgSVJRLiAgSXQgaXMgaGFuZGxlZCBieSBhY3BpX2ly
cSgpCndoaWNoIHVsdGltYXRlbHkgaW5mb3JtcyB0aGUgUENJIHN1YnN5c3RlbSB0byB3YWtlIHRo
ZSBQQ0kgZGV2aWNlLgpUaGUgUENJIHN1YnN5c3RlbSBwZXJmb3JtcyBwbV9yZXF1ZXN0X3Jlc3Vt
ZSgpLCByZWZlciBwY2lfYWNwaV93YWtlX2RldigpLgoKV2hlbiB0aGUgY29udHJvbGxlciBpcyBy
ZXN1bWVkLCBpdCBlbmFibGVzIHRoZSBJM0MgYnVzIGFuZCB0aGUgSUJJIGlzCmZpbmFsbHkgZGVs
aXZlcmVkIG5vcm1hbGx5LgoKSG93ZXZlciwgbm9uZSBvZiB0aGF0IGlzIHJlbGF0ZWQgdG8gdGhp
cyBwYXRjaC4KClRoaXMgcGF0Y2ggaXMgYmVjYXVzZSB0aGUgUENJIGRldmljZSBoYXMgMiBJM0Mg
YnVzIGluc3RhbmNlcyBhbmQgb25seSAxIFBNRQp3YWtldXAuICBUaGUgUE1FIGJlY29tZXMgYWN0
aXZlIHdoZW4gdGhlIFBDSSBkZXZpY2UgaXMgcHV0IHRvIGEgbG93CnBvd2VyIHN0YXRlLiAgQm90
aCBJM0MgYnVzIGluc3RhbmNlcyBtdXN0IGJlIHJ1bnRpbWUgc3VzcGVuZGVkIHRoZW4uClNpbWls
YXJseSwgdXBvbiByZXN1bWUgdGhlIFBNRSBpcyBubyBsb25nZXIgYWN0aXZlLCBzbyBib3RoIEkz
QyBidXMgaW5zdGFuY2VzCm11c3QgbWFrZSB0aGVpciBidXNlcyBvcGVyYXRpb25hbCAtIHdlIGRv
bid0IGtub3cgd2hpY2ggbWF5IGhhdmUgcmVjZWl2ZWQKYW4gSUJJLiAgQW5kIHRoZXJlIG1heSBi
ZSBmdXJ0aGVyIElCSXMgd2hpY2ggY2FuJ3QgYmUgcmVjZWl2ZWQgdW5sZXNzIHRoZQphc3NvY2lh
dGVkIGJ1cyBpcyBvcGVyYXRpb25hbC4gIFRoZSBQQ0kgZGV2aWNlIGlzIG5vIGxvbmdlciBpbiBh
IGxvdyBwb3dlcgpzdGF0ZSwgc28gdGhlcmUgd2lsbCBiZSBubyBQTUUgaW4gdGhhdCBjYXNlLgoK
PiAKPiBGcmFuawo+IAo+Pgo+Pj4KPj4+IEZyYW5rCj4+Pgo+Pj4+IGV2ZXJ5IGJ1cyBpbnN0YW5j
ZSBtdXN0IHJlbWFpbiBhYmxlIHRvIHJlY2VpdmUgSUJJcyB1cAo+Pj4+IHVudGlsIHRoYXQgcG9p
bnQuICBUaGlzIHJlcXVpcmVzIGRlZmVycmluZyB0aGUgaW5kaXZpZHVhbCBjb250cm9sbGVyc+KA
mQo+Pj4+IHJ1bnRpbWUgc3VzcGVuZCBjYWxsYmFja3MgKHdoaWNoIGRpc2FibGUgYnVzIGFjdGl2
aXR5KSB1bnRpbCB0aGUgcGFyZW50Cj4+Pj4gZGVjaWRlcyBpdCBpcyBzYWZlIGZvciBhbGwgaW5z
dGFuY2VzIHRvIHN1c3BlbmQgdG9nZXRoZXIuCj4+Pj4KPj4+PiBUbyBzdXBwb3J0IHRoaXMgdXNh
Z2UgbW9kZWw6Cj4+Pj4KPj4+PiAgICogRXhwb3J0IHRoZSBjb250cm9sbGVyJ3MgcnVudGltZSBQ
TSBzdXNwZW5kL3Jlc3VtZSBjYWxsYmFja3Mgc28gdGhhdAo+Pj4+ICAgICB0aGUgcGFyZW50IGNh
biBpbnZva2UgdGhlbSBkaXJlY3RseS4KPj4+Pgo+Pj4+ICAgKiBBZGQgYSBuZXcgcXVpcmssIEhD
SV9RVUlSS19SUE1fUEFSRU5UX01BTkFHRUQsIHdoaWNoIGRlc2lnbmF0ZXMgdGhlCj4+Pj4gICAg
IHBhcmVudCBkZXZpY2UgYXMgdGhlIGNvbnRyb2xsZXLigJlzIHJ1bnRpbWUgUE0gZGV2aWNlIChy
cG1fZGV2KS4gIFdoZW4KPj4+PiAgICAgdXNlZCB3aXRob3V0IEhDSV9RVUlSS19SUE1fQUxMT1dF
RCwgdGhpcyBhbHNvIHByZXZlbnRzIHRoZSBjaGlsZAo+Pj4+ICAgICBpbnN0YW5jZeKAmXMgc3lz
dGVtLXN1c3BlbmQgY2FsbGJhY2tzIGZyb20gdXNpbmcKPj4+PiAgICAgcG1fcnVudGltZV9mb3Jj
ZV9zdXNwZW5kKCkvcG1fcnVudGltZV9mb3JjZV9yZXN1bWUoKSwgc2luY2UgcnVudGltZQo+Pj4+
ICAgICBQTSBpcyBtYW5hZ2VkIGVudGlyZWx5IGJ5IHRoZSBwYXJlbnQuCj4+Pj4KPj4+PiAgICog
TW92ZSBERUZBVUxUX0FVVE9TVVNQRU5EX0RFTEFZX01TIGludG8gdGhlIGhlYWRlciBzbyBpdCBj
YW4gYmUgc2hhcmVkCj4+Pj4gICAgIGJ5IHBhcmVudC1tYW5hZ2VkIFBNIGltcGxlbWVudGF0aW9u
cy4KPj4+Pgo+Pj4+IFRoZSBuZXcgcXVpcmsgYWxsb3dzIHBsYXRmb3JtcyB3aXRoIG11bHRpLWJ1
cyBwYXJlbnQtbWFuYWdlZCBQTQo+Pj4+IGluZnJhc3RydWN0dXJlIHRvIGNvcnJlY3RseSBjb29y
ZGluYXRlIHJ1bnRpbWUgUE0gYWNyb3NzIGFsbCBJM0MgSENJCj4+Pj4gaW5zdGFuY2VzLgo+Pj4+
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5j
b20+Cj4+Pj4gLS0tCj4+Pj4gIGRyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5j
IHwgMjUgKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+Pj4+ICBkcml2ZXJzL2kzYy9tYXN0ZXIv
bWlwaS1pM2MtaGNpL2hjaS5oICB8ICA2ICsrKysrKwo+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDIy
IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIv
bWlwaS1pM2MtaGNpL2NvcmUuYwo+Pj4+IGluZGV4IGVjNGRiZTY0YzM1ZS4uY2I5NzRiMGY5ZTE3
IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5j
Cj4+Pj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPj4+PiBA
QCAtNzMzLDcgKzczMyw3IEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9yZXNldF9hbmRfaW5pdChzdHJ1
Y3QgaTNjX2hjaSAqaGNpKQo+Pj4+ICAJcmV0dXJuIDA7Cj4+Pj4gIH0KPj4+Pgo+Pj4+IC1zdGF0
aWMgaW50IGkzY19oY2lfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPj4+PiAr
aW50IGkzY19oY2lfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPj4+PiAgewo+
Pj4+ICAJc3RydWN0IGkzY19oY2kgKmhjaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+Pj4+ICAJ
aW50IHJldDsKPj4+PiBAQCAtNzQ2LDggKzc0Niw5IEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9ydW50
aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+Pj4+Cj4+Pj4gIAlyZXR1cm4gMDsKPj4+
PiAgfQo+Pj4+ICtFWFBPUlRfU1lNQk9MX0dQTChpM2NfaGNpX3J1bnRpbWVfc3VzcGVuZCk7Cj4+
Pj4KPj4+PiAtc3RhdGljIGludCBpM2NfaGNpX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikKPj4+PiAraW50IGkzY19oY2lfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2
KQo+Pj4+ICB7Cj4+Pj4gIAlzdHJ1Y3QgaTNjX2hjaSAqaGNpID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7Cj4+Pj4gIAlpbnQgcmV0Owo+Pj4+IEBAIC03NjgsNiArNzY5LDcgQEAgc3RhdGljIGludCBp
M2NfaGNpX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPj4+Pgo+Pj4+ICAJcmV0
dXJuIDA7Cj4+Pj4gIH0KPj4+PiArRVhQT1JUX1NZTUJPTF9HUEwoaTNjX2hjaV9ydW50aW1lX3Jl
c3VtZSk7Cj4+Pj4KPj4+PiAgc3RhdGljIGludCBpM2NfaGNpX3N1c3BlbmQoc3RydWN0IGRldmlj
ZSAqZGV2KQo+Pj4+ICB7Cj4+Pj4gQEAgLTc4NCwxMiArNzg2LDE0IEBAIHN0YXRpYyBpbnQgaTNj
X2hjaV9yZXN1bWVfY29tbW9uKHN0cnVjdCBkZXZpY2UgKmRldiwgYm9vbCByc3RkYWEpCj4+Pj4g
IAlzdHJ1Y3QgaTNjX2hjaSAqaGNpID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4+Pj4gIAlpbnQg
cmV0Owo+Pj4+Cj4+Pj4gLQlpZiAoIShoY2ktPnF1aXJrcyAmIEhDSV9RVUlSS19SUE1fQUxMT1dF
RCkpCj4+Pj4gLQkJcmV0dXJuIDA7Cj4+Pj4gKwlpZiAoIShoY2ktPnF1aXJrcyAmIEhDSV9RVUlS
S19SUE1fUEFSRU5UX01BTkFHRUQpKSB7Cj4+Pj4gKwkJaWYgKCEoaGNpLT5xdWlya3MgJiBIQ0lf
UVVJUktfUlBNX0FMTE9XRUQpKQo+Pj4+ICsJCQlyZXR1cm4gMDsKPj4+Pgo+Pj4+IC0JcmV0ID0g
cG1fcnVudGltZV9mb3JjZV9yZXN1bWUoZGV2KTsKPj4+PiAtCWlmIChyZXQpCj4+Pj4gLQkJcmV0
dXJuIHJldDsKPj4+PiArCQlyZXQgPSBwbV9ydW50aW1lX2ZvcmNlX3Jlc3VtZShkZXYpOwo+Pj4+
ICsJCWlmIChyZXQpCj4+Pj4gKwkJCXJldHVybiByZXQ7Cj4+Pj4gKwl9Cj4+Pj4KPj4+PiAgCXJl
dCA9IGkzY19tYXN0ZXJfZG9fZGFhX2V4dCgmaGNpLT5tYXN0ZXIsIHJzdGRhYSk7Cj4+Pj4gIAlp
ZiAocmV0KQo+Pj4+IEBAIC04MTIsOCArODE2LDYgQEAgc3RhdGljIGludCBpM2NfaGNpX3Jlc3Rv
cmUoc3RydWN0IGRldmljZSAqZGV2KQo+Pj4+ICAJcmV0dXJuIGkzY19oY2lfcmVzdW1lX2NvbW1v
bihkZXYsIHRydWUpOwo+Pj4+ICB9Cj4+Pj4KPj4+PiAtI2RlZmluZSBERUZBVUxUX0FVVE9TVVNQ
RU5EX0RFTEFZX01TIDEwMDAKPj4+PiAtCj4+Pj4gIHN0YXRpYyB2b2lkIGkzY19oY2lfcnBtX2Vu
YWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+Pj4gIHsKPj4+PiAgCXN0cnVjdCBpM2NfaGNpICpo
Y2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPj4+PiBAQCAtOTYyLDYgKzk2NCwxMSBAQCBzdGF0
aWMgaW50IGkzY19oY2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+PiAg
CWlmIChoY2ktPnF1aXJrcyAmIEhDSV9RVUlSS19SUE1fSUJJX0FMTE9XRUQpCj4+Pj4gIAkJaGNp
LT5tYXN0ZXIucnBtX2liaV9hbGxvd2VkID0gdHJ1ZTsKPj4+Pgo+Pj4+ICsJaWYgKGhjaS0+cXVp
cmtzICYgSENJX1FVSVJLX1JQTV9QQVJFTlRfTUFOQUdFRCkgewo+Pj4+ICsJCWhjaS0+bWFzdGVy
LnJwbV9kZXYgPSBwZGV2LT5kZXYucGFyZW50Owo+Pj4+ICsJCWhjaS0+bWFzdGVyLnJwbV9hbGxv
d2VkID0gdHJ1ZTsKPj4+PiArCX0KPj4+PiArCj4+Pj4gIAlyZXR1cm4gaTNjX21hc3Rlcl9yZWdp
c3RlcigmaGNpLT5tYXN0ZXIsICZwZGV2LT5kZXYsICZpM2NfaGNpX29wcywgZmFsc2UpOwo+Pj4+
ICB9Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhj
aS9oY2kuaCBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvaGNpLmgKPj4+PiBpbmRl
eCA4MTkzMjhhODViODQuLmQwZTdhZDU4YWMxNSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2hjaS5oCj4+Pj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVy
L21pcGktaTNjLWhjaS9oY2kuaAo+Pj4+IEBAIC0xNDcsNiArMTQ3LDcgQEAgc3RydWN0IGkzY19o
Y2lfZGV2X2RhdGEgewo+Pj4+ICAjZGVmaW5lIEhDSV9RVUlSS19SRVNQX0JVRl9USExECQlCSVQo
NCkgIC8qIFNldCByZXNwIGJ1ZiB0aGxkIHRvIDAgZm9yIEFNRCBwbGF0Zm9ybXMgKi8KPj4+PiAg
I2RlZmluZSBIQ0lfUVVJUktfUlBNX0FMTE9XRUQJCUJJVCg1KSAgLyogUnVudGltZSBQTSBhbGxv
d2VkICovCj4+Pj4gICNkZWZpbmUgSENJX1FVSVJLX1JQTV9JQklfQUxMT1dFRAlCSVQoNikgIC8q
IElCSSBhbmQgSG90LUpvaW4gYWxsb3dlZCB3aGlsZSBydW50aW1lIHN1c3BlbmRlZCAqLwo+Pj4+
ICsjZGVmaW5lIEhDSV9RVUlSS19SUE1fUEFSRU5UX01BTkFHRUQJQklUKDcpICAvKiBSdW50aW1l
IFBNIG1hbmFnZWQgYnkgcGFyZW50IGRldmljZSAqLwo+Pj4+Cj4+Pj4gIC8qIGdsb2JhbCBmdW5j
dGlvbnMgKi8KPj4+PiAgdm9pZCBtaXBpX2kzY19oY2lfcmVzdW1lKHN0cnVjdCBpM2NfaGNpICpo
Y2kpOwo+Pj4+IEBAIC0xNTYsNCArMTU3LDkgQEAgdm9pZCBhbWRfc2V0X29kX3BwX3RpbWluZyhz
dHJ1Y3QgaTNjX2hjaSAqaGNpKTsKPj4+PiAgdm9pZCBhbWRfc2V0X3Jlc3BfYnVmX3RobGQoc3Ry
dWN0IGkzY19oY2kgKmhjaSk7Cj4+Pj4gIHZvaWQgaTNjX2hjaV9zeW5jX2lycV9pbmFjdGl2ZShz
dHJ1Y3QgaTNjX2hjaSAqaGNpKTsKPj4+Pgo+Pj4+ICsjZGVmaW5lIERFRkFVTFRfQVVUT1NVU1BF
TkRfREVMQVlfTVMgMTAwMAo+Pj4+ICsKPj4+PiAraW50IGkzY19oY2lfcnVudGltZV9zdXNwZW5k
KHN0cnVjdCBkZXZpY2UgKmRldik7Cj4+Pj4gK2ludCBpM2NfaGNpX3J1bnRpbWVfcmVzdW1lKHN0
cnVjdCBkZXZpY2UgKmRldik7Cj4+Pj4gKwo+Pj4+ICAjZW5kaWYKPj4+PiAtLQo+Pj4+IDIuNTEu
MAo+Pj4+Cj4+CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1pM2MK
