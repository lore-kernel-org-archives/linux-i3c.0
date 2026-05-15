Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A49CD4F3C
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 05:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lsMkXv6YSGlNfNWk+G1rXTcddjfX/hripVIq97G+pu0=; b=nLj2G4mBH+xBn/OUcnTgT8aVF0
	UMtRWRHp5WsRWZcZC+ikphRtMXBhYlbikQc6UYC92D+tX30nfB2ZbR5y2pTM3R66QbCKOchQT3TTZ
	OsMBaz62Y+L5lCKUd38YymsUPysQKvGHzl8UREKVCwsaN/+FPbPDBbCBKuxsz5YWiOamhe9DmnmQ2
	w7e4qMIPjrHHeC38WnwpXp3qAQKhgvfE+yzZcbNoGyXi40AsimWyqMkWPlz/ORwYYzrHTr0YkAoH8
	DYKq5v6E4Zn6lWU9xw/9uZzjQA6lfPhOhYO7knvzzKxJASjUz82FufnXt+Bo0AbKVYeq9W0XiZk8P
	NUbiIevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlA4-00000007PVu-2WGD;
	Fri, 15 May 2026 05:32:36 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlA2-00000007PJZ-11MB
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 05:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778823155; x=1810359155;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sgBMvQiQesfbGYHIl1Eigsv3E8n7RgWpcHw1Mp77msM=;
  b=MBNhYZS08UMtD6Eym/RJHt3r79kLlA0vVdEMFuns3Kt4wNMIpitwmTSk
   IvVt0yeK4qdvt7xkgYNipIXY8Z3R1N+6AtA5YPESh8iXLGazJw5jNwvBc
   MDMYE99LBA4pv/5PSJNAaCdxa3DgS+FIW9wGsPAHzQKSuFzEAJqOIC+ZS
   SKnT1qX/3pISZO4AMi9eN8HyqQuifyNGaBH+VoMvfQCy7qUP/Jt47Q7BX
   ADdFUZ25VIF9ChyMEZygbPqfztUcYeeMu+9OIKG4I35YmBwVgq7DmGPaY
   vwNeU8hePmG9tqb2z076NgxKwc2GqBi37CoOYeYmN9yyqeKAvRNZV8HH6
   A==;
X-CSE-ConnectionGUID: BY8GwBpQSBiPkrLQduqP6A==
X-CSE-MsgGUID: x1hubFJ6QlGndoDIvM4ksw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79668379"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79668379"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 22:30:31 -0700
X-CSE-ConnectionGUID: JwR4JCmhSeSa0cPK+SzYqA==
X-CSE-MsgGUID: E4PWvfUXQn2GiavovOZZew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235956928"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 22:30:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 22:30:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 22:30:29 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 22:30:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4RVI5pfvmq0QKaFCzUwc9fyf6DZgtjsxw+tL5lPGmPbLhepdecJjOPECMGZiBfJp+qxXHdKTVhL6K4d79VUsYqcktUmTL9MOsPPvle4qJkx96W8BFWMEIdn80wyK8wlUtUCzvCeACVqDpAIs9JO4IWrwjNiC2MdwDw0vA4dVVJjyVEFJiFuuuaaplRecQ6FY1NgCOXwI5SHr9SpfsYDidm1FmZgEXTGhRxfnmd81P9PMt+eGKdsaxy+Ha+V3DEhS5LEi1SLEKuJrBsVw9q+3CnDewy9WiZohL4zB5FP4zXWhyDCKPSy+soXwoeYhxhd6S91y9+HyuPJl/Wab/IQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpGrBzEmi2C2XE6hrk/X78vAwSemfnqeW9ebMwu3jsE=;
 b=MinZtDTRICfSeIHCEx7+GF5vOlzeTdKWUP/tBIh4CNXIIfgNgyHmCsFkS+Iaek2RMMIoFdcCqKewbbkfc+ew59/NN23pHrPYcod7IWPqCmyciJYLp8QIPdltVqdAnCzREde439Meo7565oZ02d9+FMKjob+jhypAlXoCgf1HqrvRV95fUmrvk8AxeoJhtrg8zvkzqZVjpAkNhv1hJ803v0xGfzHkhDBBWwlGN5xF2jff4cTEymOvA1/+8UcLvU9rcAsHc7v+L9J9b9UZgWo+RTfBMh3smvfNdHoY0QHj5lqviYIUpXd8TTAVmK0aXg6yo/QVUis64PcOtt48ph+Jiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SN7PR11MB6752.namprd11.prod.outlook.com (2603:10b6:806:264::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Fri, 15 May
 2026 05:30:26 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 05:30:25 +0000
Message-ID: <e3989979-989c-410c-ada6-f941545d9f09@intel.com>
Date: Fri, 15 May 2026 08:30:21 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 08/16] i3c: mipi-i3c-hci: Avoid restarting DMA ring
 after aborting wrong transfer
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
 <20260504113352.38490-9-adrian.hunter@intel.com>
 <agNaUSIjMc252Jj8@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <agNaUSIjMc252Jj8@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU2P250CA0008.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::13) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SN7PR11MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: 446a03da-24c0-45c5-5f48-08deb2431106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|11063799003|4143699003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: DSky80Hsz71SD9Lxw10tWIlFGEdht55K/ufwCc1jn0C2jutHj2RqNjx3wD18hRItX40ka59paZl+gJHT/m28cX/jvpzBPfyB0YcutQ1QvKCt60QcJFuUJ5Ad5DzJn4ed0VN0/zz+jBxZgFs6dgLb6C6rMrIsa/U5+tQ5cirLlx9dvQqBtQd4JZAABwHJ404E+ed0S3G0s550dkVguQiwPIghutPqJFg873XhkpcZp2cY9GDUXQCvby/tBBAGzXHxSiewy4XyfgrHyIG+cA4szKzaAsaKwrp7KjiNs+Oq/JrrEYuGWggZxphambgTNfPXLEh7m16A5TO0/pnHUmp5zoy5grCUXNGa/0LkG97FFIoU8MhWQFIQBU+HiEgyMwtcr9E2hmYBGFk6OKxpgv5ZRiu0iMpIo8IMM++nwIcra6jEpEtx7odGqATrNpJsec8eBzQLnKLhvtiTb5Bfq6O5apklzmZM7P0cc298N3MbO2quVBwespgaS0VmRbsk8GjmdL+naLCB0kOcU3/SAZd4q+a4VFVIV0ec7Y4TC1VVLaUN5Aml81mWnKoneR9RmD/0cdBXLy9oIU1ma4pxXSSvUh/wnebzfMflRn990Qdmpk6vyHj+d5h6M+qEl/hZAH+0PVXawLQO4pMs5sSyiB4Z84KGeod7Zc+XD0GvITTDswBNHbNNAxhsnUy/2ekrX52M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(4143699003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjIxQXN0S055K1MxUEpRVTJIL3U0d2VjTjN3ajNrN3J1b2FVN1hUdC9paW5Q?=
 =?utf-8?B?UmVvb0FvSWtOa284VXVYVzdKL2hpbmwxQjhEdWFTMG5nbnFQeTFoby9SOEsz?=
 =?utf-8?B?Um81T0o0TnRpZU5WaElHREo2MkhtREY2UDJ4U3NxODdLT205RTl4alNHMkQ0?=
 =?utf-8?B?MmdmOUFUck9rQS94dkhsc3Q0MlllcXNUYlgvZjRVZXR3NG5KZ0hsZ3hzQklD?=
 =?utf-8?B?RlZQYTZEZEhSMGJwSEw3dWNRTVdrMVMyT05ER0xwMkZxZGJ3NUlOeU50RU95?=
 =?utf-8?B?YnJFMmIzcXd5TENDTkhSUmZtaDQrR0NVdHV3eCtaZDRVSkVIRzlCUFBXMjJY?=
 =?utf-8?B?aG1qdE5TOUp2V1o3VmlIUGRFSUE2MTRyUWgxWE9pUE1aTmtXSFJPbnBXUDJB?=
 =?utf-8?B?cXdsNG1KRGJ4SUx6QXNiT3dNckdFMkJWckxDRm5hMS9uS1gwdUVjZkR4RTgx?=
 =?utf-8?B?RG1OSU91NXF2N1Nlc3ZRZzd4Uk1wNjZtMVpOS1Z5NnQ3YzJNai8vVVA1TEZs?=
 =?utf-8?B?NmVnWUJHZFdCa2NSUnljLzAxSEdiTGlwYzZSbEs5Uk1TdmZFNWdxM1YyeGpC?=
 =?utf-8?B?OWYrTjJJT2syM1JmZEMyUkYxdFE0TjJudGh2T0s0L3FuTVpSK241cW83a0hy?=
 =?utf-8?B?bkJma2dhaTZvdjVHQnFERTk3NUxMTktKbGY4cFZKd3NObXBVdk14SllmVmdM?=
 =?utf-8?B?N1p4QURzYVZhdDAyZEttcjNaZGl2Y1huV1NjTGc1ZUEvRWNjdlFTZ0lTOXUv?=
 =?utf-8?B?K1A0U1FSQ3FYRFJKQjJWQkoyYlEySm1nVEt0YjQ4WlozRlpzY1BZMk1UNGVG?=
 =?utf-8?B?U1hMdjg5bHYzMjRlTHhkVTB2R1lhbFRPSVJRUTJZOVdiVU5IRXBDMWZQa291?=
 =?utf-8?B?Q3BFWkprNE9Jemw0cHdoNVBTS3l5d1RkTkcya2RzUmc1YWRMbW9NZ3BWTVR6?=
 =?utf-8?B?cTltOE9EdThxNFk0NVlueEZ2L3pndDJFYWd1dVE2ZTRBejVzSEJYOURwSTNQ?=
 =?utf-8?B?czhtQytEN0o0aVRCU0R5MUJqN0lpb21MVmdRNUdwR1dYRC9SWnNFdHJBZVN6?=
 =?utf-8?B?a2tkcEwwSTVsYzRkKzNuYWNVR1dtbmQ4bGFFMSswWUlhUFROcTl6T1crQ2Vh?=
 =?utf-8?B?Z0N5akFPMGtwUzVnd2o2amQ2VlB1b1NSMzE5aG9yelE4QnFDaXRVL1FjdENu?=
 =?utf-8?B?RW1kUGhLVGlWWXFHRjY3VThXSmthcW1la3VoWHk3Vm9RN25zS3ZtaXNJbkJh?=
 =?utf-8?B?dkQwYlgwdTJlT095aGtpY2ZUU0ViYUNNQTRhTk55anphNkwzSmFqZi9FTm05?=
 =?utf-8?B?Q2NDa01RdkRmUzZMeHVJdDJPOUM0ekV1SWxSYVRsLytFWWRTOFNDQ1poTUNK?=
 =?utf-8?B?Tkl6WDJrdC9WVnBveWxGV0Yxb3FOMXVBQmtOejNTOExQOEZrb0FUSVBSQ3Jp?=
 =?utf-8?B?MStJV3lGT280S0VHYmNST2JzdWlYcEZDVlYreGQ3WklQQU95b2ovZEM3VlB0?=
 =?utf-8?B?V3NiQllmc08vWDZZN2kwMFlQWVNKMjQ4ZFdpeXdGRW9TcTF5RXBvWStieUQ1?=
 =?utf-8?B?VUoyOStMcGZVRWcxVDdZYk1ONUs3Tm95MGY3c1NMekhaSmcrNW5WYTBiZ2xL?=
 =?utf-8?B?TTZtb3FPQTJxTXYrUkgzTlBlSGJqdm1XSjlSY2ZYeGdoWWVPNDdYbjljL2FH?=
 =?utf-8?B?MThlc1dLQXI2OVZseDJJTldhYW1XcFdOMk5wUHppLzVabFJoZFcraFZjbzBj?=
 =?utf-8?B?dWc2bUlzNlVMVWFVb1A4ZUlTQi83UjRCcVpxL1JiN253aXpHa1JhcnY0UFNG?=
 =?utf-8?B?SmsrNWIvcnJvWjFPTXpXT3RrZzJtdERMOGZHbUhFNU90SDFwMXJ1cmVkT2tk?=
 =?utf-8?B?Q1ZtWVpKUDBVaUNnZ0pVck5qNk5DRlVMeGRRY1QrTDRZT29aOC9VZzNnbGV1?=
 =?utf-8?B?S1plSkJ0MG9UUkt3dk9yUEViVlFtQU1QbzJ2aUZkdm5remZLYzZ0cFB2WHcw?=
 =?utf-8?B?akU5MmNRU0JLTjMwSXpyckNRV21hRXJKYXNCRGQ3TW1SbU1IVXVqYkpkbGVI?=
 =?utf-8?B?Qm9KQTB4SldlKzhORExYbThZbk50SkFtWlcxa2tHQlJ2N3FJUUpMcy9WNWV2?=
 =?utf-8?B?MUtUVG1hb0FlSGxPd3hncm0rU0laVU9qQ2RtdG56RUlHYlZ5aFhLNjVHSE9o?=
 =?utf-8?B?cGtUelFDSnROcU1DNVpIVWNiRVYzY3JaV2VMYWdOaUxBSTh4endUWHhVb2s2?=
 =?utf-8?B?NXRNSXhPMFNwNWdGWnIybkovbFEzdGV6c1JLb08vRE5QMHRrbXkyTTl6cEtp?=
 =?utf-8?B?ZEE4RlEwM1pPN0wwQ3Z2aEJFdUw0SUwxb3g4d0R6R1FTaFpNUVd2amtBSnNv?=
 =?utf-8?Q?99p5Q3QVkHaFcDl4=3D?=
X-Exchange-RoutingPolicyChecked: HHBEhJMifNoQaHSosGBmVhhnemgn1MFPMvmayMrcs0D08bHpA18KaHFTvDzwpCIg7bI0md4VyeKlOq8ozDzJkeVoVdrGGH/NuStiaR63f2kswuBxFTylKIVvezFlkZvGyf3dUaNBAwKGyAoES6GfcHqqMw3FFApfjnM51kkEgLlSS1nwmNfMVUkdbcO9wb6Wc8kHj3xlkF4RY45z7AaFDRZIvtvDSNq4Tlo9ttEdXC7goN8Ie15u7RQSlXaUWPAldt9ZxQGd33+pBBGxuW7TzKPgXW/i6xkyWtOuMs70bYvXU7rGR6jjK8c7fBjPGGel7aC+9lpHsI9HOg/Bg+c92Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 446a03da-24c0-45c5-5f48-08deb2431106
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 05:30:25.8450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbWpXUrLS2mZ8d9R9LaWlCqqZU4d/Mn9U3UtnfZJzOQX+XiwUbkeCxNKbJ9rhAlTZ2ar/1ovxL0aC247bsFtew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6752
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_223234_370204_1EE416E7 
X-CRM114-Status: GOOD (  22.87  )
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

On 12/05/2026 19:50, Frank Li wrote:
> On Mon, May 04, 2026 at 02:33:44PM +0300, Adrian Hunter wrote:
>> Software ABORT of the DMA ring is used to recover from transfer list
>> timeouts, but it is inherently racy.  The intended transfer list may
>> complete just before the ABORT takes effect, causing the subsequent
>> transfer list to be aborted instead.
>>
>> In this case, an incomplete transfer list may remain in the ring and has
>> not yet been processed by hci_dma_dequeue_xfer().  Restarting the DMA
>> ring at that point can lead to unpredictable results.
>>
>> Detect when the next queued transfer is not the first entry of a transfer
>> list and does not belong to the list currently being dequeued.  In that
>> case, skip restarting the DMA ring and defer recovery until a subsequent
>> call to hci_dma_dequeue_xfer(), which will safely restart the ring once
>> the incomplete list is handled.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>
>>
>> Changes in V3:
>>
>> 	None
>>
>> Changes in V2:
>>
>> 	Renamed completing_xfer to final_xfer
>>
>>
>>  drivers/i3c/master/mipi-i3c-hci/dma.c | 15 +++++++++++++++
>>  drivers/i3c/master/mipi-i3c-hci/hci.h |  1 +
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> index 899fdf6555a8..268f54b32101 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> @@ -503,6 +503,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>>  		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
>>
>>  		xfer->final_xfer = xfer_list + n - 1;
>> +		xfer->xfer_list_pos = i;
>>
>>  		/* store cmd descriptor */
>>  		*ring_data++ = xfer->cmd_desc[0];
>> @@ -669,6 +670,20 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>  		}
>>  	}
>>
>> +	/*
>> +	 * A software ABORT may race with transfer completion and abort the next
>> +	 * transfer list instead. Detect that case, and do not restart the ring.
>> +	 * It will be handled by a subsequent dequeue.
>> +	 */
>> +	if (!did_unqueue) {
>> +		struct hci_xfer *xfer = rh->src_xfers[rh->done_ptr];
>> +
>> +		if (xfer && xfer->xfer_list_pos && xfer->final_xfer != xfer_list->final_xfer) {
>> +			spin_unlock_irq(&hci->lock);
> 
> Is it possible to use auto cleanup to handle lock()?

No, there are 2 paths that do not return directly after unlocking
and do different things.

> 
> Frank
>> +			return false;
>> +		}
>> +	}
>> +
>>  	/* restart the ring */
>>  	reinit_completion(&rh->op_done);
>>  	mipi_i3c_hci_resume(hci);
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
>> index f07fc627d4d2..83d4f13a68a3 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
>> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
>> @@ -107,6 +107,7 @@ struct hci_xfer {
>>  			struct hci_xfer *final_xfer;
>>  			int ring_number;
>>  			int ring_entry;
>> +			int xfer_list_pos;
>>  		};
>>  	};
>>  };
>> --
>> 2.51.0
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
