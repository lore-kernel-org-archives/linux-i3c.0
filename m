Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B2FF36C5C
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Apr 2026 12:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mIyqeNXwXZsx6o0T7A+r6Y33XAruPXkCy6toFqdGPus=; b=4vCYAfZoCMmGnTgshxQpbHqcYu
	S6ffVwP+8FAYIDoSHQu5v0S2pQEXwSWX7zs3sD+kdadP9hIW7kKkI54u/X0jmAW55J4gS9K49jHNS
	OmXqxcKpOZl61LzbmGNuDiUm90dxqyUy5e6SZBI758hOEgO5czfo8FNNOWdkrdXGWiU7Xvz+b94Z6
	lpmALAbwv+CUVeUPKXQUFHnw7e36cxMt9zAglLt80A7nlEhR5J9iY/0jVwI2Ap3Gwa2A9uktFhnSc
	OWg74ogwrYtOmxtKYQzU/V744UTWkQl6giESGYuHj83Oy1GDnPBr95KkRFL3pt3mzVZkDeB8wZq0C
	9Ukh59jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnIR-00000006qVW-0njB;
	Mon, 20 Apr 2026 12:00:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnIO-00000006qUV-2pxh
	for linux-i3c@bombadil.infradead.org;
	Mon, 20 Apr 2026 12:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:CC:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=700NKzUr3YDjT/MNbpdFr764X8X0iUShVYcYFHWE+mo=; b=nnwSE6AcvLSwDlP/jBSYzTPSZa
	/OeAa5kiBEexbnsf/BjZzaKheKbh4W++/eylZ4BM6J3Gl/R40y7o90xi+wQ+Cu7A3H2Kz+LzP4LTT
	dJ0JRZut9CzeBCM0RX5ZkVdD1j7D52fCoMt9LqRlkdqljYRu4kqKjgLEwukd1LuxNqB1lgl5QfG/p
	PiImLp36kk663FTZPMbBMMtt2ci7S5RVUX5o5HF+vqsbeCPZhyTfJLAGIwoz1REDf7WzhPxVnLujN
	XXAcctJPgEj9bgjnOSCn+XtxOqb6g70lpzBAT1fus7oU3ThbvRRaizrccXTGTfmF0VhvSxPXkufyr
	vAkxZQFQ==;
Received: from mgamail.intel.com ([198.175.65.13])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnIK-00000007s7O-1Hso
	for linux-i3c@lists.infradead.org;
	Mon, 20 Apr 2026 12:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776686405; x=1808222405;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+Z+mJAg5j5DNS6uwf+P39rkLB45ziYkA5qC0cmKo3/0=;
  b=izYPH/SRV7osnkpfLhS3+/9l2YkMwPFfhgCWWw/wKuRcVQemQ8id/uop
   E6qec9j0augC2humLQQOJKGW1Cobryg/tPUmqs8rVHjD5sfd9I0f/7BFv
   x1KohV3XPZrp3IvKwMI1O4ga5vdZC3yDGmfY7LLzSqa8E5yipCENEaW/U
   p2PwUPaXe6+Z6F9T23YmW/Acws2+/F+cVNADOgovT/JmZvRUVSV9dlVXt
   npGC5g15HoGAvFnpYRcIxWGq19RyRd1oFMUdjKquL1Bc1q7IdKCDFAb97
   6vEROVNx9VY4fdUElEOgyvOJkDMsXDYYKXwpw3wYHYRmpmGqzSf85vqcR
   Q==;
X-CSE-ConnectionGUID: 2obP4Ur3TAy16JU7SdHNYQ==
X-CSE-MsgGUID: U67DaZpZSsyoz1EhpTZgaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88672344"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="88672344"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 04:59:58 -0700
X-CSE-ConnectionGUID: miV3Wc4jSbiaX5N0wWGCsA==
X-CSE-MsgGUID: t85py9O4SoGSUtod3e1OIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="255178393"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 04:59:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 04:59:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 04:59:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 04:59:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeikcaIfrMWjAoyw++CN20FEWTTTjZ+oF9lQcm1sh3OskhC+s8MMa5AuEWlps0OCeDb2JMwUlfj0aW5sWwOo0m1EglfoOcpb9H+j+u3Vp8Q1dJWK7kj+HnBzFbrdcgG+taPgS83DX0XtYcaquPJ3RazG5GbvOUDLVkqQ5gKAPNxu6OBwCTngr8QeaAJ4DanhEOP4AajP9m6TNbyJooX1g0kDmBCD33cqZr1EL3ggLSu8gjH+/NKzgeQXk4PcH3TqDu0ykPEdcOX25Qm1b1yfOA9Qu4Eb5tpYh+iFsZ0oE8bSpFJbDVS3U8QbdvuHq7Wenb82Mv0a5Upncylt8RvKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=700NKzUr3YDjT/MNbpdFr764X8X0iUShVYcYFHWE+mo=;
 b=GeqlKAC91QIH74QrtxO7t2naoF53Rx+t6kX3rSwnVlqZGOOdKumYA3SlKxLbN2qoRAg0ulUgpT7fIzV6zTMBhvO0GW61gwmKzV2HjuWbJtcpDhWkl7bS7Umckf/gGeiBKOcvTiQjyIOCQlguo5mIrvhW538auH4loPKftJQNxHo7s3KFIlUAE+U97T3IbX0J3Mx2yCj8yMvANYhQG/krqq23+Hiotx+DQl9Y4GHLlcgdw+wMnZmQfAg3q06M/1Fg/sgYGpcQMx7XQMxpL26b2PcOJ1q0qZhNxEQnUM1WB78O/ZI1mujzQcFQJ3nHRk7L4oMt122LOM35TSv6/qJ5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA1PR11MB6146.namprd11.prod.outlook.com (2603:10b6:208:3ee::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 11:59:52 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 11:59:51 +0000
Message-ID: <671fa705-d104-4c52-9471-f6a85d5b6f23@intel.com>
Date: Mon, 20 Apr 2026 14:59:47 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] i3c: mipi-i3c-hci: Prevent DMA enqueue while ring
 is aborting or in error
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
 <20260416175704.41217-4-adrian.hunter@intel.com>
 <aeHZnUV0QlGHYlVA@lizhi-Precision-Tower-5810>
 <3db31a9c-443c-4d2e-a6fa-8cf16cb80bcf@intel.com>
 <aeWNfN0x-Ptsj1-g@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aeWNfN0x-Ptsj1-g@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0212.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::18) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA1PR11MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: d06e4bab-66a0-4ab4-725b-08de9ed45407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: qXsycRWSi7iz2NBH9keepjCLyUfCeI81mYXBJ/4TtDJxRMmQ2xv7eIwrc/sTzWlE76jhJwPNAiY7r/c1qg38toz425Z/RAyEo1Tv8q5zgzEBcA0blqYUic072ZqiH0BC3y2cgyfBL2ZCzF1y7bEMBFund0Sm5T2Q6Oa7oVy7lpqqUX2S4v8AwhxKKFH8Lb6r1tQvQbGGdl9fIl/13J48yAko9PBjhF1uKtweG8CZog2KNA6vvcREHkeprnbAAj2OHlfMv1JyPb9rbxOV+o+cF6M6l8E1NZqCQGUMJMTA7GoCKgKWvdzupqhpPde8rk6qb653su702mt0eWalZWpKqsm16/39sBUJ3GqiHL+5Kd0MktzuJv/q9r+bv2KpYL+511cyS+TP+JH41lmxT1xjSV1I5CELbkZKqy3D9TCNdp7xp6NlUO31Uk9sZmyDAaeWNl8bp/zndlkeSDpNRYid4zs5GgnEaAkgzeSqRKlR7n8JzuB0PvRhh/MifkPB6t1Ja2VF1sOf7jji8kDfgHhO6jysSPLCFTn2rpT4el7ta35RSb1eax864Z4HEseFphZSk5m5vqx8RCOlmd46KEwmguT0g+QpQclkNALtoftXMjBKG7R6r5c/T+BqSKYhvo9gFpHsqWXe5/M+EapMxt4tTTnNEpXHmKTGV/eM+DEvxmlJkmT1YE9NQaejfVvApNwQFiaxuMv37a9llxtwQJO5H7N4v1qv50rTIMy7CtP+jC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFZsSHJ1N245bENYVHBtLzNISTVtOGs1TVpQcEFTK2N4YUlJVHlPd2p3K2F5?=
 =?utf-8?B?NWoycGEycU90LzB0Y2daOU5jQVhqOUlhVkF3djFZc20ydVI2LzFyK0xubWoz?=
 =?utf-8?B?M2tXbzNGNDBYSFpQeXFueTlmU29LSERaNHNlYnJGWFFvaC8vcFhYdDdteThV?=
 =?utf-8?B?TzJSNFB0QWxlZE5pa0Q1b0xqSXl1YktOMXpxQmpNSS95OTErYUx0SUNxRFpY?=
 =?utf-8?B?R2V2N01Bd2Q1bnlGSERTVTNjY003d3NDcmxsdUtmWi93U1JIYWxmQUtST29w?=
 =?utf-8?B?MzJKK2l4bjkwQnM4NTlhSG44a3l2TTM0Rk9BUHhDVDZWZXVtRFhocURjKzNX?=
 =?utf-8?B?NXBxbDNTWDJCZXkvNE9lUVlxMUVzcWxxRndWb0k4M2xJbktxU210R09zOWM4?=
 =?utf-8?B?Qk10Z2dqSjBCbXFqRkY1Z0JVNlRCT3Z2S2ptOFUwOEZpdmwrQ3RES29qRlVD?=
 =?utf-8?B?YkJKK2xxN25aZjNzdUZyTkNvRjNRZ09oZWExNW9zTEtmaHNBTkJoZC8yZ3Er?=
 =?utf-8?B?U3ZXa0JkeDZVd2NTc21GcjlmSlhEbmtVUGErT0VmTVE4SURteFdoSUNHVGZk?=
 =?utf-8?B?S0NMRlk1SDd6MmxsTkR3eCtGazFUTWpDcWREY2FKbGJqTkRsZm5Mam5lVEhF?=
 =?utf-8?B?UXR4d0pkSSt5UTVqcDZGbTErN2xpa2d6blYvVVUvamxFbDhIRVB2SyszUHFJ?=
 =?utf-8?B?aDVsTTBnN0RUVytQTnJyN1FvMytMcU9DNVQ2VHhST1NDQkUrcVJRSjZjdjcr?=
 =?utf-8?B?R0lDWEdQa2ZJUFRsVUxPWXFMeGdqdnZ6QU1KdGdKRnZ4OEVWdnNVZjhyZzB0?=
 =?utf-8?B?NjVlbi9iTEVVWll0Vk42ZlJPdVkzRVpKS3BtRUdZT1oySGNSc2xtV05KVHI4?=
 =?utf-8?B?NXRTRnd6YWc4aldNYkEzQ3RnQ2t4SE5DbENiUGhuYzJyNXpJS2o3VWgvV0Fl?=
 =?utf-8?B?UEFXV2hqRjJFTFB0eHlLcW9WNGlyVE11bThXMFV5Tk9RZll1MHdsTWQ2dnNi?=
 =?utf-8?B?TGtnaFhjUUtKSUFDSlc1aWpZMncvTnRTdlNwS1NGTHpUTFRoQVg0dGRWU01P?=
 =?utf-8?B?YWlQMzQ1cXF1ZFN2bkFrMWpIcTdXQXN5V3ZwTG92cnJUMzltVUZja2hGV2Nm?=
 =?utf-8?B?ZUVkMUVmallTbytTbjhwUUNWUC9jY3FrL2dYYU95SUNDeVA5M2xvbENWSE40?=
 =?utf-8?B?WXRsaWZkOFhVNnVuTFpxbjdJT2xmeDZtZld4cUhEa25pUFMvVit0a3VBNkxP?=
 =?utf-8?B?ZXdDZlJWOGZ2M3FVQ1VhQURodnliUENUNUtlOHNGYzJNNFVycEg1VXVQZWtK?=
 =?utf-8?B?Y3J4eDhnTmJwRUovcy8xYUFkdzVCeWpDS0Z5VXIyN0xudFU2UHJTYkxzV3Za?=
 =?utf-8?B?VkM0dk1kMGlWVno3UURhUHJGM2tFUGtPTElXdEk2cHVIVUV5LzdYQzBGUkZw?=
 =?utf-8?B?NXI1UndiSUUwU0loclRvaEZEaVIvWHNVMHVSdnhPdlQ1TEtJUk0yd0liVjBB?=
 =?utf-8?B?bDAwd1lPUVJDNm9KYURxRDQ4MDBGMVhuRkxxVCtaS2ZYbi9SZjdJZDFQUkpx?=
 =?utf-8?B?TTVaNWdBNGxBUEFjYUVoc1VydmFDQkZFR3RhTlN4bS9mWllmeVV6MTFlY1VD?=
 =?utf-8?B?dEYzRThpOEIrVDFONWlKWXE5a0lqbDIrOWZVZm9xeTFNbmk0R0hSWjg4bUJm?=
 =?utf-8?B?T0QxN2VQSmxrUzlwT0hCeDU0U1I5YzVMK2xVaHQzcHFIMGpxdDA5bDFja1Zw?=
 =?utf-8?B?RlMwMHl2eG54YWI5QUltdlh4bmRkV0pIcnN6OGhlQVpJRFlHUVFPbUhiMVNo?=
 =?utf-8?B?KzUrNVVvUkttN1VscnMyQkdUemFXbi9SMnJuM2ZjbkplQ1F4OXRKR3hmMms4?=
 =?utf-8?B?ZERmOTJTNkhGcVhKai9vOGM4SjhjakNWRDRLSEp3SjhkQTEvK0ozakM0TXZp?=
 =?utf-8?B?RDFVTE10bmdiRUpZSUNNUHl6YisxNENlOTR5MERBODh6V1dVNDFwSnZucUZK?=
 =?utf-8?B?UzFiVEs2R25DdzkvUzhjQVhiYm9ESHh6MVNCUGZxb1dyM3R5UWNrVkJQOEI5?=
 =?utf-8?B?S1EvcHp2dHZLQ1U4dkJzZGxneHR6ZTZHY1pWY3NOZkxEWDRuYTFQWjExU2JT?=
 =?utf-8?B?U2J4ZytPYkczeDA2d0QvQk5TQVRhREFnVjhwcXpTKythOEN5L29Sa3Rrd0NY?=
 =?utf-8?B?WFFMeTRpblorYlNOU1BlQi9URXlvdW1ONHNBVE5Dc3B6cGFsVGVLdUZLcUwr?=
 =?utf-8?B?VlhQVXk0ekJoaUJHanBBS0JYUWhSWnNnREtuNkdIcnNiN2pXRTYzSXFFZzNi?=
 =?utf-8?B?VnBtaUF0em9TTFNTOVBtWmkwSzhHallmNVlGemRLKzdiem1jVVhzb2dLRXdr?=
 =?utf-8?Q?hPqHA5Qy85VMukbI=3D?=
X-Exchange-RoutingPolicyChecked: V5Jz/o7fZpZqrUda2vxM1NPenaoP0WuqJqew+cY2SESbubzhHEVWGKzCEDw3kmCtbk9eHqM8jfwg1v5aE0+htUXIyWizrgCa09T9w1vOgAzN2NKZKph4LZVeRsg5Ond046uyM986I+O92ar1WmomUJIKCwuyb6HXT6JAVk+Bax+NbWJXjmsC4BjF9L27sdMGExnOS/hwMuxBqZMcVAZvxQ58lU1IK6vKWo5q6n/JmUQtQp+gOwGzxODxKDK4/Nexwl9FhYtbGx4FNKNFOmB8B8CwauEzz1gPrlX4TRX6is0ZTUtcYzQDLO13+rz4KWHtsmmY6n4NkM8g00LUjbV2Gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d06e4bab-66a0-4ab4-725b-08de9ed45407
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 11:59:51.7119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvzIlMWIVsI6lD0RUMCmMm/t/8dpIE6oe3KfQrVMVjta37E+HHyQMUop/VMRJeZqmEQjg/wB6sntXQ7HiD876Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6146
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_130005_422625_0A380315 
X-CRM114-Status: GOOD (  22.49  )
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

On 20/04/2026 05:20, Frank Li wrote:
> On Fri, Apr 17, 2026 at 08:07:11PM +0300, Adrian Hunter wrote:
>> On 17/04/2026 09:56, Frank Li wrote:
>>> On Thu, Apr 16, 2026 at 08:56:51PM +0300, Adrian Hunter wrote:
>>>> Block the DMA enqueue path while a Ring abort is in progress or after an
>>>> error condition has been detected.
>>>>
>>>> Previously, new transfers could be enqueued while the DMA Ring was being
>>>> aborted or while error handling was underway. This allowed enqueue and
>>>> error-recovery paths to run concurrently, potentially interfering with
>>>> each other and corrupting Ring state.
>>>
>>> why not hold lock at abort and error handler? does it take quite long time
>>> to do that?
>>
>> hci_dma_dequeue_xfer() handles errors.  It is called from
>> i3c_hci_process_xfer():
>> 	on timeout:
>> 		calls ->dequeue_xfer() == hci_dma_dequeue_xfer()
>> 	on error:
>> 		calls ->handle_error() == hci_dma_handle_error()
>> 			calls hci_dma_dequeue_xfer()
>>
>> It takes the spin lock, but has to release it to wait for the
>> abort.  There is no set time for how long the abort can take,
>> but the timeout is 1 second, so it is not suitable to wait
>> for.
> 
> Feel like overall equeue/dequeue and timeout's lock is too complex, it is
> quite easy to involve bugs.
> 
> Is it possible to use simpler design?

Some kind of locking is needed to block the enqueue path.  Using a flag
with wait_event() / wake_up_all() is similar complexity to, say, adding
a semaphore, but more light-weight because there is 1 lock not 2.

> 
> 
> Frank
> 
>>
>>>
>>> Frank
>>>>
>>>> Introduce explicit enqueue blocking and a wait queue to serialize access:
>>>> enqueue operations now wait until abort or error handling has completed
>>>> before proceeding. Enqueue is unblocked once the Ring is safely restarted.
>>>>
>>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>>> ---
>>>>  drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
>>>>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 25 +++++++++++++++++++++++--
>>>>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
>>>>  3 files changed, 26 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>>>> index bb8f2d830b0d..5e1bc6d819cf 100644
>>>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>>>> @@ -976,6 +976,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
>>>>
>>>>  	spin_lock_init(&hci->lock);
>>>>  	mutex_init(&hci->control_mutex);
>>>> +	init_waitqueue_head(&hci->enqueue_wait_queue);
>>>>
>>>>  	/*
>>>>  	 * Multi-bus instances share the same MMIO address range, but not
>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>>>> index 4cd32e3afa7b..314635e6e190 100644
>>>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>>>> @@ -484,6 +484,12 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>>>>
>>>>  	spin_lock_irq(&hci->lock);
>>>>
>>>> +	while (unlikely(hci->enqueue_blocked)) {
>>>> +		spin_unlock_irq(&hci->lock);
>>>> +		wait_event(hci->enqueue_wait_queue, !READ_ONCE(hci->enqueue_blocked));
>>>> +		spin_lock_irq(&hci->lock);
>>>> +	}
>>>> +
>>>>  	if (n > rh->xfer_space) {
>>>>  		spin_unlock_irq(&hci->lock);
>>>>  		hci_dma_unmap_xfer(hci, xfer_list, n);
>>>> @@ -539,6 +545,14 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>>>>  	return 0;
>>>>  }
>>>>
>>>> +static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
>>>> +{
>>>> +	if (hci->enqueue_blocked) {
>>>> +		hci->enqueue_blocked = false;
>>>> +		wake_up_all(&hci->enqueue_wait_queue);
>>>> +	}
>>>> +}
>>>> +
>>>>  static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>>>  				 struct hci_xfer *xfer_list, int n)
>>>>  {
>>>> @@ -550,12 +564,17 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>>>
>>>>  	guard(mutex)(&hci->control_mutex);
>>>>
>>>> +	spin_lock_irq(&hci->lock);
>>>> +
>>>>  	ring_status = rh_reg_read(RING_STATUS);
>>>>  	if (ring_status & RING_STATUS_RUNNING) {
>>>> +		hci->enqueue_blocked = true;
>>>> +		spin_unlock_irq(&hci->lock);
>>>>  		/* stop the ring */
>>>>  		reinit_completion(&rh->op_done);
>>>>  		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
>>>>  		wait_for_completion_timeout(&rh->op_done, HZ);
>>>> +		spin_lock_irq(&hci->lock);
>>>>  		ring_status = rh_reg_read(RING_STATUS);
>>>>  		if (ring_status & RING_STATUS_RUNNING) {
>>>>  			/*
>>>> @@ -567,8 +586,6 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>>>  		}
>>>>  	}
>>>>
>>>> -	spin_lock_irq(&hci->lock);
>>>> -
>>>>  	for (i = 0; i < n; i++) {
>>>>  		struct hci_xfer *xfer = xfer_list + i;
>>>>  		int idx = xfer->ring_entry;
>>>> @@ -604,6 +621,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>>>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
>>>>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
>>>>
>>>> +	hci_dma_unblock_enqueue(hci);
>>>> +
>>>>  	spin_unlock_irq(&hci->lock);
>>>>
>>>>  	return did_unqueue;
>>>> @@ -647,6 +666,8 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>>>>  			}
>>>>  			if (xfer->completion)
>>>>  				complete(xfer->completion);
>>>> +			if (RESP_STATUS(resp))
>>>> +				hci->enqueue_blocked = true;
>>>>  		}
>>>>
>>>>  		done_ptr = (done_ptr + 1) % rh->xfer_entries;
>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
>>>> index f17f43494c1b..d630400ec945 100644
>>>> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
>>>> @@ -54,6 +54,8 @@ struct i3c_hci {
>>>>  	struct mutex control_mutex;
>>>>  	atomic_t next_cmd_tid;
>>>>  	bool irq_inactive;
>>>> +	bool enqueue_blocked;
>>>> +	wait_queue_head_t enqueue_wait_queue;
>>>>  	u32 caps;
>>>>  	unsigned int quirks;
>>>>  	unsigned int DAT_entries;
>>>> --
>>>> 2.51.0
>>>>
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
