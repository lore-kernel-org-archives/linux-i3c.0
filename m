Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21E8C4167B
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Nov 2023 18:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SJMd9I2nFCjjcJpORscYHQUAxSQONpRKqjTD0xmqO3c=; b=WVUd36CtdF3gw0
	EcIhxgWhs5xwVfDjRGKKPd2M1h8sjpWLq+6F3bM/dpNF79KFuthNyv7xfatdgcoZC5eJ+kcU32Jtx
	NlNIE8lvIoQ4qw4+7CpYbom3WN9Ol5FUf+VM4P6KAKXIODjX6ng1QGEN/ZV7B6yyBWY75iAV+rR68
	zk4g881NWPAKQuMXBTDCtCFy8YfCa3/VyydvV/FplcWlIaFgIjnpL+sfWU2TBjh+jy5cyBNWZiZFt
	jEt11vIS3LYan/1WtxwRGwT/nwwVyfpb+XQg8KhMgzP2D1+85bm48HRIB7LlUyMX4HizMOBFrjdHg
	kRBeHPmy2XnJhkbQ/cEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyzHe-00Bzgt-2A;
	Fri, 03 Nov 2023 18:52:42 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qujhG-006BqE-0y
	for linux-i3c@lists.infradead.org;
	Mon, 23 Oct 2023 01:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698024334; x=1729560334;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=GDJdAETLIziNh4cN75SjZvyOEmTfC2IC1ifXLGk9wgo=;
  b=XzcVubYA6C9N6Ag6EtcMI+qs29j7sD4LgCyfdnLV2BF+CA0sw3E6B+Gn
   2Z/6UueKdT1HLOf2E2kEk8cNSGSaJ3aXbyhP+zVPT5b7O+ofhOOfaH5Xb
   1jFzie3UmzNeMUZxf9XN9HNsb9/67vxaW1zvAibth3tV+N1rWklRV8laj
   5B3U/IpvDlQLV2mzpoohGLJInVqsAZF9EjXV+DIoZxtb1XsJH0mYoCGe5
   c0oxD20iaJZ19PXOpaiDkT5eFm6P5XDgn+oVWazTsW96og+t3nMCpMdra
   h6KxNPbejv+zN/H5WonMihO1n4pqSWExelH5zzAeA7vR71w/N+Rkxt3KK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="371814013"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="371814013"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 18:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="734501810"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="734501810"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Oct 2023 18:25:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 22 Oct 2023 18:25:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 22 Oct 2023 18:25:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 22 Oct 2023 18:25:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGxJ03fVfNS/ZzJG9Dea1EacTPMxAg/BFm90hKHqvO4zvVti38JioSGxwy/7Rm8rMfWBFb4elKRu/r1pdJpFvW8O9o/v6j8qymDWhltSwMoeCfXTiMVZ1Q6iyJOmLLEPV4/A2v/9ZrMvp9dsMAY85btmEBSGJGv3eVgrge1jkPxGJ7UtSgxBOqDLcG74L1hfA4s5fUHN3rLZJeM3Z5dT4SPM1PJtqSopoYJ1ovYUeLWKe/njCndLb8bHsMe2lzCDmgWrmnwQMJDjI9TKT4wmmb0+flwpPEU2bPZCOAqWYSLwP30O5xpN/MnmwUtMqNOSdH7bWCdTmssBDXBzNtJHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kulXsPvd4iFVK9rLsugiRvs6vHTuT5ROUaUaqOBG4pY=;
 b=f3FWZoDzootGx2eRh0vgKL6QpQvD8G5bXYiSNE45BdhkfVdFp1N6HtTritTUyyUdkHaCOH6NzV2y5KcW0ScsedgQcDLaofebBCjSDvwzCVq55fVpzC3Nw+dhN3Y3XBJh2JE25Xyyhu4XmTiTlwju2i/113pVThACunn6mFIbrD6+M5IHlqhb3NUOUHYRzNbA5yMpLXbg9F5iAxWq4ba/8FUCJo9zFAtyhgQQzoYIpui4srOaJzAwRJi4K/96sZEhMECHWaMWPmYx0AW4ljvxyIKxFfcE5OwKNO+orpMm6SLQ5xeOiQr4ncP2Zp0pL4iIPxTJvLHePXiWwLC4eZR8kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 01:25:28 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::21f8:775f:a94d:e1c0]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::21f8:775f:a94d:e1c0%4]) with mapi id 15.20.6907.022; Mon, 23 Oct 2023
 01:25:28 +0000
Date: Mon, 23 Oct 2023 09:20:37 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Frank Li <Frank.Li@nxp.com>, <miquel.raynal@bootlin.com>,
	<conor.culhane@silvaco.com>, <alexandre.belloni@bootlin.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <corbet@lwn.net>, <joe@perches.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <gregkh@linuxfoundation.org>,
	<imx@lists.linux.dev>, <jirislaby@kernel.org>, <linux-serial@vger.kernel.org>
Subject: Re: [PATCH 1/5] i3c: add slave mode support
Message-ID: <202310211527.TeVTMxA7-lkp@intel.com>
Content-Disposition: inline
In-Reply-To: <20231018215809.3477437-2-Frank.Li@nxp.com>
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MN0PR11MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b9ca45-6a22-48c8-c6f6-08dbd366f0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q1Y4PtFlzmofhO4WMBCoZ+INaR8u4BldBOlYWgVy+taEjhY5A6cYM2cinjNoDp9RZDi8y8NRLtAgBYzHTnt83ArPL7FbCGQzgWMWkFegrMER35mGOHBXkDa6KGBqIERZGAjvZ8DAuEFYg7JDfo7ITzo7XCwf08OJiYFuP9bPtyfQpXTqaLWf34/zA98c4/Yjy/YvMeH8HNv/2FWGwAJa15PiwNnErIdscf6xbgKSspimLuUSCA0dtHepgYtYRkDgEJLQsSMrEiMNLfgmvIGGlzBb1lymim6saiv8d/r7iNNMQeed+1MGZkT2ADxXnMnBBqDZNv0BjLPisy/gLnpqOBqc/KwiMrqxAo3y01UbsN5XMFSLMBylp09z8XcV8OTm1MJPiwQ7stg8476XV3Leu+qE0Kv8ll3fev7zetS4uJR2FVMZcoVjGt4KOFIONzrS456/uG4JU7PkHIBUfVMNsniTNpMfkO7cu1AGzmN/MEjkPo9CPPQj7gb3YSvPSnane/t/x/UqRGYUbtpwqI6jTu1svGGsS/isoerl1/zgvB++9vfwRRic6uC0fS0PL0U0DjhrHY5T5xBVHDfzAHiSgVRcuDktR2161AAu/zIHLITHuV9IsnFdPFh0x4UuecyL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(921008)(4001150100001)(38100700002)(2906002)(41300700001)(86362001)(5660300002)(7416002)(36756003)(4326008)(8676002)(8936002)(6506007)(478600001)(6666004)(26005)(1076003)(82960400001)(66476007)(2616005)(66946007)(316002)(66556008)(83380400001)(966005)(6486002)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QssNjupezd39zV/EJaZgtKC81+U4SIYOLH7AV9FOpGTGBk5msu1MpByDGXY/?=
 =?us-ascii?Q?oIdW3+qQDF81Bk6t1wOBjVKPLPjGs+m8g5J+Ke1d9OwfWM74qI7Btrw4uxMO?=
 =?us-ascii?Q?Mlr4V2VkhSEa4FcWvlYT8R+MbMNF1KAT4qMU2L6KOUZMUEhoRblJ1p9Piru/?=
 =?us-ascii?Q?6II1lpR/sg6qIN/L40TdHVPKDDE0S8cKgSw8fQa1DkNrSZsfSyj5GNZFvtAv?=
 =?us-ascii?Q?EF3AsF+OMUNatlzrsI51xNOrw6k9zH5R1mZ4IEsLK81WTY/uRR8Y+takbO/Z?=
 =?us-ascii?Q?TaDHbgJyUlIrBZmXZD35UbP2WW060D8r08hZig+HNMX+t1BYNjkFSCHaMVxz?=
 =?us-ascii?Q?3Ktq5TnozFIROa9dkAYTCwkBfcz4VDREFq3EHgDpkcLX8PFTYpLdfKHRNgIj?=
 =?us-ascii?Q?dfKIoEl+retVeejZ4bE8jMIwXw26Lo1sIy1WfgrUdhH14V2uBh8iLr/D2qb0?=
 =?us-ascii?Q?3a2wlOHryfifeh0+CZcx8aJinSyIih3BdRKAS3wZTNYtHfqK+IxnEEuC0CnY?=
 =?us-ascii?Q?GQ2bUVVvf+q4DofM5qYSWV7MlzprnnfInyT3V8yCjm5Bb2JcaHInhzW2ph/c?=
 =?us-ascii?Q?9vdxtS20u+8vA9C2LRmJcFd9+rEY3pxxbDr97PJd2jtKQzKzE3p9N2CMDt1b?=
 =?us-ascii?Q?a+2zY4EVYpe10vPyX8RAhjs8LPGXcDkcA6lvXUoJW1Kr9eD0RLjfvmW2dPLj?=
 =?us-ascii?Q?721+/men03HqF7kHUnD0ig8PAeI/Zh4eNsWxTkFSXlc1nUXbi6Hf0BklmWhl?=
 =?us-ascii?Q?AOowZiQeItPTqi/f0QIHk6De11u54dn49+7h6VO7u8Gl2O0iD+8s/dUoZov9?=
 =?us-ascii?Q?nqvKdlcmcA0RQv6rMp14VwzATsFr9FDX+5NNy3juZoivREoiy+HsBEs7kD1r?=
 =?us-ascii?Q?Cw6Qasy5msqO+3GD25oJip3mQkguMFQG0tKIS9s+XAM51s0IyNSolYo+JoHh?=
 =?us-ascii?Q?P0dhSQncel73CleBCNoGu+wAFdfsuRfeGYm+WMEGknmjOU7ti7NLjKiAVzJ+?=
 =?us-ascii?Q?YBEuP2nq6k0c5CVGV2326/atR8cNhkCwqc4K5s6cNuvarTM6t0W7hzSZJGSd?=
 =?us-ascii?Q?I8td5VsZ784hKnG/Q7edX6ZuCm8LI0G//JW5DTnEpTCjYbg8FitV53thvuQa?=
 =?us-ascii?Q?qXiLbEnf1Lov88RcRfXFuOygjo0Ea6QlNvMyooeV2U7dO0pJBZNKDN4vh1iL?=
 =?us-ascii?Q?71wNNMOKG/efQQ7kn+AR9lqwlfk8hfMrUpFCVKF98EWBFdqPPZGrDkUKYS6h?=
 =?us-ascii?Q?spTo9VMroDuxdtDp5f2npIjxGPkPQJHgp+lA+uuvDrBpUrfu1ARt0dxp+f/R?=
 =?us-ascii?Q?4nrQwRj/vXjiEv4SQc5ySUv8fhG+L/ic1KG/YfBzHUFy0VV2X6dPvWGkf10Z?=
 =?us-ascii?Q?ncIe1euC7M/Q08t8ZQ0ZHSzpF1DpQttyVjI2Qd4Q69KIXLR9arrqIN9jT/3j?=
 =?us-ascii?Q?rDl8io5n5OYTM5PVajOOtzSmMNfmFZIfxkPi2cXssiDQOXZ1iJhyNCr7VrXl?=
 =?us-ascii?Q?8M8B7UPlzMVmMmZxFZw7oXJnzFGH8LyGZlKuUTz4rnQV9SRHBq4Ohdjxf5lV?=
 =?us-ascii?Q?wr0arViQ/nnMph8noGY37GLBi/F4q4bI9VcPV+Ou?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b9ca45-6a22-48c8-c6f6-08dbd366f0d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 01:25:28.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WBAXut9NTahCMu8OBjpWyrnmVtIDE3o4iDLbeo28JzYFTl90u3+UjrNjQGr5EuRtWAm9zZThXvDCBXT83XwQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6301
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_182534_427677_4C6A189F 
X-CRM114-Status: GOOD (  13.81  )
X-Mailman-Approved-At: Fri, 03 Nov 2023 11:52:41 -0700
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

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-add-slave-mode-support/20231019-055940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231018215809.3477437-2-Frank.Li%40nxp.com
patch subject: [PATCH 1/5] i3c: add slave mode support
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231021/202310211527.TeVTMxA7-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211527.TeVTMxA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202310211527.TeVTMxA7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i3c/slave.c:11:
   include/linux/i3c/slave.h: In function 'i3c_slave_ctrl_alloc_request':
   include/linux/i3c/slave.h:272:23: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     272 |                 req = kzalloc(sizeof(*req), gfp_flags);
         |                       ^~~~~~~
>> include/linux/i3c/slave.h:272:21: warning: assignment to 'struct i3c_request *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     272 |                 req = kzalloc(sizeof(*req), gfp_flags);
         |                     ^
   include/linux/i3c/slave.h: In function 'i3c_slave_ctrl_free_request':
   include/linux/i3c/slave.h:298:17: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
     298 |                 kfree(req);
         |                 ^~~~~
         |                 kvfree
   In file included from drivers/i3c/slave.c:13:
   include/linux/slab.h: At top level:
>> include/linux/slab.h:227:6: warning: conflicting types for 'kfree'; have 'void(const void *)'
     227 | void kfree(const void *objp);
         |      ^~~~~
   include/linux/i3c/slave.h:298:17: note: previous implicit declaration of 'kfree' with type 'void(const void *)'
     298 |                 kfree(req);
         |                 ^~~~~
   include/linux/slab.h:718:37: error: conflicting types for 'kzalloc'; have 'void *(size_t,  gfp_t)' {aka 'void *(unsigned int,  unsigned int)'}
     718 | static inline __alloc_size(1) void *kzalloc(size_t size, gfp_t flags)
         |                                     ^~~~~~~
   include/linux/i3c/slave.h:272:23: note: previous implicit declaration of 'kzalloc' with type 'int()'
     272 |                 req = kzalloc(sizeof(*req), gfp_flags);
         |                       ^~~~~~~
   cc1: some warnings being treated as errors


vim +272 include/linux/i3c/slave.h

a63b2858bd837d Frank Li 2023-10-18  256  
a63b2858bd837d Frank Li 2023-10-18  257  /**
a63b2858bd837d Frank Li 2023-10-18  258   * i3c_slave_ctrl_alloc_request() - Alloc an I3C transfer
a63b2858bd837d Frank Li 2023-10-18  259   * @ctrl: I3C slave controller device
a63b2858bd837d Frank Li 2023-10-18  260   * gfp_flags: additional gfp flags used when allocating the buffers
a63b2858bd837d Frank Li 2023-10-18  261   *
a63b2858bd837d Frank Li 2023-10-18  262   * Returns: Zero for success, or an error code in case of failure
a63b2858bd837d Frank Li 2023-10-18  263   */
a63b2858bd837d Frank Li 2023-10-18  264  static inline struct i3c_request *
a63b2858bd837d Frank Li 2023-10-18  265  i3c_slave_ctrl_alloc_request(struct i3c_slave_ctrl *ctrl, gfp_t gfp_flags)
a63b2858bd837d Frank Li 2023-10-18  266  {
a63b2858bd837d Frank Li 2023-10-18  267  	struct i3c_request *req = NULL;
a63b2858bd837d Frank Li 2023-10-18  268  
a63b2858bd837d Frank Li 2023-10-18  269  	if (ctrl && ctrl->ops && ctrl->ops->alloc_request)
a63b2858bd837d Frank Li 2023-10-18  270  		req = ctrl->ops->alloc_request(ctrl, gfp_flags);
a63b2858bd837d Frank Li 2023-10-18  271  	else
a63b2858bd837d Frank Li 2023-10-18 @272  		req = kzalloc(sizeof(*req), gfp_flags);
a63b2858bd837d Frank Li 2023-10-18  273  
a63b2858bd837d Frank Li 2023-10-18  274  	if (req)
a63b2858bd837d Frank Li 2023-10-18  275  		req->ctrl = ctrl;
a63b2858bd837d Frank Li 2023-10-18  276  
a63b2858bd837d Frank Li 2023-10-18  277  	return req;
a63b2858bd837d Frank Li 2023-10-18  278  }
a63b2858bd837d Frank Li 2023-10-18  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
