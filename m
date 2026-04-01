Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBFCD2ED08
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Apr 2026 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=upZMgl00yR6oOwMrqb6x5MaosAzfSGRGMB515P1a75E=; b=2QvlOCtqIBxltpozPjPZQuKD0x
	ZzSs89O53XvFg+9CAPalK527kJP+O2Yo9cz0jox4SSA00BbLaX0lLCn2muJwe5ZIuQRWBd4fSWdbw
	9rdzZD+VpoXVNiuizZx4fASEN8O+F1Vwh1Fr/p1YeFEaz4CHrSv2ZCFiZS4TEFyuvT38VsyFNCSI1
	Ic37c6AViNM0Fp3CQQTCEaKEYXCRhKskeygPCr7BdDlHaDbtHW0OzzJRnYqoLTsLEMZevCWD3QdLP
	/B+zBy5qf2OIXZH4CljSvHvzHOUioCNxk8Sx1eVlBfMU50RLWnWGLr6AXW9kltDjsuRlYi+BGoqU4
	RCfJR0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vhs-0000000FJwQ-1eBw;
	Wed, 01 Apr 2026 13:34:04 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vho-0000000FJvT-13iu
	for linux-i3c@lists.infradead.org;
	Wed, 01 Apr 2026 13:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775050440; x=1806586440;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zbAoYuS94GTiAC6g1kq6CLPbQteMkHYgJ9rK8mO/W54=;
  b=hb1NlLnCEEVWWwahFgvWt8tz2q23mxQYhsSE6ZGfwMYUE75RkEZsJcER
   O3ZRSwffGgslejbzE9PZvsV8eNfPHp06aHMLTSwcdWY5uveBQT6rLvefN
   xdzJh7e2JBmOC0/9QT+L7YvUJra/DW78sUc+RnUnW0VrZ1B2noUHNdHBj
   lO6U70sx2PoN6XIGA3ocjpzeggH466vqfVsI0u0w9rpu0N+DmLKplKl2+
   ZgR7pLgUxW8qDOi8eGzxHQoaRp3x0jJ4f0SdEvfv4dgUC1r3whpIvQ1ap
   kfz01RzLAPwVocQ1Zp9JEBskZ01zZCd9ul9Hnra5HAcdu1inODW7PLELP
   A==;
X-CSE-ConnectionGUID: 13zJ7iSWTTG3ZtxHGV+MeA==
X-CSE-MsgGUID: rjnO/N29SRugrfiuh2XqLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76147221"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76147221"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 06:33:59 -0700
X-CSE-ConnectionGUID: N8NXA8NzSJiaPuaAwK6fjg==
X-CSE-MsgGUID: 6SsWqYbBQ52NcPXzhb2nXw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 06:33:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 06:33:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 06:33:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 06:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9S4K3D4U4guTEZJdOTbWpHlrvuR5fiLAvh6ozJPYH1BcGlwVCWjYlll5tfhy2hibYPQchVJyl+tezQJo3J342sJRLX5p0Ihnb9IYg2qw0nvrAf8jL4AOxpJQaBUzTkDfWpd9vZ9/5oh58Fqd6/zxI4Pd7CWdf9o64bQ9hVRWPL0yiRCBphEVPZQ4EafmucKcqxFu63IwWw3GP+k+xx+7wFZUg7Mq5nZZ/qQQgZylxBy4whi8IbRBHZlOuYHRUGvs6pRkRvOjRFmHyXdOE6L18Wjh3p+zpJFLZhJLQ6Kks+F9+irrn1co6BzqcvXgD/k7WJ64X9Jpcp0ApxEJcO6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir17rLWUmG1EfN+WfKdqevRXTYcLTR3gTrj5q6IPtZs=;
 b=UtY5QfLdqbnpkV6LeqKz2SZ6mC5CFsEH03zPHFXkaNPT8DmrqxPlh1SnQcwp1HaTrv66berMVptGymZJQFBGyOdirMjYqUG+22Mms+Srhdz5Up+6G3zHf7hmeuxht8oSSomQTK+Fnozk5vDfyA5Js+xJzSK+oiNpj+ffbuFN0GH9mRRXZv9Rug/rlgYMsV8ggdmfWnr2Y37MiCVtGcFq81WEFh7+goj9DgKXv7rILS69yl6zwckGSXS4kJoRvoZOeu2k2wMJN7UY0UhCei5WMiuE/xqO/0JdqmlWZU6w0Rn+HBu6j9W4AmZSTOXNGY4lheGFPanWxJRCRxYrTlLDVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SN7PR11MB6601.namprd11.prod.outlook.com (2603:10b6:806:273::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 13:33:54 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 13:33:54 +0000
Message-ID: <ad7cd33b-3424-4532-b38e-f8f9c5ee1ad5@intel.com>
Date: Wed, 1 Apr 2026 16:33:49 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: mipi-i3c-hci: fix IBI payload length calculation for
 final status
To: Billy Tsai <billy_tsai@aspeedtech.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Nicolas Pitre
	<npitre@baylibre.com>, Boris Brezillon <boris.brezillon@collabora.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com>
X-ClientProxiedBy: DUZP191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::9) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SN7PR11MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 3252d3ea-4674-491c-45e1-08de8ff35146
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: LiCBy0oGIO0E1xzOL9n49Jo+AxnDvBeYooCEPy7WnVKPfqv9jLrptJEYe7U0nsjGfhNj7I0V/uqY/+ZzdoccEQKTnEmvWzp33NAj5IB4N9hu/dDhGuSVo6DfAhs/ZQfHhPzQ/29d5hofbMSeSrX56UFSWcQOB+XnVEuQmJqHukAKBPDlWh2TkKYkmnSWWIf+5JvGBXT+9AN/z71ULZ4MqWam+MQX7XNIlv79OxH3jo9FQNYM/tNJ+s/R1UkVOP0E8asWfSfcO8iGwbhg4fFHZaSMWBYM0lT4mkGmSJwFLYJ/W6HTmZQzDaVjrFj9ZhJ1/xTJmRsUolH+GcOBsG4C2XBQ2ZjFxL2mFbyuI89n8AxIZiUi1pFwo6Y8XvK1DdwfbqeI2po5zVMxLC4qDDzO+58OdTQoU+e1IU6iz5JMfenjOBtMvP62XIYP+bzn3qwH0j8kHSa+TcVEf5oqWGUp/hRV3RLjlB7NuhKmgOX6lHY7hqbWMMI5ZQHxeASEwHwDZzsoMEj8HhQ7uvKcAkaC9t7+LFMQraCosa58VOgQ03phWuIaVNONfi71ibHsEn3kEIobUiCByW8rUO1t4f/3dhiydA5XP+msw3/wpUF6y/WJJK1FOCCIWE9/oPqkSZH9kXuyo0x3hQjDW2zjZnOFp5Y9mpdayg9u1kvIIeHR6YOv30YUIVLtZHgYOjGcMkJNOopPd3wG9Qsxwo7+PbZKoDeW+s8FR+eIMI5lJXxvq4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVRoejhwS0dCdWxwV2RwSk1XWk5Bd052cjZVaHBTb2xIL1VtdGJYZktuOW1n?=
 =?utf-8?B?WkVhRUs4bjdzdFduQ0h0WUZTSVhBMjc5ZHE2VFJuMk1xc2RIeE5FbGtMVjBL?=
 =?utf-8?B?TXBLcitkWXFVb3U4U05FaXZkdmNFT2hBQzZGOWtFUU84UE41LzR6QVhmdjNI?=
 =?utf-8?B?QjkrSmxRWXJ5M0pFOEtPTXpTc3Q5ajRyT3k0TlFCOHZoY0wycTV4QjJycFJK?=
 =?utf-8?B?eWhWSDY4dkY0L3dEZXRhS1VjTlhZQUlMTHA1U0wrZDNGeXdramJBc3ZnMEJ1?=
 =?utf-8?B?TCt2b0NIMWNTUVVQdDQyMVNpSHc1WEdoZVFva0F5V1ROWUVqRVZ5bERnc1pH?=
 =?utf-8?B?amYrNTFuakttREJsUkpTRkg5UVlMekE5SXV3QTJRT0RUUDNVR3FTYzBDN0Rz?=
 =?utf-8?B?WVJSRy9wSkt1SWJQdUNxUlNKeGNnalIzZitaRm1JbmY5cUFZd0VQazBnbTl1?=
 =?utf-8?B?TFYvSzNFeGxHVisraVZZU0VQZEEwbUZYZ3dLbG5UTDdvS3MzaXV2V2JwNzRt?=
 =?utf-8?B?amFlbGlpRGtEZGNndnRxdFFNSFV2ZzNrclhFOGZhbDAzUmdaMGcyaXBNZlRa?=
 =?utf-8?B?L3ZPb2N0ZS9ORFcwaHd4eDMwTVJkREhxcnh1LzZiVElIazVtQVJpV01JTVgv?=
 =?utf-8?B?VnRjVmxOQlhaVURtdWpiUExEK3NNUW1TNUF6QlRQV1YwV0NtZDRwYUFwSFlF?=
 =?utf-8?B?VHR1ZTZKVWdleWhZalBzTWVJYWdPckNVWWVKaHZSUHdJZUhmc3FwYkVqUCs5?=
 =?utf-8?B?R045Q25XZEpjL0RObHRBZUFCN25DYVFRbGdrdUo4V0ZuRU50RExndFlsa1Mr?=
 =?utf-8?B?bnBiWks0VExOVjc3NjBSUEN6UzhEakJsVW5pTlRlekh5WmNXRnBIV3lJdlB1?=
 =?utf-8?B?ZWxpT095RFJzK09qWTVzTWxrU1lNeFcwQnFQZmI5a3V5YWdRbnRVeDVBeUxL?=
 =?utf-8?B?QmJjK3kxU09iYitiTDc2ckNqK1NDQTZnQTNJUTB5N2FLd2VqSTg5V1QyOG1Y?=
 =?utf-8?B?KzJZUmVhMTZxbUdad28yRWo2U1J5eXFGc0UxZ3NDN3NJUGNoalNLOXZTTmd2?=
 =?utf-8?B?S3pQeXJ3cUtkblFvZXAxblN2NmJtV2lFZUIybU44cTg0SXNLWmpuSHRMbGFJ?=
 =?utf-8?B?QndvNVFYVXV3VXVpSHhVUnhpWkcwTnNzNWhxazFnRnc4Z3R1eGozbnNnQXlO?=
 =?utf-8?B?N0hDSWVJOHlYMGwwTktSM0Jwdm1XV2xDVERqUkExQXByQVU5WGFNa1h3ZmNT?=
 =?utf-8?B?dkUzK3Vra1VlR0ZYeEF5K0ZvdjFtek9QTC9PajU5V2t4N2llTU11bllvYXB5?=
 =?utf-8?B?QzlIT2xSQmtaWlljaGVLYmQvVGsvTlAvQUJRQWRuOFRoVjRKd1hha0F4U3Vj?=
 =?utf-8?B?N2tuUDBueVBMdHE5STRKSkRzREpTN3QvMllpN2Q1QVZqWXQrbFdITC9qc1BZ?=
 =?utf-8?B?eUZTZXl0a0h5UitvNDlUQW5rTUxETG1TcTZJcGZERk4rdGhQd1ljVFk5YWtP?=
 =?utf-8?B?emxYbjhXNVdtNk9GUG5JQk1qektySGV3S1FETEZlT0R2MDRDclFweEdjQlRw?=
 =?utf-8?B?UWE0cWo3aWRDeG1NekF3aXBuYTNMRmY1eVdGYkZkRlhpZWNTeGw4UDF6SXhm?=
 =?utf-8?B?NThqQ2hEcU5pb2pGSnNGUXlRM0ZjU1lvU1MremdGQWdNQktTVHphVnNBVWdB?=
 =?utf-8?B?cmF3NDQ2MXpNRkh4NHQ5RGZQcmp5dlpCRzFDQ09wM1ZBMEt4SG1VWkRtR1BZ?=
 =?utf-8?B?Y3VKd2ZXd0dSbHFZeXROSTFzN040ZFdwT2pRTHl0U2NaTllyYVhld29xVDhy?=
 =?utf-8?B?dE1Wc0p0M3pTT0I2UStvSUtHcWk2VEpwTHZ3MlNrU09CU1pJeXlOVVVmbTVn?=
 =?utf-8?B?V3FydDFIUXVPYUlhK1JmOW9sUkloNXY5SWtTd3kzbnZWVkJIRnQyMGt1UGpF?=
 =?utf-8?B?bHRLWjR4WVBvclpGaHE5bFFRVWJhZ0tyVzhDUXZFUFIxcDJZT21rSVR3L0Zp?=
 =?utf-8?B?Z2toWHgwQlpsYkpkZW1SaGxnQW5RMEFoU1BraXRRSEptWlAyQTU4UG9mdkRh?=
 =?utf-8?B?c1RybUFUZVF1MXdhRUtMRkdLQjU0WUtYL1J3dTJieHV6bGg1Z3VPYmZyZWg3?=
 =?utf-8?B?WEhDR0tnT05nK1loa0VtcDlSU0wvRzN3dnFPWTJ1Ri9iT1NZMkF6TTQvUHNF?=
 =?utf-8?B?SUVoWFJuclovZUxRUDc1UlovOUEwWUV6T3A1V0NQbzZFSzRuRlZOcUhhTWlN?=
 =?utf-8?B?ZDl4VUhRczRuWDYzODdvN3ZKeHBpMFlqaDR6a1RMVUYvT2V5YmlxZTlONjN3?=
 =?utf-8?B?bkpLWm1ZVm9lajA1VmxTa3FLRi9LckxqZGkrOVpsZ3AxeGRRUGNsNVBuNTM0?=
 =?utf-8?Q?fdj4MNM1FoC5M7YI=3D?=
X-Exchange-RoutingPolicyChecked: owxQQ6zc69+klnEGn0cBMV3e6d/5O2nNLVyAoKbU3UovjlASjb+6wgDUhm3hlH5wSXjfXK2X3lKZDeHs56CrzfVZuyNzu6RnZOva6rseOfSd6skNnyf2KeyFiymaq20nGqjDcZLVcoTC01VgBmFytXOQ3TwiWN0n21rkUYsHyZku2vdYuDyb2qVQypXoka53ylKsWJwNfk/SEwCCvkjlRPJ7vtrqvlpnI+CkFx5dyRPtS0/XZNi06T+5qZILo/xTVz2oZmkFp8RGGzDZ3NeyceZBg6JkRE8JFNze/p1d1MEkNJbpWbe4T1TT1LQ0GVRwTpQNYBmAiVqM1WkoI8HfZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3252d3ea-4674-491c-45e1-08de8ff35146
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:33:54.0918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKxOsl7cQVIDC0voFdMmuxEVRT3Hz0IHv6zIsOvdomBs9chAOjKL1V6/uMXMtx+dIwgry++3yfcgCUpBozK5mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6601
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_063400_341555_3B4A02DB 
X-CRM114-Status: GOOD (  18.51  )
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

On 31/03/2026 13:27, Billy Tsai wrote:
> In DMA mode, the IBI status descriptor encodes the payload using
> CHUNKS (number of chunks) and DATA_LENGTH (valid bytes in the last
> chunk). All preceding chunks are implicitly full-sized.
> 
> The current code accumulates full chunk sizes for non-final status
> descriptors, but for the final status descriptor it only adds
> DATA_LENGTH. This ignores the contribution of the preceding full
> chunks described by the same final status entry.
> 
> As a result, the computed IBI payload length is truncated whenever
> the final status spans multiple chunks. For example, with a chunk
> size of 4 bytes, CHUNKS=2 and DATA_LENGTH=1 should result in a total
> payload size of 5 bytes, but the current code reports only 1 byte.
> 
> Fix the calculation by adding the size of (CHUNKS - 1) full chunks
> plus DATA_LENGTH for the last chunk.
> 
> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index b903a2da1fd1..f4c76f168276 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -721,6 +721,7 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  		if (!(ibi_status & IBI_LAST_STATUS)) {
>  			ibi_size += chunks * rh->ibi_chunk_sz;
>  		} else {
> +			ibi_size += (chunks - 1) * rh->ibi_chunk_sz;

That assumes chunks is not 0.  It would be better to
defend against that possibility i.e.

			if (chunks) {
				ibi_size += (chunks - 1) * rh->ibi_chunk_sz;
				ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
			}

>  			ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
>  			last_ptr = ptr;
>  			break;
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260331-i3c-hci-dma-3aae908b4e8e
> 
> Best regards,


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
