Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F7FCD8CA4
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Jun 2026 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BdF5MqT7az43hB40JPoRI0+c9AZvk4QAWxMPDM8/QQQ=; b=jsbLCfD27a7xerabhvN+rLckY2
	cjgUn+bPbGj3Uocm4G10/YNJJW6l95ndRNmYQ0DyTbeZAc89txacNSb0GQJTDhqJK1V7+YfK5KiGU
	vFCOXiQOEwisJtn0Jeu/cW2Spsu4fN4CQZB5ZlqE2B3DVkO8myB1SnwKrygTE0iagYfzRAabQ5rCD
	Ovajdlf+42vSL2BxsxETKKpVbMWPFiTKGVU24hZt0p/mzBkzB4u8auinJoJlbHd8SJ+XtvPXmRdva
	CkA94zlgVM2aZgflhUjBLXaeKqjag1rV9WANpo3T1d/h7oPXo+FLHXc3F75HVD7xKGtC4lHTWLUlI
	HLayhNjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsgn-00000005CQb-1Awm;
	Tue, 09 Jun 2026 09:24:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsgm-00000005CQS-0RLo
	for linux-i3c@bombadil.infradead.org;
	Tue, 09 Jun 2026 09:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:CC:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e0GSZAe5KJLrFFmmaRtk5qBm7XSDdH8CrUaAyvVNLys=; b=MJILUunPsW5tsI2j1VexgjiesU
	Z6vDNpRAGtHje17Wd3VxJ6vANGv8kjap81Ng35X6qpiGsrT2sNNwu9kt1f6Wi05OTk08UJ8pd2xo5
	7PBPpwfvMqfiRsdidRqf8CX1OTwcCjlykUsqZyOkO9iqR1wy9fAuD25Cx61twT5i72p5umBMi6AHu
	KHnMum48kqIwpnw00f2Lh5bXaN76xs55UIiEbeFYYkkGn/IHjRQ1+OZ74dIhgw8x11c43VQwRe8VX
	mlI/qVSjDGi9M4PcU/a7MaBnfwJ3bczXawBnEkck9t5r2HF2XdbZFNdmv3GsH+d/O12O3w4Yn+LxI
	LEYcI4Qw==;
Received: from mgamail.intel.com ([192.198.163.17])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWsgf-00000002FEr-0zTj
	for linux-i3c@lists.infradead.org;
	Tue, 09 Jun 2026 09:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780997037; x=1812533037;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a5rFN0RYAPnuLGsV85NLmVW2hG+ptmQFVaL+h9+v0tw=;
  b=aZy5OUuVdv7ffpkhgPRboh53tMQgabjSw4Qm81rUK2iVWLgiqaNz9F5D
   Buc6j9QrehtJ2ZCUOIXzpiT7GNqnQmWR5m2nDrO6fOAZbqoZYb7mPxsE+
   Z6WeLAkON6gZx+2bf7FtBNyUcylf175NYQAqtqNL0BwcL6NwvWe5nGGOW
   St83M2+leXtUSgusgBZ+GxKxRMRIRDJibXqADUvRRePSLf3t7wV+2Uxlo
   4aSp+2A88TCltNJW1Z9SAH88F8VHmsCbwKtwcJReNCdlzn27n6W4CZARV
   S1Fn1IEFSojitS0NHeaRGR9YZbHc23vP+tGp872wGN2dqYjEssWWBT7M8
   w==;
X-CSE-ConnectionGUID: LXAn7Y1cRVO+xxAN66nWuA==
X-CSE-MsgGUID: M0YdvIKTRouk6iwN1A1Xwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81604352"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="81604352"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 02:23:50 -0700
X-CSE-ConnectionGUID: Lx7h1BrDTA6G9vj2P9nuMg==
X-CSE-MsgGUID: tSNklWlWTUKoU71FO5mhiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="244651903"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 02:23:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 02:23:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 02:23:48 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 02:23:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cV8NTUZxrEWm9mpP4azTWn1wXFcDIVVAi45Oaw37+Cg52LikNHkTavVNvFZktDoTVKOIVRxlnUbeFu6kXKcL3blsLz5HXiiQQxaGW3Auwj+LfaCV2S8GX/jcxgVx3qtozQFfJITCdZ5DlUgTcD7pDxiaN53h+NAcSvlSmT4g6cEqfgvClsTiFDDnBWuVSyopIsS/gcPDHWTern+dycOq4iCYzqsK0xF9g0zHHWNm5t10Rm2V60CGogkLai3Kk4hrfKLbPahXO6wgQ6fvOIM6AF9J0OGuedHms+zHiiM3QwEJy64UoukIh6gaX2RxIoM9Fn9MV+U0Br1YhpGU2CC4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0GSZAe5KJLrFFmmaRtk5qBm7XSDdH8CrUaAyvVNLys=;
 b=w0kaN8HMqHUwQ3U0D3R7r1CALmCNxH2CHvHQIG0PQ3FF1xuXzrksHFdIMubijB7xyARD6GrIEGsNafeI6Vy1XbQ3L4W9QRRhpB0fm4I+Oz9poGdiarE8V+D6qU3xe7ub66umkz9YwoCcTnxr5LttaLiCHXHJoctewadhx2ZrJaTGQ/G1YEx9RXJVjq4xONvkkRbjhrQxnjRxgMEZ0HiSsk9HY01vr0OUrnZo4qg3I6rY9q6ZEe7md9xC9rP/1i+LZ+iwcYuhcZoa5K6K8kGpZ6BUfQkV1Dj5LuX2NrcIp8oc7XGNJ7xIDLNnwW4MNnn2Gh4B+QtswFIaMq/aTe362g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA0PR11MB4624.namprd11.prod.outlook.com (2603:10b6:806:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 09:23:41 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 09:23:41 +0000
Message-ID: <aa430bac-9098-484f-8f48-15a678905430@intel.com>
Date: Tue, 9 Jun 2026 12:23:36 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 7/7] i3c: master: Reconcile dynamic addresses after DAA
To: Frank Li <Frank.Li@oss.nxp.com>
CC: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
 <20260608075801.16111-8-adrian.hunter@intel.com>
 <aicEsjs6oZxp7R4N@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aicEsjs6oZxp7R4N@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU7P194CA0027.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::7) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA0PR11MB4624:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f46e978-7491-4e12-da33-08dec608cb5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099006|4143699003|22082099003|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: AWsaLrlzgkIhbHlsL4OSII5U5C6L09lpgzZQFtE2lAaCcmIE3wdBIf8ebHGKFrgkYKaLayb90sTHzBJtamFQLI1Zi35S1FOHUnhQkypCrQM5lDGRo1666LfsS+G82Te4F8nxgs4tT2e8xtVD9LWnKFqx/RDHL93q8BfvLd25Q9xRjURIm44pFrC8wXadKtqY5Te81gIbiMM2k8aFl6mJNciy+2fxS1/32B1z3roVrK7F2MVIzg8f0+8ZYLpI/caGJG1AAm9hWaAY8nY9RS3P5dFqw3puVYHaXYm2z9aY60vEEE1RCziKqBESvmmPOlG9xfv24O4/fZhiKDaQJ62N7tS0TZlNu8PQypO05wpoxLYcjz3mOzWbHUJfFGwfKnjC41VwbHRe5P4hRmhJUuMNoSSX7d25piIR5xcUsnzZskwTRwU+cXwsWMMuRMO7crxIfWegvodcKprfibRX7ad/4/+FUO8kMnUYYR0t19rpCu3DCU0+DMuq0CFh6N01/d2jpK+Df+R/rTOPMDSqjgx2xaA/BYbGuuJcm7inH/ZakbfV0WeFAwwmqsLkE5gizFXtBVR3XrItigXsxBXtOa5vnF+Zra5aNLKwEuSfEl6s79NgxoLqp7b2dX1mvfVzdt/DmSfzQ6rfokR4qd2T+307lKBk8QSjIjlHSiFATxgx0fcSa2oHTQyvyzs5fIY5+N/5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(4143699003)(22082099003)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGYxUFhQSnlBcU9EMUxGb1hydTkvcE10L09UZzJoeUlNRlNaYVQ4U2YzM0k1?=
 =?utf-8?B?VkZQU3FjNDZkYUZqMkF5NFdVbXg2NnlZNWU3Nkg1QU1ZTVJqSnRTSCtVOGh3?=
 =?utf-8?B?cWNTdnhXVGkxWCtQanN5UldYNmJiY0ZRL2xtQnJERHE3Lzk0ZmVEc0NqemRB?=
 =?utf-8?B?dk10dm9BUEloOFRMd1MrNXk0Mm45N2pKSksvcWdVRVpRTVQ4TEZxekVmbEFq?=
 =?utf-8?B?QzZmNk9MSjBKalYzWklqRWdRc2RrM0xXd2pDSEpDSWdCQklFSFpFcGdka1la?=
 =?utf-8?B?S0l2eC95ckhlMmtISkQxNXlWV3NueERoWWZjSkFCaGE0VjFERjRDZ1lTNEJM?=
 =?utf-8?B?UGgwSzVKc09LQmtHL25HeHoyWEZRUlNlY0lpM2dsRmdKTnZuY0w3Nk9lbjNP?=
 =?utf-8?B?S3BqVDBSdUZJVGlEY1VYRTFWMHkxUlBTWVozU2FKa01GODFDeUVSbjdOUW10?=
 =?utf-8?B?bTFDWkdaZG5xdDBYaEJKTWVvUHNzdlZVU21nZWtyNDEyU1FWa2c2M0dBQnZi?=
 =?utf-8?B?bWw3V09BeDZ0MVZnNVBOOEx1aDBDMjk1Qk56ZlAzWWwxenVEQjJ4ajZJWTFk?=
 =?utf-8?B?QTcrVnRBS2xSU1JPQTNYRnQyZ3llaUZ0UW5ubWZ6NEZyWFE0cHNwbTN4OWZ0?=
 =?utf-8?B?S09aa2VLY1J3Rk9BczFkbTNESWV4V2lEeVFSV0djOEpTcE9IZFhyZlNzTWVO?=
 =?utf-8?B?WVhSbDhwSnhvT2dWWHlaVU9wTzJGdVZyVnAyT1JNYWlXNU1aOWVReVJhamhY?=
 =?utf-8?B?VGlvOWMvQnZEZHVURDVVSWZ2dG83VTBqSXhuMjNEMWRRUWxKVXRMTGY4QUM0?=
 =?utf-8?B?RDVucE1BSkowNjlPRVg4Y2RibkNPNitrd0JkTEJNVTVMRDBVNzJLNDJCOTJi?=
 =?utf-8?B?T0tVc3I5ZmwrbEdGUGtmdUw5R1dMQTJQZVFWUG4wSVZHVk1XdTRPOThoTnQ2?=
 =?utf-8?B?UmgwWUdGZ1p3ZUEwcTBSY3UwOXFzZjFkR2kzVy9XMEpEWUVwTzlidk1vQjQy?=
 =?utf-8?B?a0ZxblZ6dEtjbHR0Lzc5ek5WMi83RS9QZ2ZSSnM4ODZvZTNhdlBoMitwdXNZ?=
 =?utf-8?B?ZVVKN3dUR29yNVFITWZEOUJwNk9rcXJZdFp3SzFkQmdrRHE4TGZWcXNyWGxs?=
 =?utf-8?B?V1ZXQWFBSm1DaktnY0dYdTR3YTQ0MGFYTjIxZ1dzb0tLMjFEYUJvdjBWaVB0?=
 =?utf-8?B?aXlvUmc3V09aUjVzTDI0UTFSYjBNWlFIUnpkM2xQR1N3T1JuMkd3enR1T1cx?=
 =?utf-8?B?WUM4bFc2MHZaTWJ1Um13cG5mcnp3d2tUcWZoSXk3Z1U1QUoxZ0MwcGJXN2JI?=
 =?utf-8?B?QWxXOEhrLzMyL3V5UXVlUDFVdDlrSXc5dit3d3VlTVJDOWRUakQwVnUrRnNB?=
 =?utf-8?B?ME8wRXpsVVpvRFR4QS9rdllwUkhHOHkwSks0c2Nkc00zamdhWFA1Mmcyejlr?=
 =?utf-8?B?SnF5S0l5dFBLbU50SnI1d250b1hpMmZPMGdrMkVKdmVrN3JPWi9uQ2xMcGtu?=
 =?utf-8?B?M0YrWThSUFI0R1dJcWhhUnRiZ0E3RWVROU1IcU5VODE1cXpyM2RZZTJ1Uitz?=
 =?utf-8?B?ektHTzczckY0ZE1KRUo2ZVh4NlVuMFE1VXN0VGRyUDBYMVlvSWc3YitLVUMw?=
 =?utf-8?B?ZktDbncxOGd1RTRQRFNtMnU3Q29JMWlzamVESkV4a2xQcmlRMy9mb3RWMmw0?=
 =?utf-8?B?R3NRb1QzSW84RzdnN1o0elQyMmJXOG1WL083M2JmU1ZTbmRDR2duZUloaVZl?=
 =?utf-8?B?QnBUQlNKY3JyMHczUnpvSnltQjQ3NEhJZU1aRkE1dVlvV21VaGNVRjQwTkNE?=
 =?utf-8?B?bmt2NlU1ZHJJMEV1SUVGOElZdkVKSHVxa1RhdDRBdkJrdUo1enJTckhuRFhW?=
 =?utf-8?B?RjRsSk0xZGEvSDBpWTg0ZTFBZnBjSTlqRkx3RlRqRGtuL2hJT3NuNjNsK2ls?=
 =?utf-8?B?NFdCNGNaNjJDMGtjNHBFaE9nN2NEcEwwNjN0cW1JdzVuVGppdmtwRUZHNFla?=
 =?utf-8?B?OHlVamJ3L2FVV0VBLzhVTUduYk9tekFKN2tZcFRldGhkY1JkUG05WVdsVWJH?=
 =?utf-8?B?WkIrRkNOVWJpa2sxVWVhV3diTjZHV2ZTU0pvczRIS2RFcWw3Y2w0czJlbzhy?=
 =?utf-8?B?aThSWE5odVZ4elFEN1FoUlNQZ3BOUkQ2eFR1MEhiSHdNdWc2ZDlHaWh6Rm1J?=
 =?utf-8?B?bzRYcFJBWEJvYXd4eXdNemxxd3ZMQ055L1h2Unh5djdtUWZCeFpTOG00UUJP?=
 =?utf-8?B?ZzQ5dEw2L3pVTm5HSlZqdmdJbjZBeFd6WXJ2UEVnTEJ4bXpvckU0TmhkSThF?=
 =?utf-8?B?eWRIN25ZMFE2bDBsV3QyeGdEdjl5TFRNeVA0ZERSdE91cjdwYzJ5cnMrOGdH?=
 =?utf-8?Q?Fck+34SbkcbJ8fgc=3D?=
X-Exchange-RoutingPolicyChecked: Aguc+UWwILR9uTlQYbRRiJHNb1EPcbpNcSNkQKE2kSkn39WtCWt0waMxajf2p0YDK1dspOc7DRAXN+jNR24CUiKNroeSsVk3rTOohs3g/x51xjyN4GOaIEZzE14n+vYu5EG6LplC/KjWXuIJzf/O7bha8+T8lK3+p2xUvRxP8JPRNd2Ult1uZ2wbPoEixydiONgHcTL8Inaxc9cJWez4wM848GJuD4ZAexSb9YQCR2cXKsWicuMqbMHRLZXvaCC9EnMV6FneIjBwXf/xNtvWnGi1JufWQA45sjuQPJTNsRG2a2i+pSv3VT2LmvW/73GTyfvW7cPJY/TBv6xa0ox0kA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f46e978-7491-4e12-da33-08dec608cb5c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 09:23:40.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INV38rzYWonDUNak+b/+hbItd8SumKFTdBKIr8aSmbZHKW2QxUAVW/9EdXocRoND7SK7GolLDmP1v7lktML4AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4624
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_102359_160761_71AE4B6C 
X-CRM114-Status: GOOD (  24.23  )
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

On 08/06/2026 21:06, Frank Li wrote:
> On Mon, Jun 08, 2026 at 10:58:00AM +0300, Adrian Hunter wrote:
>> After Dynamic Address Assignment (DAA), there may be cases where
>> devices have been assigned dynamic addresses on the bus, but are not
>> successfully registered in the device model.  This can happen, for
>> example, if errors occur during device addition, leaving the bus state
>> and software state inconsistent.
>>
>> Introduce a reconciliation step to resolve such inconsistencies.
>>
>> Scan all address slots marked as I3C devices by the bus, and compare
>> them against the set of devices currently registered.  For any dynamic
>> address that is marked occupied but has no corresponding i3c_dev_desc,
>> probe for device presence using a GETSTATUS CCC.
>>
>> Retry the probe (with exponential backoff delay) to handle transient NACK
>> conditions.  If a device responds, register it via
>> i3c_master_add_i3c_dev_locked().  Otherwise, free the address
>> slot so it may be reused in future DAA operations.
>>
>> Note, i3c_master_add_i3c_dev_locked() may fail (again), in which case the
>> dynamic address remains marked as occupied.  A future DAA will try again.
>>
>> This also handles a corner case where a device is assigned a dynamic
>> address but not successfully added, and subsequently loses that address
>> (e.g. due to power management).  If DAA is run again, the device may
>> receive a new dynamic address while the old one remains marked as
>> occupied.  Repeated occurrences of this scenario could eventually
>> exhaust the dynamic address space.  The reconciliation step ensures that
>> stale addresses are detected and freed, preventing address leakage.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>
>>
>> Changes in V2:
>>
>> 	Add bitmap.h include for bitmap_zero() etc.
>> 	Re-base due to changes in previous patches.
>>
>>
>>  drivers/i3c/master.c | 115 ++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 113 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index 5021d25b718a..6656c8591fab 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -6,7 +6,9 @@
>>   */
>>
>>  #include <linux/atomic.h>
>> +#include <linux/bitmap.h>
>>  #include <linux/bug.h>
>> +#include <linux/delay.h>
>>  #include <linux/device.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/err.h>
>> @@ -1613,6 +1615,56 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
>>  	return 0;
>>  }
>>
>> +static int i3c_master_getstatus_locked(struct i3c_master_controller *master,
>> +				       u8 addr, u16 *status)
>> +{
>> +	struct i3c_ccc_getstatus *getstatus;
>> +	struct i3c_ccc_cmd_dest dest;
>> +	struct i3c_ccc_cmd cmd;
>> +	int ret;
>> +
>> +	getstatus = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*getstatus));
>> +	if (!getstatus)
>> +		return -ENOMEM;
>> +
>> +	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETSTATUS, &dest, 1);
>> +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>> +	if (ret)
>> +		goto out;
>> +
>> +	if (dest.payload.len != sizeof(*getstatus)) {
>> +		ret = -EIO;
>> +		goto out;
>> +	}
>> +
>> +	if (status)
>> +		*status = be16_to_cpu(getstatus->status);
>> +out:
>> +	i3c_ccc_cmd_dest_cleanup(&dest);
>> +
>> +	return ret;
>> +}
>> +
>> +#define I3C_DEV_PROBE_INITIAL_DELAY_US	20
>> +#define I3C_DEV_PROBE_DELAY_FACTOR	2
>> +#define I3C_DEV_PROBE_CNT		5

They are somewhat arbitrary, but should give a device enough
opportunity to respond.

> 
> what's these value coming from? from i3c spec?
> 
>> +
>> +static bool i3c_master_i3c_dev_present(struct i3c_master_controller *master, unsigned int addr)
>> +{
>> +	int delay = I3C_DEV_PROBE_INITIAL_DELAY_US;
>> +
>> +	for (int i = 0; i < I3C_DEV_PROBE_CNT; i++) {
>> +		if (i) {
>> +			fsleep(delay);
>> +			delay *= I3C_DEV_PROBE_DELAY_FACTOR;
>> +		}
>> +		if (!i3c_master_getstatus_locked(master, addr, NULL))
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
> ...
>>
>> +static void i3c_master_reconcile_dyn_addrs(struct i3c_master_controller *master)
>> +{
>> +	DECLARE_BITMAP(dev_dyn_addrs, I2C_MAX_ADDR + 1);
>> +	enum i3c_addr_slot_status status;
>> +	struct i3c_dev_desc *desc;
>> +
>> +	/* Mark all devices' dynamic addresses in the bitmap */
>> +	bitmap_zero(dev_dyn_addrs, I2C_MAX_ADDR + 1);
>> +	i3c_bus_for_each_i3cdev(&master->bus, desc)
>> +		__set_bit(desc->info.dyn_addr, dev_dyn_addrs);

This misses static addresses.  I will add:

		if (desc->info.static_addr)
			__set_bit(desc->info.static_addr, dev_dyn_addrs);

>> +	/* Reconcile the bitmap with the bus address slot status */
>> +	for (unsigned int addr = 0; addr <= I2C_MAX_ADDR; addr++) {
>> +		status = i3c_bus_get_addr_slot_status(&master->bus, addr);
>> +		if (status != I3C_ADDR_SLOT_I3C_DEV || test_bit(addr, dev_dyn_addrs))
>> +			continue;
>> +		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_FREE);
>> +		/* Try to add the device, but probe to see if it is really present */
>> +		__i3c_master_add_i3c_dev_locked(master, addr, true);
> 
> If dev add success for addr, but you free addr at previous line, any
> issue?

Currently, addr is always I3C_ADDR_SLOT_FREE on all paths that call
__i3c_master_add_i3c_dev_locked(), so this is consistent.

There is no i3c_dev_desc for this addr since that was checked just
above.

Then a success path will use i3c_master_attach_i3c_dev() which sets
I3C_ADDR_SLOT_I3C_DEV via i3c_master_get_i3c_addrs()

> 
> Frank
>> +	}
>> +}
>> +
>>  /**
>>   * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
>>   * @master: controller
>> @@ -2445,6 +2551,11 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>>  		if (rstdaa)
>>  			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
>>  		ret = master->ops->do_daa(master);
>> +		/*
>> +		 * Handle cases where a dynamic address was assigned but the
>> +		 * device was not successfully added.
>> +		 */
>> +		i3c_master_reconcile_dyn_addrs(master);
>>  	}
>>
>>  	i3c_bus_maintenance_unlock(&master->bus);
>> --
>> 2.51.0
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
